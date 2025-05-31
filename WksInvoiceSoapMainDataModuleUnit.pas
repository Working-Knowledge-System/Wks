Unit WksInvoiceSoapMainDataModuleUnit;

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
  IInvoiceMainDataModule = interface(IAppServerSOAP)
    ['{5A8AA1C5-D62B-47B7-8138-F0F5452460FE}']
  end;

  TInvoiceMainDataModule = class(TSoapDataModule, IInvoiceMainDataModule, IAppServerSOAP, IAppServer)
    InvoiceADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    InvoiceADOTable: TADOTable;
    InvoiceDataSetProvider: TDataSetProvider;
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
procedure TWksInvoiceSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TInvoiceMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TInvoiceMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if InvoiceADOConnection.Connected then
    InvoiceADOConnection.Close;
  InvoiceADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TInvoiceMainDataModule, TWksInvoiceSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IInvoiceMainDataModule));
{$ENDREGION}

end.
