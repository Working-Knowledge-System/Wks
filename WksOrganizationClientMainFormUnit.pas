unit WksOrganizationClientMainFormUnit;

// riporta un Id errato quando viene creata la orga in Member (objecttype errato pure)
// dopo che la si e creata (modificata anche?) in Organization
// inoltre tenta di crearla anche quando gia' esiste! ... dopo anche una semplice modifica

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
  JvClock, Vcl.Menus, Winapi.WebView2, Winapi.ActiveX, Vcl.Edge, Vcl.WinXCtrls;
{$ENDREGION}

{$REGION 'Type'}
type
  TOrganizationMainForm = class(TBaseMainForm)
    OrganizationAboutDBEdit: TDBEdit;
    OrganizationAboutLabel: TLabel;
    OrganizationAction: TActionList;
    OrganizationClientDataSet: TClientDataSet;
    OrganizationDBNavigator2: TDBNavigator;
    OrganizationDBNavigator: TDBNavigator;
    OrganizationDataSource: TDataSource;
    OrganizationEmailDBEdit: TDBEdit;
    OrganizationEmailLabel: TLabel;
    OrganizationImageList24: TImageList;
    OrganizationJvScrollMaxBand: TJvScrollMaxBand;
    OrganizationLogoDBImage: TDBImage;
    OrganizationLogoJvScrollMaxBand: TJvScrollMaxBand;
    OrganizationLogoLabel: TLabel;
    OrganizationLogoLongDBImage: TDBImage;
    OrganizationLogoLongLabel: TLabel;
    OrganizationLogoLongSaveLabel: TLabel;
    OrganizationLogoSaveLabel: TLabel;
    OrganizationObjectIdDBEdit: TDBEdit;
    OrganizationObjectIdLabel: TLabel;
    OrganizationPhoneDBEdit: TDBEdit;
    OrganizationPhoneLabel: TLabel;
    OrganizationSloganDBEdit: TDBEdit;
    OrganizationSloganLabel: TLabel;
    OrganizationWwwDBEdit: TDBEdit;
    OrganizationWwwLabel: TLabel;
    OrganizationLogoLoadLabel: TLabel;
    OrganizationLogoLongLoadLabel: TLabel;
    OrganizationThemeJvScrollMaxBand: TJvScrollMaxBand;
    ThemeObjectIdLabel: TLabel;
    ThemeObjectIdDBEdit: TDBEdit;
    ThemeLabel: TLabel;
    ThemeDBComboBox: TDBComboBox;
    ThemeClientDataSet: TClientDataSet;
    ThemeDataSource: TDataSource;
    ThemeGradeLabel: TLabel;
    ThemeGradeDBComboBox: TDBComboBox;
    ThemeHighlightJsLabel: TLabel;
    ThemeHighlightJsDBComboBox: TDBComboBox;
    ThemeBorderedClassLabel: TLabel;
    ThemeBorderedClassDBComboBox: TDBComboBox;
    ThemePaddingClassLabel: TLabel;
    ThemePaddingClassDBComboBox: TDBComboBox;
    ThemeSizeClassLabel: TLabel;
    ThemeSizeClassDBComboBox: TDBComboBox;
    ThemeFontFamilyLabel: TLabel;
    ThemeFontFamilyDBComboBox: TDBComboBox;
    ThemeColorJvScrollMaxBand: TJvScrollMaxBand;
    ThemeSuccessColorLabel: TLabel;
    ThemeSuccessColorDBEdit: TDBEdit;
    ThemeInfoColorLabel: TLabel;
    ThemeInfoColorDBEdit: TDBEdit;
    ThemeDangerColorLabel: TLabel;
    ThemeDangerColorDBEdit: TDBEdit;
    ThemeWarningColorLabel: TLabel;
    ThemeWarningColorDBEdit: TDBEdit;
    ThemeAccent10ColorLabel: TLabel;
    ThemeAccent10ColorDBEdit: TDBEdit;
    ThemeErrorColorLabel: TLabel;
    ThemeErrorColorDBEdit: TDBEdit;
    ThemePrimary60BgColorLabel: TLabel;
    ThemePrimary60BgColorDBEdit: TDBEdit;
    ThemeSecondary30FgColorLabel: TLabel;
    ThemeSecondary30FgColorDBEdit: TDBEdit;
    ThemeDBNavigator: TDBNavigator;
    ThemeColorResetLabel: TLabel;
    ThemeFontWeightDBComboBox: TDBComboBox;
    ThemeFontWeightLabel: TLabel;
    OrganizationWwwAltLabel: TLabel;
    OrganizationWwwAltDBEdit: TDBEdit;
    ThemeStateLabel: TLabel;
    ThemeStateDBComboBox: TDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure OrganizationClientDataSetAfterDelete(DataSet: TDataSet);
    procedure OrganizationClientDataSetAfterInsert(DataSet: TDataSet);
    procedure OrganizationClientDataSetAfterPost(DataSet: TDataSet);
    procedure OrganizationClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure OrganizationLogoLongSaveLabelClick(Sender: TObject);
    procedure OrganizationLogoSaveLabelClick(Sender: TObject);
    procedure OrganizationLogoLongLoadLabelClick(Sender: TObject);
    procedure OrganizationLogoLoadLabelClick(Sender: TObject);
    procedure ThemePrimary60BgColorLabelClick(Sender: TObject);
    procedure ThemePrimary60BgColorDBEditChange(Sender: TObject);
    procedure ThemeColorResetLabelClick(Sender: TObject);
    procedure ThemeClientDataSetAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  OrganizationMainForm: TOrganizationMainForm;
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
  , WksColorFormUnit
  ;
{$ENDREGION}

