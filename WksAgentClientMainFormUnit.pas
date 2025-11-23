unit WksAgentClientMainFormUnit;

interface

{$REGION 'Help'}
(*
  for Dws stuff sync this unit with WksDwsUnit !!!

  properties of visual components (main thread) can only be updated using CriticalSection:

  - InitializeCriticalSection() - Creates an instance of Critical Section
  - EnterCriticalSection()      - Engages the lock
    access the resource
  - LeaveCriticalSection()      - Releases the lock
  - DeleteCriticalSection()     - Destroys the instance of Critical Section

  or Synchronize:

  procedure AgentThread.UpdateCaption;
  begin
    Form1.Caption := 'Updated in a thread via normal method';
  end;

  Synchronize(UpdateCaption);

  or Synchronize with anonymous method:

  Synchronize(
    procedure
    begin
      Form1.Caption := 'Updated in thread via an anonymous method'
    end
  );

  or Queue:

  Similarly, you can use Queue method, with similar parameters, instead passing another
  TThread as the first parameter and putting the thread in a queue with the other thread
*)
{$ENDREGION}

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
  , Data.Win.ADODB
  , Datasnap.DBClient
  , FireDAC.Stan.Intf
  , FireDAC.Stan.Option
  , FireDAC.Stan.Error
  , FireDAC.Stan.Def
  , FireDAC.Stan.Pool
  , FireDAC.Stan.Async
  , FireDAC.Stan.Param
  , FireDAC.Stan.ExprFuncs
  , FireDAC.UI.Intf
  , FireDAC.VCLUI.Wait
  , FireDAC.Phys.Intf
  , FireDAC.DatS
  , FireDAC.DApt
  , FireDAC.DApt.Intf
  , FireDAC.Moni.Base
  , FireDAC.Comp.DataSet
  , FireDAC.Comp.Client
  , FireDAC.Phys
  , FireDAC.Phys.MSAccDef , FireDAC.Phys.MSAcc
  , FireDAC.Phys.MySQLDef , FireDAC.Phys.MySQL
