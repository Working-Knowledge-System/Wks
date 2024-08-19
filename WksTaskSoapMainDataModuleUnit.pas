Unit WksTaskSoapMainDataModuleUnit;

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
  ITaskMainDataModule = interface(IAppServerSOAP)
    ['{06F9DEAE-E322-48C9-A5C6-D0CA0383AA22}']
  end;

  TTaskMainDataModule = class(TSoapDataModule, ITaskMainDataModule, IAppServerSOAP, IAppServer)
    TaskADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    TaskADOTable: TADOTable;
    TaskDataSetProvider: TDataSetProvider;
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
procedure TWksTaskSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
 obj := TTaskMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TTaskMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  TaskADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TTaskMainDataModule, TWksTaskSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(ITaskMainDataModule));
{$ENDREGION}

end.
