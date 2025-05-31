object PersonMainDataModule: TPersonMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 1070
  object PersonADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=secret@123;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DbaPerson;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaPerson'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 40
  end
  object PersonADOTable: TADOTable
    Connection = PersonADOConnection
    CursorType = ctKeyset
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblPerson'
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
  object PersonDataSetProvider: TDataSetProvider
    DataSet = PersonADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = PersonADOConnection
    CursorType = ctKeyset
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
  object UserADOTable: TADOTable
    Connection = PersonADOConnection
    CursorType = ctKeyset
    IndexFieldNames = 'FldPersonId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'DbaUser.dbo.TblUser'
    Left = 560
    Top = 40
  end
  object UserDataSetProvider: TDataSetProvider
    DataSet = UserADOTable
    Left = 560
    Top = 152
  end
end