//, FireDAC.Phys.MSSQLDef , FireDAC.Phys.MSSQL
//, FireDAC.Phys.OracleDef, FireDAC.Phys.Oracle
//, FireDAC.Phys.ODBCDef  , FireDAC.Phys.ODBC  , FireDAC.Phys.ODBCBase
  , FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteWrapper.Stat
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
    RunListClearLabel: TLabel;
    AgentResultToolButton: TToolButton;
    AgentResultAction: TAction;
    ResultDataSource: TDataSource;
    ResultADOQuery: TADOQuery;
    ResultADOConnection: TADOConnection;
    ResultFDConnection: TFDConnection;
    ResultFDQuery: TFDQuery;
    ResultTabSheet: TTabSheet;
    ResultDBGrid: TDBGrid;
    SynEditDataPopup: TPopupMenu;
    SynEditDataJsonBaseTemplate: TMenuItem;
    JsonDivPopup: TMenuItem;
    SynEditDataJsonOptionBlock: TMenuItem;
    SynEditDataJsonRunAtBlock: TMenuItem;
    SynEditDataJsonSaveBlock: TMenuItem;
    SynEditDataJsonEmailBlock: TMenuItem;
    SynEditDataJsonDatasourceBlock: TMenuItem;
    SynEditDataJsonDatatargetBlock: TMenuItem;
    SynEditDataJsonTimeframeBlock: TMenuItem;
    SynEditDataJsonEtlBlock: TMenuItem;
    SynEditDataJsonParamsBlock: TMenuItem;
    JsonDiv2Popup: TMenuItem;
    SynEditDataJsonAdoMsSqlCsPopup: TMenuItem;
    SynEditDataJsonAdoMsMdbCsPopup: TMenuItem;
    SynEditDataJsonAdoMsAccdbCsPopup: TMenuItem;
    SynEditDataJsonAdoMsXlsCsPopup: TMenuItem;
    SynEditDataJsonAdoMsXlsxCsPopup: TMenuItem;
    JsonDiv3Popup: TMenuItem;
    SynEditDataJsonFdMsSqlCsPopup: TMenuItem;
    SynEditDataJsonFdOracleCsPopup: TMenuItem;
    SynEditDataJsonFdMongodbCsPopup: TMenuItem;
    AgentCsAdoTestToolButton: TToolButton;
    ToolButton2: TToolButton;
    AgentCsFdTestAction: TAction;
    AgentCsAdoTestAction: TAction;
    RunningTabSheet: TTabSheet;
    RunningPanel: TPanel;
    RunningPauseLabel: TLabel;
    RunningListBox: TListBox;
    RunningStopLabel: TLabel;
    RunningContinueLabel: TLabel;
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
    procedure AgentActiveClientDataSetAfterScroll(DataSet: TDataSet);
    procedure ObjectClientDataSetAfterPost(DataSet: TDataSet);
    procedure AgentActiveTabSheetShow(Sender: TObject);
    procedure RunListBoxClick(Sender: TObject);
    procedure RunInfoTabSheetShow(Sender: TObject);
    procedure RunListClearLabelClick(Sender: TObject);
    procedure AgentResultActionExecute(Sender: TObject);
    procedure SynEditDataJsonBaseTemplateClick(Sender: TObject);
    procedure SynEditDataJsonOptionBlockClick(Sender: TObject);
    procedure SynEditDataJsonRunAtBlockClick(Sender: TObject);
    procedure SynEditDataJsonSaveBlockClick(Sender: TObject);
    procedure SynEditDataJsonEmailBlockClick(Sender: TObject);
    procedure SynEditDataJsonDatasourceBlockClick(Sender: TObject);
    procedure SynEditDataJsonDatatargetBlockClick(Sender: TObject);
    procedure SynEditDataJsonTimeframeBlockClick(Sender: TObject);
    procedure SynEditDataJsonEtlBlockClick(Sender: TObject);
    procedure SynEditDataJsonParamsBlockClick(Sender: TObject);
    procedure SynEditDataJsonAdoMsSqlCsPopupClick(Sender: TObject);
    procedure SynEditDataJsonAdoMsMdbCsPopupClick(Sender: TObject);
    procedure SynEditDataJsonAdoMsAccdbCsPopupClick(Sender: TObject);
    procedure SynEditDataJsonAdoMsXlsCsPopupClick(Sender: TObject);
    procedure SynEditDataJsonAdoMsXlsxCsPopupClick(Sender: TObject);
    procedure SynEditDataJsonFdMsSqlCsPopupClick(Sender: TObject);
    procedure SynEditDataJsonFdOracleCsPopupClick(Sender: TObject);
    procedure SynEditDataJsonFdMongodbCsPopupClick(Sender: TObject);
    procedure AgentCsAdoTestActionExecute(Sender: TObject);
    procedure AgentCsFdTestActionExecute(Sender: TObject);
    procedure RunningStopLabelClick(Sender: TObject);
    procedure RunningPauseLabelClick(Sender: TObject);
    procedure RunningContinueLabelClick(Sender: TObject);
  private
    { Private declarations }
    // winmessages
    procedure WmFormAfterShow(var Msg: TMessage); message WM_AFTER_SHOW; // thiggered also from the baseform
    // agent
    function  AgentIsPast(IvAgentRec: TAgentRec): boolean;
    function  AgentIsOnTime(IvAgentRec: TAgentRec): boolean; // runnable now
    function  AgentIsNext(IvAgentRec: TAgentRec): boolean;   // runnable in the next hour
    function  AgentIsFuture(IvAgentRec: TAgentRec): boolean;
    // active
    procedure AgentActiveLabelRefresh;
    procedure AgentActiveDBCtrlGridRefresh;
  //procedure AgentActiveLoad;
  //procedure AgentActiveUnload;
    // run
    procedure AgentRunInfoClear;
    procedure AgentRunStart(IvAgentRec: TAgentRec; IvCtxTag: string = ''; IvCtxIdx: integer = -1); // ctxtag = MANU|AUTO
    // running
    procedure AgentRunningInc;
    procedure AgentRunningDec;
    function  AgentRunningSelected: TAgentThread;
    function  AgentRunningIdFindByThread(const IvAgentThread: TAgentThread): integer;
    procedure AgentRunningUiUpdate(const IvRunningId: Integer; const IvString: string);
    // thread
    procedure AgentThreadStart(IvAgentRec: TAgentRec; IvCtxTag: string = '');
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
  , System.Diagnostics
  , System.Generics.Collections
  , Vcl.RecError // reconcileerrors
  , superobject
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Routine'}

  {$REGION 'Agent'}
function  TAgentMainForm.AgentIsPast(IvAgentRec: TAgentRec): boolean; // *** plain number, no csv ***
begin
  Result := (IvAgentRec.RunAtHour.ToInteger * 3600 + IvAgentRec.RunAtMinute.ToInteger * 60 + IvAgentRec.RunAtSecond.ToInteger) < (FHour * 3600 + FMinute * 60 + FSecond);
end;

function  TAgentMainForm.AgentIsOnTime(IvAgentRec: TAgentRec): boolean; // *** ok csv ***
begin
  Result := IvAgentRec.RunAtHour.Contains(FHour.ToString)
        and IvAgentRec.RunAtMinute.Contains(FMinute.ToString)
        and IvAgentRec.RunAtSecond.Contains(FSecond.ToString);
end;

function  TAgentMainForm.AgentIsNext(IvAgentRec: TAgentRec): boolean; // *** plain number, no csv ***
begin
  Result := (not AgentIsPast(IvAgentRec)) and (not AgentIsFuture(IvAgentRec));
end;

function  TAgentMainForm.AgentIsFuture(IvAgentRec: TAgentRec): boolean; // *** plain number, no csv ***
begin
  Result := (FHour * 3600 + 3600 + FMinute * 60 + FSecond) < (IvAgentRec.RunAtHour.ToInteger * 3600 + IvAgentRec.RunAtMinute.ToInteger * 60 + IvAgentRec.RunAtSecond.ToInteger);
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

procedure TAgentMainForm.AgentActiveUnload;
begin
  ObjectActiveClientDataSet.Close;
end;
}
procedure TAgentMainForm.AgentActiveLabelRefresh;
begin
  AgentActiveCountLabel.Caption := AgentActiveClientDataSet.RecordCount.ToString
end;

