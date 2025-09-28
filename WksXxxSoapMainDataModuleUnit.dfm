object XxxMainDataModule: TXxxMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object XxxADOConnection: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Password=secret@123;Persist Security Info=' +
      'True;User ID=sa;Initial Catalog=DbaXxx;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaXxx'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 80
    Top = 40
  end
  object XxxADOTable: TADOTable
    Connection = XxxADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblXxx'
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
  object XxxDataSetProvider: TDataSetProvider
    DataSet = XxxADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = XxxADOConnection
    CursorType = ctStatic
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
end
