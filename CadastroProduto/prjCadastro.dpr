program prjCadastro;

uses
  MidasLib,
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fmPrincipal},
  uProduto in 'uProduto.pas',
  uProdutoDB in 'uProdutoDB.pas',
  uCadastroProduto in 'uCadastroProduto.pas' {fmCadastroProduto},
  dm in 'dm.pas' {dmProduto: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmProduto, dmProduto);
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.Run;
end.
