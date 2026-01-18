unit WksSystemClientMainFormUnit;

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
  , IdBaseComponent
  , IdComponent
  , IdSocketHandle
  , IdSysLogMessage
  , IdSysLogServer
  , IdUDPBase
  , IdUDPServer
  , JvClock
  , JvComponentBase
  , JvDBDateTimePicker
  , JvDBGrid
  , JvDBUltimGrid
  , JvDateTimePicker
  , JvExComCtrls
  , JvExControls
  , JvExDBGrids
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
  , WksLogFrameUnit, WksBaseClientMainFormUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TSystemMainForm = class(TBaseMainForm)
    AuditClientDataSet: TClientDataSet;
    AuditCountLabel: TLabel;
    AuditDataSource: TDataSource;
    AuditJvDBUltimGrid: TJvDBUltimGrid;
    AuditRefreshSpeedButton: TSpeedButton;
    AuditTabSheet: TTabSheet;
    AuditTopPanel: TPanel;
    BinariesAction: TActionList;
    BinariesClientDataSet: TClientDataSet;
    BinariesClientDeployAction: TAction;
    BinariesClientDeployToolButton: TToolButton;
    BinariesCountLabel: TLabel;
    BinariesDBNavigator: TDBNavigator;
    BinariesDataSource: TDataSource;
    BinariesDescriptionDBMemo: TDBMemo;
    BinariesDescriptionTabSheet: TTabSheet;
    BinariesImageList: TImageList;
    BinariesJvDBUltimGrid: TJvDBUltimGrid;
    BinariesNoteDBMemo: TDBMemo;
    BinariesNoteTabSheet: TTabSheet;
    BinariesPageControl: TPageControl;
    BinariesPanel: TPanel;
    BinariesServerDeployAction: TAction;
    BinariesServerDeployToolButton: TToolButton;
    BinariesServiceDeployAction: TAction;
    BinariesServiceToolButton: TToolButton;
    BinariesSplitter: TSplitter;
    BinariesTabSheet: TTabSheet;
    BinariesToolBar: TToolBar;
    DatabaseAccountClientDataSet: TClientDataSet;
    DatabaseAccountDataSource: TDataSource;
    DatabaseDbaClientDataSet: TClientDataSet;
    DatabaseDbaDataSource: TDataSource;
    DatabaseFldClientDataSet: TClientDataSet;
    DatabaseFldDBNavigator: TDBNavigator;
    DatabaseFldDataSource: TDataSource;
    DatabaseFldPanel: TPanel;
    DatabaseIdxClientDataSet: TClientDataSet;
    DatabaseIdxDataSource: TDataSource;
    DatabasePanel: TPanel;
    ServerClientDataSet: TClientDataSet;
    ServerDBNavigator: TDBNavigator;
    ServerDataSource: TDataSource;
    ServerPanel: TPanel;
    DatabaseTabSheet: TTabSheet;
    DatabaseTblClientDataSet: TClientDataSet;
    DatabaseTblDBNavigator: TDBNavigator;
    DatabaseTblDataSource: TDataSource;
    DatabaseTblPanel: TPanel;
    DatabaseToolBar: TToolBar;
    DbLogClientDataSet: TClientDataSet;
    DbLogCountLabel: TLabel;
    DbLogDataSource: TDataSource;
    DbLogJvDBUltimGrid: TJvDBUltimGrid;
    DbLogRefreshSpeedButton: TSpeedButton;
    DbLogTabSheet: TTabSheet;
    DbLogTopPanel: TPanel;
    ServiceTabSheet: TTabSheet;
    SourceClientDataSet: TClientDataSet;
    SourceConnStrAdoDBSynEdit: TDBSynEdit;
    SourceConnStrAdoLabel: TLabel;
    SourceConnStrAdoPanel: TPanel;
    SourceConnStrAdoTestLabel: TLabel;
    SourceConnStrFdDBSynEdit: TDBSynEdit;
    SourceConnStrFdLabel: TLabel;
    SourceConnStrFdPanel: TPanel;
    SourceConnStrFdTestLabel: TLabel;
    SourceJvDBUltimGrid: TJvDBUltimGrid;
    SourceDBNavigator: TDBNavigator;
    SourceDTClientTree: TDTClientTree;
    SourceDataSource: TDataSource;
    SourceLeftPanel: TPanel;
    SourceLeftSplitter: TSplitter;
    SourceMainPanel: TPanel;
    SourceSourceLabel: TLabel;
    SourceTabSheet: TTabSheet;
    SysLogLabel: TLabel;
    SysLogPanel: TPanel;
    SysLogTabSheet: TTabSheet;
    SyslogIdSyslogServer: TIdSyslogServer;
    SyslogRichEdit: TRichEdit;
    SystemAction: TActionList;
    SystemClientDataSet: TClientDataSet;
    SystemDBNavigator: TDBNavigator;
    SystemDataSource: TDataSource;
    SystemDbaBackupDdlAction: TAction;
    SystemDbaBackupDdlToolButton: TToolButton;
    SystemDbaCreateDdlAction: TAction;
    SystemDbaCreateDdlToolButton: TToolButton;
    SystemDbaDefinitionRebuildAction: TAction;
    SystemDbaDefinitionRebuildToolButton: TToolButton;
    SystemDbaDeleteDdlAction: TAction;
    SystemDbaDeleteDdlToolButton: TToolButton;
    SystemDbaRestoreDdlAction: TAction;
    SystemDbaRestoreDdlToolButton: TToolButton;
    SystemImageList24: TImageList;
    SystemJvScrollMaxBand: TJvScrollMaxBand;
    SystemObjectIdDBEdit: TDBEdit;
    SystemObjectIdLabel: TLabel;
    SystemSyslogAction: TActionList;
    SystemSyslogCleanAction: TAction;
    SystemSyslogCleanSpeedButton: TSpeedButton;
    SystemSyslogImageList: TImageList;
    SystemSyslogStartAction: TAction;
    SystemSyslogStartSpeedButton: TSpeedButton;
    SystemTabSheet: TTabSheet;
    SystemToolBar: TToolBar;
    SystemValue1DBEdit: TDBEdit;
    SystemValue1Label: TLabel;
    SystemValue2DBEdit: TDBEdit;
    SystemValue2Label: TLabel;
    TopServiceComboBox: TComboBox;
    TopServiceContinueButton: TButton;
    TopServiceInstallButton: TButton;
    TopServiceLabel: TLabel;
    TopServicePauseButton: TButton;
    TopServiceStartButton: TButton;
    TopServiceStopButton: TButton;
    TopServiceUninstallButton: TButton;
    WebTabSheet: TTabSheet;
    WebW3ColorJsCheckBox: TCheckBox;
    WebW3CssCheckBox: TCheckBox;
    WebW3FilesGenerateSpeedButton: TSpeedButton;
    WebW3FilesGroupBox: TGroupBox;
    WebW3JsCheckBox: TCheckBox;
    WebW3ThemeCssCheckBox: TCheckBox;
    WebWksCssCheckBox: TCheckBox;
    WebWksDefaultHtmlCheckBox: TCheckBox;
    WebWksDefaultUseSpinCheckBox: TCheckBox;
    WebWksFilesGenerateSpeedButton: TSpeedButton;
    WebWksGroupBox: TGroupBox;
    WebWksJsCheckBox: TCheckBox;
    ServerDBGrid: TDBGrid;
    DatabaseTblDBGrid: TDBGrid;
    DatabaseFldDBGrid: TDBGrid;
    DatabaseTblNoteSplitter: TSplitter;
    DatabaseTblNoteDBMemo: TDBMemo;
    DatabaseFldNoteSplitter: TSplitter;
    DatabaseFldNoteDBMemo: TDBMemo;
    DatabaseTableCreateLabel: TLabel;
    DatabaseTableCreateCommitCheckBox: TCheckBox;
    DatabaseTableCheckLabel: TLabel;
    DatabaseFieldCreateCommitCheckBox: TCheckBox;
    DatabaseFieldCreateLabel: TLabel;
    DatabaseLeftJvNetscapeSplitter: TJvNetscapeSplitter;
    DatabaseRightPanel: TPanel;
    DatabaseTblLabel: TLabel;
    DatabaseRightSplitter: TSplitter;
    DatabaseFldLabel: TLabel;
    ServerTabSheet: TTabSheet;
    DatabaseLeftPanel: TPanel;
    DatabaseDbaLabel: TLabel;
    DatabaseDbaDBNavigator: TDBNavigator;
    DatabaseDbaDBGrid: TDBGrid;
    procedure ActionPostActionExecute(Sender: TObject);
    procedure AuditClientDataSetAfterRefresh(DataSet: TDataSet);
    procedure AuditRefreshSpeedButtonClick(Sender: TObject);
    procedure BinariesClientDataSetAfterRefresh(DataSet: TDataSet);
    procedure BinariesClientDeployActionExecute(Sender: TObject);
    procedure BinariesServerDeployActionExecute(Sender: TObject);
    procedure BinariesServiceDeployActionExecute(Sender: TObject);
    procedure DbLogClientDataSetAfterRefresh(DataSet: TDataSet);
    procedure DbLogRefreshSpeedButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure SourceConnStrAdoTestLabelClick(Sender: TObject);
    procedure SourceConnStrFdTestLabelClick(Sender: TObject);
    procedure SyslogIdSyslogServerSyslog(Sender: TObject; ASysLogMessage: TIdSysLogMessage; ABinding: TIdSocketHandle);
    procedure SyslogRichEditChange(Sender: TObject);
    procedure SystemClientDataSetAfterDelete(DataSet: TDataSet);
    procedure SystemClientDataSetAfterInsert(DataSet: TDataSet);
    procedure SystemClientDataSetAfterPost(DataSet: TDataSet);
    procedure SystemClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure SystemDbaBackupDdlActionExecute(Sender: TObject);
    procedure SystemDbaCreateDdlActionExecute(Sender: TObject);
    procedure SystemDbaDefinitionRebuildActionExecute(Sender: TObject);
    procedure SystemDbaDeleteDdlActionExecute(Sender: TObject);
    procedure SystemDbaRestoreDdlActionExecute(Sender: TObject);
    procedure SystemSyslogCleanActionExecute(Sender: TObject);
    procedure SystemSyslogStartActionExecute(Sender: TObject);
    procedure TopServiceContinueButtonClick(Sender: TObject);
    procedure TopServiceInstallButtonClick(Sender: TObject);
    procedure TopServiceStartButtonClick(Sender: TObject);
    procedure TopServiceStopButtonClick(Sender: TObject);
    procedure TopServiceUninstallButtonClick(Sender: TObject);
    procedure WebW3FilesGenerateSpeedButtonClick(Sender: TObject);
    procedure WebWksFilesGenerateSpeedButtonClick(Sender: TObject);
    procedure DatabaseTableCreateLabelClick(Sender: TObject);
    procedure ServerClientDataSetAfterScroll(DataSet: TDataSet);
    procedure DatabaseDbaClientDataSetAfterScroll(DataSet: TDataSet);
    procedure DatabaseTblClientDataSetAfterScroll(DataSet: TDataSet);
    procedure ServerClientDataSetAfterOpen(DataSet: TDataSet);
    procedure DatabaseDbaClientDataSetAfterOpen(DataSet: TDataSet);
    procedure DatabaseTblClientDataSetAfterOpen(DataSet: TDataSet);
    procedure DatabaseTableCheckLabelClick(Sender: TObject);
    procedure DatabaseFldClientDataSetAfterOpen(DataSet: TDataSet);
    procedure DatabaseFieldCreateLabelClick(Sender: TObject);
  private
    { Private declarations }
    FSyslogCount: integer;
    function  SystemDbaDdlExport(IvKind: string): boolean;
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  SystemMainForm: TSystemMainForm;
{$ENDREGION}

