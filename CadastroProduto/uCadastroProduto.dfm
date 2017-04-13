object FMCadProduto: TFMCadProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produto'
  ClientHeight = 309
  ClientWidth = 524
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
    Width = 518
    Height = 38
    Margins.Top = 0
    Margins.Bottom = 0
    ButtonHeight = 19
    ButtonWidth = 63
    Caption = 'ToolBar1'
    List = True
    ShowCaptions = True
    TabOrder = 0
    ExplicitWidth = 515
    object tbNovo: TToolButton
      Left = 0
      Top = 0
      Action = acNovo
    end
    object tbAlterar: TToolButton
      Left = 63
      Top = 0
      Action = acAlterar
    end
    object ToolButton1: TToolButton
      Left = 126
      Top = 0
      Action = acExcluir
    end
    object tbGrava: TToolButton
      Left = 189
      Top = 0
      Action = acGravar
    end
    object tbAnterior: TToolButton
      Left = 252
      Top = 0
      Action = acAlterior
    end
    object tbProximo: TToolButton
      Left = 315
      Top = 0
      Action = acProximo
    end
    object tbUltimo: TToolButton
      Left = 378
      Top = 0
      Action = acUltimo
    end
    object tbCancelar: TToolButton
      Left = 441
      Top = 0
      Action = acCancelar
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 41
    Width = 518
    Height = 265
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitTop = 30
    ExplicitWidth = 494
    ExplicitHeight = 276
    DesignSize = (
      518
      265)
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
      Width = 409
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'nome'
      DataSource = dmTabelas.dsProduto
      TabOrder = 0
      ExplicitWidth = 396
    end
    object DBEdit2: TDBEdit
      Left = 93
      Top = 45
      Width = 409
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'marca'
      DataSource = dmTabelas.dsProduto
      TabOrder = 1
      ExplicitWidth = 396
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
      Width = 166
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'unidade'
      DataSource = dmTabelas.dsProduto
      TabOrder = 3
      ExplicitWidth = 153
    end
    object DBMemo1: TDBMemo
      Left = 93
      Top = 117
      Width = 409
      Height = 132
      Anchors = [akLeft, akTop, akRight]
      DataField = 'observacao'
      DataSource = dmTabelas.dsProduto
      TabOrder = 4
      ExplicitWidth = 396
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
      end>
    Left = 432
    Top = 128
    StyleName = 'Standard'
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
    object acExcluir: TAction
      Category = 'dados'
      Caption = 'Excluir'
      OnExecute = acExcluirExecute
    end
  end
  object dsTela: TDataSource
    OnStateChange = dsTelaStateChange
    OnDataChange = dsTelaDataChange
    Left = 48
    Top = 216
  end
  object ImageList1: TImageList
    Left = 315
    Top = 193
  end
end
