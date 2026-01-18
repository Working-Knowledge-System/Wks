object SpcMainDataModule: TSpcMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object SpcADOConnection: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Persist Security Info=True;Data Source=LOC' +
      'ALHOST;User ID=sa;Password=31316@Wks;Initial Catalog=DbaSpc'
    DefaultDatabase = 'DbaSpc'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 80
    Top = 40
  end
  object SpcADOTable: TADOTable
    Connection = SpcADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblSpc'
    Left = 400
    Top = 40
  end
  object ObjectDataSource: TDataSource
    DataSet = ObjectADOTable
    Left = 240
    Top = 96
  end
  object ObjectDataSetProvider: TDataSetProvider
    DataSet = ObjectADOTable
    Left = 240
    Top = 152
  end
  object SpcDataSetProvider: TDataSetProvider
    DataSet = SpcADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = SpcADOConnection
    CursorType = ctStatic
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
end
