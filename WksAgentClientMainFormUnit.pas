unit WksAgentClientMainFormUnit;

interface

{$REGION 'Uses'}
uses
    Winapi.Windows
  , Winapi.Messages
  , Winapi.WebView2
  , Winapi.ActiveX
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
  , Vcl.DBCGrids
  , Vcl.DBCtrls
  , Vcl.DBGrids
  , Vcl.Dialogs
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
  , Vcl.Edge
  , Data.DB
  , Datasnap.DBClient
  , Soap.SOAPConn
  , SynDBEdit
  , SynEdit
  , JvClock
  , JvComponentBase
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
  , VirtualTrees
  , DTClientTree
  , DTDBTreeView
  , WksBaseClientMainFormUnit
  , WksLogFrameUnit
  , WksAgentUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TAgentMainForm = class(TBaseMainForm)
    AgentAction: TActionList;
    AgentActiveAction: TAction;
    AgentActiveToolButton: TToolButton;
    AgentClientDataSet: TClientDataSet;
    AgentDBNavigator: TDBNavigator;
    AgentDataSource: TDataSource;
    AgentImageList24: TImageList;
    AgentJvScrollMaxBand: TJvScrollMaxBand;
    AgentObjectIdDBEdit: TDBEdit;
    AgentObjectIdLabel: TLabel;
    AgentRunAction: TAction;
    AgentRunToolButton: TToolButton;
    AgentTabSheet: TTabSheet;
    AgentTestAction: TAction;
    AgentTestToolButton: TToolButton;
    AgentToolBar: TToolBar;
    AgentMonitorPanel: TPanel;
    AgentRunningLabel: TLabel;
    AgentRunningCountLabel: TLabel;
    AgentEventsJvScrollMaxBand: TJvScrollMaxBand;
    AgentOnSuccessLabel: TLabel;
    AgentOnSuccessDBEdit: TDBEdit;
    AgentOnFailLabel: TLabel;
    AgentOnFailDBEdit: TDBEdit;
    AgentOnEmptyLabel: TLabel;
    AgentOnEmptyDBEdit: TDBEdit;
    AgentRunAtJvScrollMaxBand: TJvScrollMaxBand;
    AgentRunAtYearLabel: TLabel;
    AgentRunAtYearDBEdit: TDBEdit;
    AgentRunAtQuarterLabel: TLabel;
    AgentRunAtQuarterDBEdit: TDBEdit;
    AgentRunAtMonthLabel: TLabel;
    AgentRunAtMonthDBEdit: TDBEdit;
    AgentRunAtWeekLabel: TLabel;
    AgentRunAtWeekDBEdit: TDBEdit;
    AgentRunAtDayLabel: TLabel;
    AgentRunAtDayDBEdit: TDBEdit;
    AgentRunAtSecondLabel: TLabel;
    AgentRunAtSecondDBEdit: TDBEdit;
    AgentRunAtMinuteLabel: TLabel;
    AgentRunAtMinuteDBEdit: TDBEdit;
    AgentRunAtHourLabel: TLabel;
    AgentRunAtHourDBEdit: TDBEdit;
    AgentActiveDBCtrlGrid: TDBCtrlGrid;
    AgentActiveObjectIdDBText: TDBText;
    AgentActiveObjectDBText: TDBText;
    OptionJclJvScrollMaxBand: TJvScrollMaxBand;
    OptionJmpExePathLabel: TLabel;
    OptionJmpExePathEdit: TEdit;
    AgentActiveTabSheet: TTabSheet;
    AgentActiveClientDataSet: TClientDataSet;
    AgentActiveDataSource: TDataSource;
    AgentActiveDBNavigator: TDBNavigator;
    AgentActiveRunAtHourDBText: TDBText;
    AgentActiveRunAtMinuteDBText: TDBText;
    AgentActiveRunAtSecondDBText: TDBText;
    AgentActiveRunAtLabel: TLabel;
    AgentActiveLabel: TLabel;
    AgentActiveCountLabel: TLabel;
    RunListTabSheet: TTabSheet;
    RunListBox: TListBox;
    RunListPanel: TPanel;
    RunInfoTabSheet: TTabSheet;
    RunInfoPanel: TPanel;
    RunInfoStartedLabel: TLabel;
    RunInfoStartedValueLabel: TLabel;
    RunInfoEndedValueLabel: TLabel;
    RunInfoEndedLabel: TLabel;
    RunInfoMessageLabel: TLabel;
    RunInfoMessageValueLabel: TLabel;
    RunInfoGridPanel: TGridPanel;
    RunInfoOutputLabel: TLabel;
    RunInfoReportLabel: TLabel;
    RunInfoReportRichEdit: TRichEdit;
    RunInfoOutputRichEdit: TRichEdit;
    RunInfoElapsedLabel: TLabel;
    RunInfoElapsedValueLabel: TLabel;
    RunInfoAffectedLabel: TLabel;
    RunInfoAffectedValueLabel: TLabel;
    RunInfoListClearLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure AgentActiveActionExecute(Sender: TObject);
    procedure AgentClientDataSetAfterDelete(DataSet: TDataSet);
    procedure AgentClientDataSetAfterInsert(DataSet: TDataSet);
    procedure AgentClientDataSetAfterPost(DataSet: TDataSet);
    procedure AgentClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure AgentRunActionExecute(Sender: TObject);
    procedure AgentTestActionExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure LeftPanelResize(Sender: TObject);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ObjectClientDataSetAfterRefresh(DataSet: TDataSet);
    procedure ObjectClientDataSetAfterOpen(DataSet: TDataSet);
    procedure TimerJvThreadTimerTimer(Sender: TObject);
    procedure AgentActiveClientDataSetAfterOpen(DataSet: TDataSet);
    procedure AgentActiveClientDataSetAfterRefresh(DataSet: TDataSet);
    procedure ObjectClientDataSetAfterPost(DataSet: TDataSet);
    procedure AgentActiveTabSheetShow(Sender: TObject);
    procedure AgentActiveClientDataSetAfterScroll(DataSet: TDataSet);
    procedure RunListBoxClick(Sender: TObject);
    procedure RunInfoTabSheetShow(Sender: TObject);
    procedure RunInfoListClearLabelClick(Sender: TObject);
  private
    { Private declarations }
    // winmessages
    procedure WmFormAfterShow(var Msg: TMessage); message WM_AFTER_SHOW; // thiggered also from the baseform
    // gui
    procedure GuiRefresh;
    // active
  //procedure AgentActiveLoad;
  //procedure AgentActiveUnload;
    // agentrunning
    procedure AgentRunningInc;
    procedure AgentRunningDec;
    // run
    procedure RunInfoClear;
    // thread
    procedure AgentThreadStart(IvAgentRec: TAgentRec);
    procedure AgentThreadOnTerminate(Sender: TObject);
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  AgentMainForm: TAgentMainForm;
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

  {$REGION 'Gui'}
