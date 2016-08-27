program prjProduto;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fmPrincipal},
  uTabelas in 'uTabelas.pas' {dmTabelas: TDataModule},
  uCadastroProduto in 'uCadastroProduto.pas' {FMCadProduto},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Luna');
  Application.CreateForm(TdmTabelas, dmTabelas);
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.Run;
end.
