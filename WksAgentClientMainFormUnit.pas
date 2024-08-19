unit WksAgentClientMainFormUnit;

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
  Vcl.ToolWin, JvNetscapeSplitter, Vcl.AppEvnts, JvComponentBase, JvThreadTimer,
  JvClock, Vcl.Menus;
{$ENDREGION}

{$REGION 'Type'}
type
  TAgentMainForm = class(TBaseMainForm)
    AgentAction: TActionList;
    AgentActiveAction: TAction;
    AgentActiveToolButton: TToolButton;
    AgentClientDataSet: TClientDataSet;
    AgentContinuousOnDBCheckBox: TDBCheckBox;
    AgentDBNavigator: TDBNavigator;
    AgentDataSource: TDataSource;
    AgentDelayMsDBEdit: TDBEdit;
    AgentDelayMsLabel: TLabel;
    AgentHistorySaveDBCheckBox: TDBCheckBox;
    AgentImageList24: TImageList;
    AgentJvScrollMaxBand: TJvScrollMaxBand;
    AgentObjectIdDBEdit: TDBEdit;
    AgentObjectIdLabel: TLabel;
    AgentOnEmptyDBEdit: TDBEdit;
    AgentOnEmptyLabel: TLabel;
    AgentOnFailDBEdit: TDBEdit;
    AgentOnFailLabel: TLabel;
    AgentOnSuccessDBEdit: TDBEdit;
    AgentOnSuccessLabel: TLabel;
    AgentOutputDoDBCheckBox: TDBCheckBox;
    AgentReportDoDBCheckBox: TDBCheckBox;
    AgentRunAction: TAction;
    AgentRunSingleDBCheckBox: TDBCheckBox;
    AgentRunToolButton: TToolButton;
    AgentTabSheet: TTabSheet;
    AgentTestAction: TAction;
    AgentTestToolButton: TToolButton;
    AgentToolBar: TToolBar;
    AgentMonitorPanel: TPanel;
    AgentMonitorRunningLabel: TLabel;
    AgentMonitorRunningCountLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure PostActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure AgentActiveActionExecute(Sender: TObject);
    procedure AgentClientDataSetAfterDelete(DataSet: TDataSet);
    procedure AgentClientDataSetAfterInsert(DataSet: TDataSet);
    procedure AgentClientDataSetAfterPost(DataSet: TDataSet);
    procedure AgentClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure AgentRunActionExecute(Sender: TObject);
    procedure AgentTestActionExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionGridFitActionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure AgentMonitorRunningInc;
    procedure AgentMonitorRunningDec;
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
procedure TAgentMainForm.AgentMonitorRunningInc;
begin
  AgentMonitorRunningCountLabel.Tag := AgentMonitorRunningCountLabel.Tag + 1;
  AgentMonitorRunningCountLabel.Caption := IntToStr(AgentMonitorRunningCountLabel.Tag);
  Application.ProcessMessages;
end;

procedure TAgentMainForm.AgentMonitorRunningDec;
begin
  AgentMonitorRunningCountLabel.Tag := AgentMonitorRunningCountLabel.Tag - 1;
  AgentMonitorRunningCountLabel.Caption := IntToStr(AgentMonitorRunningCountLabel.Tag);
  Application.ProcessMessages;
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TAgentMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
//AgentTestToolButton.Visible := false
  {$ENDREGION}

  {$REGION 'property'}
  // kind
//AgentKindDBComboBox.Items.Add('');
//for str in TAgentRec.AgentKindVector do AgentKindDBComboBox.Items.Add(str);
  {$ENDREGION}

end;

procedure TAgentMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;

  // agentactive
  CanClose := not AgentActiveAction.Checked;
  if not CanClose then begin
    TMesRec.I(     'Unable to close the AGENT application'
    + sLineBreak + 'Agent Active switch is "ON"'
    + sLineBreak + 'Please set it to "OFF" before closing'
    );
    Exit;
  end;

  // agentsrunning
  CanClose := AgentMonitorRunningCountLabel.Tag = 0;
  if not CanClose then begin
    TMesRec.I(            'Unable to close the AGENT application'
    + sLineBreak + Format('%d agents are still running', [AgentMonitorRunningCountLabel.Tag])
    + sLineBreak +        'Wait until all running agents have finished or kill them before exit'
    );
  end;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TAgentMainForm.PostActionExecute(Sender: TObject);
begin
  inherited;

  // ... continue from ancestor
  if AgentClientDataSet.State = dsEdit then
    AgentDBNavigator.BtnClick(nbPost);
end;

procedure TAgentMainForm.ActionGridFitActionExecute(Sender: TObject);
//var
//  str: string;
begin
  inherited;

//  str := TPgcRec.Subject(MainPageControl);
//  if      str = 'Result' then
//    TGriRec.GriFix(AgentResultDBGrid)
//  else if str = 'Active' then
//    TGriRec.GriFix(AgentActiveDBGrid)
//  else if str = 'Running' then
//    TGriRec.GriFix(AgentRunningDBGrid)
//  else if str = 'History' then
//    TGriRec.GriFix(HistoryDBGrid);
end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TAgentMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

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

{$REGION 'AgentActions'}
procedure TAgentMainForm.AgentTestActionExecute(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;

procedure TAgentMainForm.AgentRunActionExecute(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;

procedure TAgentMainForm.AgentActiveActionExecute(Sender: TObject);
begin
  inherited;

  if AgentActiveAction.Checked then begin
    AgentActiveAction.Caption := TStaRec.ACTIVE.Name;
    AgentActiveAction.ImageIndex := 4;
//    TopRightPageControl.ActivePage := TimeTabSheet;
  //AgentActiveLoad;
  //ActiveClientDataSet.DisableControls;

  end else begin
  //AgentJvThreadTimer.Enabled := false;
    AgentActiveAction.Caption := TStaRec.INACTIVE.Name;
    AgentActiveAction.ImageIndex := 3;
//    TopRightPageControl.ActivePage := ObjectTabSheet;
  //AgentActiveUnload;
  //ActiveClientDataSet.EnableControls;
  end;
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
  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
  DataSet.FieldByName('FldReportDo').Value := true;
  DataSet.FieldByName('FldOutputDo').Value := true;
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

end.
