Unit WksAccountSoapMainDataModuleUnit;

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
  IAccountMainDataModule = interface(IAppServerSOAP)
    ['{21B8AA13-C808-491A-AFED-92DB131F6A37}']
  end;

  TAccountMainDataModule = class(TSoapDataModule, IAccountMainDataModule, IAppServerSOAP, IAppServer)
    AccountADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    AccountADOTable: TADOTable;
    AccountDataSetProvider: TDataSetProvider;
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
procedure TWksAccountSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TAccountMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TAccountMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if AccountADOConnection.Connected then
    AccountADOConnection.Close;
  AccountADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TAccountMainDataModule, TWksAccountSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IAccountMainDataModule));
{$ENDREGION}

end.
