object SystemMainDataModule: TSystemMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 619
  Width = 540
  object SystemADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=secret@123;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DbaSystem;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaSystem'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 40
  end
  object SystemADOTable: TADOTable
    Connection = SystemADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblSystem'
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
  object SystemDataSetProvider: TDataSetProvider
    DataSet = SystemADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = SystemADOConnection
    CursorType = ctStatic
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
  object LogADOQuery: TADOQuery
    Connection = SystemADOConnection
    Parameters = <>
    SQL.Strings = (
      'select top(1000)'
      '    FldDateTime'
      '  , FldHost'
      '  , FldExe'
      '  , FldLog'
      'from'
      '    DbaSystem.dbo.TblLog'
      'order by'
      '    FldDateTime desc')
    Left = 240
    Top = 232
  end
  object AuditADOQuery: TADOQuery
    Connection = SystemADOConnection
    Parameters = <>
    SQL.Strings = (
      'select top(1000)'
      '    FldDateTime'
      '  , FldUsername'
      '  , FldTable'
      '  , FldField'
      '  , FldValue'
      '  , FldWhere'
      '  , FldQuery'
      '  , FldState'
      '  , FldMesssage'
      '  , FldInMs'
      'from'
      '    DbaSystem.dbo.TblAudit'
      'order by'
      '    FldDateTime desc')
    Left = 400
    Top = 232
  end
  object LogDataSetProvider: TDataSetProvider
    DataSet = LogADOQuery
    Left = 240
    Top = 288
  end
  object AuditDataSetProvider: TDataSetProvider
    DataSet = AuditADOQuery
    Left = 400
    Top = 288
  end
  object ClientsDataSetProvider: TDataSetProvider
    DataSet = ClientsADOTable
    Left = 240
    Top = 488
  end
  object ChangesDataSetProvider: TDataSetProvider
    DataSet = ChangesADOTable
    Left = 400
    Top = 488
  end
  object ClientsADOTable: TADOTable
    Connection = ClientADOConnection
    CursorType = ctStatic
    TableName = 'TblClient'
    Left = 240
    Top = 376
  end
  object ChangesADOTable: TADOTable
    Connection = ClientADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldClient'
    MasterFields = 'FldClient'
    MasterSource = ClientsDataSource
    TableName = 'TblChange'
    Left = 400
    Top = 376
  end
  object ClientsDataSource: TDataSource
    DataSet = ClientsADOTable
    Left = 240
    Top = 432
  end
  object ClientADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=secret@123;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DbaSystem;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaClient'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 376
  end
end
