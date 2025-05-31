Unit WksAgentSoapMainDataModuleUnit;

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
  IAgentMainDataModule = interface(IAppServerSOAP)
    ['{FAE95A0B-8260-40FB-AABF-709802EAF92D}']
  end;

  TAgentMainDataModule = class(TSoapDataModule, IAgentMainDataModule, IAppServerSOAP, IAppServer)
    AgentADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    AgentADOTable: TADOTable;
    AgentDataSetProvider: TDataSetProvider;
    AgentActiveDataSetProvider: TDataSetProvider;
    AgentActiveADOQuery: TADOQuery;
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
procedure TWksAgentSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TAgentMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TAgentMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if AgentADOConnection.Connected then
    AgentADOConnection.Close;
  AgentADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TAgentMainDataModule, TWksAgentSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IAgentMainDataModule));
{$ENDREGION}

end.