implementation

{$REGION 'Uses'}
{$R *.dfm}

uses
    System.StrUtils
  , System.DateUtils
  , System.Types
  , System.IOUtils
  , Winapi.WinSvc  // services
  , Vcl.RecError   // reconcileerrors
  , Wks000Unit
  , WksSystemSoapMainServiceIntf
  ;
{$ENDREGION}

{$REGION 'Routine'}
function TSystemMainForm.SystemDbaDdlExport(IvKind: string): boolean;
var
  hos, str, dat, fna, fbk: string; // dbhost, str, datetime, filename
  sls: TStrings;
begin
  // ask
  Result := TAskRec.Yes('Export %s DDL script for all databases hosted at %s ?'
    + sLineBreak      + 'The script file will be saved in your hard disk', [UpperCase(IvKind), UpperCase(gaps.Www)]);
  if not Result then
    Exit;

  // rio
  Screen.Cursor := crHourGlass;
  try
         if SameText(IvKind, 'Create')  then Result := (TRioRec.HttpRio as ISystemSoapMainService).SystemDbaCreateDdlSoap (hos, dat, str, fbk)
    else if SameText(IvKind, 'Delete')  then Result := (TRioRec.HttpRio as ISystemSoapMainService).SystemDbaDeleteDdlSoap (hos, dat, str, fbk)
    else if SameText(IvKind, 'Backup')  then Result := (TRioRec.HttpRio as ISystemSoapMainService).SystemDbaBackupDdlSoap (hos, dat, str, fbk)
    else if SameText(IvKind, 'Restore') then Result := (TRioRec.HttpRio as ISystemSoapMainService).SystemDbaRestoreDdlSoap(hos, dat, str, fbk)
    else begin                               Result := false; fbk := ''; end;
    TMesRec.I(fbk);
    if Result then begin
      sls := TStringList.Create;
      try
        sls.Text := str;
        fna := Format('%s\WksDbaAll%s_%s_%s.txt', [TBynRec.BinaryDir, IvKind, hos, dat]);
        sls.SaveToFile(fna);
        TMesRec.I('%s DDL script saved to %s', [UpperCase(IvKind), fna]);
        TFsyRec.FileOpenAsText(fna, fbk);
      finally
        sls.Free;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TSystemMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
  TopServiceComboBox.ItemIndex := 0;
  {$ENDREGION}

  {$REGION 'property'}
  // systemkind
