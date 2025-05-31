unit WksPersonClientMainFormUnit;

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
  TPersonMainForm = class(TBaseMainForm)
    PersonAction: TActionList;
    PersonClientDataSet: TClientDataSet;
    PersonDBEdit: TDBEdit;
    PersonDBNavigator: TDBNavigator;
    PersonDataSource: TDataSource;
    PersonEmailDBEdit: TDBEdit;
    PersonEmailLabel: TLabel;
    PersonEmailValidateLabel: TLabel;
    PersonGdprLabel: TLabel;
    PersonIdentifierGenerateLabel: TLabel;
    PersonImageList24: TImageList;
    PersonJvScrollMaxBand: TJvScrollMaxBand;
    PersonLabel: TLabel;
    PersonNameDBEdit: TDBEdit;
    PersonNameLabel1: TLabel;
    PersonObjectIdDBEdit: TDBEdit;
    PersonObjectIdLabel: TLabel;
    PersonPhoneDBEdit: TDBEdit;
    PersonPhoneLabel: TLabel;
    PersonPhoneValidateLabel: TLabel;
    PersonPictureDBImage: TDBImage;
    PersonPictureLabel: TLabel;
    PersonPictureSaveLabel: TLabel;
    PersonSurnameDBEdit: TDBEdit;
    PersonSurnameLabel1: TLabel;
    UserAvatarDBImage: TDBImage;
    UserAvatarGenerateLabel: TLabel;
    UserAvatarLabel: TLabel;
    UserAvatarSaveLabel: TLabel;
    UserClientDataSet: TClientDataSet;
    UserDBNavigator: TDBNavigator;
    UserDataSource: TDataSource;
    UserJvScrollMaxBand: TJvScrollMaxBand;
    UserPasswordDBEdit: TDBEdit;
    UserPasswordGenerateLabel: TLabel;
    UserPasswordLabel1: TLabel;
    UserPasswordShowLabel: TLabel;
    UserPersonIdLDBEdit: TDBEdit;
    UserPersonIdLabel: TLabel;
    UserStateDBComboBox: TDBComboBox;
    UserStateLabel: TLabel;
    UserUsernameDBEdit: TDBEdit;
    UserUsernameLabel1: TLabel;
    UserUsernameSetLabel: TLabel;
    UserIpLabel: TLabel;
    UserIpDBEdit: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure PersonClientDataSetAfterDelete(DataSet: TDataSet);
    procedure PersonClientDataSetAfterInsert(DataSet: TDataSet);
    procedure PersonClientDataSetAfterPost(DataSet: TDataSet);
    procedure PersonClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure PersonEmailValidateLabelClick(Sender: TObject);
    procedure PersonGdprLabelClick(Sender: TObject);
    procedure PersonIdentifierGenerateLabelClick(Sender: TObject);
    procedure PersonPhoneDBEditChange(Sender: TObject);
    procedure PersonPhoneValidateLabelClick(Sender: TObject);
    procedure PersonPictureSaveLabelClick(Sender: TObject);
    procedure UserAvatarGenerateLabelClick(Sender: TObject);
    procedure UserAvatarSaveLabelClick(Sender: TObject);
    procedure UserClientDataSetAfterDelete(DataSet: TDataSet);
    procedure UserClientDataSetAfterInsert(DataSet: TDataSet);
    procedure UserClientDataSetAfterPost(DataSet: TDataSet);
    procedure UserClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure UserPasswordGenerateLabelClick(Sender: TObject);
    procedure UserPasswordShowLabelClick(Sender: TObject);
    procedure UserUsernameSetLabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  PersonMainForm: TPersonMainForm;
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
procedure TPersonMainForm.FormCreate(Sender: TObject);
begin
  inherited;

  {$REGION 'gui'}
//PersonTestToolButton.Visible := false
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TPersonMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  // detail
  if PersonClientDataSet.State = dsEdit then
    PersonDBNavigator.BtnClick(nbPost);
