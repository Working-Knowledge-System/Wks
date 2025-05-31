unit WksTaskClientMainFormUnit;

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
  Vcl.ToolWin, JvNetscapeSplitter, JvDBRadioPanel, JvDBDateTimePicker,
  JvComponentBase, JvThreadTimer, Vcl.AppEvnts, JvClock, Vcl.Menus,
  Winapi.WebView2, Winapi.ActiveX, Vcl.Edge, Vcl.WinXCtrls;
{$ENDREGION}

{$REGION 'Type'}
type
  TTaskMainForm = class(TBaseMainForm)
    TaskAction: TActionList;
    TaskClientDataSet: TClientDataSet;
    TaskCostDBEdit: TDBEdit;
    TaskCostLabel: TLabel;
    TaskDBNavigator: TDBNavigator;
    TaskDataSource: TDataSource;
    TaskEtaJvDBDateTimePicker: TJvDBDateTimePicker;
    TaskEtaLabel: TLabel;
    TaskImageList24: TImageList;
    TaskIsMilestoneDBCheckBox: TDBCheckBox;
    TaskJvScrollMaxBand: TJvScrollMaxBand;
    TaskObjectIdDBEdit: TDBEdit;
    TaskObjectIdLabel: TLabel;
    TaskOwnerDBEdit: TDBEdit;
    TaskOwnerLabel: TLabel;
    TaskPeopleJvScrollMaxBand: TJvScrollMaxBand;
    TaskProgressJvDBRadioPanel: TJvDBRadioPanel;
    TaskProgressJvScrollMaxBand: TJvScrollMaxBand;
    TaskProgressLabel: TLabel;
    TaskRequestorDBEdit: TDBEdit;
    TaskRequestorLabel: TLabel;
    TaskResourceJvScrollMaxBand: TJvScrollMaxBand;
    TaskStakeholderCsvDBEdit: TDBEdit;
    TaskStakeholderCsvLabel: TLabel;
    TaskTabSheet: TTabSheet;
    TaskToolBar: TToolBar;
    TaskStartJvDBDateTimePicker: TJvDBDateTimePicker;
    TaskStartLabel: TLabel;
    TaskHourLabel: TLabel;
    TaskHourDBEdit: TDBEdit;
    TaskDatesResetToolButton: TToolButton;
    TaskDatesResetAction: TAction;
    TaskMoveToolButton: TToolButton;
    TaskStartChangeToolButton: TToolButton;
    TaskEtaChangeToolButton: TToolButton;
    TaskMoveEarlierAction: TAction;
    TaskMoveLaterAction: TAction;
    TaskStartEarlierAction: TAction;
    TaskStartLaterAction: TAction;
    TaskEtaEarlierAction: TAction;
    TaskEtaLaterAction: TAction;
    TaskParentsUpdateAction: TAction;
    TaskParentsUpdateToolButton: TToolButton;
    OptionTaskJvScrollMaxBand: TJvScrollMaxBand;
    OptionTaskUpdateUpToLevelLabel: TLabel;
    OptionTaskUpdateUpToLevelComboBox: TComboBox;
    TaskDurationLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure TaskClientDataSetAfterDelete(DataSet: TDataSet);
    procedure TaskClientDataSetAfterInsert(DataSet: TDataSet);
    procedure TaskClientDataSetAfterPost(DataSet: TDataSet);
    procedure TaskClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure TaskStartLabelClick(Sender: TObject);
    procedure TaskEtaLabelClick(Sender: TObject);
    procedure TaskDatesResetActionExecute(Sender: TObject);
    procedure TaskMoveEarlierActionExecute(Sender: TObject);
    procedure TaskMoveLaterActionExecute(Sender: TObject);
    procedure TaskStartEarlierActionExecute(Sender: TObject);
    procedure TaskStartLaterActionExecute(Sender: TObject);
    procedure TaskEtaEarlierActionExecute(Sender: TObject);
    procedure TaskEtaLaterActionExecute(Sender: TObject);
    procedure TaskStartChangeToolButtonMouseLeave(Sender: TObject);
    procedure TaskStartChangeToolButtonMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TaskEtaChangeToolButtonMouseLeave(Sender: TObject);
    procedure TaskEtaChangeToolButtonMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TaskParentsUpdateActionExecute(Sender: TObject);
    procedure TaskMoveToolButtonMouseLeave(Sender: TObject);
    procedure TaskMoveToolButtonMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TaskStartJvDBDateTimePickerChange(Sender: TObject);
    procedure ObjectClientDataSetAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  TaskMainForm: TTaskMainForm;
{$ENDREGION}

