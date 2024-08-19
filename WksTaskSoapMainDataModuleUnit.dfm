object TaskMainDataModule: TTaskMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object TaskADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=secret@123;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DbaTask;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaTask'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
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
