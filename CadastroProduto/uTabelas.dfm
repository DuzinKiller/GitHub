object dmTabelas: TdmTabelas
  OldCreateOrder = False
  Height = 459
  Width = 884
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=DESKTOP-4JPSGQB\sqlexpress'
      'Database=CadastroProduto'
      'OSAuthent=Yes'
      'User_Name=sa'
      'Password=masterkey'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 112
    Top = 168
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 112
    Top = 216
  end
  object dsProduto: TDataSource
    DataSet = FDTableProduto
    Left = 272
    Top = 72
  end
  object FDTableProduto: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'PRODUTO'
    TableName = 'PRODUTO'
    Left = 272
    Top = 16
  end
  object FDConsulta: TFDQuery
    Connection = FDConnection1
    Left = 432
    Top = 16
  end
  object dsConsulta: TDataSource
    DataSet = FDConsulta
    Left = 432
    Top = 64
  end
end
