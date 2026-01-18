unit WksReportClientMainFormUnit;

interface

{$REGION 'Uses'}
uses
    Winapi.Windows
  , Winapi.ActiveX
  , Winapi.Messages
  , Winapi.WebView2
  , System.Actions
  , System.Classes
  , System.ImageList
  , System.SysUtils
  , System.Variants
  , Vcl.ActnList
  , Vcl.AppEvnts
  , Vcl.Buttons
  , Vcl.ComCtrls
  , Vcl.Controls
  , Vcl.DBCtrls
  , Vcl.DBGrids
  , Vcl.Dialogs
  , Vcl.Edge
  , Vcl.ExtCtrls
  , Vcl.Forms
  , Vcl.Graphics
  , Vcl.Grids
  , Vcl.ImgList
  , Vcl.Mask
  , Vcl.Menus
  , Vcl.StdCtrls
  , Vcl.ToolWin
  , Vcl.WinXCtrls
  , Data.DB
  , Datasnap.DBClient
  , Soap.SOAPConn
  , JvClock
  , JvComponentBase
  , JvDBDateTimePicker
  , JvDateTimePicker
  , JvExComCtrls
  , JvExControls
  , JvExExtCtrls
  , JvExMask
  , JvExtComponent
  , JvNetscapeSplitter
  , JvScrollMax
  , JvSpin
  , JvThreadTimer
  , SynDBEdit
  , SynEdit
  , VirtualTrees
  , DTClientTree
  , DTDBTreeView
  , WksBaseClientMainFormUnit
  , WksLogFrameUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TReportMainForm = class(TBaseMainForm)
    ChartClientDataSet: TClientDataSet;
    ChartDataSource: TDataSource;
    DatasetClientDataSet: TClientDataSet;
    DatasetDataSource: TDataSource;
    ReportDatasetPageControl: TPageControl;
    ParamClientDataSet: TClientDataSet;
    ParamDataSource: TDataSource;
    ReportAction: TActionList;
    ReportAliasDBEdit: TDBEdit;
    ReportAliasLabel: TLabel;
    ReportChartChartDBEdit: TDBEdit;
    ReportChartChartLabel: TLabel;
    ReportChartDBGrid: TDBGrid;
    ReportChartDBNavigator: TDBNavigator;
    ReportChartDescriptionDBEdit: TDBEdit;
    ReportChartDescriptionLabel: TLabel;
    ReportChartHeightDBEdit: TDBEdit;
    ReportChartHeightLabel: TLabel;
    ReportChartJvScrollMaxBand: TJvScrollMaxBand;
    ReportChartLabel: TLabel;
    ReportChartOrderDBEdit: TDBEdit;
    ReportChartOrderLabel: TLabel;
    ReportChartPanelClosedDBCheckBox: TDBCheckBox;
    ReportChartPanelOnDBCheckBox: TDBCheckBox;
    ReportChartSplitter: TSplitter;
    ReportChartStateDBComboBox: TDBComboBox;
    ReportChartStateLabel: TLabel;
    ReportChartTabSheet: TTabSheet;
    ReportChartTitleDBEdit: TDBEdit;
    ReportChartTitleLabel: TLabel;
    ReportChartTitleOnDBCheckBox: TDBCheckBox;
    ReportChartTopPanel: TPanel;
    ReportChartWidthDBEdit: TDBEdit;
    ReportChartWidthLabel: TLabel;
    ReportChartXCaptionDBEdit: TDBEdit;
    ReportChartXCaptionLabel: TLabel;
    ReportChartXLabelAngleDegDBEdit: TDBEdit;
    ReportChartXLabelAngleDegLabel: TLabel;
    ReportChartYCaptionDBEdit: TDBEdit;
    ReportChartYCaptionLabel: TLabel;
    ReportChartYLabelAngleDegDBEdit: TDBEdit;
    ReportChartYLabelAngleDegLabel: TLabel;
    ReportClassDBEdit: TDBEdit;
    ReportClassLabel: TLabel;
    ReportClientDataSet: TClientDataSet;
    ReportDBNavigator: TDBNavigator;
    ReportDataSource: TDataSource;
    ReportDatasetClassDBEdit: TDBEdit;
    ReportDatasetClassLabel: TLabel;
    ReportDatasetConnLibDBComboBox: TDBComboBox;
    ReportDatasetConnLibLabel: TLabel;
    ReportDatasetConnStrDBEdit: TDBEdit;
    ReportDatasetConnStrLabel: TLabel;
    ReportDatasetDBEdit: TDBEdit;
    ReportDatasetDBGrid: TDBGrid;
    ReportDatasetDBNavigator: TDBNavigator;
    ReportDatasetDatasetsLabel: TLabel;
    ReportDatasetDeleteDBSynEdit: TDBSynEdit;
    ReportDatasetDeleteTabSheet: TTabSheet;
    ReportDatasetDescriptionDBEdit: TDBEdit;
    ReportDatasetDescriptionLabel: TLabel;
    ReportDatasetEditableDBCheckBox: TDBCheckBox;
    ReportDatasetEditorCsvDBEdit: TDBEdit;
    ReportDatasetEditorCsvLabel: TLabel;
    ReportDatasetInsertDBSynEdit: TDBSynEdit;
    ReportDatasetInsertTabSheet: TTabSheet;
    ReportDatasetJsonDBSynEdit: TDBSynEdit;
    ReportDatasetJsonTabSheet: TTabSheet;
    ReportDatasetJsonTemplateLabel: TLabel;
    ReportDatasetJsonValidateLabel: TLabel;
    ReportDatasetJvScrollMaxBand: TJvScrollMaxBand;
    ReportDatasetLabel: TLabel;
    ReportDatasetLanguageDBComboBox: TDBComboBox;
    ReportDatasetLanguageLabel: TLabel;
    ReportDatasetMaxRecordsDBEdit: TDBEdit;
    ReportDatasetMaxRecordsLabel: TLabel;
    ReportDatasetOrderDBEdit: TDBEdit;
    ReportDatasetOrderLabel: TLabel;
    ReportDatasetPanelClosedDBCheckBox: TDBCheckBox;
    ReportDatasetPanelOnDBCheckBox: TDBCheckBox;
    ReportDatasetSelectDBSynEdit: TDBSynEdit;
    ReportDatasetSelectTabSheet: TTabSheet;
    ReportDatasetSplitter: TSplitter;
    ReportDatasetStateDBComboBox: TDBComboBox;
    ReportDatasetStateLabel: TLabel;
    ReportDatasetStyleDBEdit: TDBEdit;
    ReportDatasetStyleLabel: TLabel;
    ReportDatasetSwitchDBEdit: TDBEdit;
    ReportDatasetSwitchLabel: TLabel;
    ReportDatasetTabSheet: TTabSheet;
    ReportDatasetTimeoutSecDBEdit: TDBEdit;
    ReportDatasetTimeoutSecLabel: TLabel;
    ReportDatasetTitleDBEdit: TDBEdit;
    ReportDatasetTitleLabel: TLabel;
    ReportDatasetTitleOnDBCheckBox: TDBCheckBox;
    ReportDatasetTopPanel: TPanel;
    ReportDatasetUpdateDBSynEdit: TDBSynEdit;
    ReportDatasetUpdateTabSheet: TTabSheet;
    ReportDatasetViewerCsvDBEdit: TDBEdit;
    ReportDatasetViewerCsvLabel: TLabel;
    ReportEnvironmentDBEdit: TDBEdit;
    ReportEnvironmentLabel: TLabel;
    ReportExportDBEdit: TDBEdit;
    ReportExportLabel: TLabel;
    ReportFromContentDBCheckBox: TDBCheckBox;
    ReportImageList24: TImageList;
    ReportJvScrollMaxBand: TJvScrollMaxBand;
    ReportLinkDBEdit: TDBEdit;
    ReportLinkLabel: TLabel;
    ReportObjectIdDBEdit: TDBEdit;
    ReportObjectIdLabel: TLabel;
    ReportParamCaptionDBEdit: TDBEdit;
    ReportParamCaptionLabel: TLabel;
    ReportParamClassDBEdit: TDBEdit;
    ReportParamClassLabel: TLabel;
    ReportParamDBEdit: TDBEdit;
    ReportParamDBGrid: TDBGrid;
    ReportParamDBNavigator: TDBNavigator;
    ReportParamDefaultCsvDBEdit: TDBEdit;
    ReportParamDefaultCsvLabel: TLabel;
    ReportParamDescriptionDBEdit: TDBEdit;
    ReportParamDescriptionLabel: TLabel;
    ReportParamDisabledDBCheckBox: TDBCheckBox;
    ReportParamEnvDBComboBox: TDBComboBox;
    ReportParamEnvLabel: TLabel;
    ReportParamFromQueryDBCheckBox: TDBCheckBox;
    ReportParamHelpDBEdit: TDBEdit;
    ReportParamHelpLabel: TLabel;
    ReportParamHiddenDBCheckBox: TDBCheckBox;
    ReportParamJvScrollMaxBand: TJvScrollMaxBand;
    ReportParamKindDBComboBox: TDBComboBox;
    ReportParamKindLabel: TLabel;
    ReportParamLabel: TLabel;
    ReportParamLineGrid12DBComboBox: TDBComboBox;
    ReportParamLineGrid12Label: TLabel;
    ReportParamOptionCsvDBSynEdit: TDBSynEdit;
    ReportParamOptionCsvLabel: TLabel;
    ReportParamOptionCsvPanel: TPanel;
    ReportParamOptionJsonDBSynEdit: TDBSynEdit;
    ReportParamOptionJsonLabel: TLabel;
    ReportParamOptionJsonPanel: TPanel;
    ReportParamOptionQueryDBSynEdit: TDBSynEdit;
    ReportParamOptionQueryLabel: TLabel;
    ReportParamOptionQueryPanel: TPanel;
    ReportParamOrderDBEdit: TDBEdit;
    ReportParamOrderLabel: TLabel;
    ReportParamParamsLabel: TLabel;
    ReportParamPlaceholderDBEdit: TDBEdit;
    ReportParamPlaceholderLabel: TLabel;
    ReportParamRequiredDBCheckBox: TDBCheckBox;
    ReportParamSplitter: TSplitter;
    ReportParamSplitter2: TSplitter;
    ReportParamSplitter3: TSplitter;
    ReportParamStateDBComboBox: TDBComboBox;
    ReportParamStateLabel: TLabel;
    ReportParamStyleDBEdit: TDBEdit;
    ReportParamStyleLabel: TLabel;
    ReportParamTabSheet: TTabSheet;
    ReportParamTopPanel: TPanel;
    ReportSerieDBGrid: TDBGrid;
    ReportSerieDBNavigator: TDBNavigator;
    ReportSerieLabel2: TLabel;
    ReportSeriePanel: TPanel;
    ReportSourceDBEdit: TDBEdit;
    ReportSourceLabel: TLabel;
    ReportStoreDBEdit: TDBEdit;
    ReportStoreLabel: TLabel;
    ReportStyleDBEdit: TDBEdit;
    ReportStyleLabel: TLabel;
    ReportTestAction: TAction;
    ReportValidatorCsvDBEdit: TDBEdit;
    ReportValidatorCsvLabel: TLabel;
    ReportViewerCsvDBEdit: TDBEdit;
    ReportViewerCsvLabel: TLabel;
    SerieClientDataSet: TClientDataSet;
    SerieDataSource: TDataSource;
    ReportDatasetModeDBComboBox: TDBComboBox;
    ReportDatasetModeLabel: TLabel;
    ReportDatasetFeedbackIfEmptyLabel: TLabel;
    ReportDatasetFeedbackIfEmptyDBEdit: TDBEdit;
    ReportReportTitleOnDBCheckBox: TDBCheckBox;
    ReportReportPanelOnDBCheckBox: TDBCheckBox;
    ReportReportPanelClosedDBCheckBox: TDBCheckBox;
    ReportParamsTitleDBCheckBox: TDBCheckBox;
    ReportParamsPanelOnDBCheckBox: TDBCheckBox;
    ReportParamsPanelClosedDBCheckBox: TDBCheckBox;
    ReportDsHeaderOffDBCheckBox: TDBCheckBox;
    ReportDsRecordCountOffDBCheckBox: TDBCheckBox;
    ReportParamsOffDBCheckBox: TDBCheckBox;
    ReportDatasetRepeaterTabSheet: TTabSheet;
    ReportTabSheet: TTabSheet;
    ReportHeaderLabel: TLabel;
    ReportHeaderDBSynEdit: TDBSynEdit;
    ReportFooterLabel: TLabel;
    ReportFooterSplitter: TSplitter;
    ReportFooterDBSynEdit: TDBSynEdit;
    ReportGlobalTabSheet: TTabSheet;
    ReportGlobalLeftPanel: TPanel;
    ReportGlobalDTClientTree: TDTClientTree;
    ReportGlobalDBNavigator: TDBNavigator;
    ReportGlobalLeftSplitter: TSplitter;
    ReportGlobalMainPanel: TPanel;
    ReportGlobalDBGrid: TDBGrid;
    ReportGlobalDataDBSynEdit: TDBSynEdit;
    GlobalClientDataSet: TClientDataSet;
    GlobalDataSource: TDataSource;
    ReportParamOptionQueryBottomPanel: TPanel;
    ReportParamOptionQueryConnStrLabel: TLabel;
    ReportParamOptionQueryConnStrDBEdit: TDBEdit;
    ReportParamCommLibLabel: TLabel;
    ReportParamCommLibDBComboBox: TDBComboBox;
    ReportChartSerieJvScrollMaxBand: TJvScrollMaxBand;
    ReportChartSeriePointJvScrollMaxBand: TJvScrollMaxBand;
    ReportChartSerieKindLabel: TLabel;
    ReportChartSerieKindDBComboBox: TDBComboBox;
    ReportChartSerieTitleLabel: TLabel;
    ReportChartSerieTitleDBEdit: TDBEdit;
    ReportChartSerieDescriptionLabel: TLabel;
    ReportChartSerieDescriptionDBEdit: TDBEdit;
    ReportChartSerieStateLabel: TLabel;
    ReportChartSerieStateDBComboBox: TDBComboBox;
    ReportChartSerieXLabelFieldDBEdit1: TDBEdit;
    ReportChartSerieXLabelFieldLabel1: TLabel;
    ReportChartSerieXFieldDBEdit: TDBEdit;
    ReportChartSerieXFieldLabel: TLabel;
    ReportChartSerieYFieldLabel: TLabel;
    ReportChartSerieYFieldDBEdit: TDBEdit;
    ReportChartSerieZFieldDBEdit: TDBEdit;
    ReportChartSerieZFieldLabel: TLabel;
    ReportChartSerieTooltipFieldLabel: TLabel;
    ReportChartSerieTooltipFieldDBEdit: TDBEdit;
    ReportChartSerieLineJvScrollMaxBand: TJvScrollMaxBand;
    ReportChartSerieColorLabel: TLabel;
    ReportChartSerieColorDBEdit: TDBEdit;
    ReportChartSerieLineColorLabel1: TLabel;
    ReportChartSerieLineColorDBEdit1: TDBEdit;
    ReportChartSerieLineSizeDBEdit1: TDBEdit;
    ReportChartSerieLineSizeLabel1: TLabel;
    ReportChartSerieLineTypeDBEdit1: TDBEdit;
    ReportChartSerieLineTypeLabel1: TLabel;
    ReportChartSeriePointSizeDBEdit: TDBEdit;
    ReportChartSeriePointSizeLabel: TLabel;
    ReportChartSeriePointTypeDBEdit: TDBEdit;
    ReportChartSeriePointTypeLabel: TLabel;
    ReportChartSeriePointColorDBEdit: TDBEdit;
    ReportChartSeriePointColorLabel: TLabel;
    ReportReportTopPanel: TPanel;
    ReportGlobalPanel: TPanel;
    ReportDatasetSelectTemplateLabel: TLabel;
    ReportDatasetSelectFixLabel: TLabel;
    ReportDatasetRepeaterItemLabel: TLabel;
    ReportDatasetRepeaterFooterLabel: TLabel;
    ReportDatasetRepeaterItemDBSynEdit: TDBSynEdit;
    ReportDatasetRepeaterOnDBCheckBox: TDBCheckBox;
    ReportDatasetRepeaterHeaderPanel: TPanel;
    ReportDatasetRepeaterHeaterLabel: TLabel;
    ReportDatasetDriverSelectTabSheet: TTabSheet;
    ReportDatasetDriverSelectDBSynEdit: TDBSynEdit;
    ReportDatasetDriverSelectLabel: TLabel;
    ReportDatasetHeaderTabSheet: TTabSheet;
    ReportDatasetFooterTabSheet: TTabSheet;
    ReportDatasetHeaderDBSynEdit: TDBSynEdit;
    ReportDatasetFooterDBSynEdit: TDBSynEdit;
    ReportDatasetRepeaterFooterDBSynEdit: TDBSynEdit;
    ReportDatasetRepeaterHeaderDBSynEdit: TDBSynEdit;
    ReportDatasetRepeaterPreLabel: TLabel;
    ReportDatasetRepeaterPostLabel: TLabel;
    ReportDatasetRepeaterPostDBSynEdit: TDBSynEdit;
    ReportDatasetRepeaterPreDBSynEdit: TDBSynEdit;
    RepeaterBlockShape: TShape;
    procedure FormCreate(Sender: TObject);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure ParamClientDataSetAfterInsert(DataSet: TDataSet);
    procedure DatasetClientDataSetAfterInsert(DataSet: TDataSet);
    procedure ChartClientDataSetAfterInsert(DataSet: TDataSet);
    procedure SerieClientDataSetAfterInsert(DataSet: TDataSet);
    procedure ReportClientDataSetAfterDelete(DataSet: TDataSet);
    procedure ReportClientDataSetAfterInsert(DataSet: TDataSet);
    procedure ReportClientDataSetAfterPost(DataSet: TDataSet);
    procedure ReportClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure ReportDatasetJsonTemplateLabelClick(Sender: TObject);
    procedure ReportDatasetJsonValidateLabelClick(Sender: TObject);
    procedure OptionFoldingLineShowCheckBoxClick(Sender: TObject);
    procedure ParamClientDataSetAfterPost(DataSet: TDataSet);
    procedure DatasetClientDataSetAfterPost(DataSet: TDataSet);
    procedure ChartClientDataSetAfterPost(DataSet: TDataSet);
    procedure SerieClientDataSetAfterPost(DataSet: TDataSet);
    procedure ReportDatasetSelectTemplateLabelClick(Sender: TObject);
    procedure ReportDatasetSelectFixLabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SynEditsSetup;
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  ReportMainForm: TReportMainForm;
{$ENDREGION}

