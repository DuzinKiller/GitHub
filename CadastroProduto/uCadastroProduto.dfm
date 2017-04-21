object fmCadastroProduto: TfmCadastroProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produto'
  ClientHeight = 309
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 38
    Width = 529
    Height = 268
    Margins.Top = 15
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -2
    ExplicitTop = 39
    ExplicitHeight = 262
    object Label1: TLabel
      Left = 16
      Top = 27
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 16
      Top = 71
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 16
      Top = 115
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label4: TLabel
      Left = 16
      Top = 155
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object Label5: TLabel
      Left = 288
      Top = 115
      Width = 81
      Height = 13
      Caption = 'Unidade estoque'
    end
    object edtNome: TEdit
      Left = 88
      Top = 68
      Width = 425
      Height = 21
      Margins.Top = 20
      TabOrder = 1
      Text = 'Edit1'
    end
    object edtUnidade: TEdit
      Left = 392
      Top = 112
      Width = 121
      Height = 21
      Margins.Top = 20
      TabOrder = 3
      Text = 'Edit1'
    end
    object edtEstoque: TEdit
      Left = 88
      Top = 112
      Width = 121
      Height = 21
      Margins.Top = 20
      TabOrder = 2
      Text = 'Edit1'
    end
    object edtID: TEdit
      Tag = 1
      Left = 88
      Top = 24
      Width = 121
      Height = 21
      Margins.Top = 20
      ReadOnly = True
      TabOrder = 0
      Text = 'edtID'
    end
    object mmObs: TMemo
      Left = 88
      Top = 152
      Width = 425
      Height = 89
      Lines.Strings = (
        'mmObs')
      TabOrder = 4
    end
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 535
    Height = 23
    ActionManager = ActionManager1
    Caption = 'ActionToolBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = acNovo
            Caption = '&Novo'
          end
          item
            Action = acAltera
            Caption = '&Alterar'
          end
          item
            Action = acGravar
            Caption = '&Gravar'
          end
          item
            Action = acExcluir
            Caption = '&Excluir'
          end
          item
            Action = acAnterior
            Caption = 'An&terior'
          end
          item
            Action = acProximo
            Caption = '&Pr'#243'ximo'
          end
          item
            Action = acCancelar
            Caption = '&Cancelar'
          end>
        ActionBar = ActionToolBar1
      end>
    Left = 411
    Top = 31
    StyleName = 'Platform Default'
    object acNovo: TAction
      Caption = 'Novo'
      OnExecute = acNovoExecute
    end
    object acAltera: TAction
      Caption = 'Alterar'
      OnExecute = acAlteraExecute
    end
    object acGravar: TAction
      Caption = 'Gravar'
      OnExecute = acGravarExecute
    end
    object acExcluir: TAction
      Caption = 'Excluir'
      OnExecute = acExcluirExecute
    end
    object acAnterior: TAction
      Caption = 'Anterior'
      OnExecute = acAnteriorExecute
    end
    object acProximo: TAction
      Caption = 'Pr'#243'ximo'
      OnExecute = acProximoExecute
    end
    object acCancelar: TAction
      Caption = 'Cancelar'
      OnExecute = acCancelarExecute
    end
  end
end