implementation

{$REGION 'Uses'}
{$R *.dfm}

uses
    System.StrUtils
  , System.DateUtils
  , System.Types
  , System.Math
  , Vcl.RecError // reconcileerrors
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Form'}
procedure TTaskMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
  {$ENDREGION}

  {$REGION 'property'}
  // kind
//TaskKindDBComboBox.Items.Add('');
//for str in TTaskRec.TaskKindVector do TaskKindDBComboBox.Items.Add(str);

  // task
//  TaskStartJvDBDateTimePicker.DropDownDate := Date();
  //TaskStartJvDBDateTimePicker.NullDate     := 0;
//  TaskEtaJvDBDateTimePicker.DropDownDate   := Date() + 7;
  //TaskEtaJvDBDateTimePicker.NullDate       := 0;
  TaskDurationLabel.Caption := 'Duration : ';
  {$ENDREGION}

  {$REGION 'options'}
  OptionTaskUpdateUpToLevelComboBox.ItemIndex     := gini.IntGet(FObj + '/OptionTaskUpdateUpToLevel' , 1                  );
  {$ENDREGION}

end;

procedure TTaskMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  {$REGION 'options'}
  gini.IntSet(FObj + '/OptionTaskUpdateUpToLevel' , OptionTaskUpdateUpToLevelComboBox.ItemIndex    );
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TTaskMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  // detail
  if TaskClientDataSet.State = dsEdit then
    TaskDBNavigator.BtnClick(nbPost);
end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TTaskMainForm.ObjectClientDataSetAfterScroll(DataSet: TDataSet);
begin
  inherited;

  TaskStartJvDBDateTimePickerChange(nil);
end;

procedure TTaskMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
  if TaskClientDataSet.Locate('FldObjectId', FId, []) then begin
    TaskClientDataSet.Delete;
    if TaskClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      TaskClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'TaskCds'}
procedure TTaskMainForm.TaskClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if TaskClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    TaskClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', ['Object']);
  end;
  {$ENDREGION}

end;

procedure TTaskMainForm.TaskClientDataSetAfterInsert(DataSet: TDataSet);
var
  now, dt1, dt2: TDateTime;
  dof, hof: integer; // daysoffset, hoursoffset
begin
  inherited;

  {$REGION 'detail'}
  // dates
  dof := OptionWorkWeekDayEdit.Tag;                // 4
  hof := OptionWorkWeekTimeEdit.Tag;               // 19                               |-------4-------|
  now := IncHour(Date(), hof);                     //   [D]  L   M   M   G   V   S  [D]  L   M   M   G   V   S  [D]
  dt1 := IncDay(now, 8 - DayOfWeek(now) + dof);    // ---#---|---|---|---|---|---|---#---|---|---|---|---|---|---#---
  dt2 := IncDay(dt1, 7);                           //                      x

  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
  DataSet.FieldByName('FldIsMilestone'   ).Value := false;
  DataSet.FieldByName('FldRequestor'     ).Value := '';
  DataSet.FieldByName('FldStakeholderCsv').Value := '';
  DataSet.FieldByName('FldOwner'         ).Value := gmbr.Member;
  DataSet.FieldByName('FldStart'         ).Value := dt1;
  DataSet.FieldByName('FldEta'           ).Value := dt2;
  DataSet.FieldByName('FldProgress'      ).Value := 0;
  DataSet.FieldByName('FldHour'          ).Value := 0;
  DataSet.FieldByName('FldCost'          ).Value := 0;

  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
  {$ENDREGION}

end;

procedure TTaskMainForm.TaskClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // applyupdatetoremoteserver
  if TaskClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    TaskClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TTaskMainForm.TaskClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'TaskActions'}
procedure TTaskMainForm.TaskDatesResetActionExecute(Sender: TObject);
begin
  inherited;

  if TAskRec.No('Would you like to reset Start & Stop/ETA to today date?') then
    Exit;
  TaskStartJvDBDateTimePicker.DataSource.DataSet.Edit;
  TaskStartJvDBDateTimePicker.Field.Value := Date;
  TaskEtaJvDBDateTimePicker.Field.Value   := Date;
  TaskStartJvDBDateTimePicker.DataSource.DataSet.Post;
