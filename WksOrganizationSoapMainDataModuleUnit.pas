Unit WksOrganizationSoapMainDataModuleUnit;

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
  IOrganizationMainDataModule = interface(IAppServerSOAP)
    ['{06F9DEAE-E322-48C9-A5C6-D0CA0383AA22}']
  end;

  TOrganizationMainDataModule = class(TSoapDataModule, IOrganizationMainDataModule, IAppServerSOAP, IAppServer)
    OrganizationADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    OrganizationADOTable: TADOTable;
    OrganizationDataSetProvider: TDataSetProvider;
    ThemeADOTable: TADOTable;
    ThemeDataSetProvider: TDataSetProvider;
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
procedure TWksOrganizationSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
 obj := TOrganizationMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TOrganizationMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  OrganizationADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TOrganizationMainDataModule, TWksOrganizationSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IOrganizationMainDataModule));
{$ENDREGION}

end.