//SystemKindDBComboBox.Items.Add('');
//for str in TSystemRec.SystemKindVector do SystemKindDBComboBox.Items.Add(str);
  {$ENDREGION}

  {$REGION 'syslog'}
  SysLogLabel.Caption := '';
  SyslogRichEdit.Clear;
  {$ENDREGION}

end;

procedure TSystemMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SyslogIdSyslogServer.Active := false;

  inherited;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TSystemMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  {$REGION 'Object'}
  {$ENDREGION}

  {$REGION 'Detail'}
  if not (SystemClientDataSet.State = dsBrowse) then
    SystemDBNavigator.BtnClick(nbPost);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TSystemMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
  if SystemClientDataSet.Locate('FldObjectId', FId, []) then begin
    SystemClientDataSet.Delete;
    if SystemClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      SystemClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'SystemCds'}
procedure TSystemMainForm.SystemClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if SystemClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    SystemClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TSystemMainForm.SystemClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
  DataSet.FieldByName('FldValue1'  ).Value := TNamRec.RndInt('Value1');
  DataSet.FieldByName('FldValue2'  ).Value := TNamRec.RndInt('Value2');
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
  {$ENDREGION}

end;

procedure TSystemMainForm.SystemClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'applyupdatetoremoteserver'}
  if SystemClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    SystemClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TSystemMainForm.SystemClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'reconcileerror'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Syslog'}
