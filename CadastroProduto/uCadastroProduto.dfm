object FMCadProduto: TFMCadProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produto'
  ClientHeight = 309
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    AlignWithMargins = True
    Left = 3
    Top = 0
    Width = 494
    Height = 27
    Margins.Top = 0
    Margins.Bottom = 0
    ButtonHeight = 21
    ButtonWidth = 58
    Caption = 'ToolBar1'
    ShowCaptions = True
    TabOrder = 0
    object tbNovo: TToolButton
      Left = 0
      Top = 0
      Action = acNovo
    end
    object tbAlterar: TToolButton
      Left = 58
      Top = 0
      Action = acAlterar
    end
    object tbGrava: TToolButton
      Left = 116
      Top = 0
      Action = acGravar
    end
    object tbAnterior: TToolButton
      Left = 174
      Top = 0
      Action = acAlterior
    end
    object tbProximo: TToolButton
      Left = 232
      Top = 0
      Action = acProximo
    end
    object tbUltimo: TToolButton
      Left = 290
      Top = 0
      Action = acUltimo
    end
    object tbCancelar: TToolButton
      Left = 348
      Top = 0
      Action = acCancelar
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 30
    Width = 494
    Height = 276
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 7
      Top = 48
      Width = 34
      Height = 13
      Caption = 'Marca'
    end
    object Label3: TLabel
      Left = 7
      Top = 80
      Width = 80
      Height = 13
      Caption = 'Qtde. Estoque'
    end
    object Label4: TLabel
      Left = 272
      Top = 80
      Width = 46
      Height = 13
      Caption = 'Unidade'
    end
    object Label5: TLabel
      Left = 7
      Top = 120
      Width = 68
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object DBEdit1: TDBEdit
      Left = 93
      Top = 13
      Width = 364
      Height = 21
      DataField = 'nome'
      DataSource = dmTabelas.dsProduto
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 93
      Top = 45
      Width = 364
      Height = 21
      DataField = 'marca'
      DataSource = dmTabelas.dsProduto
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 93
      Top = 77
      Width = 139
      Height = 21
      DataField = 'estoque'
      DataSource = dmTabelas.dsProduto
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 336
      Top = 77
      Width = 121
      Height = 21
      DataField = 'unidade'
      DataSource = dmTabelas.dsProduto
      TabOrder = 3
    end
    object DBMemo1: TDBMemo
      Left = 93
      Top = 117
      Width = 364
      Height = 132
      DataField = 'observacao'
      DataSource = dmTabelas.dsProduto
      TabOrder = 4
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
      end>
    Left = 432
    Top = 128
    StyleName = 'Platform Default'
    object acNovo: TAction
      Category = 'dados'
      Caption = 'Novo'
      OnExecute = acNovoExecute
    end
    object acAlterar: TAction
      Category = 'dados'
      Caption = 'Alterar'
      OnExecute = acAlterarExecute
    end
    object acPesquisar: TAction
      Category = 'dados'
      Caption = 'Pesquisar'
    end
    object acProximo: TAction
      Category = 'dados'
      Caption = 'Pr'#243'ximo'
      OnExecute = acProximoExecute
    end
    object acAlterior: TAction
      Category = 'dados'
      Caption = 'Alterior'
      OnExecute = acAlteriorExecute
    end
    object acUltimo: TAction
      Category = 'dados'
      Caption = #218'ltimo'
      OnExecute = acUltimoExecute
    end
    object acGravar: TAction
      Category = 'dados'
      Caption = 'Gravar'
      OnExecute = acGravarExecute
    end
    object acCancelar: TAction
      Category = 'dados'
      Caption = 'Cancelar'
      OnExecute = acCancelarExecute
    end
  end
  object dsTela: TDataSource
    OnStateChange = dsTelaStateChange
    Left = 536
    Top = 56
  end
end
