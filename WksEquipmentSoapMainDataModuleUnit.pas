Unit WksEquipmentSoapMainDataModuleUnit;

interface

{$REGION 'Use'}
uses
    System.SysUtils
  , System.Classes
  , Data.DB
  , Data.Win.ADODB
  , Datasnap.Midas
  , Datasnap.Provider
  , Soap.InvokeRegistry
  , Soap.SOAPDm
  , Soap.SOAPMidas
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  IEquipmentMainDataModule = interface(IAppServerSOAP)
    ['{61ACFFED-7B2D-4A57-8E98-7E82CBE7438A}']
  end;

  TEquipmentMainDataModule = class(TSoapDataModule, IEquipmentMainDataModule, IAppServerSOAP, IAppServer)
    EquipmentADOConnection: TADOConnection;
    EquipmentADOTable: TADOTable;
    EquipmentDataSetProvider: TDataSetProvider;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    EquipmentConfigurationADOTable: TADOTable;
    EquipmentConfigurationDataSetProvider: TDataSetProvider;
    EquipmentProcessADOTable: TADOTable;
    EquipmentProcessDataSetProvider: TDataSetProvider;
    EquipmentCommercialADOTable: TADOTable;
    EquipmentCommercialDataSetProvider: TDataSetProvider;
    procedure SoapDataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.DFM}

uses
    Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Routine'}
procedure TWksEquipmentSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TEquipmentMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TEquipmentMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if EquipmentADOConnection.Connected then
    EquipmentADOConnection.Close;
  EquipmentADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TEquipmentMainDataModule, TWksEquipmentSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IEquipmentMainDataModule));
{$ENDREGION}

end.
