object FileMainDataModule: TFileMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object FileADOConnection: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Persist Security Info=True;Data Source=LOC' +
      'ALHOST;User ID=sa;Password=31316@Wks;Initial Catalog=DbaFile'
    DefaultDatabase = 'DbaFile'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 80
    Top = 40
  end
  object FileADOTable: TADOTable
    Connection = FileADOConnection
    CursorType = ctKeyset
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblFile1'
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
  object FileDataSetProvider: TDataSetProvider
    DataSet = FileADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = FileADOConnection
    CursorType = ctKeyset
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
end
