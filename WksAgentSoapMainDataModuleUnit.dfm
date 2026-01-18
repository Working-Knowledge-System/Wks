object AgentMainDataModule: TAgentMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 715
  object AgentADOConnection: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Persist Security Info=True;Data Source=LOC' +
      'ALHOST;User ID=sa;Password=31316@Wks;Initial Catalog=DbaAgent'
    DefaultDatabase = 'DbaAgent'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 80
    Top = 40
  end
  object AgentADOTable: TADOTable
    Connection = AgentADOConnection
    CursorType = ctKeyset
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
    CursorType = ctKeyset
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
  object AgentActiveDataSetProvider: TDataSetProvider
    DataSet = AgentActiveADOQuery
    Left = 560
    Top = 152
  end
  object AgentActiveADOQuery: TADOQuery
    Connection = AgentADOConnection
    Parameters = <>
    SQL.Strings = (
      'select'
      '    b.FldId'
      '  , b.FldState'
      '  , b.FldContentKind'
      '  , b.FldContent'
      '  , b.FldData'
      '  , b.FldObject'
      
        '  , isnull(nullif(a.FldRunAtYear    , '#39#39'), '#39'*'#39'  ) as FldRunAtYea' +
        'r'
      
        '  , isnull(nullif(a.FldRunAtQuarter , '#39#39'), '#39'*'#39'  ) as FldRunAtQua' +
        'rter'
      
        '  , isnull(nullif(a.FldRunAtMonth   , '#39#39'), '#39'*'#39'  ) as FldRunAtMon' +
        'th'
      
        '  , isnull(nullif(a.FldRunAtWeek    , '#39#39'), '#39'*'#39'  ) as FldRunAtWee' +
        'k'
      
        '  , isnull(nullif(a.FldRunAtWeekMode, '#39#39'), '#39'iso'#39') as FldRunAtWee' +
        'kMode'
      '  , isnull(nullif(a.FldRunAtDay     , '#39#39'), '#39'*'#39'  ) as FldRunAtDay'
      
        '  , isnull(nullif(a.FldRunAtHour    , '#39#39'), '#39'*'#39'  ) as FldRunAtHou' +
        'r'
      
        '  , isnull(nullif(a.FldRunAtMinute  , '#39#39'), '#39'*'#39'  ) as FldRunAtMin' +
        'ute'
      
        '  , isnull(nullif(a.FldRunAtSecond  , '#39#39'), '#39'*'#39'  ) as FldRunAtSec' +
        'ond'
      '  , a.FldOnSuccess'
      '  , a.FldOnFail'
      '  , a.FldOnEmpty'
      'from'
      '    DbaAgent.dbo.TblAgent  a inner join'
      '    DbaAgent.dbo.TblObject b on (b.FldId = a.FldObjectId)'
      'where'
      '    b.FldId > 100'
      'and b.FldState = '#39'Active'#39
      'order by'
      '    a.FldRunAtHour'
      '  , a.FldRunAtMinute'
      '  , a.FldRunAtSecond')
    Left = 560
    Top = 40
  end
end