implementation

{$REGION 'Uses'}
{$R *.dfm}

uses
    System.StrUtils
  , System.DateUtils
  , System.Types
  , Vcl.RecError // reconcileerrors
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Routine'}
procedure TReportMainForm.SynEditsSetup;
begin
  gsyn.Setup(ReportParamOptionCsvDBSynEdit  , Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckCsv , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportParamOptionJsonDBSynEdit , Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckJson, OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportParamOptionQueryDBSynEdit, Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckSql , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportDatasetSelectDBSynEdit   , Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckSql , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportDatasetInsertDBSynEdit   , Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckSql , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportDatasetUpdateDBSynEdit   , Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckSql , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportDatasetDeleteDBSynEdit   , Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckSql , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportDatasetJsonDBSynEdit     , Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckJson, OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportDatasetHeaderDBSynEdit   , Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckHtml, OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportDatasetFooterDBSynEdit   , Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckHtml, OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportGlobalDataDBSynEdit      , Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckSql , OptionFoldingLineShowCheckBox.Checked);
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TReportMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
  {$ENDREGION}

  {$REGION 'syn'}
  SynEditsSetup;
  {$ENDREGION}

  {$REGION 'property'}
  // kind
//ReportKindDBComboBox.Items.Add('');
//for str in TReportRec.ReportKindVector do ReportKindDBComboBox.Items.Add(str);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TReportMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  {$REGION 'Object'}
  {$ENDREGION}

  {$REGION 'Detail'}
  if not (ReportClientDataSet.State = dsBrowse) then
    ReportDBNavigator.BtnClick(nbPost);

  if not (ParamClientDataSet.State = dsBrowse) then
    ReportParamDBNavigator.BtnClick(nbPost);

  if not (DatasetClientDataSet.State = dsBrowse) then
    ReportDatasetDBNavigator.BtnClick(nbPost);

  if not (ChartClientDataSet.State = dsBrowse) then
    ReportChartDBNavigator.BtnClick(nbPost);

  if not (SerieClientDataSet.State = dsBrowse) then
    ReportSerieDBNavigator.BtnClick(nbPost);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TReportMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
  if ReportClientDataSet.Locate('FldObjectId', FId, []) then begin
    ReportClientDataSet.Delete;
    if ReportClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      ReportClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'ReportCds'}
