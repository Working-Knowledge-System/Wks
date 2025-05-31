Unit WksFormSoapMainDataModuleUnit;

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
  IFormMainDataModule = interface(IAppServerSOAP)
    ['{B8654CD4-08AE-4DC7-978C-D2D4689E2EAD}']
  end;

  TFormMainDataModule = class(TSoapDataModule, IFormMainDataModule, IAppServerSOAP, IAppServer)
    FormADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    FormADOTable: TADOTable;
    FormDataSetProvider: TDataSetProvider;
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
procedure TWksFormSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TFormMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TFormMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if FormADOConnection.Connected then
    FormADOConnection.Close;
  FormADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TFormMainDataModule, TWksFormSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IFormMainDataModule));
{$ENDREGION}

end.
