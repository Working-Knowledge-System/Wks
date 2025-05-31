object WordMainDataModule: TWordMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object WordADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=secret@123;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DbaWord;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaWord'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
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