end;


procedure TTaskMainForm.TaskMoveEarlierActionExecute(Sender: TObject);
begin
  inherited;

  TaskClientDataSet.Edit;

  if TaskClientDataSet.FieldByName('FldStart').Value = null then TaskClientDataSet.FieldByName('FldStart').AsDateTime := Date;
  if TaskClientDataSet.FieldByName('FldEta').Value   = null then TaskClientDataSet.FieldByName('FldEta'   ).AsDateTime:= Date;

  TaskClientDataSet.FieldByName('FldStart').AsDateTime := IncDay(TaskClientDataSet.FieldByName('FldStart').AsDateTime, -7);
  TaskClientDataSet.FieldByName('FldEta').AsDateTime   := IncDay(TaskClientDataSet.FieldByName('FldEta'  ).AsDateTime, -7);

  TaskClientDataSet.Post;
  LogFrame.Log('Task anticipated %d days earlier', [7]);
end;

procedure TTaskMainForm.TaskMoveLaterActionExecute(Sender: TObject);
begin
  inherited;

  TaskClientDataSet.Edit;

  if TaskClientDataSet.FieldByName('FldStart').Value = null then TaskClientDataSet.FieldByName('FldStart').AsDateTime := Date;
  if TaskClientDataSet.FieldByName('FldEta').Value   = null then TaskClientDataSet.FieldByName('FldEta'   ).AsDateTime:= Date;

  TaskClientDataSet.FieldByName('FldStart').AsDateTime := IncDay(TaskClientDataSet.FieldByName('FldStart').AsDateTime, +7);
  TaskClientDataSet.FieldByName('FldEta').AsDateTime   := IncDay(TaskClientDataSet.FieldByName('FldEta'  ).AsDateTime, +7);

  TaskClientDataSet.Post;
  LogFrame.Log('Task anticipated %d days later', [7]);
end;


procedure TTaskMainForm.TaskStartEarlierActionExecute(Sender: TObject);
begin
  inherited;

  TaskClientDataSet.Edit;

  if TaskClientDataSet.FieldByName('FldStart').Value = null then TaskClientDataSet.FieldByName('FldStart').AsDateTime := Date;

  TaskClientDataSet.FieldByName('FldStart').AsDateTime := IncDay(TaskClientDataSet.FieldByName('FldStart').AsDateTime, -7);

  TaskClientDataSet.Post;
  LogFrame.Log('Task Start date anticipated %d days earlier', [7]);
end;

procedure TTaskMainForm.TaskStartLaterActionExecute(Sender: TObject);
begin
  inherited;

  TaskClientDataSet.Edit;

  if TaskClientDataSet.FieldByName('FldStart').Value = null then TaskClientDataSet.FieldByName('FldStart').AsDateTime := Date;

  TaskClientDataSet.FieldByName('FldStart').AsDateTime := IncDay(TaskClientDataSet.FieldByName('FldStart').AsDateTime, +7);

  TaskClientDataSet.Post;
  LogFrame.Log('Task Start date posticipated %d days later', [7]);
end;


procedure TTaskMainForm.TaskEtaEarlierActionExecute(Sender: TObject);
begin
  inherited;

  TaskClientDataSet.Edit;

  if TaskClientDataSet.FieldByName('FldStop').Value = null then TaskClientDataSet.FieldByName('FldStop').AsDateTime := Date;

  TaskClientDataSet.FieldByName('FldStop').AsDateTime := IncDay(TaskClientDataSet.FieldByName('FldStop').AsDateTime, -7);

  TaskClientDataSet.Post;
  LogFrame.Log('Task Stop/ETA date anticipated %d days later', [7]);
end;

procedure TTaskMainForm.TaskEtaLaterActionExecute(Sender: TObject);
begin
  inherited;

  TaskClientDataSet.Edit;

  if TaskClientDataSet.FieldByName('FldStop').Value = null then TaskClientDataSet.FieldByName('FldStop').AsDateTime := Date;

  TaskClientDataSet.FieldByName('FldStop').AsDateTime := IncDay(TaskClientDataSet.FieldByName('FldStop').AsDateTime, +7);

  TaskClientDataSet.Post;
  LogFrame.Log('Task Stop/ETA date posticipated %d days later', [7]);
