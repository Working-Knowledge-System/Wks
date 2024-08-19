Unit WksPageSoapMainDataModuleUnit;

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
  IPageMainDataModule = interface(IAppServerSOAP)
    ['{06F9DEAE-E322-48C9-A5C6-D0CA0383AA22}']
  end;

  TPageMainDataModule = class(TSoapDataModule, IPageMainDataModule, IAppServerSOAP, IAppServer)
    PageADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    PageADOTable: TADOTable;
    PageDataSetProvider: TDataSetProvider;
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
procedure TWksPageSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
 obj := TPageMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TPageMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  PageADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TPageMainDataModule, TWksPageSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IPageMainDataModule));
{$ENDREGION}

end.