{$REGION 'Form'}
procedure TOrganizationMainForm.FormCreate(Sender: TObject);
var
  str: string;
begin
  inherited;

  {$REGION 'gui'}
  ThemeDBComboBox.Items.Add('');
  for str in TW3fRec.THEME_NAME_VEC do ThemeDBComboBox.Items.Add(str);

  ThemeGradeDBComboBox.Items.Add('');
  for str in TTheRec.GRADE_VEC do ThemeGradeDBComboBox.Items.Add(str);

  ThemeFontFamilyDBComboBox.Items.Add('');
  for str in TTheRec.FONT_FAMILY_VEC do ThemeFontFamilyDBComboBox.Items.Add(str);

  ThemeFontWeightDBComboBox.Items.Add('');
  for str in TTheRec.FONT_WEIGHT_VEC do ThemeFontWeightDBComboBox.Items.Add(str);

  ThemeSizeClassDBComboBox.Items.Add('');
  for str in TTheRec.SIZE_CLASS_VEC do ThemeSizeClassDBComboBox.Items.Add(str);

  ThemePaddingClassDBComboBox.Items.Add('');
  for str in TTheRec.PADDING_CLASS_VEC do ThemePaddingClassDBComboBox.Items.Add(str);

  ThemeBorderedClassDBComboBox.Items.Add('');
  for str in TTheRec.BORDERED_CLASS_VEC do ThemeBorderedClassDBComboBox.Items.Add(str);

  ThemeHighlightJsDBComboBox.Items.Add('');
  for str in TTheRec.HIGHLIGHTJS_THEME_VEC do ThemeHighlightJsDBComboBox.Items.Add(str);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TOrganizationMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  // detail
  if OrganizationClientDataSet.State = dsEdit then
    OrganizationDBNavigator.BtnClick(nbPost);
  if ThemeClientDataSet.State = dsEdit then
    ThemeDBNavigator.BtnClick(nbPost);
end;
{$ENDREGION}

{$REGION 'Properties'}

  {$REGION 'OrganizationLogo'}
procedure TOrganizationMainForm.OrganizationLogoLoadLabelClick(Sender: TObject);
var
  fbk: string;
  boo: boolean;
  gra: TGraphic;
begin
  inherited;

