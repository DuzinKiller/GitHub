object fmPrincipal: TfmPrincipal
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 440
  ClientWidth = 892
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 60
    Width = 886
    Height = 13
    Margins.Top = 60
    Align = alTop
    Alignment = taCenter
    Caption = 'Listagem de produtos cadastrados'
    ExplicitWidth = 196
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 79
    Width = 886
    Height = 358
    Align = alClient
    DataSource = dmTabelas.dsConsulta
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'marca'
        Title.Caption = 'Marca'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estoque'
        Title.Caption = 'Qtde. Estoque'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unidade'
        Title.Caption = 'Unidade'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'observacao'
        Title.Caption = 'Observa'#231#227'o'
        Width = 300
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 520
    Top = 208
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Produto1: TMenuItem
        Caption = 'Produto'
        OnClick = Produto1Click
      end
    end
  end
end