procedure TSystemMainForm.SyslogRichEditChange(Sender: TObject);
begin
  inherited;

  SendMessage(SyslogRichEdit.handle, WM_VSCROLL, SB_BOTTOM, 0);
end;

procedure TSystemMainForm.SystemSyslogStartActionExecute(Sender: TObject);
begin
  inherited;

  SyslogIdSyslogServer.Active := SystemSyslogStartAction.Checked;
  if SyslogIdSyslogServer.Active then begin
  //SyslogRichEdit.SetFocus;
  //SyslogRichEdit.Lines.Add('Wks SysLog Server Started');
    StatusBar.SimpleText := 'Wks SysLog Server Started';
  end else
  //SyslogRichEdit.Lines.Add('Wks SysLog Server Stopped');
    StatusBar.SimpleText := 'Wks SysLog Server Stopped';
end;

procedure TSystemMainForm.SystemSyslogCleanActionExecute(Sender: TObject);
begin
  inherited;

  SyslogRichEdit.Clear;
end;

procedure TSystemMainForm.SyslogIdSyslogServerSyslog(Sender: TObject; ASysLogMessage: TIdSysLogMessage; ABinding: TIdSocketHandle);
var
  r: string;            // rawmsg
  h, p: string;         // host, peer=hostip
  t: TDateTime;         // timestamp
//f: TidSyslogFacility; // facility
//s: TIdSyslogSeverity; // severity
//m: TIdSysLogMsgPart;  // msg
  e: string;            // text
  c: string;            // content
  x: string;            // process
//a: boolean;           // pidisavailable
//i: integer;           // pid
  l: string;            // logrow
//b: TTabSheet;         // tab
//j: integer;           // tabidx
begin
  inherited;

  // zip
  r := ASysLogMessage.RawMessage;
  h := ASysLogMessage.Hostname;
  p := ASysLogMessage.Peer;
  t := ASysLogMessage.TimeStamp;
//f := ASysLogMessage.Facility;
//s := ASysLogMessage.Severity;
//a := ASysLogMessage.Msg.PIDAvailable;
  e := ASysLogMessage.Msg.Text;
  x := ASysLogMessage.Msg.Process;
//i := ASysLogMessage.Msg.PID;
  c := ASysLogMessage.Msg.Content;

  // row
  l := Format('%s - %s - %s : %s', [FormatDateTime('yyyy/mm/dd hh:nn:ss', t), h, x, c]);

  // log
  SyslogRichEdit.SetFocus;
  SyslogRichEdit.SelStart := SyslogRichEdit.GetTextLen;
  SyslogRichEdit.Perform(EM_SCROLLCARET, 0, 0);
  SyslogRichEdit.Lines.Add(l);
  Inc(FSyslogCount);
  SysLogLabel.Caption := Format('Entries %d', [FSyslogCount]);

  // tablog
//for j := 0 to MainPageControl.PageCount-1 do begin
//  b := MainPageControl.Pages[j];
//  if SameText(b.Caption, h) then
//    with b.Controls[0] as TRichEdit do begin
//      Lines.Add(l);
//      Exit;
//    end;
//end;

  // logdetails
  {
  SyslogRichEdit.Lines.Add(r);                              // <14>Nov  8 15:42:35 www.wks.cloud WksWaferMarkDualProject[3312]: tick...
  SyslogRichEdit.Lines.Add(h);                              // www.wks.cloud
  SyslogRichEdit.Lines.Add(p);                              // 10.176.66.8
  SyslogRichEdit.Lines.Add(DateTimeToStr(t));               // 11/8/2022 3:42:35 PM
  SyslogRichEdit.Lines.Add(TEnumConverter.EnumToString(f)); // sfUserLevel
  SyslogRichEdit.Lines.Add(TEnumConverter.EnumToString(s)); // slInformational
  SyslogRichEdit.Lines.Add(a.ToString);                     // -1
  SyslogRichEdit.Lines.Add(e);                              // WksWafermarkDualProject[3312]: Z:\
  SyslogRichEdit.Lines.Add(x);                              // WksWafermarkDualProject
  SyslogRichEdit.Lines.Add(i.ToString);                     // 3312
  SyslogRichEdit.Lines.Add(c);                              // tick...
  }
