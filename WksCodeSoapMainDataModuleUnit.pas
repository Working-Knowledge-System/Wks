Unit WksCodeSoapMainDataModuleUnit;

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
  ICodeMainDataModule = interface(IAppServerSOAP)
    ['{3A776DD3-B53F-4908-B371-85493190F0F2}']
  end;

  TCodeMainDataModule = class(TSoapDataModule, ICodeMainDataModule, IAppServerSOAP, IAppServer)
    CodeADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    CodeADOTable: TADOTable;
    CodeDataSetProvider: TDataSetProvider;
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
procedure TWksCodeSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TCodeMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TCodeMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if CodeADOConnection.Connected then
    CodeADOConnection.Close;
  CodeADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TCodeMainDataModule, TWksCodeSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(ICodeMainDataModule));
{$ENDREGION}

end.
