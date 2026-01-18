object WordMainDataModule: TWordMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object WordADOConnection: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Persist Security Info=True;Data Source=LOC' +
      'ALHOST;User ID=sa;Password=31316@Wks;Initial Catalog=DbaWord'
    DefaultDatabase = 'DbaWord'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 80
    Top = 40
  end
  object WordDataSource: TDataSource
    DataSet = WordADOTable
    Left = 240
    Top = 96
  end
  object WordDataSetProvider: TDataSetProvider
    DataSet = WordADOTable
    Left = 240
    Top = 152
  end
  object WordADOTable: TADOTable
    Connection = WordADOConnection
    CursorType = ctStatic
    IndexName = 'IX_TblWord'
    TableName = 'TblWord'
    Left = 240
    Top = 40
  end
end
