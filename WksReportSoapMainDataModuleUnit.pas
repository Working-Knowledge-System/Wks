Unit WksReportSoapMainDataModuleUnit;

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
  IReportMainDataModule = interface(IAppServerSOAP)
    ['{E6042B90-92E0-44DF-9EBD-688326ABA646}']
  end;

  TReportMainDataModule = class(TSoapDataModule, IReportMainDataModule, IAppServerSOAP, IAppServer)
    ReportADOConnection: TADOConnection;
    ObjectADOTable: TADOTable;
    ObjectDataSource: TDataSource;
    ObjectDataSetProvider: TDataSetProvider;
    ReportADOTable: TADOTable;
    ReportDataSetProvider: TDataSetProvider;
    ParamADOTable: TADOTable;
    DatasetADOTable: TADOTable;
    ChartADOTable: TADOTable;
    SerieADOTable: TADOTable;
    ParamDataSetProvider: TDataSetProvider;
    DatasetDataSetProvider: TDataSetProvider;
    ChartDataSetProvider: TDataSetProvider;
    SerieDataSetProvider: TDataSetProvider;
    DatasetDataSource: TDataSource;
    ChartDataSource: TDataSource;
    GlobalADOTable: TADOTable;
    GlobalDataSetProvider: TDataSetProvider;
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
procedure TWksReportSoapMainDataModuleUnitCreateInstance(out obj: TObject);
begin
  obj := TReportMainDataModule.Create(nil);
end;
{$ENDREGION}

{$REGION 'TMainDataModule'}
procedure TReportMainDataModule.SoapDataModuleCreate(Sender: TObject);
begin
  if ReportADOConnection.Connected then
    ReportADOConnection.Close;
  ReportADOConnection.ConnectionString := DBA_CONNECTION_STR;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TReportMainDataModule, TWksReportSoapMainDataModuleUnitCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(IReportMainDataModule));
{$ENDREGION}

end.
