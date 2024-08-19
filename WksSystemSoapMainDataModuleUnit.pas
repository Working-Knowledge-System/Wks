Unit WksSystemSoapMainDataModuleUnit;

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
  ISystemMainDataModule = interface(IAppServerSOAP)
    ['{06F9DEAE-E322-48C9-A5C6-D0CA0383AA22}']
  end;

  TSystemMainDataModule = class(TSoapDataModule, ISystemMainDataModule, IAppServerSOAP, IAppServer)
    SystemADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    SystemADOTable: TADOTable;
    SystemDataSetProvider: TDataSetProvider;
    LogADOQuery: TADOQuery;
    AuditADOQuery: TADOQuery;
    LogDataSetProvider: TDataSetProvider;
    AuditDataSetProvider: TDataSetProvider;
    ClientsDataSetProvider: TDataSetProvider;
    ChangesDataSetProvider: TDataSetProvider;
    ClientsADOTable: TADOTable;
    ChangesADOTable: TADOTable;
    ClientsDataSource: TDataSource;
    ClientADOConnection: TADOConnection;
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
procedure TWksSystemSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
 obj := TSystemMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TSystemMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  SystemADOConnection.ConnectionString := DBA_CONNECTION_STR;
  ClientADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TSystemMainDataModule, TWksSystemSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(ISystemMainDataModule));
{$ENDREGION}

end.
