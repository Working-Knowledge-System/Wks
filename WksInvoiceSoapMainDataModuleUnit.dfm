object InvoiceMainDataModule: TInvoiceMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 271
  Width = 540
  object InvoiceADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=secret@123;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DbaInvoice;Data Source=LOCALHOST'
    DefaultDatabase = 'DbaInvoice'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 40
  end
  object InvoiceADOTable: TADOTable
    Connection = InvoiceADOConnection
    CursorType = ctKeyset
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblInvoice'
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
  object InvoiceDataSetProvider: TDataSetProvider
    DataSet = InvoiceADOTable
    Left = 400
    Top = 152
  end
  object ObjectADOTable: TADOTable
    Connection = InvoiceADOConnection
    CursorType = ctKeyset
    TableName = 'TblObject'
    Left = 240
    Top = 40
  end
end