procedure TReportMainForm.ReportClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if ReportClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    ReportClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TReportMainForm.ReportClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // set
//DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
//DataSet.FieldByName('FldValue1'  ).Value := TNamRec.RndInt('Value1');
//DataSet.FieldByName('FldValue2'  ).Value := TNamRec.RndInt('Value2');
//DataSet.Post;
//LogFrame.Log('%s data initialized', [FObj]);
  {$ENDREGION}

end;

procedure TReportMainForm.ReportClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'applyupdatetoremoteserver'}
  if ReportClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save Report data to remote server')
  else begin
    ReportClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('Report data saved to remote server');
  end;
  {$ENDREGION}

end;

procedure TReportMainForm.ReportClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'reconcileerror'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'ParamCds'}
procedure TReportMainForm.ParamClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId'   ).Value := FId ; // automatic
//DataSet.FieldByName('FldOrder'      ).Value := null;
  DataSet.FieldByName('FldState'      ).Value := 'Active';
  DataSet.FieldByName('FldParam'      ).Value := TNamRec.RndInt('Param');
//DataSet.FieldByName('FldEnv'        ).Value := null;
//DataSet.FieldByName('FldDefault'    ).Value := null;
//DataSet.FieldByName('FldTitle'      ).Value := null;
//DataSet.FieldByName('FldSubtitle'   ).Value := null;
//DataSet.FieldByName('FldCaption'    ).Value := null;
//DataSet.FieldByName('FldPlaceholder').Value := null;
//DataSet.FieldByName('FldDescription').Value := null;
//DataSet.FieldByName('FldHelp'       ).Value := null;
//DataSet.FieldByName('FldKind'       ).Value := null;
//DataSet.FieldByName('FldHidden'     ).Value := null;
//DataSet.FieldByName('FldRequired'   ).Value := null;
//DataSet.FieldByName('FldDisabled'   ).Value := null;
//DataSet.FieldByName('FldLineGrid12' ).Value := null;
//DataSet.FieldByName('FldOptionCsv'  ).Value := null;
//DataSet.FieldByName('FldOptionJson' ).Value := null;
//DataSet.FieldByName('FldOptionQuery').Value := null;
//DataSet.FieldByName('FldConnStr'    ).Value := null;
//DataSet.FieldByName('FldConnLib'    ).Value := null;
//DataSet.FieldByName('FldClass'      ).Value := null;
//DataSet.FieldByName('FldStyle'      ).Value := null;
//DataSet.FieldByName('FldFromQuery'  ).Value := null;
//DataSet.FieldByName('FldFromContent').Value := null;
  DataSet.Post;
  LogFrame.Log('%s data initialized', [DataSet.FieldByName('FldParam').AsString]);
  {$ENDREGION}

