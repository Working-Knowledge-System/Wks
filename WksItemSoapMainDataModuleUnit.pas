Unit WksItemSoapMainDataModuleUnit;

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
  IItemMainDataModule = interface(IAppServerSOAP)
    ['{A9CB6DB3-B5DD-46A1-A07F-9627248D2B28}']
  end;

  TItemMainDataModule = class(TSoapDataModule, IItemMainDataModule, IAppServerSOAP, IAppServer)
    ItemADOConnection: TADOConnection;
    ItemADOTable: TADOTable;
    ItemDataSetProvider: TDataSetProvider;
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
procedure TWksItemSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TItemMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TItemMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if ItemADOConnection.Connected then
    ItemADOConnection.Close;
  ItemADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TItemMainDataModule, TWksItemSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IItemMainDataModule));
{$ENDREGION}

end.
