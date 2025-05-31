object CodeMainDataModule: TCodeMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object CodeADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=secret@123;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DbaCode;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaCode'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 40
  end
  object CodeADOTable: TADOTable
    Connection = CodeADOConnection
    CursorType = ctKeyset
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblCode'
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
  object CodeDataSetProvider: TDataSetProvider
    DataSet = CodeADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = CodeADOConnection
    CursorType = ctKeyset
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
end
