unit uProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  TProduto = class
  private
    FID : Integer;
    FDescricao : String;
    FUnidade : String;
    FEstoque : Extended;
    FObs : String;

    function GetDescricao: string;
    function GetID: Integer;
    function GetObs: String;
    function GetEstoque: Extended;
    function GetUnidade: string;
    procedure SetDescricao(const Value: string);
    procedure SetID(const Value: Integer);
    procedure SetObs(const Value: String);
    procedure SetEstoque(const Value: Extended);
    procedure SetUnidade(const Value: string);
    { private declarations }
  protected
    { protected declarations }
  public
    procedure Novo;
    { public declarations }
  published
    { published declarations }
    property ID       	: Integer read GetID write SetID;
    property Descricao : string read GetDescricao write SetDescricao;
    property Unidade   : string read GetUnidade write SetUnidade;
    property Estoque   : Extended read GetEstoque write SetEstoque;
    property Obs       : String read GetObs write SetObs;
  end;

implementation

{ TProduto }

function TProduto.GetDescricao: string;
begin
     Result := FDescricao;
end;

function TProduto.GetID: Integer;
begin
     Result := FID;
end;

function TProduto.GetObs: String;
begin
     Result := FObs;
end;

function TProduto.GetEstoque: Extended;
begin
     Result := FEstoque;
end;

function TProduto.GetUnidade: string;
begin
     Result := FUnidade;
end;

procedure TProduto.Novo;
begin
     FID := 0;
     FDescricao := EmptyStr;
     FUnidade   := EmptyStr;
     FEstoque   := 0;
     FObs       := EmptyStr;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
     FDescricao := Value;
end;

procedure TProduto.SetID(const Value: Integer);
begin
     FID := Value;
end;

procedure TProduto.SetObs(const Value: String);
begin
     FObs := Value;
end;

procedure TProduto.SetEstoque(const Value: Extended);
begin
     if Value >= 0 then
     begin
          FEstoque := Value;
     end
     else
     begin
          raise Exception.Create('Estoque negativo!');
     end;
end;

procedure TProduto.SetUnidade(const Value: string);
begin
     FUnidade := Value;
end;

end.
