object OrganizationMainDataModule: TOrganizationMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 727
  object OrganizationADOConnection: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Persist Security Info=True;Data Source=LOC' +
      'ALHOST;User ID=sa;Password=31316@Wks;Initial Catalog=DbaOrganiza' +
      'tion'
    DefaultDatabase = 'DbaOrganization'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 80
    Top = 40
  end
  object OrganizationADOTable: TADOTable
    Connection = OrganizationADOConnection
    CursorType = ctKeyset
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblOrganization'
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
  object OrganizationDataSetProvider: TDataSetProvider
    DataSet = OrganizationADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = OrganizationADOConnection
    CursorType = ctKeyset
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
  object ThemeADOTable: TADOTable
    Connection = OrganizationADOConnection
    CursorType = ctKeyset
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblTheme'
    Left = 560
    Top = 40
  end
  object ThemeDataSetProvider: TDataSetProvider
    DataSet = ThemeADOTable
    Left = 560
    Top = 152
  end
end
