unit WksReportClientMainFormUnit;

interface

{$REGION 'Uses'}
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WksBaseClientMainFormUnit, Data.DB,
  Datasnap.DBClient, Soap.SOAPConn, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, SynEdit, SynDBEdit, Vcl.ComCtrls,
  Vcl.StdCtrls, JvExMask, JvSpin, JvExComCtrls, JvDateTimePicker, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, JvExControls, JvScrollMax, JvExExtCtrls,
  JvExtComponent, WksLogFrameUnit, VirtualTrees, DTDBTreeView, DTClientTree,
  Vcl.ToolWin, JvNetscapeSplitter, Vcl.Grids, Vcl.DBGrids, JvComponentBase,
  JvThreadTimer, Vcl.AppEvnts, JvClock, Vcl.Menus, Winapi.WebView2,
  Winapi.ActiveX, Vcl.Edge, Vcl.WinXCtrls;
{$ENDREGION}

{$REGION 'Type'}
type
  TReportMainForm = class(TBaseMainForm)
    ChartClientDataSet: TClientDataSet;
    ChartDataSource: TDataSource;
    DatasetClientDataSet: TClientDataSet;
    DatasetDataSource: TDataSource;
    DatasetAndChartPageControl: TPageControl;
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
    ReportParamOptionQueryConnStrDBEdit: TDBEdit;
    ReportParamOptionQueryConnStrLabel: TLabel;
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
  gsyn.Setup(ReportDatasetSelectDBSynEdit, Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckSql , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportDatasetInsertDBSynEdit, Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckSql , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportDatasetUpdateDBSynEdit, Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckSql , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportDatasetDeleteDBSynEdit, Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckSql , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ReportDatasetJsonDBSynEdit  , Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckJson, OptionFoldingLineShowCheckBox.Checked);
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

  // detail
  if ReportClientDataSet.State = dsEdit then
    ReportDBNavigator.BtnClick(nbPost);
  if ParamClientDataSet.State = dsEdit then
    ReportParamDBNavigator.BtnClick(nbPost);
  if DatasetClientDataSet.State = dsEdit then
    ReportDatasetDBNavigator.BtnClick(nbPost);
  if ChartClientDataSet.State = dsEdit then
    ReportChartDBNavigator.BtnClick(nbPost);
  if SerieClientDataSet.State = dsEdit then
    ReportSerieDBNavigator.BtnClick(nbPost);
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
    LogFrame.Log('%s detail data deleted from remote server', ['Object']);
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

  {$REGION 'detail'}
  // applyupdatetoremoteserver
  if ReportClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    ReportClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TReportMainForm.ReportClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail'}
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

  {$REGION 'Json'}