procedure TAgentMainForm.GuiRefresh;
begin
  // agent
  AgentActiveDBCtrlGrid.RowCount := AgentActiveDBCtrlGrid.Height div 48;
end;
  {$ENDREGION}

  {$REGION 'Running'}
procedure TAgentMainForm.AgentRunningInc;
begin
  AgentRunningCountLabel.Tag := AgentRunningCountLabel.Tag + 1;
  AgentRunningCountLabel.Caption := IntToStr(AgentRunningCountLabel.Tag);
  Application.ProcessMessages;
end;

procedure TAgentMainForm.AgentRunningDec;
begin
  AgentRunningCountLabel.Tag := AgentRunningCountLabel.Tag - 1;
  AgentRunningCountLabel.Caption := IntToStr(AgentRunningCountLabel.Tag);
  Application.ProcessMessages;
end;
  {$ENDREGION}

  {$REGION 'Run'}
procedure TAgentMainForm.RunInfoClear;
begin
  RunInfoStartedValueLabel.Caption  := '';
  RunInfoEndedValueLabel.Caption    := '';
  RunInfoElapsedValueLabel.Caption  := '';
  RunInfoAffectedValueLabel.Caption := '';
  RunInfoMessageValueLabel.Caption  := '';
  RunInfoOutputRichEdit.Clear;
  RunInfoReportRichEdit.Clear;