end;


procedure TTaskMainForm.TaskMoveToolButtonMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if x < TaskMoveToolButton.Width div 2 then
    TaskMoveToolButton.Action := TaskMoveEarlierAction
  else
    TaskMoveToolButton.Action := TaskMoveLaterAction;
end;

procedure TTaskMainForm.TaskMoveToolButtonMouseLeave(Sender: TObject);
begin
  inherited;

  TaskMoveToolButton.Action := TaskMoveEarlierAction;
end;


procedure TTaskMainForm.TaskStartChangeToolButtonMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if x < TaskStartChangeToolButton.Width div 2 then
    TaskStartChangeToolButton.Action := TaskStartEarlierAction
  else
    TaskStartChangeToolButton.Action := TaskStartLaterAction;
end;

procedure TTaskMainForm.TaskStartChangeToolButtonMouseLeave(Sender: TObject);
begin
  inherited;

  TaskStartChangeToolButton.Action := TaskStartEarlierAction;
end;


procedure TTaskMainForm.TaskEtaChangeToolButtonMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if x < TaskEtaChangeToolButton.Width div 2 then
    TaskEtaChangeToolButton.Action := TaskEtaEarlierAction
  else
    TaskEtaChangeToolButton.Action := TaskEtaLaterAction;
end;

procedure TTaskMainForm.TaskEtaChangeToolButtonMouseLeave(Sender: TObject);
begin
  inherited;

  TaskEtaChangeToolButton.Action := TaskEtaLaterAction;
end;


procedure TTaskMainForm.TaskParentsUpdateActionExecute(Sender: TObject);
var
  nod, par, sib: PVirtualNode;   // currentnode, parentnode, siblingnode
  obj: string;
  sta, eta, dtm, dtx: TDateTime; // start, eta, dtmin, dtmax
  dtv: TArray<double>;           // vectorofdatetime
 {lev,}pro, pra: integer;        // level, progress%, progavg
  hou, hoa, cst, csa: double;    // hours, hoursavg, cost, costavg
  prv, hov, csv: TArray<double>; // vectorsforavgs
  len: integer;                  // vectorlength
begin
  inherited;

  // currentnode
  nod := ObjectDTClientTree.FocusedNode;
  if not Assigned(nod) then begin
    TMesRec.I('Please select a "task node" of your interest in the tasks tree');
    Exit;
  end;

  // parentnode
  par := nod.Parent;
  if not Assigned(par) then begin
    TMesRec.I('This task has not a "parent" task, unable to update it from siblings');
    Exit;
  end;

  // level (exit condition for recursive)
  if FNodeLevel <= StrToInt(OptionTaskUpdateUpToLevelComboBox.Text) then begin
    LogFrame.Log('Parents update stopped at "%s", level %d', [FNodeCaption, FNodeLevel], clWebOrangeRed);
    Exit;
  end;

  // freeze
  //ObjectClientDataSet.DisableControls; // *** nop, doesn't visit nodes ***

  // iteratethroughthesiblings
  sib := par.FirstChild;
//  dtm := Infinity;
//  dtx := NegInfinity;
  while Assigned(sib) do begin
    // we must select each one
    ObjectDTClientTree.Selected[sib] := true;
    // process each sibling node, for example, we can get the text of each sibling node
    //LogFrame.Log(ObjectDTClientTree.Text[sib, 0]);

    // trottle
    Sleep(10);

    // nodedata
    obj := ObjectClientDataSet.FieldByName('FldObject').AsString;
    sta := TaskClientDataSet.FieldByName('FldStart').AsDateTime;
    eta := TaskClientDataSet.FieldByName('FldEta').AsDateTime;
    pro := TaskClientDataSet.FieldByName('FldProgress').AsInteger;
    hou := TaskClientDataSet.FieldByName('FldHour').AsFloat;
    cst := TaskClientDataSet.FieldByName('FldCost').AsFloat;

    // precalcs
    len := Length(prv);

    SetLength(dtv, len*2+2);
    dtv[len*2+0] := sta;
    dtv[len*2+1] := eta;

    SetLength(prv, len+1);
    prv[len] := pro;

    SetLength(hov, len+1);
    hov[len] := hou;

    SetLength(csv, len+1);
    csv[len] := cst;

    LogFrame.Log([obj, DateTimeToStr(sta), DateTimeToStr(eta), pro, hou, cst]);

    // next
    sib := sib.NextSibling;
  end;

  // postcals
  dtm := MinValue(dtv);        if dtm = 0 then dtm := Date();
  dtx := MaxValue(dtv);        if dtx = 0 then dtx := Date();
  pra := Round(Mean(prv));
  hoa := System.Math.Sum(hov);
  csa := System.Math.Sum(csv);

  // paretupdate
  ObjectDTClientTree.Selected[par] := true;
  ObjectDTClientTreeClick(nil); // update level and others
  TaskClientDataSet.Edit;
  TaskClientDataSet.FieldByName('FldStart'   ).Value := dtm;
  TaskClientDataSet.FieldByName('FldEta'     ).Value := dtx;
  TaskClientDataSet.FieldByName('FldProgress').Value := pra;
  TaskClientDataSet.FieldByName('FldHour'    ).Value := hoa;
  TaskClientDataSet.FieldByName('FldCost'    ).Value := csa;
  TaskClientDataSet.Post;
