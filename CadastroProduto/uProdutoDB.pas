unit uProdutoDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uProduto, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TListaProduto = Array of TProduto;

  TProdutoDB = class
  private
    FConexao: TFDConnection;
    FFDQuery : TFDQuery;

    function  Consulta(pID: Integer; pSinal: String): TProduto;
    procedure LimparFDQuery;
  protected
    function Conectar: Boolean;
  public
    constructor Create(pConnection: TFDConnection); reintroduce;
    destructor Destroy;override;

    function ListaProdutos: TListaProduto;

    function Proximo(pID: Integer): TProduto;
    function Anterior(pID: Integer): TProduto;
    function Posicionar(pID: Integer): TProduto;
    function Ultimo: TProduto;

    function Excluir(pId: Integer): Boolean;
    function Gravar(pProduto: TProduto): Boolean;


  published

  end;


implementation

{ TProdutoDB }

function TProdutoDB.Anterior(pID: Integer): TProduto;
begin
     Result := Consulta(pID, '<');
end;

function TProdutoDB.Conectar: Boolean;
begin
     try
        FConexao.Open();
        Result := FConexao.Connected;
     except on e: Exception do
        raise Exception.Create(e.Message);
     end;
end;

function TProdutoDB.Consulta(pID: Integer; pSinal: String): TProduto;
var xOrder: String;
begin
     try
        xOrder := EmptyStr;
        if pSinal = '<' then
        begin
             xOrder := ' desc';
        end;

        FFDQuery.SQL.Text := 'select * from produto where id ' + pSinal + ' ' + pID.ToString() + ' order by id ' + xOrder;
        FFDQuery.Open;

        if FFDQuery.FieldByName('id').AsInteger = 0 then
        begin
             Exit;
        end;
        
        Result := TProduto.Create;

        Result.ID        := FFDQuery.FieldByName('id').AsInteger;
        Result.Descricao := FFDQuery.FieldByName('nome').AsString;
        Result.Unidade   := FFDQuery.FieldByName('unidade').AsString;
        Result.Estoque   := FFDQuery.FieldByName('estoque').AsFloat;
        Result.Obs       := FFDQuery.FieldByName('observacao').AsString;
     finally
        LimparFDQuery;
     end;
end;

constructor TProdutoDB.Create(pConnection: TFDConnection);
begin
     inherited Create;

     FConexao := pConnection;
     FFDQuery := TFDQuery.Create(nil);
     FFDQuery.Connection := FConexao;
end;

destructor TProdutoDB.Destroy;
begin
     if Assigned(FFDQuery) then
     begin
          FreeAndNil(FFDQuery);
     end;
     inherited;
end;

function TProdutoDB.Excluir(pId: Integer): Boolean;
begin
     Result := False;
     try
        FFDQuery.SQL.Text := 'delete from produto ' +
                              'where id = :id';
        FFDQuery.ParamByName('id').AsInteger     := pId;
        FFDQuery.ExecSQL;

        Result := FFDQuery.RowsAffected > 0;
     finally
        LimparFDQuery;
     end;
end;

function TProdutoDB.Gravar(pProduto: TProduto): Boolean;
var xId : Integer;
begin
     Result := False;
     try
        if pProduto.ID = 0 then
        begin
             FFDQuery.SQL.Text := 'insert into Produto (nome, unidade, estoque, observacao) values (:nome, :unidade, :estoque, :obs)';
        end
        else
        begin
             FFDQuery.SQL.Text := 'update produto ' +
                                   'set nome = :nome, ' +
                                       'unidade = :unidade, ' +
                                       'estoque = :estoque, ' +
                                       'observacao = :obs ' +
                                   'where id = :id';
             FFDQuery.ParamByName('id').AsInteger := pProduto.ID;
        end;
        FFDQuery.ParamByName('nome').AsString    := pProduto.Descricao;
        FFDQuery.ParamByName('unidade').AsString := pProduto.Unidade;
        FFDQuery.ParamByName('estoque').AsFloat  := pProduto.Estoque;
        FFDQuery.ParamByName('obs').AsString     := pProduto.Obs;

        FFDQuery.ExecSQL;
        Result := FFDQuery.RowsAffected > 0;

     finally
        LimparFDQuery;
     end;
end;

procedure TProdutoDB.LimparFDQuery;
begin
     FFDQuery.Close;
     FFDQuery.SQL.Clear;
     FFDQuery.Params.Clear;
end;

function TProdutoDB.ListaProdutos: TListaProduto;
var i: Integer;
    xSQL : String;
begin
     try
        if Conectar then
        begin
             xSQL := 'select * from produto';
             FFDQuery.FetchOptions.RecordCountMode := cmTotal;{ Deixa visivel todos itens para a contagem }
             FFDQuery.SQL.Text   := xSQL;
             FFDQuery.Open;
             FFDQuery.First;
             SetLength(Result, FFDQuery.RecordCount);

             for i := 0 to Pred(FFDQuery.RecordCount) do
             begin
                  Result[i] := TProduto.Create;

                  Result[i].Descricao := FFDQuery.FieldByName('nome').AsString;
                  Result[i].Obs       := FFDQuery.FieldByName('observacao').AsString;
                  Result[i].Unidade   := FFDQuery.FieldByName('unidade').AsString;
                  Result[i].Estoque   := FFDQuery.FieldByName('estoque').AsExtended;

                  FFDQuery.Next;
             end;
             LimparFDQuery;
        end;
     except on e: Exception do
        raise Exception.Create(e.Message);
     end;
end;

function TProdutoDB.Posicionar(pID: Integer): TProduto;
begin
     Result := Consulta(pID, '=');
end;

function TProdutoDB.Proximo(pID: Integer): TProduto;
begin
     Result := Consulta(pID, '>');
end;

function TProdutoDB.Ultimo: TProduto;
begin
     try
        FFDQuery.SQL.Text := 'select max(id) ultimo from produto';
        FFDQuery.Open;

        Result := TProduto.Create;

        Result := Consulta(FFDQuery.FieldByName('ultimo').AsInteger, ' = ');
     finally
        LimparFDQuery;
     end;
end;

end.