procedure TAgentMainForm.AgentActiveDBCtrlGridRefresh;
begin
  AgentActiveDBCtrlGrid.RowCount := AgentActiveDBCtrlGrid.Height div 48;
end;
  {$ENDREGION}

  {$REGION 'Run'}
procedure TAgentMainForm.AgentRunInfoClear;
begin
  RunInfoStartedValueLabel.Caption  := '';
  RunInfoEndedValueLabel.Caption    := '';
  RunInfoElapsedValueLabel.Caption  := '';
  RunInfoAffectedValueLabel.Caption := '';
  RunInfoMessageValueLabel.Caption  := '';
  RunInfoOutputRichEdit.Clear;
  RunInfoReportRichEdit.Clear;
end;

procedure TAgentMainForm.AgentRunStart(IvAgentRec: TAgentRec; IvCtxTag: string; IvCtxIdx: integer);
begin
  inherited;

  // start
  Screen.Cursor := crHourGlass;
  try
    AgentThreadStart(IvAgentRec, IvCtxTag); // *** it will be handy an option to avoid sending emails inside the thread ***
    LogFrame.LogOne('Agent %d "%s" has been started', [IvAgentRec.Id, IvAgentRec.Agent], fmDanger);
    if IvCtxIdx < 0 then
      LogFrame.Log('Agent %d "%s" started at min:%s, sec:%s', [IvAgentRec.Id, IvAgentRec.Agent, IvAgentRec.RunAtMinute, IvAgentRec.RunAtSecond])
    else
      LogFrame.Log('%3d) agent %4d %-32s started at min:%s, sec:%s', [IvCtxIdx, IvAgentRec.Id, IvAgentRec.Agent.QuotedString('"'), IvAgentRec.RunAtMinute, IvAgentRec.RunAtSecond]);
  finally
    Screen.Cursor := crDefault
  end;
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

function TAgentMainForm.AgentRunningSelected: TAgentThread;
var
  idx: Integer;
begin
  Result := nil;
  idx := RunningListBox.ItemIndex;
  if idx >= 0 then
    Result := TAgentThread(RunningListBox.Items.Objects[idx]);
end;

function TAgentMainForm.AgentRunningIdFindByThread(const IvAgentThread: TAgentThread): integer;
begin
  for Result := 0 to RunningListBox.Items.Count - 1 do
    if TObject(RunningListBox.Items.Objects[Result]) = IvAgentThread then
      Exit;
  Result := -1;
end;

procedure TAgentMainForm.AgentRunningUiUpdate(const IvRunningId: Integer; const IvString: string);
var
  i: integer;
  ath: TAgentThread;
begin
  for i := 0 to RunningListBox.Items.Count - 1 do begin
    ath := TAgentThread(RunningListBox.Items.Objects[i]);
    if Assigned(ath) and (ath.RunningId = IvRunningId) then begin
      RunningListBox.Items[i] := Format('%3d "%s" — %s', [ath.AgentRec.Id, ath.AgentRec.Agent, IvString]);
      Application.ProcessMessages;
      Break;
    end;
  end;
end;
  {$ENDREGION}

  {$REGION 'Thread'}
procedure TAgentMainForm.AgentThreadStart(IvAgentRec: TAgentRec; IvCtxTag: string);
const
  SLEEP_MS = 500;
var
  okk: boolean;
  ath: TAgentThread;