end;

procedure TReportMainForm.ParamClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'applyupdatetoremoteserver'}
  if ParamClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save Param data to remote server')
  else begin
    ParamClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('Param data saved to remote server');
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'DatasetCds'}
procedure TReportMainForm.DatasetClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId'       ).Value := FId ; // automatic
//DataSet.FieldByName('FldOrder'          ).Value := null;
  DataSet.FieldByName('FldState'          ).Value := 'Active';
  DataSet.FieldByName('FldDataset'        ).Value := TNamRec.RndInt('Dataset');
//DataSet.FieldByName('FldTitle'          ).Value := null;
//DataSet.FieldByName('FldDescription'    ).Value := null;
//DataSet.FieldByName('FldMode'           ).Value := null;
//DataSet.FieldByName('FldConnStr'        ).Value := null;
//DataSet.FieldByName('FldConnLib'        ).Value := null;
//DataSet.FieldByName('FldParamStr'       ).Value := null;
//DataSet.FieldByName('FldDefaultStr'     ).Value := null;
//DataSet.FieldByName('FldLanguage'       ).Value := null;
//DataSet.FieldByName('FldMaxRecords'     ).Value := null;
//DataSet.FieldByName('FldMaxRecordsCsv'  ).Value := null;
//DataSet.FieldByName('FldSelect'         ).Value := null;
//DataSet.FieldByName('FldSelectDev'      ).Value := null;
//DataSet.FieldByName('FldSelectBak'      ).Value := null;
//DataSet.FieldByName('FldInsert'         ).Value := null;
//DataSet.FieldByName('FldUpdate'         ).Value := null;
//DataSet.FieldByName('FldDelete'         ).Value := null;
//DataSet.FieldByName('FldViewerCsv'      ).Value := null;
//DataSet.FieldByName('FldEditable'       ).Value := null;
//DataSet.FieldByName('FldEditorCsv'      ).Value := null;
//DataSet.FieldByName('FldEditIni'        ).Value := null;
//DataSet.FieldByName('FldJson'           ).Value := null;
//DataSet.FieldByName('FldSwitch'         ).Value := null;
//DataSet.FieldByName('FldClass'          ).Value := null;
//DataSet.FieldByName('FldStyle'          ).Value := null;
//DataSet.FieldByName('FldTitleOn'        ).Value := null;
//DataSet.FieldByName('FldPanelOn'        ).Value := null;
//DataSet.FieldByName('FldPanelClosed'    ).Value := null;
//DataSet.FieldByName('FldTimeoutSec'     ).Value := null;
//DataSet.FieldByName('FldFeedbackIfEmpty').Value := null;
  DataSet.Post;
  LogFrame.Log('%s data initialized', [DataSet.FieldByName('FldDataset').AsString]);
  {$ENDREGION}