end;
  {$ENDREGION}

  {$REGION 'Active'}
{
procedure TAgentMainForm.AgentActiveLoad;
begin
  Screen.Cursor := crHourGlass;
  //ObjectActiveDBGrid.DataSource := nil;
  //AgentActiveDBGrid.DataSource := nil;
  try
    // clear
    ObjectActiveClientDataSet.Close; //ObjectActiveUnload;
    AgentActiveClientDataSet.Close;  //AgentActiveUnload;

    // clone
    ObjectActiveClientDataSet.CloneCursor(ObjectClientDataSet, true, false);
    AgentActiveClientDataSet.CloneCursor(AgentClientDataSet, true, false);

    // filter
    ObjectActiveClientDataSet.FilterOptions := [foCaseInsensitive]; // apparently option is not supported, probably it depend on the dbengine
    ObjectActiveClientDataSet.Filter        := 'FldId > 100 and FldState = ''Active'' and FldContentKind in (' + TCodRec.KindCsv(true) + ')';
    ObjectActiveClientDataSet.Filtered      := true;

    // sort
    ObjectActiveClientDataSet.IndexFieldNames := 'FldId';
    AgentActiveClientDataSet.IndexFieldNames := 'FldObjectId';

    // open
    ObjectActiveClientDataSet.Open;
    AgentActiveClientDataSet.Open;
  finally
    //ObjectActiveDBGrid.DataSource := ObjectActiveDataSource;
    //AgentActiveDBGrid.DataSource := AgentActiveDataSource;
    //TGriRec.GriFit(ObjectActiveDBGrid);
    //TGriRec.GriFit(AgentActiveDBGrid);
    Screen.Cursor := crDefault;
  end;
end;
}
//procedure TAgentMainForm.AgentActiveUnload;
//begin
//  ObjectActiveClientDataSet.Close;
//end;
  {$ENDREGION}

  {$REGION 'Thread'}
procedure TAgentMainForm.AgentThreadStart(IvAgentRec: TAgentRec);
var
  okk: boolean;
begin

  {$REGION 'checks'}
  // state
  okk := (IvAgentRec.State = TStaRec.ACTIVE.Name) or (IvAgentRec.State = TStaRec.TESTING.Name);
  if not okk then begin
    TMesRec.W('Unable to start agent %d "%s", it is not in "Active" or "Testing" state', [IvAgentRec.Id, IvAgentRec.Agent]);
    Exit;
  end;

  // kind
  okk := TCodRec.KindCsv().Contains(IvAgentRec.ContentKind);
  if not okk then begin
    TMesRec.W('Unable to start agent %d "%s", content kind "%s" is unknown', [IvAgentRec.Id, IvAgentRec.Agent, IvAgentRec.ContentKind]);
    Exit;
  end;

  // precondition
  // an agent might have a "precondition code" to run before its execution
  // if the execution of precondition code return "false" then exit
  // this feature might be usefull to conditionally run an insert-query, the precondition code cuold check some requirements before the inserted
  {$ENDREGION}

  {$REGION 'start'}
  // +1
  AgentRunningInc;

  // log
  LogFrame.Log('%-16s | %4d "%s"', ['AGENTSTART (MAN)', IvAgentRec.Id, IvAgentRec.Agent], clBlue);

  // JSL
  if          IvAgentRec.ContentKind = TCodRec.JSL.Kind then begin
    with TAgentJslThread.Create(IvAgentRec, true) do begin
      OnTerminate := AgentThreadOnTerminate;
      Start;
    end;

  // PY
  end else if IvAgentRec.ContentKind = TCodRec.PY.Kind then begin
    with TAgentPythonThread.Create(IvAgentRec, true) do begin
      OnTerminate := AgentThreadOnTerminate;
      Start;
    end;

  // SQL
  end else if IvAgentRec.ContentKind = TCodRec.SQL.Kind then begin
    with TAgentSqlThread.Create(IvAgentRec, true) do begin
      OnTerminate := AgentThreadOnTerminate;
      Start;
    end;

  // UNKNOWN
  end else begin
    TMesRec.W('Unable to start agent %d "%s", content kind "%s" is not implemented', [IvAgentRec.Id, IvAgentRec.Agent, IvAgentRec.ContentKind]);

    // -1
    AgentRunningDec;
  end;
  {$ENDREGION}

end;

procedure TAgentMainForm.AgentThreadOnTerminate(Sender: TObject);
var
  ath: TAgentThread;
  ptr: PAgentThreadInfoRec;