begin

  {$REGION 'exits'}
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
  {$ENDREGION}

  {$REGION 'precondition'}
  // an agent might have some "preconditions codes" to be run before its execution
  // if any execution of preconditions codes return "false" then exit
  // this feature might be usefull to conditionally run an insert-query, the precondition code cuold check some requirements before the insert
  {$ENDREGION}

  {$REGION 'start'}
  // +1
  AgentRunningInc;

  // log
  LogFrame.Log('%-16s | %4d "%s"', ['AGENTSTART (%s)', IvAgentRec.Id, IvAgentRec.Agent, IvCtxTag], clBlue);

  // BAT
  if          IvAgentRec.ContentKind = TCodRec.BAT.Kind then begin
    //with TAgentDosThread.Create(IvAgentRec{, true}, ) do begin
    //  OnTerminate := AgentThreadOnTerminate;
    //  Start; // now the execute method is called, Resume is deprecated
    //end;
    ath := TAgentDosThread.Create(IvAgentRec{, true}
    , procedure(AId: Integer; AString: string)
      begin
        AgentRunningUiUpdate(AId, AString);
      end
    );
    ath.RunningId := RunningListBox.Items.Count;
    ath.OnTerminate := AgentThreadOnTerminate;
    RunningListBox.Items.AddObject(Format('%3d "%s" — %s', [IvAgentRec.Id, IvAgentRec.Agent, 'starting...']), ath); // the caption will be updated later from inside the thread as necessary
    Application.ProcessMessages;
    sleep(SLEEP_MS);
    ath.Start;

  // JSL
  end else if IvAgentRec.ContentKind = TCodRec.JSL.Kind then begin
    //with TAgentJslThread.Create(IvAgentRec{, true}, AgentRunningUiUpdate) do begin
    //  OnTerminate := AgentThreadOnTerminate;
    //  Start;
    //end;
    ath := TAgentJslThread.Create(IvAgentRec{, true}
    , procedure(AId: Integer; AString: string)
      begin
        AgentRunningUiUpdate(AId, AString);
      end
    );
    ath.RunningId := RunningListBox.Items.Count;
    ath.OnTerminate := AgentThreadOnTerminate;
    RunningListBox.Items.AddObject(Format('%3d "%s" — %s', [IvAgentRec.Id, IvAgentRec.Agent, 'starting...']), ath);
    Application.ProcessMessages;
    sleep(SLEEP_MS);
    ath.Start;

  // PY
  end else if IvAgentRec.ContentKind = TCodRec.PY.Kind then begin
    //with TAgentPythonThread.Create(IvAgentRec{, true}, AgentRunningUiUpdate) do begin
    //  OnTerminate := AgentThreadOnTerminate;
    //  Start;
    //end;
    ath := TAgentPythonThread.Create(IvAgentRec{, true}
    , procedure(AId: Integer; AString: string)
      begin
        AgentRunningUiUpdate(AId, AString);
      end
    );
    ath.RunningId := RunningListBox.Items.Count;
    ath.OnTerminate := AgentThreadOnTerminate;
    RunningListBox.Items.AddObject(Format('%3d "%s" — %s', [IvAgentRec.Id, IvAgentRec.Agent, 'starting...']), ath);
    Application.ProcessMessages;
    sleep(SLEEP_MS);
    ath.Start;

  // SQL
  end else if IvAgentRec.ContentKind = TCodRec.SQL.Kind then begin
    //with TAgentSqlThread.Create(IvAgentRec{, true}, ) do begin
    //  OnTerminate := AgentThreadOnTerminate;
    //  Start;
    //end;
    ath := TAgentSqlThread.Create(IvAgentRec{, true}
    , procedure(AId: Integer; AString: string)
      begin
        AgentRunningUiUpdate(AId, AString);
      end
    );
    ath.RunningId := RunningListBox.Items.Count;
    ath.OnTerminate := AgentThreadOnTerminate;
    RunningListBox.Items.AddObject(Format('%3d "%s" — %s', [IvAgentRec.Id, IvAgentRec.Agent, 'starting...']), ath);
    Application.ProcessMessages;
    sleep(SLEEP_MS);
    ath.Start;

  // ETL
  end else if IvAgentRec.ContentKind = TCodRec.ETL.Kind then begin
    //with TAgentEtlThread2.Create(IvAgentRec{, true}, ) do begin
    //  OnTerminate := AgentThreadOnTerminate;
    //  Start;
    //end;
    ath := TAgentEtlThread2.Create(IvAgentRec{, true}
    , procedure(AId: Integer; AString: string)
      begin
        AgentRunningUiUpdate(AId, AString);
      end
    );
    ath.RunningId := RunningListBox.Items.Count;
    ath.OnTerminate := AgentThreadOnTerminate;
    RunningListBox.Items.AddObject(Format('%3d %s — %s', [IvAgentRec.Id, IvAgentRec.Agent, 'starting...']), ath);
    Application.ProcessMessages;
    sleep(SLEEP_MS);
    ath.Start;

  // UNKNOWN
  end else begin
    TMesRec.W('Unable to start agent , content kind "%s" is not implemented', [IvAgentRec.Id, IvAgentRec.Agent, IvAgentRec.ContentKind]);

    // -1
    AgentRunningDec;
  end;
  {$ENDREGION}

end;

procedure TAgentMainForm.AgentThreadOnTerminate(Sender: TObject);
var
  ath: TAgentThread;
  ptr: PAgentThreadInfoRec;
  rlx: integer; // agentrunninglistindex
begin
  // receive a terminating thread (before .Destroy)

  {$REGION 'exits'}
  if not (Sender is TAgentThread) then begin
    TMesRec.W('Unknown thread is terminating... please check...');
    if AgentActiveAction.Checked then begin
      TMesRec.I('Now switch off any automatic activity... please check...');
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

  // runinfoadd
  New(ptr);
  ptr.Started   := ath.InfoRec.Started  ;
  ptr.Ended     := ath.InfoRec.Ended    ;
  ptr.Affected  := ath.InfoRec.Affected ;
  ptr.ElapsedMs := ath.InfoRec.ElapsedMs;
  ptr.Report    := ath.InfoRec.Report   ;
  ptr.Output    := ath.InfoRec.Output   ;
  ptr.Message   := ath.InfoRec.Message  ;
  RunListBox.AddItem(Format('%s - #%d "%s"', [DateTimeToStr(ptr.Started), ath.AgentRec.Id, ath.AgentRec.Agent]), TObject(ptr));

  // log
  LogFrame.Log('%-16s | %4d "%s" elapsed: %d ms, affected: %d, msg: %s', ['AGENTSTOP', ath.AgentRec.Id, ath.AgentRec.Agent, ptr.ElapsedMs, ptr.Affected, ptr.Message], clBlue);

  // output
  LogFrame.Output(ptr.Output.Text);
  {$ENDREGION}

  {$REGION 'runninglist'}
  rlx := AgentRunningIdFindByThread(ath);
  if rlx >= 0 then
    RunningListBox.Items.Delete(rlx);
  {$ENDREGION}

  {$REGION 'on'}
  // onsuccess

  // onfail

  // onempty
  {$ENDREGION}

  // free
  //ath.Free; // freeze tue UI !
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
//AgentTestToolButton.Visible := false;
  AgentRunInfoClear;
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
  RunListClearLabelClick(nil);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Left'}
