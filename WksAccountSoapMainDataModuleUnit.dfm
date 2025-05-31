object AccountMainDataModule: TAccountMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object AccountADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=secret@123;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DbaAccount;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaAccount'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 40
  end
  object AccountADOTable: TADOTable
    Connection = AccountADOConnection
    CursorType = ctKeyset
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblAccount'
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
  object AccountDataSetProvider: TDataSetProvider
    DataSet = AccountADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = AccountADOConnection
    CursorType = ctKeyset
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
end