begin
  // receive a terminating thread (before .Destroy)

  {$REGION 'checks'}
  // threadnot
  if not (Sender is TAgentThread) then begin
    TMesRec.W('Unknown thread is terminating... please check...');
    if AgentActiveAction.Checked then begin
      TMesRec.I('Now switch off activities... please check...');
      AgentActiveAction.Execute;
    end;
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'terminate'}
  // -1
  AgentRunningDec;

  // thread
  ath := (Sender as TAgentThread);

  // output
  LogFrame.Output(ath.InfoRec.Output.Text);

  // runinfoadd
  New(ptr);
  ptr.Started   := ath.InfoRec.Started  ;
  ptr.Ended     := ath.InfoRec.Ended    ;
  ptr.Affected  := ath.InfoRec.Affected ;
  ptr.ElapsedMs := ath.InfoRec.ElapsedMs;
  ptr.Report    := ath.InfoRec.Report   ;
  ptr.Output    := ath.InfoRec.Output   ;
  ptr.Msg       := ath.InfoRec.Msg      ;
  RunListBox.AddItem(Format('%s - #%d "%s"', [DateTimeToStr(ptr.Started), ath.AgentRec.Id, ath.AgentRec.Agent]), TObject(ptr));

  // log
  LogFrame.Log('%-16s | %4d "%s" elapsed: %.2f s, affected: %d, msg: %s', ['AGENTSTOP', ath.AgentRec.Id, ath.AgentRec.Agent, ptr.ElapsedMs/1000, ptr.Affected, ptr.Msg], clBlue);
  {$ENDREGION}

  {$REGION 'on'}
  // onsuccess

  // onfail

  // onempty
  {$ENDREGION}

end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Form'}
procedure TAgentMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
//AgentTestToolButton.Visible := false
  RunInfoClear;
  {$ENDREGION}

  {$REGION 'property'}
  // kind
//AgentKindDBComboBox.Items.Add('');
//for str in TAgentRec.AgentKindVector do AgentKindDBComboBox.Items.Add(str);
  {$ENDREGION}

  {$REGION 'option'}
  OptionJmpExePathEdit.Text := gini.StrGet('Agent/JmpExePath', 'C:\Program Files\Jmp\...');
  {$ENDREGION}

end;

procedure TAgentMainForm.WmFormAfterShow(var Msg: TMessage);
begin
  // code here will be executed after formshow event happened in the baseform
//ShowMessage('WM_AFTER_SHOW message received 2nd !');
end;

procedure TAgentMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  inherited;

  // agentactive
  CanClose := not AgentActiveAction.Checked;
  if not CanClose then begin
    TMesRec.I(     'Unable to close the AGENT client.'
    + sLineBreak + 'The "Active" switch is in "ON" position.'
    + sLineBreak + 'Please switch it to "OFF" before closing.'
    );
    Exit;
  end;

  // agentsrunning
  CanClose := AgentRunningCountLabel.Tag = 0;
  if not CanClose then begin
    TMesRec.I(            'Unable to close the AGENT client.'
    + sLineBreak + Format('%d agents are still running', [AgentRunningCountLabel.Tag])
    + sLineBreak +        'Wait until all running agents have finished or kill them before exit.'
    );
  end;
end;

procedure TAgentMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  {$REGION 'option'}
  gini.StrSet('Agent/JmpExePath', OptionJmpExePathEdit.Text);
  {$ENDREGION}

  {$REGION 'gui'}
  RunInfoListClearLabelClick(nil);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Left'}
procedure TAgentMainForm.LeftPanelResize(Sender: TObject);
begin
  inherited;

  GuiRefresh;
end;

procedure TAgentMainForm.AgentActiveTabSheetShow(Sender: TObject);
begin
  inherited;

  GuiRefresh;
end;

procedure TAgentMainForm.RunListBoxClick(Sender: TObject);
 var
  ptr: PAgentThreadInfoRec;
begin
  inherited;

  MainPageControl.ActivePage        := RunInfoTabSheet;

  ptr := PAgentThreadInfoRec(RunListBox.Items.Objects[ RunListBox.ItemIndex ]);

  RunInfoStartedValueLabel.Caption  := ptr.Started.ToString  ;
  RunInfoEndedValueLabel.Caption    := ptr.Ended.ToString    ;
  RunInfoElapsedValueLabel.Caption  := ptr.ElapsedMs.ToString;
  RunInfoAffectedValueLabel.Caption := ptr.Affected.ToString ;
  RunInfoMessageValueLabel.Caption  := ptr.Msg               ;
  RunInfoOutputRichEdit.Text        := ptr.Output.Text       ;
  RunInfoReportRichEdit.Text        := ptr.Report.Text       ;
end;

procedure TAgentMainForm.RunInfoListClearLabelClick(Sender: TObject);
var
  i: integer;
