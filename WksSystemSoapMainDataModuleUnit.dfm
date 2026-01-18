object SystemMainDataModule: TSystemMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 815
  Width = 802
  object SystemADOConnection: TADOConnection
    Connected = False
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Persist Security Info=True;Data Source=LOC' +
      'ALHOST;User ID=sa;Password=31316@Wks;Initial Catalog=DbaSystem'
    DefaultDatabase = 'DbaSystem'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 80
    Top = 16
  end
  object SystemADOTable: TADOTable
    Connection = SystemADOConnection
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblSystem'
    Left = 240
    Top = 64
  end
  object ObjectDataSource: TDataSource
    DataSet = ObjectADOTable
    Left = 240
    Top = 16
  end
  object ObjectDataSetProvider: TDataSetProvider
    DataSet = ObjectADOTable
    Left = 624
    Top = 16
  end
  object SystemDataSetProvider: TDataSetProvider
    DataSet = SystemADOTable
    Left = 624
    Top = 64
  end
  object ObjectADOTable: TADOTable
    Connection = SystemADOConnection
    TableName = 'TblObject'
    Left = 432
    Top = 16
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
    Top = 208
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
      '  , FldMessage'
      '  , FldInMs'
      'from'
      '    DbaSystem.dbo.TblAudit'
      'order by'
      '    FldDateTime desc')
    Left = 240
    Top = 256
  end
  object LogDataSetProvider: TDataSetProvider
    DataSet = LogADOQuery
    Left = 624
    Top = 208
  end
  object AuditDataSetProvider: TDataSetProvider
    DataSet = AuditADOQuery
    Left = 624
    Top = 256
  end
  object BinariesDataSetProvider: TDataSetProvider
    DataSet = BinariesADOTable
    Left = 624
    Top = 304
  end
  object ObjDataSetProvider: TDataSetProvider
    DataSet = ObjADOTable
    Left = 624
    Top = 112
  end
  object BinariesADOTable: TADOTable
    Connection = SystemADOConnection
    TableName = 'TblBinary'
    Left = 240
    Top = 304
  end
  object ObjADOTable: TADOTable
    Connection = SystemADOConnection
    TableName = 'TblObj'
    Left = 240
    Top = 112
  end
  object StateADOTable: TADOTable
    Connection = SystemADOConnection
    TableName = 'TblState'
    Left = 240
    Top = 160
  end
  object StateDataSetProvider: TDataSetProvider
    DataSet = StateADOTable
    Left = 624
    Top = 160
  end
  object RequirementsADOTable: TADOTable
    Connection = SystemADOConnection
    TableName = 'TblRequirement'
    Left = 240
    Top = 352
  end
  object RequirementsDataSetProvider: TDataSetProvider
    DataSet = RequirementsADOTable
    Left = 624
    Top = 352
  end
  object SourceDataSetProvider: TDataSetProvider
    DataSet = SourceADOTable
    Left = 624
    Top = 400
  end
  object SourceADOTable: TADOTable
    Connection = SystemADOConnection
    TableName = 'TblSource'
    Left = 240
    Top = 400
  end
  object DatabaseDbaADOTable: TADOTable
    Connection = SystemADOConnection
    CursorType = ctStatic
    TableName = 'TblDatabase'
    Left = 240
    Top = 520
  end
  object DatabaseDbaDataSetProvider: TDataSetProvider
    DataSet = DatabaseDbaADOTable
    Left = 624
    Top = 520
  end
  object ServerADOTable: TADOTable
    Connection = SystemADOConnection
    CursorType = ctStatic
    TableName = 'TblServer'
    Left = 240
    Top = 448
  end
  object ServerDataSetProvider: TDataSetProvider
    DataSet = ServerADOTable
    Left = 624
    Top = 448
  end
  object DatabaseTblADOTable: TADOTable
    Connection = SystemADOConnection
    CursorType = ctStatic
    TableName = 'TblTable'
    Left = 240
    Top = 568
  end
  object DatabaseTblDataSetProvider: TDataSetProvider
    DataSet = DatabaseTblADOTable
    Left = 624
    Top = 568
  end
  object DatabaseFldADOTable: TADOTable
    Connection = SystemADOConnection
    CursorType = ctStatic
    TableName = 'TblField'
    Left = 240
    Top = 616
  end
  object DatabaseFldDataSetProvider: TDataSetProvider
    DataSet = DatabaseFldADOTable
    Left = 624
    Top = 616
  end
  object DatabaseIdxADOTable: TADOTable
    Connection = SystemADOConnection
    CursorType = ctStatic
    TableName = 'TblIndex'
    Left = 240
    Top = 664
  end
  object DatabaseIdxDataSetProvider: TDataSetProvider
    DataSet = DatabaseIdxADOTable
    Left = 624
    Top = 664
  end
  object DatabaseAccountADOTable: TADOTable
    Connection = SystemADOConnection
    CursorType = ctStatic
    TableName = 'TblAccount'
    Left = 240
    Top = 712
  end
  object DatabaseAccountDataSetProvider: TDataSetProvider
    DataSet = DatabaseAccountADOTable
    Left = 624
    Top = 712
  end
end
