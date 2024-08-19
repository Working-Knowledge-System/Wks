unit WksAccountClientMainFormUnit;

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
  Vcl.ToolWin, JvNetscapeSplitter, JvComponentBase, JvThreadTimer, Vcl.AppEvnts,
  JvClock, Vcl.Menus;
{$ENDREGION}

{$REGION 'Type'}
type
  TAccountMainForm = class(TBaseMainForm)
    AccountAction: TActionList;
    AccountClientDataSet: TClientDataSet;
    AccountDBNavigator: TDBNavigator;
    AccountDataSource: TDataSource;
    AccountEmailDBEdit: TDBEdit;
    AccountEmailLabel: TLabel;
    AccountHooksJvScrollMaxBand: TJvScrollMaxBand;
    AccountImageList24: TImageList;
    AccountJvScrollMaxBand: TJvScrollMaxBand;
    AccountLoginHookDBEdit: TDBEdit;
    AccountLoginHookLabel: TLabel;
    AccountLogoutHookDBEdit: TDBEdit;
    AccountLogoutHookLabel: TLabel;
    AccountObjectIdDBEdit: TDBEdit;
    AccountObjectIdLabel: TLabel;
    AccountPasswordDBEdit: TDBEdit;
    AccountPasswordLabel: TLabel;
    AccountSecureQuestionDBEdit: TDBEdit;
    AccountSecureQuestionLabel: TLabel;
    AccountSecureResponseDBEdit: TDBEdit;
    AccountSecureResponseLabel: TLabel;
    AccountSecurityJvScrollMaxBand: TJvScrollMaxBand;
    AccountTabSheet: TTabSheet;
    AccountTestAction: TAction;
    AccountTestToolButton: TToolButton;
    AccountToolBar: TToolBar;
    AccountUsernameDBEdit: TDBEdit;
    AccountUsernameLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure PostActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure AccountClientDataSetAfterPost(DataSet: TDataSet);
    procedure AccountClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure AccountClientDataSetAfterInsert(DataSet: TDataSet);
    procedure AccountClientDataSetAfterDelete(DataSet: TDataSet);
    procedure AccountTestActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  AccountMainForm: TAccountMainForm;
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

{$REGION 'Form'}
procedure TAccountMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
//AccountTestToolButton.Visible := false
  {$ENDREGION}

  {$REGION 'property'}
  // accountkind
//AccountKindDBComboBox.Items.Add('');
//for str in TAccountRec.AccountKindVector do AccountKindDBComboBox.Items.Add(str);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TAccountMainForm.PostActionExecute(Sender: TObject);
begin
  inherited;

  // ... continue from ancestor
  if AccountClientDataSet.State = dsEdit then
    AccountDBNavigator.BtnClick(nbPost);
end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TAccountMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
  if AccountClientDataSet.Locate('FldObjectId', FId, []) then begin
    AccountClientDataSet.Delete;
    if AccountClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      AccountClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'AccountActions'}
procedure TAccountMainForm.AccountTestActionExecute(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;
{$ENDREGION}

{$REGION 'AccountCds'}
procedure TAccountMainForm.AccountClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if AccountClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    AccountClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', ['Object']);
  end;
  {$ENDREGION}

end;

procedure TAccountMainForm.AccountClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
  DataSet.FieldByName('FldEmail'   ).Value := TNamRec.RndInt('Account');
  DataSet.FieldByName('FldUsername').Value := TNamRec.RndInt('username');
  DataSet.FieldByName('FldPassword').Value := TNamRec.RndInt('password');
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
  {$ENDREGION}

end;

procedure TAccountMainForm.AccountClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // applyupdatetoremoteserver
  if AccountClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    AccountClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TAccountMainForm.AccountClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

end.
