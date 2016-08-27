unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, uCadastroProduto,
  Vcl.Menus, Vcl.StdCtrls, uTabelas;

type
  TfmPrincipal = class(TForm)
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Produto1: TMenuItem;
    Label1: TLabel;
    procedure Produto1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

{$R *.dfm}

procedure TfmPrincipal.FormCreate(Sender: TObject);
begin
     dmTabelas.AtualizaListagem;
end;

procedure TfmPrincipal.Produto1Click(Sender: TObject);
var xCadProduto : TFMCadProduto;
begin
     xCadProduto := TFMCadProduto.Create(Self);
     try
        xCadProduto.ShowModal;
        dmTabelas.AtualizaListagem;
     finally
        FreeAndNil(xCadProduto);
     end;
end;

end.