procedure TAgentMainForm.LeftPanelResize(Sender: TObject);
begin
  inherited;

  AgentActiveDBCtrlGridRefresh;
end;

procedure TAgentMainForm.AgentActiveTabSheetShow(Sender: TObject);
begin
  inherited;

  AgentActiveDBCtrlGridRefresh;
end;

  {$REGION 'RunningList'}
procedure TAgentMainForm.RunningPauseLabelClick(Sender: TObject);
begin
  inherited;

  var sth := AgentRunningSelected;
  if Assigned(sth) then
    sth.PauseRequest;
end;

procedure TAgentMainForm.RunningContinueLabelClick(Sender: TObject);
begin
  inherited;

  var sth := AgentRunningSelected;
  if Assigned(sth) then
    sth.ContinueRequest;
end;

procedure TAgentMainForm.RunningStopLabelClick(Sender: TObject);
begin
  inherited;

  var sth := AgentRunningSelected;
  if Assigned(sth) then
    sth.StopRequest;
end;
  {$ENDREGION}

  {$REGION 'RunList'}
procedure TAgentMainForm.RunListBoxClick(Sender: TObject);
 var
  ptr: PAgentThreadInfoRec;
begin
  inherited;

  MainPageControl.ActivePage        := RunInfoTabSheet;

  ptr := PAgentThreadInfoRec(RunListBox.Items.Objects[RunListBox.ItemIndex]);

  RunInfoStartedValueLabel.Caption  := ptr.Started.ToString  ;
  RunInfoEndedValueLabel.Caption    := ptr.Ended.ToString    ;
  RunInfoElapsedValueLabel.Caption  := ptr.ElapsedMs.ToString;
  RunInfoAffectedValueLabel.Caption := ptr.Affected.ToString ;
  RunInfoMessageValueLabel.Caption  := ptr.Message           ;
  RunInfoOutputRichEdit.Text        := ptr.Output.Text       ;
  RunInfoReportRichEdit.Text        := ptr.Report.Text       ;
end;

procedure TAgentMainForm.RunListClearLabelClick(Sender: TObject);
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
  AgentRunInfoClear;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Center'}
procedure TAgentMainForm.RunInfoTabSheetShow(Sender: TObject);
begin
  inherited;

  RunInfoGridPanel.Align := alClient;
end;

  {$REGION 'Data'}
procedure TAgentMainForm.SynEditDataJsonBaseTemplateClick(Sender: TObject);
begin
  inherited;

  DataJsonInsert('Insert json BASE template?', AGENT_BASE_JSON_TEMPLATE);
end;

// ---

procedure TAgentMainForm.SynEditDataJsonDatasourceBlockClick(Sender: TObject);
begin
  inherited;

  DataJsonInsert('Insert json <DataSource> block?', AGENT_DATA_SOURCE_JSON_TEMPLATE);
end;

procedure TAgentMainForm.SynEditDataJsonDatatargetBlockClick(Sender: TObject);
begin
  inherited;

  DataJsonInsert('Insert json <DataTarget> block?', AGENT_DATA_TARGET_JSON_TEMPLATE);
end;

procedure TAgentMainForm.SynEditDataJsonEtlBlockClick(Sender: TObject);
begin
  inherited;

  DataJsonInsert('Insert json <Etl> block?', AGENT_ETL_JSON_TEMPLATE);
end;

// ---

procedure TAgentMainForm.SynEditDataJsonTimeframeBlockClick(Sender: TObject);
begin
  inherited;

//DataJsonInsert('Insert json <TimeFrame> block?', AGENT_TIMEFRAME_JSON_TEMPLATE);
end;

procedure TAgentMainForm.SynEditDataJsonSaveBlockClick(Sender: TObject);
begin
  inherited;

//DataJsonInsert('Insert json <Save> block?', AGENT_SAVE_JSON_TEMPLATE);
end;

procedure TAgentMainForm.SynEditDataJsonEmailBlockClick(Sender: TObject);
begin
  inherited;

//DataJsonInsert('Insert json <Email> block?', AGENT_EMAIL_JSON_TEMPLATE);
end;

procedure TAgentMainForm.SynEditDataJsonOptionBlockClick(Sender: TObject);
begin
  inherited;

//DataJsonInsert('Insert json <Option> block?', AGENT_OPTION_JSON_TEMPLATE);
end;

procedure TAgentMainForm.SynEditDataJsonParamsBlockClick(Sender: TObject);
begin
  inherited;

//DataJsonInsert('Insert json <Params> block?', AGENT_PARAMS_JSON_TEMPLATE);
end;

procedure TAgentMainForm.SynEditDataJsonRunAtBlockClick(Sender: TObject);
begin
  inherited;

//DataJsonInsert('Insert json <RunAt> block?', AGENT_RUNAT_JSON_TEMPLATE);
end;

// ---

procedure TAgentMainForm.SynEditDataJsonAdoMsSqlCsPopupClick(Sender: TObject);
begin
  inherited;

  DataJsonInsert('Insert json <ADO SqlServer connection string> block?', gcns.CsMsSqlADO('<Server>', '<Database>', '<Username>', '<Password>'));
