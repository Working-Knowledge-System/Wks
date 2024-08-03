unit WksMemberClientMainFormUnit;

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
  TMemberMainForm = class(TBaseMainForm)
    MemberAction: TActionList;
    MemberAreaDBEdit: TDBEdit;
    MemberAreaLabel: TLabel;
    MemberBadgeDBImage: TDBImage;
    MemberBadgeGenerateLabel: TLabel;
    MemberBadgeJvScrollMaxBand: TJvScrollMaxBand;
    MemberBadgeLabel: TLabel;
    MemberBadgeSaveLabel: TLabel;
    MemberClientDataSet: TClientDataSet;
    MemberDBEdit: TDBEdit;
    MemberDBNavigator2: TDBNavigator;
    MemberDBNavigator3: TDBNavigator;
    MemberDBNavigator: TDBNavigator;
    MemberDataSource: TDataSource;
    MemberEmailDBEdit: TDBEdit;
    MemberEmailGenerateLabel: TLabel;
    MemberEmailLabel: TLabel;
    MemberIdDBEdit: TDBEdit;
    MemberIdLabel: TLabel;
    MemberIdentifierSetLabel: TLabel;
    MemberImageList24: TImageList;
    MemberJobLevelDBEdit: TDBEdit;
    MemberJobLevelLabel: TLabel;
    MemberJobRoleDBEdit: TDBEdit;
    MemberJobRoleLabel: TLabel;
    MemberJobSetLabel: TLabel;
    MemberJobTitleDBEdit: TDBEdit;
    MemberJobTitleLabel: TLabel;
    MemberJvScrollMaxBand: TJvScrollMaxBand;
    MemberLabel: TLabel;
    MemberLocationJvScrollMaxBand: TJvScrollMaxBand;
    MemberObjectIdDBEdit: TDBEdit;
    MemberObjectIdLabel: TLabel;
    MemberOrganizationDBEdit: TDBEdit;
    MemberOrganizationLabel: TLabel;
    MemberPIdDBEdit: TDBEdit;
    MemberPIdLabel: TLabel;
    MemberSiteDBEdit: TDBEdit;
    MemberSiteLabel: TLabel;
    MemberStateDBComboBox: TDBComboBox;
    MemberStateLabel: TLabel;
    MemberWorkstationDBEdit: TDBEdit;
    MemberWorkstationLabel: TLabel;
    MemberTabSheet2: TTabSheet;
    MemberTestAction: TAction;
    MemberToolBar: TToolBar;
    MemberTestToolButton: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure PostActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure MemberBadgeGenerateLabelClick(Sender: TObject);
    procedure MemberBadgeSaveLabelClick(Sender: TObject);
    procedure MemberClientDataSetAfterDelete(DataSet: TDataSet);
    procedure MemberClientDataSetAfterInsert(DataSet: TDataSet);
    procedure MemberClientDataSetAfterPost(DataSet: TDataSet);
    procedure MemberClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure MemberEmailGenerateLabelClick(Sender: TObject);
    procedure MemberIdentifierSetLabelClick(Sender: TObject);
    procedure MemberJobSetLabelClick(Sender: TObject);
    procedure MemberTestActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  MemberMainForm: TMemberMainForm;
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
procedure TMemberMainForm.FormCreate(Sender: TObject);
begin
  inherited;

  {$REGION 'gui'}
//MemberTestToolButton.Visible := false
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TMemberMainForm.PostActionExecute(Sender: TObject);
begin
  inherited;

  // ... continue from ancestor
  if MemberClientDataSet.State = dsEdit then
    MemberDBNavigator.BtnClick(nbPost);
end;
{$ENDREGION}

{$REGION 'Properties'}
procedure TMemberMainForm.MemberIdentifierSetLabelClick(Sender: TObject);
begin
  inherited;

  MemberClientDataSet.Edit;
  MemberIdDBEdit.Text := ObjectDBEdit.Text;