//gra := TGraphic.Create; // *** created in PictureDlgLoad ***
  boo := TGraRec.PictureDlgLoad(gra, fbk);
  if OptionVerboseCheckBox.Checked then
    LogFrame.Log(fbk);
  if boo then begin
    try
      OrganizationLogoDBImage.DataSource.DataSet.Edit;
      OrganizationLogoDBImage.Picture.Graphic := gra;
      OrganizationLogoDBImage.DataSource.DataSet.Post;
    finally
      FreeAndNil(gra);
    end;
  end;
end;

procedure TOrganizationMainForm.OrganizationLogoLongLoadLabelClick(Sender: TObject);
var
  fbk: string;
  boo: boolean;
  gra: TGraphic;
begin
  inherited;

//gra := TGraphic.Create; // *** created in PictureDlgLoad ***
  boo := TGraRec.PictureDlgLoad(gra, fbk);
  if OptionVerboseCheckBox.Checked then
    LogFrame.Log(fbk);
  if boo then begin
    try
      OrganizationLogoLongDBImage.DataSource.DataSet.Edit;
      OrganizationLogoLongDBImage.Picture.Graphic := gra;
      OrganizationLogoLongDBImage.DataSource.DataSet.Post;
    finally
      FreeAndNil(gra);
    end;
  end;
end;

procedure TOrganizationMainForm.OrganizationLogoSaveLabelClick(Sender: TObject);
var
  dir, fna, ext, fbk: string;
  {boo: boolean;}
begin
  inherited;

  dir := gorg.HomePath;
  if not TFsyRec.DirForce(dir, fbk) then begin
    TMesRec.W('Unable to create organization'' home directory %s, avatar not saved', [dir]);
    Exit;
  end;

  fna := gorg.LogoFile;
  ext := '.png';

  {boo :=} TGraRec.PictureDlgSave(OrganizationLogoDBImage.Picture.Graphic, fna, ext, fbk);
  TMesRec.I('Logo saved to %s', [fna]);
  LogFrame.Log(fbk);
end;

procedure TOrganizationMainForm.OrganizationLogoLongSaveLabelClick( Sender: TObject);
var
  dir, fna, ext, fbk: string;
  {boo: boolean;}
begin
  inherited;

  dir := gorg.HomePath;
  if not TFsyRec.DirForce(dir, fbk) then begin
    TMesRec.W('Unable to create organization'' home directory %s, avatar not saved', [dir]);
    Exit;
  end;

  fna := gorg.LogoLongFile;
  ext := '.png';

  {boo :=} TGraRec.PictureDlgSave(OrganizationLogoLongDBImage.Picture.Graphic, fna, ext, fbk);
  TMesRec.I('LogoLong saved to %s', [fna]);
  LogFrame.Log(fbk);
end;
  {$ENDREGION}

  {$REGION 'Theme'}
  {$ENDREGION}

  {$REGION 'ThemeColors'}
procedure TOrganizationMainForm.ThemeClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // applyupdatetoremoteserver
  if ThemeClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save Theme deta to remote server')
  else begin
    ThemeClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('Theme data saved to remote server');
  end;
  {$ENDREGION}

end;

procedure TOrganizationMainForm.ThemeColorResetLabelClick(Sender: TObject);
begin
  inherited;

  ThemeClientDataSet.Edit;
  ThemePrimary60BgColorDBEdit.Text   := TTheRec.PRIMARY60BG_COLOR_DEF  ;
  ThemeSecondary30FgColorDBEdit.Text := TTheRec.SECONDARY30FG_COLOR_DEF;
  ThemeAccent10ColorDBEdit.Text      := TTheRec.ACCENT10_COLOR_DEF     ;
  ThemeErrorColorDBEdit.Text         := TTheRec.ERROR_COLOR_DEF        ;
  ThemeDangerColorDBEdit.Text        := TTheRec.DANGER_COLOR_DEF       ;
  ThemeWarningColorDBEdit.Text       := TTheRec.WARNING_COLOR_DEF      ;
  ThemeInfoColorDBEdit.Text          := TTheRec.INFO_COLOR_DEF         ;
  ThemeSuccessColorDBEdit.Text       := TTheRec.SUCCESS_COLOR_DEF      ;
  ThemeClientDataSet.Post;
  LogFrame.Log('Organization theme colors resetted');