//TaskClientDataSet.ApplyUpdates(0); *** unnecessary ***

  // log
  LogFrame.Log('Updating parent "%s" with %s, %s, %d, %f, %f', [FNodeCaption, DateTimeToStr(dtm), DateTimeToStr(dtx), pra, hoa, csa], clBlue);

  // unfreeze
  //ObjectClientDataSet.EnableControls;

  // recursive
  TaskParentsUpdateActionExecute(Sender);
end;
{$ENDREGION}

{$REGION 'Property'}
procedure TTaskMainForm.TaskStartLabelClick(Sender: TObject);
begin
  inherited;

  if TAskRec.No('Set Start date to NULL ?') then
    Exit;
  TaskStartJvDBDateTimePicker.DataSource.DataSet.Edit;
  TaskStartJvDBDateTimePicker.Field.Value := Null;
  TaskStartJvDBDateTimePicker.DataSource.DataSet.Post;

  TaskStartJvDBDateTimePickerChange(Sender);
end;

procedure TTaskMainForm.TaskEtaLabelClick(Sender: TObject);
begin
  inherited;

  if TAskRec.No('Set ETA date to NULL ?') then
    Exit;
  TaskEtaJvDBDateTimePicker.DataSource.DataSet.Edit;
  TaskEtaJvDBDateTimePicker.Field.Value := Null;
  TaskEtaJvDBDateTimePicker.DataSource.DataSet.Post;

  TaskStartJvDBDateTimePickerChange(Sender);
end;

procedure TTaskMainForm.TaskStartJvDBDateTimePickerChange(Sender: TObject);
var
  sta, eta: variant;
  yea, mon, day, hou: integer;
  col: TColor;
  res: string;
begin
  inherited;

  sta := TaskClientDataSet.FieldByName('FldStart').Value;
  eta := TaskClientDataSet.FieldByName('FldEta').Value;

           if VarIsNull(sta) and VarIsNull(eta) then begin
    col := clWebSalmon;
    res := 'WARNING: Start and ETA are NULL !'
  end else if VarIsNull(sta) then begin
    col := clWebSalmon;
    res := 'WARNING: Start is NULL !'
  end else if VarIsNull(eta) then begin
    col := clWebSalmon;
    res := 'WARNING: ETA is NULL !'

  end else if sta > eta then begin
    col := clRed;
    res := 'WARNING: Start is after ETA !'
  end else if TaskStartJvDBDateTimePicker.Date = TaskEtaJvDBDateTimePicker.Date then begin
    col := clRed;
    res := 'WARNING: Start and ETA are the same !'

  end else begin
    col := clGreen;
    TDatRec.DateDiff(sta, eta, yea, mon, day, hou);
    res := '';
    if yea > 0 then res := Format('%s %d year(s)' , [res, yea]);
    if mon > 0 then res := Format('%s %d month(s)', [res, mon]);
    if day > 0 then res := Format('%s %d day(s)'  , [res, day]);
    if hou > 0 then res := Format('%s %d hour(s)' , [res, hou]);
    res := Format('Duration : %s', [res]);
  end;

  TaskDurationLabel.Font.Color := col;
  TaskDurationLabel.Caption    := res;
end;
{$ENDREGION}

end.