procedure TReportMainForm.ReportDatasetJsonTemplateLabelClick(Sender: TObject);
begin
  inherited;

  // check
  if giis.Ex(ReportDatasetJsonDBSynEdit.Text) then
    TMesRec.W('Unable to insert the Json template, the field is not empty, please clear it first')
  else
    ReportDatasetJsonDBSynEdit.Text :=
                   '{'
    + sLineBreak + '  "EditMenu": {'
    + sLineBreak + '    "Visible": false'
    + sLineBreak + '  , "Items": ['
    + sLineBreak + '      {"Id": "AddNew", "Visible": true, "Title": "Add New"}'
    + sLineBreak + '    ]'
    + sLineBreak + '  }'
    + sLineBreak + ', "EditData": {'
  //+ sLineBreak + '    "ReportId": 14'
    + sLineBreak + '  , "DatasetName": "Person"'
    + sLineBreak + '  , "InsertIfNotExists": true'
    + sLineBreak + '  , "EditTable": "DbaAbc.dbo.TblAbc"'
    + sLineBreak + '  , "EditKeyFieldList": ["FldId"]' // ["FldSurname","FldName","FldBirthDate"] or ["FldSsn"] or ...
    + sLineBreak + '  , "EditOwnerField": "FldOwner"'
    + sLineBreak + '  , "EditOneWayField": "FldState"'
    + sLineBreak + '  , "EditOneWayRange": ["Active", "Inactive"]'
    + sLineBreak + '  , "EditFieldList": ['
    + sLineBreak + '      {"Field": "FldId"          , "Ctrl": "Text"}'
    + sLineBreak + '    , {"Field": "FldPId"         , "Ctrl": "Text"}' // TextInt
    + sLineBreak + '    , {"Field": "FldAbc"         , "Ctrl": "Text"}'
    + sLineBreak + '    , {"Field": "FldValue1"      , "Ctrl": "Text"}'
    + sLineBreak + '    , {"Field": "FldValue2"      , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldPId"         , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldPerson"      , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldName"        , "Ctrl": "Select", "OptionCsv": ",Null,"               , "OptionJson": "/WksCodeIsapiProject.dll/Code?CoId=?"}'
  //+ sLineBreak + '    , {"Field": "FldSurname"     , "Ctrl": "Select", "OptionCsv": ",Null,"               , "OptionJson": "/WksCodeIsapiProject.dll/Code?CoId=?"}'
  //+ sLineBreak + '    , {"Field": "FldGender"      , "Ctrl": "Select", "OptionCsv": ",Null,Male,Female"    , "OptionJson": "/WksCodeIsapiProject.dll/Code?CoId=?"}' // [RvCode(123)]
  //+ sLineBreak + '    , {"Field": "FldNationality" , "Ctrl": "Select", "OptionCsv": ",Null,Italian,English"}'
  //+ sLineBreak + '    , {"Field": "FldLanguage"    , "Ctrl": "Select", "OptionCsv": ",Null,Italian,English"}'
  //+ sLineBreak + '    , {"Field": "FldSsn"         , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldWatNumber"   , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldPhone"       , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldMobile"      , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldEmail"       , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldWww"         , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldAddress"     , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldZipCode"     , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldCity"        , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldProvince"    , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldCountry"     , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldBirthDate"   , "Ctrl": "Date"}                                 '
  //+ sLineBreak + '    , {"Field": "FldBirthPlace"  , "Ctrl": "Report", "OptionReport": {"ReportId": 15, "ValueField": "FldPlace", "ColumnField": "%FldLocation% - %FldProvince%"}}'
  //+ sLineBreak + '    , {"Field": "FldOfficePhone" , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldOfficeMobile", "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldOfficeEmail" , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldOfficeWww"   , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldOfficeFax"   , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldPicture"     , "Ctrl": "Text"}'
  //+ sLineBreak + '    , {"Field": "FldNote"        , "Ctrl": "Text"}'
  //+ sLineBreak + '      {"Field": "FldState"       , "Ctrl": "Select", "OptionCsv": "http://localhost/WksCodeIsapiProject.dll/Code?CoId=18"}
  //+ sLineBreak + '    , {"Field": "FldTime"        , "Ctrl": "Time"}
  //+ sLineBreak + '    , {"Field": "FldLocation"    , "Ctrl": "Select", "OptionCsv": "http://localhost/WksCodeIsapiProject.dll/Code?CoId=21"}
  //+ sLineBreak + '    , {"Field": "FldTeam1"       , "Ctrl": "Select", "OptionCsv": "", "OptionJson": "http://localhost/WksCodeIsapiProject.dll/Code?CoId=23"}
  //+ sLineBreak + '    , {"Field": "FldTeam2"       , "Ctrl": "Select", "OptionCsv": "", "OptionJson": "http://localhost/WksCodeIsapiProject.dll/Code?CoId=23"}
  //+ sLineBreak + '    , {"Field": "FldRefereeLevel", "Ctrl": "Select", "OptionCsv": "", "OptionJson": "http://localhost/WksCodeIsapiProject.dll/Code?CoId=24"}
  //+ sLineBreak + '    , {"Field": "FldReferee1"    , "Ctrl": "Select", "OptionCsv": "", "OptionJson": "http://localhost/WksCodeIsapiProject.dll/Code?CoId=25"}
  //+ sLineBreak + '    , {"Field": "FldSerie"       , "Ctrl": "Select"                 , "OptionJson": "http://localhost/WksCodeIsapiProject.dll/Code?CoId=26"}
  //+ sLineBreak + '    , {"Field": "FldReferee2"    , "Ctrl": "Report", "OptionReport": {"ReportId": 20, "ValueField": "FldLocation", "ColumnFieldCsv": "%FldLocation% - %FldProvince%"}}
    + sLineBreak + '    ]'
  //+ sLineBreak + '  , "EditValueRange": []'
  //+ sLineBreak + '  , "EditUpdatedField": ""'
  //+ sLineBreak + '  , "EditEnabledStateList": []'
    + sLineBreak + '  }'
    + sLineBreak + '}'
    ;
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