//MemberClientDataSet.Post; // leave the action to the user
end;

procedure TMemberMainForm.MemberEmailGenerateLabelClick(Sender: TObject);
var
  org: TOrgRec;
  pat, eat, fbk: string;  // path, emailat@abc.com
  vec: {$IF COMPILERVERSION < 32.0} TStringDynArray {$ELSE} TArray<string> {$ENDIF};
begin
  inherited;

  pat := TVstRec.NodePath(ObjectDTClientTree, ObjectDTClientTree.FocusedNode);
  vec := SplitString(pat, '/');

  org.InitDba(vec[3], fbk);
  eat := org.Www.Replace('www.', '');

  MemberClientDataSet.Edit;
  MemberEmailDBEdit.Text := Format('%s@%s', [MemberDBEdit.Text, eat]);
//MemberClientDataSet.Post;
end;

procedure TMemberMainForm.MemberJobSetLabelClick(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;

procedure TMemberMainForm.MemberBadgeGenerateLabelClick(Sender: TObject);
var
  bmp: TBitmap;
begin
  inherited;

  // exit
  if MemberOrganizationDBEdit.Text = '' then
    TMesRec.W('Member "Organization" is empty, please define it');
  if MemberSiteDBEdit.Text = '' then
    TMesRec.W('Member "Site" is empty, please define it');
  if MemberDBEdit.Text = '' then
    TMesRec.W('"Member" is empty, please define it');

  // gen
  bmp := TBitmap.Create;
  try
  //bmp.Assign(MemberBadgeDBImage.Picture.Bitmap);
    gmbr.BadgeGenerate(bmp, MemberOrganizationDBEdit.Text, MemberSiteDBEdit.Text, MemberDBEdit.Text);
    MemberClientDataSet.Edit;
    MemberBadgeDBImage.Picture.Assign(bmp);
    MemberClientDataSet.Post;
  finally
    bmp.Free;
  end;
end;

procedure TMemberMainForm.MemberBadgeSaveLabelClick(Sender: TObject);
var
  dir, fil, fbk: string;
begin
  inherited;

  dir := Format('C:\$Mem\%s\%s', [MemberDBEdit.Text[1], MemberDBEdit.Text]);
  if not TFsyRec.DirForce(dir, fbk) then begin
    TMesRec.W('Unable to create output directory %s, badge not saved', [dir]);
    Exit;
  end;

  fil := Format('%s\%s%sBadge.png', [dir, MemberOrganizationDBEdit.Text, MemberDBEdit.Text]);
  MemberBadgeDBImage.Picture.SaveToFile(fil);
  TMesRec.I('Badge saved to %s', [fil]);
end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TMemberMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
  if MemberClientDataSet.Locate('FldObjectId', FId, []) then begin
    MemberClientDataSet.Delete;
    if MemberClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      MemberClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'MemberActions'}
procedure TMemberMainForm.MemberTestActionExecute(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;
{$ENDREGION}

{$REGION 'MemberCds'}
procedure TMemberMainForm.MemberClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if MemberClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    MemberClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', ['Object']);
  end;
  {$ENDREGION}

end;

procedure TMemberMainForm.MemberClientDataSetAfterInsert(DataSet: TDataSet);
//var
//  per: TPerRec;
begin
  inherited;

  {$REGION 'Info'}
//  per.InitRio();
  {$ENDREGION}

  {$REGION 'detail'}
  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
  DataSet.FieldByName('FldId'      ).Value := 1;
  DataSet.FieldByName('FldPId'     ).Value := 0;
//DataSet.FieldByName('FldMember'  ).Value := TNamRec.Username();
//DataSet.FieldByName('FldEmail'   ).Value := 'mariorossi@wks.cloud';
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
  {$ENDREGION}

end;

procedure TMemberMainForm.MemberClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // applyupdatetoremoteserver
  if MemberClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    MemberClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TMemberMainForm.MemberClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

end.