end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TPersonMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail.person'}
  // ... continue from ancestor DELETING ALL CHILDS
  if PersonClientDataSet.Locate('FldObjectId', FId, []) then begin
    PersonClientDataSet.Delete;
    if PersonClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      PersonClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

  {$REGION 'detail.user'}
  // ... continue from ancestor DELETING ALL CHILDS
  if UserClientDataSet.Locate('FldPersonId', FId, []) then begin
    UserClientDataSet.Delete;
    if UserClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', ['User'])
    else begin
      UserClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', ['User']);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'PersonCds'}
procedure TPersonMainForm.PersonClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail.person'}
  if PersonClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    PersonClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TPersonMainForm.PersonClientDataSetAfterInsert(DataSet: TDataSet);
var
//pic: TPicture;
//bfl: TBlobField;
  nam, sur{, str}: string;
  vec: {$IF COMPILERVERSION < 32.0} TStringDynArray {$ELSE} TArray<string> {$ENDIF};
  i: integer;
begin
  inherited;

  {$REGION 'detail.person'}
  // info
  vec := SplitString(ObjectDBEdit.Text, ' ');
  sur := vec[0];
  nam := '';
  for i := 1 to High(vec) do
    nam := Format('%s ', [vec[i]]);
  nam := nam.Trim;

  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
  DataSet.FieldByName('FldName'    ).Value := nam;
  DataSet.FieldByName('FldSurname' ).Value := sur;
  DataSet.FieldByName('FldPerson'  ).Value := TNamRec.Username(nam, sur);
  DataSet.FieldByName('FldPicture' ).Value := null;
//pic := TPicture.Create;
//pic.LoadFromFile('C:\$Img\P\Person\Person_200x200.png'); // *** AGG CREATE ***
//bfl := TBlobField(DataSet.FieldByName('FldPicture'));
//TGraRec.ToBlobField(pic.Graphic, bfl);
//pic.Free;
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
  {$ENDREGION}

end;

procedure TPersonMainForm.PersonClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail.person'}
  // applyupdatetoremoteserver
  if PersonClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    PersonClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TPersonMainForm.PersonClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail.person'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'UserCds'}
procedure TPersonMainForm.UserClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'user'}
  if UserClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', ['User'])
  else begin
    UserClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', ['User']);
  end;
  {$ENDREGION}

end;

procedure TPersonMainForm.UserClientDataSetAfterInsert(DataSet: TDataSet);
//var
//  ava: TPicture;
//  bfl: TBlobField;
begin
  inherited;

  {$REGION 'detail.user'}
  // set
  DataSet.Edit;
//DataSet.FieldByName('FldPersonId').Value := FId; // dovrebbe esser messo in automatico
  DataSet.FieldByName('FldUsername').Value := PersonDBEdit.Text;
  DataSet.FieldByName('FldPassword').Value := TPwdRec.PwdRnd;
  DataSet.FieldByName('FldState'   ).Value := TStaRec.ACTIVE.Name;
//ava := TPicture.Create;
//ava.LoadFromFile('C:\$Img\U\User\Avatar_200x200.png');
//bfl := TBlobField(DataSet.FieldByName('FldAvatar'));
//TGraRec.ToBlobField(ava.Graphic, bfl);
//ava.Free;
  DataSet.Post;
  LogFrame.Log('%s data initialized', ['User']);
  {$ENDREGION}

end;

procedure TPersonMainForm.UserClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail.user'}
  // applyupdatetoremoteserver
  if UserClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', ['User'])
  else begin
    UserClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', ['User']);
  end;
  {$ENDREGION}

end;

procedure TPersonMainForm.UserClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail.user'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Properties'}
procedure TPersonMainForm.PersonIdentifierGenerateLabelClick(Sender: TObject);
begin
  inherited;

  PersonClientDataSet.Edit;
  PersonDBEdit.Text := TNamRec.Username(PersonNameDBEdit.Text, PersonSurnameDBEdit.Text);
//PersonClientDataSet.Post; // leave the action to the user
end;

