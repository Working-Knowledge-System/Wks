object EquipmentMainDataModule: TEquipmentMainDataModule
  OnCreate = SoapDataModuleCreate
  Height = 611
  Width = 670
  object EquipmentADOConnection: TADOConnection
    Connected = False
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Persist Security Info=True;Data Source=LOC' +
      'ALHOST;User ID=sa;Password=31316@Wks;Initial Catalog=DbaEquipmen' +
      't'
    DefaultDatabase = 'DbaEquipment'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 80
    Top = 16
  end
  object EquipmentADOTable: TADOTable
    Connection = EquipmentADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblEquipment'
    Left = 240
    Top = 72
  end
  object ObjectDataSource: TDataSource
    DataSet = ObjectADOTable
    Left = 376
    Top = 16
  end
  object ObjectDataSetProvider: TDataSetProvider
    DataSet = ObjectADOTable
    Left = 512
    Top = 16
  end
  object EquipmentDataSetProvider: TDataSetProvider
    DataSet = EquipmentADOTable
    Left = 512
    Top = 72
  end
  object ObjectADOTable: TADOTable
    Connection = EquipmentADOConnection
    CursorType = ctStatic
    TableName = 'TblObject'
    Left = 240
    Top = 16
  end
  object EquipmentConfigurationADOTable: TADOTable
    Connection = EquipmentADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblConfiguration'
    Left = 240
    Top = 128
  end
  object EquipmentConfigurationDataSetProvider: TDataSetProvider
    DataSet = EquipmentConfigurationADOTable
    Left = 512
    Top = 128
  end
  object EquipmentProcessADOTable: TADOTable
    Connection = EquipmentADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblProcess'
    Left = 240
    Top = 184
  end
  object EquipmentProcessDataSetProvider: TDataSetProvider
    DataSet = EquipmentProcessADOTable
    Left = 512
    Top = 184
  end
  object EquipmentCommercialADOTable: TADOTable
    Connection = EquipmentADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    TableName = 'TblCommercial'
    Left = 240
    Top = 240
  end
  object EquipmentCommercialDataSetProvider: TDataSetProvider
    DataSet = EquipmentCommercialADOTable
    Left = 512
    Top = 240
  end
end
