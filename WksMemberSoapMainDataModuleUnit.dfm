object MemberMainDataModule: TMemberMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object MemberADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=secret@123;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DbaMember;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaMember'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 40
  end
  object MemberADOTable: TADOTable
    Connection = MemberADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblMember'
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
  object MemberDataSetProvider: TDataSetProvider
    DataSet = MemberADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = MemberADOConnection
    CursorType = ctStatic
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
end