begin
  inherited;

  // memoryfree
  for i := 0 to RunListBox.Items.Count - 1 do
    Dispose(PAgentThreadInfoRec(RunListBox.Items.Objects[i]));

  // itemsremove
  if RunListBox.Items.Count > 0 then
    RunListBox.Clear;

  // runinfo
  RunInfoClear;
end;
{$ENDREGION}

{$REGION 'Center'}
procedure TAgentMainForm.RunInfoTabSheetShow(Sender: TObject);
begin
  inherited;

  RunInfoGridPanel.Align := alClient;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TAgentMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  // detail
  if AgentClientDataSet.State = dsEdit then
    AgentDBNavigator.BtnClick(nbPost);
end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TAgentMainForm.ObjectClientDataSetAfterOpen(DataSet: TDataSet);
begin
  inherited;

  //AgentActiveClientDataSet.Refresh;
end;

procedure TAgentMainForm.ObjectClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  AgentActiveClientDataSet.Refresh;
end;

procedure TAgentMainForm.ObjectClientDataSetAfterRefresh(DataSet: TDataSet);
begin
  inherited;

  AgentActiveClientDataSet.Refresh;
end;

procedure TAgentMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
  if AgentClientDataSet.Locate('FldObjectId', FId, []) then begin
    AgentClientDataSet.Delete;
    if AgentClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      AgentClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'AgentCds'}
procedure TAgentMainForm.AgentClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if AgentClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    AgentClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', ['Object']);
  end;
  {$ENDREGION}

end;

procedure TAgentMainForm.AgentClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
{ // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]); }
  {$ENDREGION}

end;

procedure TAgentMainForm.AgentClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // applyupdatetoremoteserver
  if AgentClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    AgentClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;

  AgentActiveClientDataSet.Refresh;
  {$ENDREGION}

end;

procedure TAgentMainForm.AgentClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'AgentActiveCds'}
procedure TAgentMainForm.AgentActiveClientDataSetAfterOpen(DataSet: TDataSet);
begin
  inherited;

  //
end;

procedure TAgentMainForm.AgentActiveClientDataSetAfterRefresh( DataSet: TDataSet);
begin
  inherited;

  //
end;

procedure TAgentMainForm.AgentActiveClientDataSetAfterScroll(DataSet: TDataSet);
begin
  inherited;

  AgentActiveCountLabel.Caption := DataSet.RecordCount.ToString;
end;
{$ENDREGION}

{$REGION 'AgentActions'}
procedure TAgentMainForm.AgentTestActionExecute(Sender: TObject);
begin
  inherited;

  TMesRec.NI;

{
  test ado connection
  ResultADOConnection.Close;
  ResultADOConnection.ConnectionString := UtilsADOConnStrTestEdit.Text;
  try
    ResultADOConnection.Open;
    ShowMessage('Ok');
  except
    on e: Exception do begin
      ShowMessage(e.Message);
    end;
  end;

  test fd connection
  ResultFDConnection.Close;
  ResultFDConnection.ConnectionString := UtilsFDConnStrTestEdit.Text;
  try
    ResultFDConnection.Open;
    if ResultFDConnection.Ping then
      ShowMessage('Ok');
  except
    on e: Exception do begin
      ShowMessage(e.Message);
    end;
  end;
}
end;

procedure TAgentMainForm.AgentRunActionExecute(Sender: TObject);
var
  age: TAgentRec;
begin
  inherited;

  // post
  ActionPostAction.Execute;

  // agent
  age.FromObjectDs(ObjectClientDataSet);

  // run
  Screen.Cursor := crHourGlass;
  try
    AgentThreadStart(age); // *** in manual it will be handy an option to avoid sending emails inside the thread ***
    LogFrame.LogOne('Agent %d %s has been started', [age.Id, age.Agent], fmDanger);
  finally
    Screen.Cursor := crDefault
  end;
end;

procedure TAgentMainForm.AgentActiveActionExecute(Sender: TObject);
begin
  inherited;

  if AgentActiveAction.Checked then begin
    AgentActiveAction.Caption := TStaRec.ACTIVE.Name;
    AgentActiveAction.ImageIndex := 4;
    AgentActiveClientDataSet.DisableControls;
    AgentActiveDBNavigator.Enabled := false;
    AgentActiveCountLabel.Font.Style  := [fsBold];
    AgentRunningCountLabel.Font.Style := [fsBold];

  end else begin
    AgentActiveAction.Caption := TStaRec.INACTIVE.Name;
    AgentActiveAction.ImageIndex := 3;
    AgentActiveClientDataSet.EnableControls;
    AgentActiveDBNavigator.Enabled := true;
    AgentActiveCountLabel.Font.Style  := [];
    AgentRunningCountLabel.Font.Style := [];
  end;