end;

procedure TAgentMainForm.SynEditDataJsonAdoMsMdbCsPopupClick(Sender: TObject);
begin
  inherited;

  DataJsonInsert('Insert json <ADO Access (.mdb) connection string> block?', gcns.CsMsAccessADO('<File>.mdb', '<Username>', '<Password>'));
end;

procedure TAgentMainForm.SynEditDataJsonAdoMsAccdbCsPopupClick(Sender: TObject);
begin
  inherited;

  DataJsonInsert('Insert json <ADO Access (.accdb) connection string> block?', gcns.CsMsAccessADO('<File>.accdb', '<Username>', '<Password>'));
end;

procedure TAgentMainForm.SynEditDataJsonAdoMsXlsCsPopupClick(Sender: TObject);
begin
  inherited;

  DataJsonInsert('Insert json <ADO Excel (.xls) connection string> block?', gcns.CsMsExcelADO('<File>.xls'));
end;

procedure TAgentMainForm.SynEditDataJsonAdoMsXlsxCsPopupClick(Sender: TObject);
begin
  inherited;

  DataJsonInsert('Insert json <ADO Excel (.xlsx) connection string> block?', gcns.CsMsExcelADO('<File>.xlsx'));
end;

// ---

procedure TAgentMainForm.SynEditDataJsonFdMsSqlCsPopupClick(Sender: TObject);
begin
  inherited;

  DataJsonInsert('Insert json <FD SqlServer connection string> block?', gcns.CsMsSqlFD('<Server>', '<Database>', '<Username>', '<Password>'));
end;

procedure TAgentMainForm.SynEditDataJsonFdOracleCsPopupClick(Sender: TObject);
begin
  inherited;

  DataJsonInsert('Insert json <FD Oracle connection string> block?', gcns.CsOracleADO('<Server>', '<Port>', '<SID>', '<ServiceName>', '<Database>', '<Username>', '<Password>', '<DataSource>'));
end;

procedure TAgentMainForm.SynEditDataJsonFdMongodbCsPopupClick(Sender: TObject);
begin
  inherited;

  DataJsonInsert('Insert json <FD Mongodb connection string> block?', gcns.CsMongoFD('<Server>', '<Port>', '<Database>', '<Username>', '<Password>', '<Collection>'));
end;
  {$ENDREGION}

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

//AgentActiveLabelRefresh; // not opened yet
end;

procedure TAgentMainForm.ObjectClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  AgentActiveClientDataSet.Refresh;
//AgentActiveLabelRefresh; // auto-done after refresh
end;

procedure TAgentMainForm.ObjectClientDataSetAfterRefresh(DataSet: TDataSet);
begin
  inherited;

  AgentActiveClientDataSet.Refresh;
