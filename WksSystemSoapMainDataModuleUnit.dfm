object SystemMainDataModule: TSystemMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 251
  Width = 1469
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
    Left = 872
    Top = 40
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
    Left = 1032
    Top = 40
  end
  object LogDataSetProvider: TDataSetProvider
    DataSet = LogADOQuery
    Left = 872
    Top = 152
  end
  object AuditDataSetProvider: TDataSetProvider
    DataSet = AuditADOQuery
    Left = 1032
    Top = 152
  end
  object BinariesDataSetProvider: TDataSetProvider
    DataSet = BinariesADOTable
    Left = 1184
    Top = 152
  end
  object ObjDataSetProvider: TDataSetProvider
    DataSet = ObjADOTable
    Left = 560
    Top = 152
  end
  object BinariesADOTable: TADOTable
    Connection = SystemADOConnection
    TableName = 'TblBinary'
    Left = 1184
    Top = 40
  end
  object ObjADOTable: TADOTable
    Connection = SystemADOConnection
    TableName = 'TblObj'
    Left = 560
    Top = 40
  end
  object StateADOTable: TADOTable
    Connection = SystemADOConnection
    TableName = 'TblState'
    Left = 720
    Top = 40
  end
  object StateDataSetProvider: TDataSetProvider
    DataSet = StateADOTable
    Left = 720
    Top = 152
  end
  object RequirementsADOTable: TADOTable
    Connection = SystemADOConnection
    TableName = 'TblRequirement'
    Left = 1336
    Top = 40
  end
  object RequirementsDataSetProvider: TDataSetProvider
    DataSet = RequirementsADOTable
    Left = 1336
    Top = 152
  end
end