procedure TPersonMainForm.PersonPhoneDBEditChange(Sender: TObject);
begin
  inherited;

  PersonPhoneDBEdit.Text := TStrRec.StrKeep(PersonPhoneDBEdit.Text, ['0'..'9', ' ']);
end;

procedure TPersonMainForm.PersonPhoneValidateLabelClick(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;

procedure TPersonMainForm.PersonEmailValidateLabelClick(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;

procedure TPersonMainForm.PersonGdprLabelClick(Sender: TObject);
var
  fil: string;
begin
  inherited;

  if TAskRec.Yes('Would ypu like to generate the "GDPR Data Processing Agreement" document for %s ?', [ObjectDBEdit.Text]) then begin
    fil := gper.FileSpecWithTags(['GdprDataProcessingAgreement'], 'pdf');
    TMesRec.I('GDPR document saved to %s', [fil]);
  end;
end;

procedure TPersonMainForm.PersonPictureSaveLabelClick(Sender: TObject);
var
  nam, sur, dir, fna, ext, fbk: string;
  {boo: boolean;}
begin
  inherited;

  nam := PersonNameDBEdit.Text;
  if nam.IsEmpty then begin
    TMesRec.W('Please insert the Name');
    Exit;
  end;

  sur := PersonSurnameDBEdit.Text;
  if sur.IsEmpty then begin
    TMesRec.W('Please insert the Name');
    Exit;
  end;

  dir := gper.HomePath;
  if not TFsyRec.DirForce(dir, fbk) then begin
    TMesRec.W('Unable to create person''s home directory %s, picture not saved', [dir]);
    Exit;
  end;

  fna := gper.PictureFile;
  ext := '.png';

  {boo :=} TGraRec.PictureDlgSave(PersonPictureDBImage.Picture.Graphic, fna, ext, fbk);
  TMesRec.I('Picture saved to %s', [fna]);
  LogFrame.Log(fbk);
end;

procedure TPersonMainForm.UserUsernameSetLabelClick(Sender: TObject);
begin
  inherited;

  UserClientDataSet.Edit;
  UserUsernameDBEdit.Text := PersonDBEdit.Text;
//UserClientDataSet.Post;
end;

procedure TPersonMainForm.UserPasswordGenerateLabelClick(Sender: TObject);
begin
  inherited;

  UserClientDataSet.Edit;
  UserPasswordDBEdit.Text := TPwdRec.PwdRnd;
//UserClientDataSet.Post;
end;

procedure TPersonMainForm.UserPasswordShowLabelClick(Sender: TObject);
begin
  inherited;

  if UserPasswordDBEdit.PasswordChar = '*' then
    UserPasswordDBEdit.PasswordChar := #0
  else
    UserPasswordDBEdit.PasswordChar := '*';
end;

procedure TPersonMainForm.UserAvatarSaveLabelClick(Sender: TObject);
var
  dir, fna, ext, fbk: string;
  {boo: boolean;}
begin
  inherited;

  dir := gper.HomePath;
  if not TFsyRec.DirForce(dir, fbk) then begin
    TMesRec.W('Unable to create person''s home directory %s, avatar not saved', [dir]);
    Exit;
  end;

  fna := gusr.AvatarFile;
  ext := '.png';

  {boo :=} TGraRec.PictureDlgSave(UserAvatarDBImage.Picture.Graphic, fna, ext, fbk);
  TMesRec.I('Avatar saved to %s', [fna]);
  LogFrame.Log(fbk);
end;

procedure TPersonMainForm.UserAvatarGenerateLabelClick(Sender: TObject);
var
  bmp: TBitmap;
begin
  inherited;

  bmp := TBitmap.Create;
  try
    bmp.Assign(UserAvatarDBImage.Picture.Bitmap);
    gusr.AvatarGenerate(bmp);
    UserClientDataSet.Edit;
    UserAvatarDBImage.Picture.Assign(bmp);
    UserClientDataSet.Post;
  finally
    bmp.Free;
  end;
end;
{$ENDREGION}

end.
