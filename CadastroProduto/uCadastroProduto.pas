unit uCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.PlatformDefaultStyleActnCtrls, Data.DB,
  uTabelas, Datasnap.DBClient, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.ODBCBase, FireDAC.Comp.UI;

type
  TFMCadProduto = class(TForm)
    ActionManager1: TActionManager;
    acNovo: TAction;
    acAlterar: TAction;
    acPesquisar: TAction;
    acProximo: TAction;
    acAlterior: TAction;
    acUltimo: TAction;
    ToolBar1: TToolBar;
    tbNovo: TToolButton;
    tbAlterar: TToolButton;
    tbAnterior: TToolButton;
    tbProximo: TToolButton;
    dsTela: TDataSource;
    tbUltimo: TToolButton;
    acGravar: TAction;
    tbGrava: TToolButton;
    acCancelar: TAction;
    tbCancelar: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure acAlterarExecute(Sender: TObject);
    procedure acProximoExecute(Sender: TObject);
    procedure acAlteriorExecute(Sender: TObject);
    procedure acUltimoExecute(Sender: TObject);
    procedure acNovoExecute(Sender: TObject);
    procedure dsTelaStateChange(Sender: TObject);
    procedure acGravarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    Tabela: TFDTable;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFMCadProduto.acAlterarExecute(Sender: TObject);
begin
     if not (Tabela.State in dsEditModes) then
     begin
          if ((Tabela.RecordCount > 0) and (Tabela.RecNo <> 0)) then
          begin
               Tabela.Edit;
          end;
     end;
end;

procedure TFMCadProduto.acAlteriorExecute(Sender: TObject);
begin
     if not (Tabela.State in dsEditModes) then
     begin
          Tabela.Prior;
     end;
end;

procedure TFMCadProduto.acCancelarExecute(Sender: TObject);
begin
     if (Tabela.State in dsEditModes) then
     begin
          Tabela.Cancel;
     end;
end;

procedure TFMCadProduto.acGravarExecute(Sender: TObject);
begin
     if (Tabela.State in dsEditModes) then
     begin
          Tabela.Post;
     end;
end;

procedure TFMCadProduto.acNovoExecute(Sender: TObject);
begin
     if not (Tabela.State in dsEditModes) then
     begin
          Tabela.Append;
     end;
end;

procedure TFMCadProduto.acProximoExecute(Sender: TObject);
begin
     if not (Tabela.State in dsEditModes) then
     begin
          Tabela.Next;
     end;
end;

procedure TFMCadProduto.acUltimoExecute(Sender: TObject);
begin
     if not (Tabela.State in dsEditModes) then
     begin
          Tabela.Last;
     end;
end;

procedure TFMCadProduto.dsTelaStateChange(Sender: TObject);
var estadoTabela: Boolean;
begin
     estadoTabela := not (Tabela.State in dsEditModes);

     acNovo.Enabled     := estadoTabela;
     acAlterar.Enabled  := estadoTabela;
     acAlterior.Enabled := estadoTabela;
     acProximo.Enabled  := estadoTabela;
     acUltimo.Enabled   := estadoTabela;
     acGravar.Enabled   := (not estadoTabela);
     acCancelar.Enabled := (not estadoTabela);

end;

procedure TFMCadProduto.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     CanClose := False;
     if Tabela.State in dsEditModes then
     begin
          ShowMessage('Registro em edição');
          Exit;
     end;

     CanClose := True;
end;

procedure TFMCadProduto.FormCreate(Sender: TObject);
begin
     Tabela         := dmTabelas.FDTableProduto;
     dsTela.DataSet := dmTabelas.FDTableProduto;
end;

end.
