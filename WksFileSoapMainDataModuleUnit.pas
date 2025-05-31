Unit WksFileSoapMainDataModuleUnit;

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
  IFileMainDataModule = interface(IAppServerSOAP)
    ['{40C2F072-99C7-44B2-BD80-51C173B77C87}']
  end;

  TFileMainDataModule = class(TSoapDataModule, IFileMainDataModule, IAppServerSOAP, IAppServer)
    FileADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    FileADOTable: TADOTable;
    FileDataSetProvider: TDataSetProvider;
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
procedure TWksFileSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TFileMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TFileMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if FileADOConnection.Connected then
    FileADOConnection.Close;
  FileADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TFileMainDataModule, TWksFileSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IFileMainDataModule));
{$ENDREGION}

end.
