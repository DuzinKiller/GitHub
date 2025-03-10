unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uProduto, Vcl.StdCtrls, uProdutoDB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MSSQL,
  FireDAC.Phys.ODBCBase, Vcl.Grids, Vcl.Menus, uCadastroProduto, dm;

type
  TfmPrincipal = class(TForm)
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Label1: TLabel;
    procedure Cadastro1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ListarProdutos;

  public
    FListaProduto: Array of TProduto;

    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

{$R *.dfm}

procedure TfmPrincipal.FormCreate(Sender: TObject);
begin
     ListarProdutos;
end;

procedure TfmPrincipal.ListarProdutos;
var xProd : TProduto;
    xProdDB : TProdutoDB;
    xListaProduto : TListaProduto;
    i: Integer;
    xLista : TStringList;
begin
     xProdDB := TProdutoDB.Create(dmProduto.FDConnection);
     xProd   := TProduto.Create;
     xLista  := TStringList.Create;
     try
        xListaProduto := xProdDB.ListaProdutos;
        try
           //Memo1.Clear;
           xLista.Clear;
           for i := 0 to Pred(Length(xListaProduto)) do
           begin
                xLista.Add('Descri��o : ' + xListaProduto[i].Descricao);
                xLista.Add('Estoque   : ' + xListaProduto[i].Estoque.ToString());
                xLista.Add('Unidade   : ' + xListaProduto[i].Unidade);
                xLista.Add('Obs       : ' + xListaProduto[i].Obs);
                xLista.Add('==============================================');
           end;
           Memo1.Clear;
           Memo1.Lines.Text := xLista.Text;

        except on e: Exception DO
           ShowMessage(e.Message);
        end;
     finally
         FreeAndNil(xProd);
         FreeAndNil(xProdDB);
     end;
end;

procedure TfmPrincipal.Cadastro1Click(Sender: TObject);
var xTelaCadProd : TfmCadastroProduto;
begin
     try
        xTelaCadProd := TfmCadastroProduto.Create(Self);
        xTelaCadProd.ShowModal;
        ListarProdutos;
     finally
        FreeAndNil(xTelaCadProd);
     end;
end;

end.
