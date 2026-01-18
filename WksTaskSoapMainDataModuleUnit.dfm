object TaskMainDataModule: TTaskMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object TaskADOConnection: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Persist Security Info=True;Data Source=LOC' +
      'ALHOST;User ID=sa;Password=31316@Wks;Initial Catalog=DbaTask'
    DefaultDatabase = 'DbaTask'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 80
    Top = 40
  end
  object TaskADOTable: TADOTable
    Connection = TaskADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblTask'
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
  object TaskDataSetProvider: TDataSetProvider
    DataSet = TaskADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = TaskADOConnection
    CursorType = ctStatic
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
end
