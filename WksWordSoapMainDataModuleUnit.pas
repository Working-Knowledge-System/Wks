Unit WksWordSoapMainDataModuleUnit;

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
  IWordMainDataModule = interface(IAppServerSOAP)
    ['{897BCAF9-AB00-44DB-A733-99D390795B79}']
  end;

  TWordMainDataModule = class(TSoapDataModule, IWordMainDataModule, IAppServerSOAP, IAppServer)
    WordADOConnection: TADOConnection;
    WordADOTable: TADOTable;
    WordDataSource: TDataSource;
    WordDataSetProvider: TDataSetProvider;
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
procedure TWksWordSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TWordMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TWordMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if WordADOConnection.Connected then
    WordADOConnection.Close;
  WordADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TWordMainDataModule, TWksWordSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IWordMainDataModule));
{$ENDREGION}

end.