end;

procedure TReportMainForm.DatasetClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'applyupdatetoremoteserver'}
  if DatasetClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save Dataset data to remote server')
  else begin
    DatasetClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('Dataset data saved to remote server');
  end;
  {$ENDREGION}

end;

procedure TReportMainForm.ReportDatasetSelectTemplateLabelClick( Sender: TObject);
begin
  inherited;

  gsyn.InsertTextAtCaret(ReportDatasetSelectDBSynEdit,
'''
-- base
select top($Top$)
    a.FldId
  , a.FldObject
  , b.FldXxx
  , b.Fld...
from
    DbaXxx.dbo.TblObject a inner join
    DbaXxx.dbo.TblXxx    b on (b.FldObjectId = a.FldId)
where
    [RvSqlFilter(b.FldXxx| $Xxx$)]
order by
    $OrderBy$
'''
  );
end;

procedure TReportMainForm.ReportDatasetSelectFixLabelClick(Sender: TObject);
var
  txt: string;
begin
  inherited;

  txt := ReportDatasetSelectDBSynEdit.Text.Trim;

  txt := txt.Replace('SELECT TOP (1000) ', 'select top($Top$)' + sLineBreak + '    ');
  txt := txt.Replace('  FROM '           , 'from'              + sLineBreak + '    ');
  txt := txt.Replace('WHERE'             , 'where'                                  );

  txt := txt.Replace('      ,'           , '  , '                                   );
  txt := txt.Replace(']'                 , ''                                       );
  txt := txt.Replace('['                 , ''                                       );

  if not txt.Contains('where') then
  txt := txt + sLineBreak + 'where'    + sLineBreak + '    [RvSqlFilter(FldXxx| $Xxx$)]';

  if not txt.Contains('order by') then
  txt := txt + sLineBreak + 'order by' + sLineBreak + '    $OrderBy$';

  ReportDatasetSelectDBSynEdit.Text := txt;
