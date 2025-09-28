object ReportMainDataModule: TReportMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 1295
  object ReportADOConnection: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Password=secret@123;Persist Security Info=' +
      'True;User ID=sa;Initial Catalog=DbaReport;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaReport'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 80
    Top = 40
  end
  object ReportADOTable: TADOTable
    Connection = ReportADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblReport'
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
  object ReportDataSetProvider: TDataSetProvider
    DataSet = ReportADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = ReportADOConnection
    CursorType = ctStatic
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
  object ParamADOTable: TADOTable
    Connection = ReportADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId;FldOrder'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblParam'
    Left = 560
    Top = 40
  end
  object DatasetADOTable: TADOTable
    Connection = ReportADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId;FldOrder'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'DbaReport.dbo.TblDataset'
    Left = 720
    Top = 40
  end
  object ChartADOTable: TADOTable
    Connection = ReportADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId;FldDataset'
    MasterFields = 'FldObjectId;FldDataset'
    MasterSource = DatasetDataSource
    TableName = 'DbaReport.dbo.TblChart'
    Left = 880
    Top = 40
  end
  object SerieADOTable: TADOTable
    Connection = ReportADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId;FldDataset;FldChart;FldOrder'
    MasterFields = 'FldObjectId;FldDataset;FldChart'
    MasterSource = ChartDataSource
    TableName = 'DbaReport.dbo.TblSerie'
    Left = 1040
    Top = 40
  end
  object ParamDataSetProvider: TDataSetProvider
    DataSet = ParamADOTable
    Left = 560
    Top = 152
  end
  object DatasetDataSetProvider: TDataSetProvider
    DataSet = DatasetADOTable
    Left = 720
    Top = 152
  end
  object ChartDataSetProvider: TDataSetProvider
    DataSet = ChartADOTable
    Left = 880
    Top = 152
  end
  object SerieDataSetProvider: TDataSetProvider
    DataSet = SerieADOTable
    Left = 1040
    Top = 152
  end
  object DatasetDataSource: TDataSource
    DataSet = DatasetADOTable
    Left = 720
    Top = 96
  end
  object ChartDataSource: TDataSource
    DataSet = ChartADOTable
    Left = 880
    Top = 96
  end
  object GlobalADOTable: TADOTable
    Connection = ReportADOConnection
    CursorType = ctStatic
    TableName = 'TblGlobal'
    Left = 1192
    Top = 40
  end
  object GlobalDataSetProvider: TDataSetProvider
    DataSet = GlobalADOTable
    Left = 1192
    Top = 152
  end
end
