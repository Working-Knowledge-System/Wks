object CodeMainDataModule: TCodeMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 237
  Width = 728
  object CodeADOConnection: TADOConnection
    Connected = False
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Persist Security Info=True;Data Source=LOC' +
      'ALHOST;User ID=sa;Password=31316@Wks;Initial Catalog=DbaCode'
    DefaultDatabase = 'DbaCode'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 80
    Top = 16
  end
  object CodeADOTable: TADOTable
    Connection = CodeADOConnection
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblCode'
    Left = 240
    Top = 72
  end
  object ObjectDataSource: TDataSource
    DataSet = ObjectADOTable
    Left = 400
    Top = 16
  end
  object ObjectDataSetProvider: TDataSetProvider
    DataSet = ObjectADOTable
    Left = 560
    Top = 16
  end
  object CodeDataSetProvider: TDataSetProvider
    DataSet = CodeADOTable
    Left = 560
    Top = 72
  end
  object ObjectADOTable: TADOTable
    Connection = CodeADOConnection
    TableName = 'TblObject'
    Left = 240
    Top = 16
  end
  object CodeSqlResultADOQuery: TADOQuery
    Connection = CodeADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PObjectId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'declare @sql varchar(max)'
      'select @sql = FldContent'
      'from [DbaCode].[dbo].[TblObject]'
      'where FldId = :PObjectId'
      ''
      'exec(@sql)')
    Left = 240
    Top = 128
  end
  object CodeSqlResultDataSetProvider: TDataSetProvider
    DataSet = CodeSqlResultADOQuery
    Left = 560
    Top = 128
  end
end