end;

procedure TOrganizationMainForm.ThemePrimary60BgColorDBEditChange(Sender: TObject);
var
  col: TColor;
begin
  inherited;

  col := TColRec.FromHexStr((Sender as TDBEdit).Text);
  (Sender as TDBEdit).Color      := col;
  (Sender as TDBEdit).Font.Color := TColRec.TColAntiBw(col);
end;

procedure TOrganizationMainForm.ThemePrimary60BgColorLabelClick(Sender: TObject);
var
  col, fbk: string;
  lab: TLabel;
  edi: TDBEdit;
begin
  inherited;

  // init
  lab := Sender as TLabel;
  if      lab.Tag = 0 then edi := ThemePrimary60BgColorDBEdit
  else if lab.Tag = 1 then edi := ThemeSecondary30FgColorDBEdit
  else if lab.Tag = 2 then edi := ThemeAccent10ColorDBEdit
  else if lab.Tag = 3 then edi := ThemeErrorColorDBEdit
  else if lab.Tag = 4 then edi := ThemeDangerColorDBEdit
  else if lab.Tag = 5 then edi := ThemeWarningColorDBEdit
  else if lab.Tag = 6 then edi := ThemeInfoColorDBEdit
  else{if lab.Tag = 7 then}edi := ThemeSuccessColorDBEdit;

  // color
  col := edi.Text;

  // formandset
  if not TColorForm.Execute(col, fbk) then
    LogFrame.Log(fbk, clWebOrange)
  else begin
    ThemeClientDataSet.Edit;
    edi.Text := col;
    ThemeClientDataSet.Post;
    LogFrame.Log(fbk)
  end;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TOrganizationMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
  if OrganizationClientDataSet.Locate('FldObjectId', FId, []) then begin
    OrganizationClientDataSet.Delete;
    if OrganizationClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      OrganizationClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'OrganizationCds'}
procedure TOrganizationMainForm.OrganizationClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if OrganizationClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    OrganizationClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', ['Object']);
  end;
  {$ENDREGION}

end;

procedure TOrganizationMainForm.OrganizationClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId'    ).Value := FId; // automatic
  DataSet.FieldByName('FldWww'         ).Value := Format('www.%s.cloud' , [LowerCase(ObjectDBEdit.Text)]);
  DataSet.FieldByName('FldEmail'       ).Value := Format('info@%s.cloud', [LowerCase(ObjectDBEdit.Text)]);
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
  {$ENDREGION}

end;

procedure TOrganizationMainForm.OrganizationClientDataSetAfterPost(DataSet: TDataSet);
//var
//  idn: integer;
begin
  inherited;

  {$REGION 'detail'}
  // applyupdatetoremoteserver
  if OrganizationClientDataSet.ApplyUpdates(0) > 0 then begin
    TMesRec.I('Unable to save %s detail to remote server', [FObj]);
    Exit;
  end else begin
    OrganizationClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

  {$REGION 'organization in MEMBER create'}
 {if TAskRec.No('Now it is suggested to create the new organization also in the Member module, Continue?') then begin
    TMesRec.I('Organization not created in Member module.  You will have to create it manually.');
    Exit;
  end;

  if string(ObjectDBEdit.Text).Trim.IsEmpty then begin
    TMesRec.W('Organization not created in Member module.  Organization identifier is empty.  You will have to create it manually.');
    Exit;
  end;

  if TObjRec.NewRio('Member', gorg.TreeDir(ObjectDBEdit.Text), ObjectDBEdit.Text, 'Organization', 'Txt', gmbr.Organization, gmbr.Member, idn) then
    TMesRec.I('Organization "%s" created in Member module with Id = %d.', [ObjectDBEdit.Text, idn])
  else
    TMesRec.W('Problems while creating the new organization in the Member module.  You will have to create it manually.');}
  {$ENDREGION}

end;

procedure TOrganizationMainForm.OrganizationClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

end.