{$ENDREGION}

{$REGION 'ChartCds'}
procedure TReportMainForm.ChartClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId'      ).Value := FId ; // automatic
//DataSet.FieldByName('FldOrder'         ).Value := null;
//DataSet.FieldByName('FldRsNo'          ).Value := null;
  DataSet.FieldByName('FldState'         ).Value := 'Active';
//DataSet.FieldByName('FldDataset'       ).Value := null; // automatic
  DataSet.FieldByName('FldChart'         ).Value := TNamRec.RndInt('Chart');
//DataSet.FieldByName('FldTitle'         ).Value := null;
//DataSet.FieldByName('FldSubtitle'      ).Value := null;
//DataSet.FieldByName('FldDescription'   ).Value := null;
//DataSet.FieldByName('FldWidth'         ).Value := null;
//DataSet.FieldByName('FldHeight'        ).Value := null;
//DataSet.FieldByName('FldTitleOn'       ).Value := null;
//DataSet.FieldByName('FldPanelOn'       ).Value := null;
//DataSet.FieldByName('FldPanelClosed'   ).Value := null;
//DataSet.FieldByName('FldDoExport'      ).Value := null;
//DataSet.FieldByName('FldTooltipShared' ).Value := null;
//DataSet.FieldByName('FldXCaption'      ).Value := null;
//DataSet.FieldByName('FldYCaption'      ).Value := null;
//DataSet.FieldByName('FldXLabelAngleDeg').Value := null;
//DataSet.FieldByName('FldYLabelAngleDeg').Value := null;
//DataSet.FieldByName('FldXFormat'       ).Value := null;
//DataSet.FieldByName('FldYFormat'       ).Value := null;
//DataSet.FieldByName('FldXStripLine'    ).Value := null;
//DataSet.FieldByName('FldYStripLine'    ).Value := null;
//DataSet.FieldByName('FldXScaleBreak'   ).Value := null;
//DataSet.FieldByName('FldYScaleBreak'   ).Value := null;
//DataSet.FieldByName('FldXMargin'       ).Value := null;
//DataSet.FieldByName('FldYMargin'       ).Value := null;
//DataSet.FieldByName('FldPanelClosed'   ).Value := null;
//DataSet.FieldByName('FldDoExport'      ).Value := null;
//DataSet.FieldByName('FldTooltipShared' ).Value := null;
//DataSet.FieldByName('FldXCaption'      ).Value := null;
//DataSet.FieldByName('FldYCaption'      ).Value := null;
//DataSet.FieldByName('FldXLabelAngleDeg').Value := null;
//DataSet.FieldByName('FldYLabelAngleDeg').Value := null;
//DataSet.FieldByName('FldXFormat'       ).Value := null;
//DataSet.FieldByName('FldYFormat'       ).Value := null;
//DataSet.FieldByName('FldXStripLine'    ).Value := null;
//DataSet.FieldByName('FldYStripLine'    ).Value := null;
//DataSet.FieldByName('FldXScaleBreak'   ).Value := null;
//DataSet.FieldByName('FldYScaleBreak'   ).Value := null;
//DataSet.FieldByName('FldXMargin'       ).Value := null;
//DataSet.FieldByName('FldYMargin'       ).Value := null;
  DataSet.Post;
  LogFrame.Log('%s data initialized', [DataSet.FieldByName('FldChart').AsString]);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'SerieCds'}
procedure TReportMainForm.SerieClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // set
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
{$ENDREGION}

{$REGION 'Option'}
procedure TReportMainForm.OptionFoldingLineShowCheckBoxClick(Sender: TObject);
begin
  inherited;

  SynEditsSetup;
end;
{$ENDREGION}

end.
