object DocumentMainDataModule: TDocumentMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object DocumentADOConnection: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Password=secret@123;Persist Security Info=' +
      'True;User ID=sa;Initial Catalog=DbaDocument;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaDocument'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 80
    Top = 40
  end
  object DocumentADOTable: TADOTable
    Connection = DocumentADOConnection
    CursorType = ctKeyset
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblDocument'
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
  object DocumentDataSetProvider: TDataSetProvider
    DataSet = DocumentADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = DocumentADOConnection
    CursorType = ctKeyset
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
end
