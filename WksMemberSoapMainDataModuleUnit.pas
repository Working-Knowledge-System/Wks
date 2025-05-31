Unit WksMemberSoapMainDataModuleUnit;

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
  IMemberMainDataModule = interface(IAppServerSOAP)
    ['{6ED97487-4EF2-47B2-ABE4-02C5697232D9}']
  end;

  TMemberMainDataModule = class(TSoapDataModule, IMemberMainDataModule, IAppServerSOAP, IAppServer)
    MemberADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    MemberADOTable: TADOTable;
    MemberDataSetProvider: TDataSetProvider;
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
procedure TWksMemberSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TMemberMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TMemberMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if MemberADOConnection.Connected then
    MemberADOConnection.Close;
  MemberADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TMemberMainDataModule, TWksMemberSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IMemberMainDataModule));
{$ENDREGION}

end.
