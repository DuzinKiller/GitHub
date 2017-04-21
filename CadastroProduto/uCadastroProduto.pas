unit uCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uProduto, uProdutoDB,
  dm, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, System.Actions, Vcl.ActnList,
  Vcl.StdStyleActnCtrls, Vcl.PlatformDefaultStyleActnCtrls;

type
  TEstadoRegisto = (dsLeitura, dsEdicao);

  TfmCadastroProduto = class(TForm)
    Panel1: TPanel;
    edtNome: TEdit;
    edtUnidade: TEdit;
    edtEstoque: TEdit;
    edtID: TEdit;
    mmObs: TMemo;
    ActionManager1: TActionManager;
    ActionToolBar1: TActionToolBar;
    acNovo: TAction;
    acAltera: TAction;
    acGravar: TAction;
    acExcluir: TAction;
    acAnterior: TAction;
    acProximo: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    acCancelar: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure acNovoExecute(Sender: TObject);
    procedure acGravarExecute(Sender: TObject);
    procedure acProximoExecute(Sender: TObject);
    procedure acAnteriorExecute(Sender: TObject);
    procedure acAlteraExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
  private
    FEstadoRegisto : TEstadoRegisto;
    FProduto : TProduto;
    FProdutoDB : TProdutoDB;

    procedure CarregaTela(pProduto: TProduto);
    procedure CarregaProduto;

    procedure SomenteLeitura(pReadyOnly : Boolean);
    procedure AcertaControles;

    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfmCadastroProduto }

procedure TfmCadastroProduto.acAlteraExecute(Sender: TObject);
begin
     if FProduto.ID = 0 then
     begin
          ShowMessage('Nenhum registro posicionado para alteração.');
          Exit;
     end;
     FEstadoRegisto := dsEdicao;
     SomenteLeitura(False);
end;

procedure TfmCadastroProduto.acAnteriorExecute(Sender: TObject);
var xProduto : TProduto;
begin
     xProduto := FProdutoDB.Anterior(FProduto.ID);
     if Assigned(xProduto) then
     begin
          FProduto := xProduto;
          CarregaTela(FProduto);
     end;
end;

procedure TfmCadastroProduto.acCancelarExecute(Sender: TObject);
begin
     FEstadoRegisto := dsLeitura;
     if FProduto.ID > 0 then
     begin
          FProduto := FProdutoDB.Posicionar(FProduto.ID);
          CarregaTela(FProduto);
     end;
     SomenteLeitura(True);
end;

procedure TfmCadastroProduto.AcertaControles;
begin
     acNovo.Enabled     := (FEstadoRegisto = dsLeitura);
     acAltera.Enabled   := (FEstadoRegisto = dsLeitura);
     acGravar.Enabled   := (FEstadoRegisto = dsEdicao);
     acExcluir.Enabled  := (FEstadoRegisto = dsLeitura);
     acAnterior.Enabled := (FEstadoRegisto = dsLeitura);
     acProximo.Enabled  := (FEstadoRegisto = dsLeitura);
     acCancelar.Enabled := (FEstadoRegisto = dsEdicao);
end;

procedure TfmCadastroProduto.acExcluirExecute(Sender: TObject);
var xID : Integer;
begin
     if FProduto.ID = 0 then
     begin
          ShowMessage('Nenhum registro posicionado para exclusão.');
          Exit;
     end;

     FEstadoRegisto := dsLeitura;
     xID            := FProduto.ID;
     FProdutoDB.Excluir(xID);

     FProduto := FProdutoDB.Anterior(FProduto.ID);
     CarregaTela(FProduto);
     SomenteLeitura(True);
end;

procedure TfmCadastroProduto.acGravarExecute(Sender: TObject);
begin
     FEstadoRegisto := dsLeitura;
     CarregaProduto;
     try
        FProdutoDB.Gravar(FProduto);

        FProduto := FProdutoDB.Ultimo;
        CarregaTela(FProduto);

        SomenteLeitura(True);
     except on e: Exception do
        ShowMessage('Erro ao gravar produto!' + chr(13) +
                    'Erro: ' + E.Message);
     end;
end;

procedure TfmCadastroProduto.acNovoExecute(Sender: TObject);
begin
     FEstadoRegisto := dsEdicao;
     FProduto.Novo;
     CarregaTela(FProduto);
     SomenteLeitura(False);
end;

procedure TfmCadastroProduto.acProximoExecute(Sender: TObject);
var xProduto : TProduto;
begin
     xProduto := FProdutoDB.Proximo(FProduto.ID);
     if assigned(xProduto) then
     begin
          FProduto := xProduto;
          CarregaTela(FProduto);
     end;
end;

procedure TfmCadastroProduto.CarregaProduto;
begin
     FProduto.ID        := StrToIntDef(edtID.Text, 0);
     FProduto.Descricao := edtNome.Text;
     FProduto.Unidade   := edtUnidade.Text;
     FProduto.Estoque   := StrToFloatDef(edtEstoque.Text, 0);
     FProduto.Obs       := mmObs.Lines.Text;
end;

procedure TfmCadastroProduto.CarregaTela(pProduto: TProduto);
begin
     if pProduto.ID = 0 then
     begin
          edtNome.Clear;
          edtUnidade.Clear;
          edtEstoque.Clear;
          edtID.Clear;
          mmObs.Lines.Clear;
     end
     else
     begin
          edtNome.Text     := pProduto.Descricao;
          edtUnidade.Text  := pProduto.Unidade;
          edtEstoque.Text  := FloatToStr(pProduto.Estoque);
          edtID.Text       := pProduto.ID.ToString;
          mmObs.Lines.Text := pProduto.Obs;
     end;
end;

procedure TfmCadastroProduto.FormCreate(Sender: TObject);
begin
     FProduto       := TProduto.Create;
     FProdutoDB     := TProdutoDB.Create(dmProduto.FDConnection);
     FEstadoRegisto := dsLeitura;

     CarregaTela(FProduto);
     SomenteLeitura(True);
end;

procedure TfmCadastroProduto.FormDestroy(Sender: TObject);
begin
     if Assigned(FProduto) then
     begin
          FreeAndNil(FProduto);
     end;

     if Assigned(FProdutoDB) then
     begin
          FreeAndNil(FProdutoDB);
     end;
end;

procedure TfmCadastroProduto.SomenteLeitura(pReadyOnly: Boolean);
var
  I: Integer;
begin
     for I := 0 to Pred(ComponentCount) do
     begin
          if Components[i] is TEdit then
          begin
               if TEdit(Components[i]).Tag = 0 then
               begin
                    TEdit(Components[i]).ReadOnly := pReadyOnly;
               end;
          end;

          if Components[i] is TMemo then
          begin
               TMemo(Components[i]).ReadOnly := pReadyOnly;
          end;
     end;
     AcertaControles;
end;

end.
