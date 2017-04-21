object fmPrincipal: TfmPrincipal
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 660
  ClientWidth = 1078
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 40
    Width = 1072
    Height = 13
    Margins.Top = 40
    Align = alTop
    Alignment = taCenter
    Caption = 'Listagem de produtos cadastrados'
    ExplicitTop = 60
    ExplicitWidth = 165
  end
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 59
    Width = 1072
    Height = 598
    Align = alClient
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 72
    ExplicitWidth = 1062
    ExplicitHeight = 580
  end
  object MainMenu1: TMainMenu
    Left = 840
    Top = 160
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      OnClick = Cadastro1Click
    end
  end
end