end;

procedure TReportMainForm.ReportDatasetJsonTemplateLabelClick(Sender: TObject);
begin
  inherited;

  gsyn.InsertTextAtCaret(ReportDatasetJsonDBSynEdit, HTM_TABLEFROMDS_EDIT_JSON);
end;

procedure TReportMainForm.ReportDatasetJsonValidateLabelClick(Sender: TObject);
var
  fbk: string;
begin
  inherited;

  if not TJsoRec.IsValid(ReportDatasetJsonDBSynEdit.Text, fbk) then
    TMesRec.W(fbk)
  else
    TMesRec.I(fbk);
end;
{$ENDREGION}

{$REGION 'ChartCds'}
procedure TReportMainForm.ChartClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'init'}
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId'        ).Value := FId ; // automatic
//DataSet.FieldByName('FldOrder'           ).Value := null;
//DataSet.FieldByName('FldRsNo'            ).Value := null;
  DataSet.FieldByName('FldState'           ).Value := 'Active';
//DataSet.FieldByName('FldDataset'         ).Value := null; // automatic
  DataSet.FieldByName('FldChart'           ).Value := TNamRec.RndInt('Chart');
//DataSet.FieldByName('FldTitle'           ).Value := null;
//DataSet.FieldByName('FldSubtitle'        ).Value := null;
//DataSet.FieldByName('FldDescription'     ).Value := null;
//DataSet.FieldByName('FldWidth'           ).Value := null;
//DataSet.FieldByName('FldHeight'          ).Value := null;
//DataSet.FieldByName('FldTitleOn'         ).Value := null;
//DataSet.FieldByName('FldPanelOn'         ).Value := null;
//DataSet.FieldByName('FldPanelClosed'     ).Value := null;
//DataSet.FieldByName('FldDoExport'        ).Value := null;
//DataSet.FieldByName('FldTooltipShared'   ).Value := null;
//DataSet.FieldByName('FldXCaption'        ).Value := null;
//DataSet.FieldByName('FldYCaption'        ).Value := null;
//DataSet.FieldByName('FldXLabelAngleDeg'  ).Value := null;
//DataSet.FieldByName('FldYLabelAngleDeg'  ).Value := null;
//DataSet.FieldByName('FldXFormat'         ).Value := null;
//DataSet.FieldByName('FldYFormat'         ).Value := null;
//DataSet.FieldByName('FldXMargin'         ).Value := null;
//DataSet.FieldByName('FldYMargin'         ).Value := null;
//DataSet.FieldByName('FldPanelClosed'     ).Value := null;
//DataSet.FieldByName('FldDoExport'        ).Value := null;
//DataSet.FieldByName('FldTooltipShared'   ).Value := null;
//DataSet.FieldByName('FldXCaption'        ).Value := null;
//DataSet.FieldByName('FldYCaption'        ).Value := null;
//DataSet.FieldByName('FldXLabelAngleDeg'  ).Value := null;
//DataSet.FieldByName('FldYLabelAngleDeg'  ).Value := null;
//DataSet.FieldByName('FldXFormat'         ).Value := null;
//DataSet.FieldByName('FldYFormat'         ).Value := null;
//DataSet.FieldByName('FldXScaleBreak'     ).Value := null;
//DataSet.FieldByName('FldYScaleBreak'     ).Value := null;
//DataSet.FieldByName('FldXStripLine'      ).Value := null;
//DataSet.FieldByName('FldYStripLine'      ).Value := null;
//DataSet.FieldByName('FldXScaleBreaksJson').Value := null;
//DataSet.FieldByName('FldYScaleBreaksJson').Value := null;
//DataSet.FieldByName('FldXStripLinesJson' ).Value := null;
//DataSet.FieldByName('FldYStripLinesJson' ).Value := null;
//DataSet.FieldByName('FldXMargin'         ).Value := null;
//DataSet.FieldByName('FldYMargin'         ).Value := null;
  DataSet.Post;
  LogFrame.Log('%s data initialized', [DataSet.FieldByName('FldChart').AsString]);
  {$ENDREGION}

