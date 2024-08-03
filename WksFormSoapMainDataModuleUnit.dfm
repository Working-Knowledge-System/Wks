object FormMainDataModule: TFormMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object FormADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=secret@123;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DbaForm;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaForm'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 40
  end
  object FormADOTable: TADOTable
    Connection = FormADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblForm'
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
  object FormDataSetProvider: TDataSetProvider
    DataSet = FormADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = FormADOConnection
    CursorType = ctStatic
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
end