end;
{$ENDREGION}

{$REGION 'DbaLog'}
procedure TSystemMainForm.DbLogClientDataSetAfterRefresh(DataSet: TDataSet);
begin
  inherited;

  TGriRec.GriFit(DbLogJvDBUltimGrid);
  DbLogCountLabel.Caption := Format('%d logs', [DataSet.RecordCount]);
end;

procedure TSystemMainForm.DbLogRefreshSpeedButtonClick(Sender: TObject);
begin
  inherited;

  DbLogClientDataSet.Refresh;
end;
{$ENDREGION}

{$REGION 'Audit'}
procedure TSystemMainForm.AuditClientDataSetAfterRefresh(DataSet: TDataSet);
begin
  inherited;

  TGriRec.GriFit(AuditJvDBUltimGrid);
  AuditCountLabel.Caption := Format('%d audits', [DataSet.RecordCount]);
end;

procedure TSystemMainForm.AuditRefreshSpeedButtonClick(Sender: TObject);
begin
  inherited;

  AuditClientDataSet.Refresh;
end;
{$ENDREGION}

{$REGION 'Database'}
procedure TSystemMainForm.SystemDbaDefinitionRebuildActionExecute(Sender: TObject);
var
//bol: boolean;
  www, k: string; // sitehost
begin
  inherited;

  // init
  www := UpperCase(gaps.Www);

  // ask
  if TAskRec.No(   'Rebuild definitions for all system databases hosted at ' + www + '?'
    + sLineBreak + 'Definitio tables: TblDatabase, TblTable, TblField, TblIndex will be aligned with the phisical database'
    + sLineBreak + 'Data already present will be preserved'
    + sLineBreak + 'Fields not present in the definition tables will be added'
  //+ sLineBreak + 'Fields not present in the database will be set to Inactive'
    ) then
    Exit;

  // rio
  Screen.Cursor := crHourGlass;
  try
    {bol :=} (TRioRec.HttpRio as ISystemSoapMainService).SystemDbaRebuildSoap(k);
    TMesRec.I(k);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TSystemMainForm.SystemDbaCreateDdlActionExecute(Sender: TObject);
begin
  inherited;

  // macro
  SystemDbaDdlExport('Create');
end;

procedure TSystemMainForm.SystemDbaDeleteDdlActionExecute(Sender: TObject);
begin
  inherited;

  // macro
  SystemDbaDdlExport('Delete');
end;

procedure TSystemMainForm.SystemDbaBackupDdlActionExecute(Sender: TObject);
begin
  inherited;

  // macro
  SystemDbaDdlExport('Backup');
end;

procedure TSystemMainForm.SystemDbaRestoreDdlActionExecute(Sender: TObject);
begin
  inherited;

  // macro
  SystemDbaDdlExport('Restore');
end;


procedure TSystemMainForm.ServerClientDataSetAfterOpen(DataSet: TDataSet);
begin
  inherited;

  ServerClientDataSet.Locate('FldServer', gini.StrGet(FObj + '/Server', ''), []);
end;

procedure TSystemMainForm.DatabaseDbaClientDataSetAfterOpen(DataSet: TDataSet);
begin
  inherited;

  DatabaseDbaClientDataSet.Locate('FldDatabase', gini.StrGet(FObj + '/DatabaseDba', ''), []);
  TGriRec.GriColumnsWidthFit(DatabaseDbaDBGrid);
end;

procedure TSystemMainForm.DatabaseTblClientDataSetAfterOpen(DataSet: TDataSet);
begin
  inherited;

  DatabaseTblClientDataSet.Locate('FldTable', gini.StrGet(FObj + '/DatabaseTbl', ''), []);
  TGriRec.GriColumnsWidthFit(DatabaseTblDBGrid);
end;

procedure TSystemMainForm.DatabaseFldClientDataSetAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TGriRec.GriColumnsWidthFit(DatabaseFldDBGrid);
end;


procedure TSystemMainForm.ServerClientDataSetAfterScroll(DataSet: TDataSet);
begin
  inherited;

  gini.StrSet(FObj + '/Server', ServerClientDataSet.FieldByName('FldServer').AsString);
end;

procedure TSystemMainForm.DatabaseDbaClientDataSetAfterScroll(DataSet: TDataSet);
begin
  inherited;

  gini.StrSet(FObj + '/DatabaseDba', DatabaseDbaClientDataSet.FieldByName('FldDatabase').AsString);
end;

procedure TSystemMainForm.DatabaseTblClientDataSetAfterScroll(DataSet: TDataSet);
begin
  inherited;

  gini.StrSet(FObj + '/DatabaseTbl', DatabaseTblClientDataSet.FieldByName('FldTable').AsString);
