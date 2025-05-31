Unit WksDocumentSoapMainDataModuleUnit;

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
  IDocumentMainDataModule = interface(IAppServerSOAP)
    ['{55CB7911-5432-43E4-83DF-A63A1812A49A}']
  end;

  TDocumentMainDataModule = class(TSoapDataModule, IDocumentMainDataModule, IAppServerSOAP, IAppServer)
    DocumentADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    DocumentADOTable: TADOTable;
    DocumentDataSetProvider: TDataSetProvider;
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
procedure TWksDocumentSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TDocumentMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TDocumentMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if DocumentADOConnection.Connected then
    DocumentADOConnection.Close;
  DocumentADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TDocumentMainDataModule, TWksDocumentSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IDocumentMainDataModule));
{$ENDREGION}

end.
