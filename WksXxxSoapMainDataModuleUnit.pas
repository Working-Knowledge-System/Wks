Unit WksXxxSoapMainDataModuleUnit;

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
  IXxxMainDataModule = interface(IAppServerSOAP)
    ['{06F9DEAE-E322-48C9-A5C6-D0CA0383AA22}']
  end;

  TXxxMainDataModule = class(TSoapDataModule, IXxxMainDataModule, IAppServerSOAP, IAppServer)
    XxxADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    XxxADOTable: TADOTable;
    XxxDataSetProvider: TDataSetProvider;
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
procedure TWksXxxSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
 obj := TXxxMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TXxxMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  XxxADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TXxxMainDataModule, TWksXxxSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IXxxMainDataModule));
{$ENDREGION}

end.
