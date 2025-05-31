Unit WksPersonSoapMainDataModuleUnit;

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
  IPersonMainDataModule = interface(IAppServerSOAP)
    ['{049372A4-CC37-4643-AFB0-50FD5B42EFD8}']
  end;

  TPersonMainDataModule = class(TSoapDataModule, IPersonMainDataModule, IAppServerSOAP, IAppServer)
    PersonADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    PersonADOTable: TADOTable;
    PersonDataSetProvider: TDataSetProvider;
    UserADOTable: TADOTable;
    UserDataSetProvider: TDataSetProvider;
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
procedure TWksPersonSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TPersonMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TPersonMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if PersonADOConnection.Connected then
    PersonADOConnection.Close;
  PersonADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TPersonMainDataModule, TWksPersonSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IPersonMainDataModule));
{$ENDREGION}

end.
