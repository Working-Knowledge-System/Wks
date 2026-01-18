unit WksAccountClientMainFormUnit;

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
  , Vcl.DBCtrls
  , Vcl.Dialogs
  , Vcl.ExtCtrls
  , Vcl.Forms
  , Vcl.Graphics
  , Vcl.ImgList
  , Vcl.Mask
  , Vcl.Menus
  , Vcl.StdCtrls
  , Vcl.ToolWin
  , Vcl.WinXCtrls
  , Vcl.Edge
  , Data.DB
  , Datasnap.DBClient
  , JvClock
  , JvComponentBase
  , JvDateTimePicker
  , JvDBDateTimePicker
  , JvExComCtrls
  , JvExControls
  , JvExExtCtrls
  , JvExMask
  , JvExtComponent
  , JvNetscapeSplitter
  , JvScrollMax
  , JvSpin
  , JvThreadTimer
  , Soap.SOAPConn
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
    AccountUsernameDBEdit: TDBEdit;
    AccountUsernameLabel: TLabel;
    AccountPasswordGenerateLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure AccountClientDataSetAfterPost(DataSet: TDataSet);
    procedure AccountClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure AccountClientDataSetAfterInsert(DataSet: TDataSet);
    procedure AccountClientDataSetAfterDelete(DataSet: TDataSet);
    procedure AccountEmailLabelClick(Sender: TObject);
    procedure AccountPasswordLabelClick(Sender: TObject);
    procedure AccountUsernameLabelClick(Sender: TObject);
    procedure AccountLoginHookLabelClick(Sender: TObject);
    procedure AccountPasswordGenerateLabelClick(Sender: TObject);
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
  //, WksPasswordGenFormUnit
  ;
{$ENDREGION}

{$REGION 'Form'}
procedure TAccountMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
  {$ENDREGION}

  {$REGION 'property'}
  // accountkind
//AccountKindDBComboBox.Items.Add('');
//for str in TAccountRec.AccountKindVector do AccountKindDBComboBox.Items.Add(str);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TAccountMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  {$REGION 'Object'}
  {$ENDREGION}

  {$REGION 'Detail'}
  if not (AccountClientDataSet.State = dsBrowse) then
    AccountDBNavigator.BtnClick(nbPost);
  {$ENDREGION}

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

{$REGION 'Property'}
procedure TAccountMainForm.AccountEmailLabelClick(Sender: TObject);
begin
  inherited;

  LogFrame.LogOne(TClpRec.ClpCopy(AccountEmailDBEdit.Text));
end;

procedure TAccountMainForm.AccountUsernameLabelClick(Sender: TObject);
begin
  inherited;

  LogFrame.LogOne(TClpRec.ClpCopy(AccountUsernameDBEdit.Text));
end;

procedure TAccountMainForm.AccountPasswordLabelClick(Sender: TObject);
begin
  inherited;

  LogFrame.LogOne(TClpRec.ClpCopy(AccountPasswordDBEdit.Text));
end;

procedure TAccountMainForm.AccountPasswordGenerateLabelClick(Sender: TObject);
var
  pwd: string;
begin
  inherited;

  // generate
//  if not WksPasswordGenFormUnit.TPasswordGenForm.Execute(pwd) then
    Exit;

  // confirm
  if TAskRec.No('Set this password:   %s   ?'
    + sLineBreak + ''
    + sLineBreak + 'WARNING: the current one will be replaced and losted !', [pwd]) then
    Exit;

  // set
  AccountClientDataSet.Edit;
  AccountClientDataSet.FieldByName('FldPassword' ).AsString := pwd;
  AccountClientDataSet.Post;
end;

procedure TAccountMainForm.AccountLoginHookLabelClick(Sender: TObject);
begin
  inherited;

  LogFrame.LogOne(TClpRec.ClpCopy(AccountLoginHookDBEdit.Text));
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
    LogFrame.Log('%s detail data deleted from remote server', [FObj]);
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
//DataSet.FieldByName('FldEmail'   ).Value := TNamRec.RndInt('Account');
  DataSet.FieldByName('FldUsername').Value := TNamRec.RndInt('username');
  DataSet.FieldByName('FldPassword').Value := TNamRec.RndInt('password');
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
  {$ENDREGION}

end;

procedure TAccountMainForm.AccountClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'applyupdatetoremoteserver'}
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

  {$REGION 'reconcileerror'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

end.