end;
{$ENDREGION}

{$REGION 'Timer'}
procedure TAgentMainForm.TimerJvThreadTimerTimer(Sender: TObject);

  {$REGION 'var'}
var
  i: integer;
//jso: ISuperobject;
  okk: boolean;
  age: TAgentRec;
  yel, qul, mol, wel, wem, dal, hol, mil, sel{, k}: string; // year, quarter, month, week, weekmode, day, hour, minute, second (list)

  procedure ActiveStateToTesting;
  begin
    AgentActiveClientDataSet.Edit;
    AgentActiveClientDataSet.FieldByName('FldState').Value := TStaRec.TESTING.Name;
    AgentActiveClientDataSet.Post;
  end;

  function  YqdMatch: boolean;
  begin
    Result := ( yel.IsEmpty or (yel = '*') or TLstRec.LstHas(yel, FYear.ToString)                                    )
    and       ( qul.IsEmpty or (qul = '*') or TLstRec.LstHas(qul, FQuarter.ToString)                                 )
    and       ( dal.IsEmpty or (dal = '*') or TLstRec.LstHas(dal, FDay.ToString) or TLstRec.LstHas(dal, FDayStr3)    );
  end;

  function  YmdMatch: boolean;
  begin
    Result := ( yel.IsEmpty or (yel = '*') or TLstRec.LstHas(yel, FYear.ToString)                                    )
    and       ( mol.IsEmpty or (mol = '*') or TLstRec.LstHas(mol, FMonth.ToString) or TLstRec.LstHas(mol, FMonthStr3))
    and       ( dal.IsEmpty or (dal = '*') or TLstRec.LstHas(dal, FDay.ToString) or TLstRec.LstHas(dal, FDayStr3)    );
  end;

  function  YmwMatch: boolean;
  var
    wex: word;
  begin
    if wem = 'Working' then wex := FWeekWork else wex := FWeekIso;
    Result := ( yel.IsEmpty or (yel = '*') or TLstRec.LstHas(yel, FYear.ToString)                                    )
    and       ( wel.IsEmpty or (wel = '*') or TLstRec.LstHas(wel, wex.ToString)                                      )
    and       ( dal.IsEmpty or (dal = '*') or TLstRec.LstHas(dal, FDay.ToString) or TLstRec.LstHas(dal, FDayStr3)    );
  end;

  function  HmsMatch: boolean;
  begin
    Result := ( hol.IsEmpty or (hol = '*') or TLstRec.LstHas(hol, FHour.ToString)                                    )
    and       ( mil.IsEmpty or (mil = '*') or TLstRec.LstHas(mil, FMinute.ToString)                                  )
    and       ( sel.IsEmpty or (sel = '*') or TLstRec.LstHas(sel, FSecond.ToString)                                  );
  end;
  {$ENDREGION}

begin
  inherited;

  {$REGION 'exit'}
  // switchisoff
  if not AgentActiveAction.Checked then begin
  //LogFrame.Log('The "Active" switch is disactivated');
    Exit;
  end;

  // noactiveagents
  if AgentActiveClientDataSet.IsEmpty then begin
    AgentActiveAction.Execute;
    TMesRec.W('No active agent(s)!, "Active" switch has been disactivated');
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'loop'}
  LogFrame.Log('examine agents to execute...');
  i := 0;
  AgentActiveClientDataSet.First;
  while not AgentActiveClientDataSet.Eof do begin
    // idx
    Inc(i);

    // agent(active)
    okk := age.FromAgentActiveDs(AgentActiveClientDataSet);

    // notfound
    if not okk then
      LogFrame.Log('%3d) agent #%d "%s" not runnable, it has no "RunAt" info, please define them', [i, age.Id, age.Agent])

    // found
    else begin
      LogFrame.Log('%3d) agent #%d "%s" runat min:%s, sec:%s', [i, age.Id, age.Agent, age.RunAtMinute, age.RunAtSecond]);

    end;

    // next
    AgentActiveClientDataSet.Next;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

end.
