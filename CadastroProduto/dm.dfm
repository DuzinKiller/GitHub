object dmProduto: TdmProduto
  OldCreateOrder = False
  Height = 197
  Width = 307
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=cadastroproduto'
      'User_Name=sa'
      'Password=masterkey'
      'Server=.\sqlexpress'
      'DriverID=MSSQL')
    Left = 47
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 167
    Top = 64
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 47
    Top = 64
  end
end
