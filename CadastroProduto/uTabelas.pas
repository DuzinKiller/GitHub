unit uTabelas;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, Bde.DBTables,
  Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.ODBCBase, FireDAC.Comp.UI;

type
  TdmTabelas = class(TDataModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    dsProduto: TDataSource;
    FDTableProduto: TFDTable;
    FDConsulta: TFDQuery;
    dsConsulta: TDataSource;
  private
    { Private declarations }
  public
     procedure AtualizaListagem;
    { Public declarations }
  end;

var
  dmTabelas: TdmTabelas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmTabelas }

procedure TdmTabelas.AtualizaListagem;
begin
     FDConsulta.Close;
     FDConsulta.SQL.Clear;
     FDConsulta.SQL.Add('select nome, marca, unidade, estoque, observacao from produto');
     FDConsulta.Open();
end;

end.