//AgentActiveLabelRefresh; // auto-done after refresh
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
    LogFrame.Log('%s detail data deleted from remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TAgentMainForm.AgentClientDataSetAfterInsert(DataSet: TDataSet);
var
  min: word;
begin
  inherited;

  {$REGION 'detail'}
  // pre
  min := FMinute;
  if FSecond > 30 then
    Inc(min);
  if min = 60 then
    min := 0;

  // set
  DataSet.Edit;
  DataSet.FieldByName('FldRunAtHour'  ).Value := FHour.ToString;
  DataSet.FieldByName('FldRunAtMinute').Value := min.ToString;
  DataSet.FieldByName('FldRunAtSecond').Value := '30';
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
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

    AgentActiveClientDataSet.Refresh;
    LogFrame.Log('Active agent dataset refreshed');
  end;
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

  AgentActiveLabelRefresh;
end;

procedure TAgentMainForm.AgentActiveClientDataSetAfterRefresh( DataSet: TDataSet);
begin
  inherited;

  AgentActiveLabelRefresh;
end;

procedure TAgentMainForm.AgentActiveClientDataSetAfterScroll(DataSet: TDataSet);
begin
  inherited;

  AgentActiveLabelRefresh;
end;
{$ENDREGION}

{$REGION 'AgentActions'}
procedure TAgentMainForm.AgentTestActionExecute(Sender: TObject);
var
  age: TAgentRec;
  scs, sli, tcs, tli, fbk: string; // sourceconnstr, datalib, targetconnstr, datalib
  dic: TDictionary<string, string>;
  ite: TPair<string, string>;
begin
  inherited;

  TMesRec.NI;

  // agent
  age.FromObjectDs(ObjectClientDataSet);

  // dic
  dic := TDictionary<string, string>.Create;
  try
    // sourceconnstr
    scs := age.JsonCompiledSO.S['DataSource.ConnStr'];
    if scs.IsEmpty then
      LogFrame.LogOne('Data json "DataSource.ConnStr" value not found', fmWarning)
    else begin
      sli := age.JsonCompiledSO.S['DataSource.ConnLib'];
      if sli.IsEmpty then
        LogFrame.LogOne('Data json "DataSource.ConnLib" value not found')
      else
        dic.Add(sli, scs);
    end;

    // targetconnstr
    tcs := age.JsonCompiledSO.S['DataTarget.ConnStr'];
    if scs.IsEmpty then
      LogFrame.LogOne('Data json "DataTarget.ConnStr" value not found', fmWarning)
    else begin
      tli := age.JsonCompiledSO.S['DataTarget.ConnLib'];
      if tli.IsEmpty then
        LogFrame.LogOne('Data json "DataTarget.ConnLib" value not found')
      else
        dic.Add(tli, tcs);
    end;

    // loop
    for ite in dic do begin
      // FD
      if SameText(ite.Key, 'FD') then begin
        // test fd connection
        if not gcns.CsFDTest(ite.Value, fbk) then
          TMesRec.W(fbk)
        else
          TMesRec.S(fbk);

      // ADO
      end else if SameText(ite.Key, 'ADO') then begin
        // test ado connection
        if not gcns.CsADOTest(ite.Value, fbk) then
          TMesRec.W(fbk)
        else
          TMesRec.S(fbk);

      // unknown
      end else
        TMesRec.W('Data json ConnLib "%s" is unknown', [ite.Key]);
    end;
  finally
    dic.Free;
  end;
end;

procedure TAgentMainForm.AgentResultActionExecute(Sender: TObject);
var
  a: TAgentRec;
  w: TStopwatch;
  u, v: TDateTime; us, vs: string; // boundaries
  l, s, q, k: string;              // connlib, connstr, query, boundariestr
  r, z: integer;                   // rows, minutes
  e: int64;                        // elapsedms

  procedure reset;
  begin
    ResultTabSheet.Caption := 'Result';
    MainPageControl.ActivePage := ObjectContentTabSheet;
    ResultADOConnection.Close;
    ResultFDConnection.Close;
  end;

begin
  inherited;

  // exit
  if not AgentResultAction.Checked then begin
    reset;
    Exit;
  end;

  // exit
  if not 'Sql,Etl'.Contains(ObjectContentKindDBComboBox.Text) then begin
    TMesRec.I('Result data grid is available only for "Sql" or "Etl" agents');
    reset;
    Exit;
  end;

  // tab
  MainPageControl.ActivePage := ResultTabSheet;

  // agent
  a.FromObjectDs(ObjectClientDataSet);

  // datalib
  l := a.JsonCompiledSO.S['DataSource.ConnLib'];
  if l = '' then begin
    TMesRec.I('Json "DataSource.ConnLib" value not found, please add it to the Data tab');
    Exit;
  end;

  // connstr
  s := a.JsonCompiledSO.S['DataSource.ConnStr'];
  if s = '' then begin
    TMesRec.I('Json "DataSource.ConnStr" value not found, please add it to the Data tab');
    Exit;
  end;

  // query
  q := a.ContentCompiled;
  if q.Trim = '' then begin
    TMesRec.I('Content value is empty, please add an Sql script to the Content tab');
    Exit;
  end;

  // compile
  if a.JsonCompiledSO.AsObject.Exists('TimeFrame') then begin
    // timeboundaries
    u := StrToDateTime(a.JsonCompiledSO.S['TimeFrame.Begin']);
    // 1st batch size calc
    z := a.JsonCompiledSO.I['TimeFrame.BatchSizeMin']; // 30 min
    if z > 0 then
      v := TDatRec.DatMinute(u, z)
    else
      v := StrToDateTime(a.JsonCompiledSO.S['TimeFrame.End']);
    // tostr
    us := FormatDateTime(a.JsonCompiledSO.S['TimeFrame.Format'], u);
    vs := FormatDateTime(a.JsonCompiledSO.S['TimeFrame.Format'], v);
    // replace
    q := TStrRec.StrReplace(q, '$BatchBegin$', us);
    q := TStrRec.StrReplace(q, '$BatchEnd$'  , vs);
  end;
  LogFrame.Output(q);

  // exec
  Screen.Cursor := crHourGlass;
  try
    // FD
    if SameText(l, 'FD') then begin
      // conn
      ResultFDConnection.Close;
      ResultFDConnection.ConnectionString := s;
    //ResultADOConnection.Open;

      // query
      ResultFDQuery.Close;
      ResultFDQuery.SQL.Text := q;
      try
        w := TStopwatch.StartNew;
        ResultFDQuery.Open;
        w.Stop;
        e := w.ElapsedMilliseconds;
        r := ResultFDQuery.RecordCount;
        ResultDataSource.DataSet := ResultFDQuery;
        TGriRec.GriFit(ResultDBGrid);
        LogFrame.Log('SUCCESS RESULT( FD) for %s with %d rows in %d ms', [a.Agent, r, e]);
        LogFrame.Log('FD driver actual: %s', [ResultFDConnection.ActualDriverID]);    // "MSSQL_OLEDB", "MSSQL_ODBC", "MSSQL_SQLNCLI"
        LogFrame.Log('FD MSSQLDriver: %s', [ResultFDConnection.Params.Values['MSSQLDriver']]);
      except
        on e: Exception do begin
          TMesRec.I(e.Message);
          ResultFDQuery.Close;
          ResultFDConnection.Close;
        end;
      end;

    // ADO
    end else begin
      // conn
      ResultADOConnection.Close;
      ResultADOConnection.ConnectionString := s;
    //ResultADOConnection.Open;

      // query
      ResultADOQuery.Close;
      ResultADOQuery.SQL.Text := q;
      try
        w := TStopwatch.StartNew;
        ResultADOQuery.Open;
        w.Stop;
        e := w.ElapsedMilliseconds;
        r := ResultADOQuery.RecordCount;
        ResultDataSource.DataSet := ResultADOQuery;
        TGriRec.GriFit(ResultDBGrid);
        LogFrame.Log('SUCCESS RESULT(ADO) for %s with %d rows in %d ms', [a.Agent, r, e]);
        LogFrame.Log('ADO driver actual: %s', [ResultFDConnection.ActualDriverID]);
        LogFrame.Log('FD MSSQLDriver: %s', [ResultFDConnection.Params.Values['MSSQLDriver']]);
      except
        on e: Exception do begin
          TMesRec.I(e.Message);
          ResultADOQuery.Close;
          ResultADOConnection.Close;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

  // fbk
  if r > 0 then
    ResultTabSheet.Caption := Format('Result (%d)', [r]);
end;

procedure TAgentMainForm.AgentRunActionExecute(Sender: TObject);
var
  age: TAgentRec;
begin
  inherited;

  // post
  if AgentClientDataSet.State in [dsEdit] then
    ActionPostAction.Execute;

  // agent
  age.FromObjectDs(ObjectClientDataSet); // from a wider object dataset

  // start
  AgentRunStart(age, 'MANU');
end;

procedure TAgentMainForm.AgentActiveActionExecute(Sender: TObject);
begin
  inherited;

  // active
  if AgentActiveAction.Checked then begin
    AgentActiveAction.Caption := TStaRec.ACTIVE.Name;
    AgentActiveAction.ImageIndex := 4;
    AgentActiveClientDataSet.DisableControls;
    AgentActiveDBNavigator.Enabled := false;
    AgentActiveCountLabel.Font.Style  := [fsBold];
    AgentRunningCountLabel.Font.Style := [fsBold];


  // inactive
  end else begin
    AgentActiveAction.Caption := TStaRec.INACTIVE.Name;
    AgentActiveAction.ImageIndex := 3;
    AgentActiveClientDataSet.EnableControls;
    AgentActiveDBNavigator.Enabled := true;
    AgentActiveCountLabel.Font.Style  := [];
    AgentRunningCountLabel.Font.Style := [];
  end;
end;

procedure TAgentMainForm.AgentCsAdoTestActionExecute(Sender: TObject);
var
  cns, fbk: string;
  okk: boolean;
begin
  inherited;

  cns := gsyn.Focused.SelText;
  if cns.Trim.IsEmpty then begin
    TMesRec.W('Please select an ADO connection string', 'Connection String ADO Test');
    Exit;
  end;

  okk := gcns.CsADOTest(cns, fbk);
  TMesRec.IW(fbk, okk, 'Connection String ADO Test');
end;

procedure TAgentMainForm.AgentCsFdTestActionExecute(Sender: TObject);
var
  cns, fbk: string;
  okk: boolean;
begin
  inherited;

  cns := gsyn.Focused.SelText;
  if cns.Trim.IsEmpty then begin
    TMesRec.W('Please select an ADO connection string', 'Connection String ADO Test');
    Exit;
  end;

  okk := gcns.CsFDTest(cns, fbk);
  TMesRec.IW(fbk, okk, 'Connection String ADO Test');
end;
{$ENDREGION}

{$REGION 'Timer'}
procedure TAgentMainForm.TimerJvThreadTimerTimer(Sender: TObject); // this timer is the same as in the WksBaseClient, it is always active

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
  // all datetime parts already calculated here
  inherited;

  {$REGION 'exit'}
  // noswitchactive
  if not AgentActiveAction.Checked then begin
  //LogFrame.Log('The "Active" switch is disactivated, skip the execution of active agents');
    Exit;
  end;

  // noagentsactive
  if AgentActiveClientDataSet.IsEmpty then begin
    AgentActiveAction.Execute; // toggle
    TMesRec.W('No active agent(s)!, "Active" switch has been disactivated');
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'loop'}
  LogFrame.Log('starting active agent(s) scheduled in the next 60 minutes ...');
  i := 0;
  AgentActiveClientDataSet.First;
  while not AgentActiveClientDataSet.Eof do begin
    // idx
    Inc(i);

    // agent
    age.FromAgentActiveDs(AgentActiveClientDataSet); // from a restricted agentactive dataset

    // skip <- ispast
    if AgentIsPast(age) then
    //LogFrame.Log('%3d) agent %4d %-32s skipped, already past', [i, age.Id, age.Agent.QuotedString('"')])

    // start <- ontime
    else if AgentIsOnTime(age) then
      AgentRunStart(age, 'AUTO', i)

    // info <- isnext
    else if AgentIsNext(age) then
      LogFrame.Log('%3d) agent %4d %-32s will run at hour:%s min:%s sec:%s', [i, age.Id, age.Agent.QuotedString('"'), age.RunAtHour, age.RunAtMinute, age.RunAtSecond])

    // skip <- isfuture
    else if AgentIsFuture(age) then
    //LogFrame.Log('%3d) agent %4d %-32s skipped, not scheduled in the next 60 minutes', [i, age.Id, age.Agent.QuotedString('"')])
    ;

    // next
    AgentActiveClientDataSet.Next;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

end.
