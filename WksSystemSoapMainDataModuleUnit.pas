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
    ['{EFD5B5DC-7F6F-4B22-BA56-A343E8AAE309}']
  end;

  TSystemMainDataModule = class(TSoapDataModule, ISystemMainDataModule, IAppServerSOAP, IAppServer)
    SystemADOConnection: TADOConnection;
    SystemADOTable: TADOTable;
    SystemDataSetProvider: TDataSetProvider;
    ObjectADOTable: TADOTable;
    ObjectDataSetProvider: TDataSetProvider;
    ObjectDataSource: TDataSource;
    AuditADOQuery: TADOQuery;
    AuditDataSetProvider: TDataSetProvider;
    BinariesADOTable: TADOTable;
    BinariesDataSetProvider: TDataSetProvider;
    ObjADOTable: TADOTable;
    ObjDataSetProvider: TDataSetProvider;
    LogADOQuery: TADOQuery;
    LogDataSetProvider: TDataSetProvider;
    StateADOTable: TADOTable;
    StateDataSetProvider: TDataSetProvider;
    RequirementsADOTable: TADOTable;
    RequirementsDataSetProvider: TDataSetProvider;
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
  if SystemADOConnection.Connected then
    SystemADOConnection.Close;
  SystemADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TSystemMainDataModule, TWksSystemSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(ISystemMainDataModule));
{$ENDREGION}

end.