end;

procedure TReportMainForm.ChartClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'applyupdatetoremoteserver'}
  if ChartClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save Chart data to remote server')
  else begin
    ChartClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('Chart data saved to remote server');
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'SerieCds'}
procedure TReportMainForm.SerieClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'init'}
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId'          ).Value := FId ; // automatic
//DataSet.FieldByName('FldOrder'             ).Value := null;
  DataSet.FieldByName('FldState'             ).Value := 'Active';
//DataSet.FieldByName('FldDataset'           ).Value := null; // automatic
//DataSet.FieldByName('FldChart'             ).Value := null; // automatic
  DataSet.FieldByName('FldSerie'             ).Value := TNamRec.RndInt('Serie');
//DataSet.FieldByName('FldKind'              ).Value := null;
//DataSet.FieldByName('FldTitle'             ).Value := null;
//DataSet.FieldByName('FldDescription'       ).Value := null;
//DataSet.FieldByName('FldLegend'            ).Value := null;
//DataSet.FieldByName('FldLegendOn'          ).Value := null;
//DataSet.FieldByName('FldTooltip'           ).Value := null;
//DataSet.FieldByName('FldTooltipShared'     ).Value := null;
//DataSet.FieldByName('FldXLabelField'       ).Value := null;
//DataSet.FieldByName('FldXField'            ).Value := null;
//DataSet.FieldByName('FldYField'            ).Value := null;
//DataSet.FieldByName('FldZField'            ).Value := null;
//DataSet.FieldByName('FldTooltipField'      ).Value := null;
//DataSet.FieldByName('FldColorField'        ).Value := null;
//DataSet.FieldByName('FldSizeField'         ).Value := null;
//DataSet.FieldByName('FldShapeField'        ).Value := null;
//DataSet.FieldByName('FldColor'             ).Value := null;
//DataSet.FieldByName('FldLineSize'          ).Value := null;
//DataSet.FieldByName('FldLineType'          ).Value := null;
//DataSet.FieldByName('FldLineColor'         ).Value := null;
//DataSet.FieldByName('FldMarkerSize'        ).Value := null;
//DataSet.FieldByName('FldMarkerType'        ).Value := null;
//DataSet.FieldByName('FldMarkerColor'       ).Value := null;
//DataSet.FieldByName('FldIsLogarithmic'     ).Value := null;
//DataSet.FieldByName('FldYAxisNo'           ).Value := null;
//DataSet.FieldByName('FldYAxisPrefix'       ).Value := null;
//DataSet.FieldByName('FldYAxisSuffix'       ).Value := null;
//DataSet.FieldByName('FldYAxisLabelAngleDeg').Value := null;
  DataSet.Post;
  LogFrame.Log('%s data initialized', [DataSet.FieldByName('FldSerie').AsString]);
  {$ENDREGION}

end;

procedure TReportMainForm.SerieClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'applyupdatetoremoteserver'}
  if SerieClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save Serie data to remote server')
  else begin
    SerieClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('Serie data saved to remote server');
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Option'}
procedure TReportMainForm.OptionFoldingLineShowCheckBoxClick(Sender: TObject);
begin
  inherited;

  SynEditsSetup;
end;
{$ENDREGION}

end.
