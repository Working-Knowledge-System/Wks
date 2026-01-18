unit WksSpcSoapMainDataModuleUnit;

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
  ISpcMainDataModule = interface(IAppServerSOAP)
    ['{06F9DEAE-E322-48C9-A5C6-D0CA0383AA22}'] // *** CHANGE IN NEW OBJ USING CTRL+SHIFT+G ***
  end;

  TSpcMainDataModule = class(TSoapDataModule, ISpcMainDataModule, IAppServerSOAP, IAppServer)
    SpcADOConnection: TADOConnection;
    SpcADOTable: TADOTable;
    SpcDataSetProvider: TDataSetProvider;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
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
procedure TWksSpcSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TSpcMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TSpcMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if SpcADOConnection.Connected then
    SpcADOConnection.Close;
  SpcADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TSpcMainDataModule, TWksSpcSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(ISpcMainDataModule));
{$ENDREGION}

end.