end;


procedure TSystemMainForm.DatabaseTableCreateLabelClick(Sender: TObject);
var
  com, dba, tbl, fld, typ, len, nul, fbk: string;
  sbu: TSbuRec;
  aff: integer;
  ook: boolean;
begin
  inherited;

  dba := DatabaseDbaClientDataSet.FieldByName('FldDatabase').AsString;
  tbl := DatabaseTblClientDataSet.FieldByName('FldTable').AsString;

  sbu.Add('use [%s]', [dba]);
//  sbu.Add('if not exists (');
//  sbu.Add('    select 1');
//  sbu.Add('    from sys.tables t');
//  sbu.Add('    join sys.schemas s on t.schema_id = s.schema_id');
//  sbu.Add('    where t.name = ''%s''', [tbl]);
//  sbu.Add('      and s.name = ''dbo''');
//  sbu.Add(') begin');
  sbu.Add('if object_id(''%s'', ''U'') is not null', [tbl]);
  sbu.Add('begin');
  sbu.Add('    raiserror (''table %s already exists.'', 16, 1);', [tbl]);
  sbu.Add('    return');
  sbu.Add('end');

  sbu.Add('create table [%s].[dbo].[%s] (', [dba, tbl]);
  com := '';
  DatabaseFldClientDataSet.First;
  while not DatabaseFldClientDataSet.Eof do begin
    com := IfThen(com.IsEmpty, '    ', '  , ');
    fld := DatabaseFldClientDataSet.FieldByName('FldField').AsString;
    typ := DatabaseFldClientDataSet.FieldByName('FldType').AsString;
    len := IfThen(typ.Contains('char'), Format('(%s)', [DatabaseFldClientDataSet.FieldByName('FldLength').AsString]), '');
    nul := IfThen(DatabaseFldClientDataSet.FieldByName('FldNullable').AsBoolean, 'null', 'not null');
    sbu.Add('%s[%s] %s%s %s', [com, fld, typ, len, nul]);
    DatabaseFldClientDataSet.Next;
  end;
  sbu.Add(') on [primary]');
  sbu.Add('print ''table %s created''', [tbl]);

  LogFrame.Output(sbu.Text);

  // rio
  if DatabaseTableCreateCommitCheckBox.Checked then begin
    ook := TDbaRec.CmdExecRio(sbu.Text, aff, fbk);
    LogFrame.Output(fbk, ook);
  end;
end;

procedure TSystemMainForm.DatabaseTableCheckLabelClick(Sender: TObject);
var
  fbk: string;
  ook: boolean;
begin
  inherited;

  // rio
  ook := TDbaRec.TblCheckRio(
    DatabaseTblClientDataSet.FieldByName('FldSystem').AsString
  , DatabaseTblClientDataSet.FieldByName('FldDatabase').AsString
  , DatabaseTblClientDataSet.FieldByName('FldTable').AsString
  , fbk);
  LogFrame.Output(fbk, ook);
end;


