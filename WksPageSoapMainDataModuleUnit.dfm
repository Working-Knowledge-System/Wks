object PageMainDataModule: TPageMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object PageADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=secret@123;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DbaPage;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaPage'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 40
  end
  object PageADOTable: TADOTable
    Connection = PageADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblPage'
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
  object PageDataSetProvider: TDataSetProvider
    DataSet = PageADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = PageADOConnection
    CursorType = ctStatic
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
end
