object AgentMainDataModule: TAgentMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object AgentADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=secret@123;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DbaAgent;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaAgent'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 40
  end
  object AgentADOTable: TADOTable
    Connection = AgentADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblAgent'
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
  object AgentDataSetProvider: TDataSetProvider
    DataSet = AgentADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = AgentADOConnection
    CursorType = ctStatic
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
end