procedure TSystemMainForm.DatabaseFieldCreateLabelClick(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;
{$ENDREGION}

{$REGION 'Binaries'}

  {$REGION 'Cds'}
procedure TSystemMainForm.BinariesClientDataSetAfterRefresh(DataSet: TDataSet);
begin
  inherited;

  TGriRec.GriFit(BinariesJvDBUltimGrid);
  BinariesCountLabel.Caption := Format('%d clients', [DataSet.RecordCount]);
end;
  {$ENDREGION}

  {$REGION 'Actions'}
procedure TSystemMainForm.BinariesClientDeployActionExecute(Sender: TObject); // *** MOVE TO SYSTEM AS RIO ACTION ***
const
  ZIP_TARGET_PATH = 'C:\$\X\Zip';
var
  dst: TDataset;
  sql, bin, ext, ver, osb, fna, fs0, fs1, fs2, fs3, fsp, zfs: string;
begin
  inherited;

  // log
  LogFrame.LogShow;

  // clientsget
  sql :=         'select'
  + sLineBreak + '    FldId'
  + sLineBreak + '  , FldState'
  + sLineBreak + '  , FldDeploy'
  + sLineBreak + '  , FldDownload'
  + sLineBreak + '  , FldObject'
  + sLineBreak + '  , FldBinary'
  + sLineBreak + '  , FldExt'
  + sLineBreak + '  , FldVersion'
  + sLineBreak + '  , FldOs'
  + sLineBreak + '  , FldKind'
  + sLineBreak + '  , FldDescription'
  + sLineBreak + '  , FldNote'
  + sLineBreak + '--, FldDateTime'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaSystem.dbo.TblBinary'
  + sLineBreak + 'where'
  + sLineBreak + '    FldState = ''Active'''
  + sLineBreak + 'and FldKind in (''Client'', ''ClientDll'', ''Editor'')'
  + sLineBreak + 'and FldDeploy = 1'
  + sLineBreak + 'order by'
  + sLineBreak + '    FldBinary'
  ;
  TDbaRec.DsFromSql(sql, dst); // *** WORKS ONLY IF THE CLIENT SEE THE DB SERVER ***

  // targetdelete
  if DirectoryExists(ZIP_TARGET_PATH) then
    TDirectory.Delete(ZIP_TARGET_PATH, true);

  // targetcreate
  TDirectory.CreateDirectory(ZIP_TARGET_PATH);

  // deploy
  Screen.Cursor := crHourGlass;
  try
    while not dst.Eof do begin
      // source
      bin := dst.FieldByName('FldBinary' ).AsString;
      ext := dst.FieldByName('FldExt'    ).AsString;
      osb := dst.FieldByName('FldOs'     ).AsString;
      ver := dst.FieldByName('FldVersion').AsString;
      fna := Format('%s%s'                   , [bin, ext]);
      fs0 := Format('C:\$\X\Win64\Release\%s', [fna]);
    //fs1 := Format('C:\$\X\Win64\Debug\%s'  , [fna]);
      fs2 := Format('C:\$\X\Win32\Release\%s', [fna]);
    //fs3 := Format('C:\$\X\Win32\Debug\%s'  , [fna]);

      //try
      if      FileExists(fs0) then
        fsp := fs0
      else if FileExists(fs1) then
        fsp := fs1
      else if FileExists(fs2) then
        fsp := fs2
      else if FileExists(fs3) then
        fsp := fs3
      else begin
        fsp := '';
        LogFrame.Log('binary %s skipped, unable to find binary file', [bin, zfs], clWebDarkOrange);
      end;

      // go
      if not fsp.IsEmpty then begin
        // target
        zfs := Format('%s\%s_%s_%s.zip', [ZIP_TARGET_PATH, bin, ver, osb]);

        // zip
        TZipRec.ZipFile(fsp, zfs);
        LogFrame.Log('binary %s zipped to %s', [bin, zfs]);
      end;

      dst.Next;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TSystemMainForm.BinariesServerDeployActionExecute(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;

procedure TSystemMainForm.BinariesServiceDeployActionExecute(Sender: TObject);
begin
  inherited;

  TMesRec.I('See specific tab "Services"');
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Services'}
procedure TSystemMainForm.TopServiceInstallButtonClick(Sender: TObject);
var
  sch, svh: SC_HANDLE; // servicecontrolmanagerhandle, servicehandle
  nam, sna, sdn, sep: string; // servicename, displayname, exepath
begin
  inherited;

  nam := TopServiceComboBox.Text;
  if nam.IsEmpty then begin
    TMesRec.W('Please select the service name');
    Exit;
  end;
//  sna := TSvcRec.ServiceName(nam);
//  sdn := TSvcRec.DisplayName(nam);
//  sep := TSvcRec.ExePath(nam);
  sna := 'jachLogServiceDemo';
  sdn := 'jach Log Service Demo';
  sep := 'C:\$\X\Win32\Debug\jachLogServiceDemo.exe';

  sch := OpenSCManager(nil, nil, SC_MANAGER_CREATE_SERVICE);
  if sch = 0 then
    raise Exception.Create('Could not open Service Control Manager');

  try
    svh := CreateService(
      sch
    , PChar(sna)
    , PChar(sdn)
    , SERVICE_ALL_ACCESS
    , SERVICE_WIN32_OWN_PROCESS
    , SERVICE_DEMAND_START
    , SERVICE_ERROR_NORMAL
    , PChar(sep)
    , nil
    , nil
    , nil
    , nil
    , nil
    );

    if svh = 0 then
      raise Exception.CreateFmt('Could not install service "%s"', [sdn]);

    TMesRec.I('Service "%s" has been installed', [sdn]);
    CloseServiceHandle(svh);
  finally
    CloseServiceHandle(sch);
  end;
end;

procedure TSystemMainForm.TopServiceUninstallButtonClick(Sender: TObject); // *** need a RunAs Administrator ! ***
var
  sch, svh: SC_HANDLE; // servicecontrolmanagerhandle, servicehandle
  nam, sna, sdn: string; // servicename, displayname
begin
  inherited;

  nam := TopServiceComboBox.Text;
  if nam.IsEmpty then begin
    TMesRec.W('Please select the service name');
    Exit;
  end;
//  sna := TSvcRec.ServiceName(nam);
//  sdn := TSvcRec.DisplayName(nam);
  sna := 'jachLogServiceDemo';
  sdn := 'jach Log Service Demo';

  sch := OpenSCManager(nil, nil, SC_MANAGER_CONNECT);
  if sch = 0 then
    raise Exception.Create('Could not open Service Control Manager');

  try
    svh := OpenService(
      sch
    , PChar(sna)
    , SERVICE_ALL_ACCESS {SERVICE_STOP}
    );

    if svh = 0 then
      raise Exception.CreateFmt('Could not open service "%s"', [sdn]);

    try
      if not DeleteService(svh) then
        raise Exception.CreateFmt('Could not uninstall service "%s"', [sdn]);

      TMesRec.I('Service "%s" has been uninstalled', [sdn]);
    finally
      CloseServiceHandle(svh);
    end;
  finally
    CloseServiceHandle(sch);
  end;
end;

procedure TSystemMainForm.TopServiceStartButtonClick(Sender: TObject);
var
  sch, svh: SC_HANDLE; // servicecontrolmanagerhandle, servicehandle
  nam, sna, sdn: string; // servicename, displayname
begin
  inherited;

  nam := TopServiceComboBox.Text;
  if nam.IsEmpty then begin
    TMesRec.W('Please select the service name');
    Exit;
  end;
//  sna := TSvcRec.ServiceName(nam);
//  sdn := TSvcRec.DisplayName(nam);
  sna := 'jachLogServiceDemo';
  sdn := 'jach Log Service Demo';

  sch := OpenSCManager(nil, nil, SC_MANAGER_CONNECT);
  if sch = 0 then
    raise Exception.Create('Could not open Service Control Manager');

  try
    svh := OpenService(
      sch
    , PChar(sna)
    , SERVICE_START
    );

    if svh = 0 then
      raise Exception.CreateFmt('Could not open service "%s"', [sdn]);

    try
      if not StartService(svh, 0, PChar(nil^)) then
        raise Exception.CreateFmt('Could not start service "%s"', [sdn]);

      TMesRec.I('Service "%s" has been started', [sdn]);
    finally
      CloseServiceHandle(svh);
    end;
  finally
    CloseServiceHandle(sch);
  end;
end;

procedure TSystemMainForm.TopServiceStopButtonClick(Sender: TObject);
var
  sch, svh: SC_HANDLE; // servicecontrolmanagerhandle, servicehandle
  nam, sna, sdn: string; // servicename, displayname
  sst: TServiceStatus;
begin
  inherited;

  nam := TopServiceComboBox.Text;
  if nam.IsEmpty then begin
    TMesRec.W('Please select the service name');
    Exit;
  end;
//  sna := TSvcRec.ServiceName(nam);
//  sdn := TSvcRec.DisplayName(nam);
  sna := 'jachLogServiceDemo';
  sdn := 'jach Log Service Demo';

  sch := OpenSCManager(nil, nil, SC_MANAGER_CONNECT);
  if sch = 0 then
    raise Exception.Create('Could not open Service Control Manager');

  try
    svh := OpenService(
      sch
    , PChar(sna)
    , SERVICE_START
    );

    if svh = 0 then
      raise Exception.CreateFmt('Could not open service "%s"', [sdn]);

    try
      if not ControlService(svh, SERVICE_CONTROL_STOP, sst) then
        raise Exception.CreateFmt('Could not stop service "%s"', [sdn]);

      TMesRec.I('Service "%s" has been stopped', [sdn]);
    finally
      CloseServiceHandle(svh);
    end;
  finally
    CloseServiceHandle(sch);
  end;
end;

procedure TSystemMainForm.TopServiceContinueButtonClick(Sender: TObject);
begin
  inherited;

end;
{$ENDREGION}

{$REGION 'Web'}
procedure TSystemMainForm.WebWksFilesGenerateSpeedButtonClick(Sender: TObject);
begin
  inherited;

  if TAskRec.Yes('Generate the Wks web files?') then begin
    TSysRec.WksWebFilesGenerate(WebWksJsCheckBox.Checked, WebWksCssCheckBox.Checked, WebWksDefaultHtmlCheckBox.Checked, WebWksDefaultUseSpinCheckBox.Checked);
    LogFrame.LogOne('Wks web files generated', fmInfo);
  end;
end;

procedure TSystemMainForm.WebW3FilesGenerateSpeedButtonClick(Sender: TObject);
begin
  inherited;

  if TAskRec.Yes('Generate and save the Wks web files?') then begin
    TW3fRec.W3WebFilesGenerate(WebW3JsCheckBox.Checked, WebW3ColorJsCheckBox.Checked, WebW3CssCheckBox.Checked, WebW3ThemeCssCheckBox.Checked);
    LogFrame.LogOne('W3 web files generated', fmInfo);
  end;
end;
{$ENDREGION}

{$REGION 'Sources'}
procedure TSystemMainForm.SourceConnStrAdoTestLabelClick(Sender: TObject);
var
  fbk: string;
begin
  inherited;

  gcns.CsAdoTest(SourceConnStrAdoDBSynEdit.Text, fbk);
  TMesRec.I(fbk);
end;

procedure TSystemMainForm.SourceConnStrFdTestLabelClick(Sender: TObject);
var
  fbk: string;
begin
  inherited;

  gcns.CsFdTest(SourceConnStrAdoDBSynEdit.Text, fbk);
  TMesRec.I(fbk);
end;
{$ENDREGION}

end.
