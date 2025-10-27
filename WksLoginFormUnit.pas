unit WksLoginFormUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.StdCtrls
  , Vcl.ExtCtrls
  , Vcl.ComCtrls
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Type'}
const
  UM_ACTIVATED = WM_USER + 1;

type
  TLoginForm = class(TForm)
    NetAndOsUserInfoLabel: TLabel;
    WksLogoImage: TImage;
    ServerWwwLabel: TLabel;
    LogRichEdit: TRichEdit;
    PageControl: TPageControl;
    LoginTabSheet: TTabSheet;
    EnterShape: TShape;
    LogoImage: TImage;
    SystemLabel: TLabel;
    ClientLabel: TLabel;
    VersionLabel: TLabel;
    EnterLabel: TLabel;
    UsernameShape: TShape;
    PasswordShape: TShape;
    OrganizationShape: TShape;
    OrganizationLabel: TLabel;
    UsernameLabel: TLabel;
    PasswordLabel2: TLabel;
    UsernameEdit: TEdit;
    PasswordEdit: TEdit;
    OrganizationEdit: TEdit;
    AccountTabSheet: TTabSheet;
    AccountNameLabel: TLabel;
    AccountNameShape: TShape;
    AccountSurnameLabel: TLabel;
    AccountSurnameShape: TShape;
    AccountEmailLabel: TLabel;
    AccountEmailShape: TShape;
    AccountMobileLabel: TLabel;
    AccountMobileShape: TShape;
    AccountUsernameLabel: TLabel;
    AccountusernameShape: TShape;
    AccountPasswordLabel: TLabel;
    AccountPasswordShape: TShape;
    AccountNameValidateLabel: TLabel;
    AccountSurnameValidateLabel: TLabel;
    AccountEmailValidateLabel: TLabel;
    AccountMobileValidateLabel: TLabel;
    AccountUsernameValidateLabel: TLabel;
    AccountPasswordValidateLabel: TLabel;
    AccountOrganizationLabel: TLabel;
    AccountOrganizationShape: TShape;
    AccountOrganizationValidateLabel: TLabel;
    AccountTitleLabel: TLabel;
    AccountNameEdit: TEdit;
    AccountSurnameEdit: TEdit;
    AccountEmailEdit: TEdit;
    AccountMobileEdit: TEdit;
    AccountUsernameEdit: TEdit;
    AccountPasswordEdit: TEdit;
    AccountCreateButton: TButton;
    AccountUpdateButton: TButton;
    AccountDeleteButton: TButton;
    AccountOrganizationEdit: TEdit;
    PasswordTabSheet: TTabSheet;
    PasswordOldLabel: TLabel;
    PasswordOldShape: TShape;
    PasswordNewLabel: TLabel;
    PasswordNewShape: TShape;
    PasswordTitleLabel: TLabel;
    PasswordUsernameLabel: TLabel;
    PasswordUsernameShape: TShape;
    PasswordOrganizationLabel: TLabel;
    PasswordOrganizationShape: TShape;
    PasswordOldEdit: TEdit;
    PasswordNewEdit: TEdit;
    PasswordChangeButton: TButton;
    PasswordRecoverButton: TButton;
    PasswordResetButton: TButton;
    PasswordUsernameEdit: TEdit;
    PasswordOrganizationEdit: TEdit;
    ServerTabSheet: TTabSheet;
    ServerWwwProdShape: TShape;
    ServerWwwTestShape: TShape;
    ServerWwwDevShape: TShape;
    ServerTitleLabel: TLabel;
    ProtocolLabel: TLabel;
    ServerProtocolComboBox: TComboBox;
    ServerWwwProdEdit: TEdit;
    ServerWwwTestEdit: TEdit;
    ServerWwwDevEdit: TEdit;
    ServerProdRadioButton: TRadioButton;
    ServerTestRadioButton: TRadioButton;
    ServerDevRadioButton: TRadioButton;
    ProxyTabSheet: TTabSheet;
    ProxyAddressLabel: TLabel;
    ProxyAddressShape: TShape;
    ProxyUsernameLabel: TLabel;
    ProxyUsernameShape: TShape;
    ProxyPasswordLabel: TLabel;
    ProxyPasswordShape: TShape;
    ProxyPortLabel: TLabel;
    ProxyPortShape: TShape;
    ProxyTitleLabel: TLabel;
    ProxyAddressEdit: TEdit;
    ProxyUsernameEdit: TEdit;
    ProxyPasswordEdit: TEdit;
    ProxyUseCheckBox: TCheckBox;
    ProxyPortEdit: TEdit;
    PrivacyTabSheet: TTabSheet;
    PrivacyTitleLabel: TLabel;
    PrivacyRichEdit: TRichEdit;
    SessionTabSheet: TTabSheet;
    SessionTitleLabel: TLabel;
    SessionLogRichEdit: TRichEdit;
    LicenseTabSheet: TTabSheet;
    LicenseTitleLabel: TLabel;
    LicenseRichEdit: TRichEdit;
    HelpTabSheet: TTabSheet;
    HelpTitleLabel: TLabel;
    HelpRichEdit: TRichEdit;
    AccountLabel: TLabel;
    PasswordLabel: TLabel;
    HelpLabel: TLabel;
    ServerLabel: TLabel;
    LoginLabel: TLabel;
    ProxyLabel: TLabel;
    LicenseLabel: TLabel;
    ExitLabel: TLabel;
    PrivacyLabel: TLabel;
    SessionLabel: TLabel;
    LoginAutoOptionCheckBox: TCheckBox;
    AvatarImage: TImage;
    BadgeImage: TImage;
    PictureImage: TImage;
    LogoTitleLabel: TLabel;
    AvatarTitleLabel: TLabel;
    PictureTitleLabel: TLabel;
    BadgeTitleLabel: TLabel;
    LogoFooterLabel: TLabel;
    AvatarFooterLabel: TLabel;
    PictureFooterLabel: TLabel;
    BadgeFooterLabel: TLabel;
    TopPanel: TPanel;
    ProxyGetViaRegistryButton: TButton;
    ProxyGetViaWininetButton: TButton;
    ServerPingButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure EnterLabelClick(Sender: TObject);
    procedure LoginLabelClick(Sender: TObject);
    procedure ServerLabelClick(Sender: TObject);
    procedure ProxyLabelClick(Sender: TObject);
    procedure AccountLabelClick(Sender: TObject);
    procedure PasswordLabelClick(Sender: TObject);
    procedure SessionLabelClick(Sender: TObject);
    procedure PrivacyLabelClick(Sender: TObject);
    procedure LicenseLabelClick(Sender: TObject);
    procedure HelpLabelClick(Sender: TObject);
    procedure ExitLabelClick(Sender: TObject);
    procedure OrganizationEditKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordLabel2Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LogoImageClick(Sender: TObject);
    procedure ServerWwwProdEditChange(Sender: TObject);
    procedure ServerWwwTestEditChange(Sender: TObject);
    procedure ServerWwwDevEditChange(Sender: TObject);
    procedure ServerProtocolComboBoxChange(Sender: TObject);
    procedure ServerProdRadioButtonClick(Sender: TObject);
    procedure ServerTestRadioButtonClick(Sender: TObject);
    procedure ServerDevRadioButtonClick(Sender: TObject);
    procedure ProxyUseCheckBoxClick(Sender: TObject);
    procedure ProxyAddressEditChange(Sender: TObject);
    procedure ProxyPortEditChange(Sender: TObject);
    procedure ProxyUsernameEditChange(Sender: TObject);
    procedure ProxyPasswordEditChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure LoginAutoOptionCheckBoxClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UsernameEditChange(Sender: TObject);
    procedure OrganizationEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UsernameEditKeyPress(Sender: TObject; var Key: Char);
    procedure UsernameEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PasswordEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LoginTabSheetShow(Sender: TObject);
    procedure WksLogoImageClick(Sender: TObject);
    procedure LicenseTabSheetShow(Sender: TObject);
    procedure PrivacyTabSheetShow(Sender: TObject);
    procedure ExitLabelMouseEnter(Sender: TObject);
    procedure ExitLabelMouseLeave(Sender: TObject);
    procedure ProxyGetViaRegistryButtonClick(Sender: TObject);
    procedure ProxyGetViaWininetButtonClick(Sender: TObject);
    procedure ServerPingButtonClick(Sender: TObject);
  private
    { Private declarations }
    FLoginAttempts: integer;
    procedure FormActivated(var Message: TMessage); message UM_ACTIVATED; // https://stackoverflow.com/questions/6036375/exiting-a-form-using-modalresult
    procedure LogClear;
    procedure Log(IvString: string; IvFbkMode: TFbkModeEnum = fmInfo; IvSleepMs: integer = LOG_PAUSE_MS); overload;
    procedure Log(IvFormat: string; const IvArgs: array of const; IvFbkMode: TFbkModeEnum = fmInfo; IvSleepMs: integer = LOG_PAUSE_MS); overload;
    procedure Log(IvString: string; IvSuccess: boolean); overload;
  //procedure Log(IvFormat: string; const IvArgs: array of const; IvSuccess: boolean); overload;
    procedure ImageRoundDo(IvImage: TImage);
    procedure OrganizationApply;
    procedure ThemeApply;
    procedure MemberApply;
    procedure UserApply;
    procedure PersonApply;
    procedure MenuUpdate(IvLabel: TLabel);
    procedure ControlsShow(IvShow: boolean);
    procedure ControlsUpdate;
  public
    { Public declarations }
    class function  Execute(var IvFbk: string): boolean;
  end;
{$ENDREGION}

{$REGION 'Var'}
//var
  //LoginForm: TLoginForm; // force to manually create, use and dispose
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    Img32
  , Img32.Extra
  , Img32.Fmt.PNG
  , Img32.vector
  , Img32.Draw
  ;
{$ENDREGION}

{$REGION 'Routine'}
class function TLoginForm.Execute(var IvFbk: string): boolean;
var
  frm: TLoginForm;
begin
  frm := TLoginForm.Create(nil);
  try
    Result := frm.ShowModal = mrOk;
    if Result then
      IvFbk := 'Logged in successful'
    else
      IvFbk := 'Unable to login, exit';
  finally
  //FreeAndNil(frm);
    frm.Release;
  end;
end;

procedure TLoginForm.LogClear;
begin
  LogRichEdit.Clear;
end;

procedure TLoginForm.Log(IvString: string; IvFbkMode: TFbkModeEnum; IvSleepMs: integer);
begin
  case IvFbkMode of
    fmInfo    : LogRichEdit.Font.Color := TColRec.TColFromHtmlHexStr(gthe.InfoColor   );
    fmSuccess : LogRichEdit.Font.Color := TColRec.TColFromHtmlHexStr(gthe.SuccessColor);
    fmWarning : LogRichEdit.Font.Color := TColRec.TColFromHtmlHexStr(gthe.WarningColor);
    fmDanger  : LogRichEdit.Font.Color := TColRec.TColFromHtmlHexStr(gthe.DangerColor );
    fmError   : LogRichEdit.Font.Color := TColRec.TColFromHtmlHexStr(gthe.ErrorColor  );
  end;
  LogRichEdit.Text := IvString;
  LogRichEdit.Refresh;
  Sleep(IvSleepMs);
end;

procedure TLoginForm.Log(IvFormat: string; const IvArgs: array of const; IvFbkMode: TFbkModeEnum; IvSleepMs: integer);
begin
  Log(Format(IvFormat, IvArgs), IvFbkMode, IvSleepMs);
end;

procedure TLoginForm.Log(IvString: string; IvSuccess: boolean);
begin
  if IvSuccess then
    Log(IvString, fmSuccess)
  else
    Log(IvString, fmDanger);
end;

//procedure TLoginForm.Log(IvFormat: string; const IvArgs: array of const; IvSuccess: boolean);
//begin
//  Log(Format(IvFormat, IvArgs), IvSuccess);
//end;

procedure TLoginForm.ImageRoundDo(IvImage: TImage); // *** MOVE TO Wks000Unit ***
var
  img: TImage32;
  pic: TPicture;
  mes: TStream;
  pat: TPathD;
begin
  img := TImage32.Create(IvImage.Width, IvImage.Height);
  try
    // imgload
    mes := TMemoryStream.Create;
    try
      {$IF COMPILERVERSION < 32.0}
      TPicRec.PicToStream(IvImage.Picture, mes);
      {$ELSE}
      IvImage.Picture.SaveToStream(mes);
      {$ENDIF}
      mes.Position := 0;
      img.LoadFromStream(mes);
    finally
      mes.Free;
    end;

    // imgdraw
    pat := Circle(Point(50, 50), 51+50);
    DrawEdge(img, pat, clWhite32, clWhite32, 100, true);
    pat := Circle(Point(50, 50), 50);
    DrawLine(img, pat, 1, clSilver32, esClosed);

    // ivimageprepareforrewrite
    IvImage.Picture.Bitmap.SetSize(img.Width, img.Height);
    IvImage.Picture.Bitmap.Canvas.Brush.Color := clBtnFace; // if img is semi-transparent, prepare the target background
    IvImage.Picture.Bitmap.Canvas.FillRect(IvImage.ClientRect);

    // ivimagerewrite
    mes := TMemoryStream.Create;
    pic := TPicture.Create;
    try
      img.SaveToStream(mes, 'png');
      mes.Position := 0;
      {$IF COMPILERVERSION < 32.0}
      TPicRec.PicFromStream(pic, mes);
      IvImage.Picture.Assign(pic);
      {$ELSE}
      IvImage.Picture.LoadFromStream(mes);
      {$ENDIF}
    finally
      pic.Free;
      mes.Free;
    end;
  finally
    img.Free;
  end;
end;

procedure TLoginForm.ThemeApply;
begin
  // form
  Color                                := TColRec.TColFromHtmlHexStr(gthe.Primary60BgColor  );
  Font.Color                           := TColRec.TColFromHtmlHexStr(gthe.Secondary30FgColor);

  // menu
  LoginLabel.Font.Color                := Font.Color;
  ServerLabel.Font.Color               := Font.Color;
  ProxyLabel.Font.Color                := Font.Color;
  AccountLabel.Font.Color              := Font.Color;
  PasswordLabel.Font.Color             := Font.Color;
  SessionLabel.Font.Color              := Font.Color;
  PrivacyLabel.Font.Color              := Font.Color;
  LicenseLabel.Font.Color              := Font.Color;
  HelpLabel.Font.Color                 := Font.Color;
  ExitLabel.Font.Color                 := Font.Color;

  // images
  LogoTitleLabel.Font.Color            := Font.Color;
  LogoFooterLabel.Font.Color           := Font.Color;
  AvatarTitleLabel.Font.Color          := Font.Color;
  AvatarFooterLabel.Font.Color         := Font.Color;
  BadgeTitleLabel.Font.Color           := Font.Color;
  BadgeFooterLabel.Font.Color          := Font.Color;
  PictureTitleLabel.Font.Color         := Font.Color;
  PictureFooterLabel.Font.Color        := Font.Color;

  // system
  SystemLabel.Font.Color               := Font.Color;

  // client
  ClientLabel.Font.Color               := TColRec.TColFromHtmlHexStr(gthe.Accent10Color);
  VersionLabel.Font.Color              := ClientLabel.Font.Color;

  // organization
  OrganizationLabel.Font.Color         := Font.Color;
  OrganizationEdit.Color               := Color;
  OrganizationEdit.Font.Color          := Font.Color;
  OrganizationShape.Pen.Color          := Font.Color;

  // username
  UsernameLabel.Font.Color             := Font.Color;
  UsernameEdit.Color                   := Color;
  UsernameEdit.Font.Color              := Font.Color;
  UsernameShape.Pen.Color              := Font.Color;

  // password
  PasswordLabel2.Font.Color            := Font.Color;
  PasswordEdit.Color                   := Color;
  PasswordEdit.Font.Color              := Font.Color;
  PasswordShape.Pen.Color              := Font.Color;

  // enter
  EnterLabel.Font.Color                := Font.Color;
  EnterShape.Pen.Color                 := Font.Color;

  // info
  ServerWwwLabel.Font.Color            := Font.Color;
  NetAndOsUserInfoLabel.Font.Color     := Font.Color;
  LogRichEdit.Color                    := Color;
  LogRichEdit.Font.Color               := Font.Color;

  // servertab
  ServerTitleLabel.Font.Color          := Font.Color;
  ServerProdRadioButton.Font.Color     := Font.Color; ServerWwwProdEdit.Color      := Color; ServerWwwProdShape.Pen.Color      := Font.Color;
  ServerTestRadioButton.Font.Color     := Font.Color; ServerWwwTestEdit.Color      := Color; ServerWwwTestShape.Pen.Color      := Font.Color;
  ServerDevRadioButton.Font.Color      := Font.Color; ServerWwwDevEdit.Color       := Color; ServerWwwDevShape.Pen.Color       := Font.Color;
  ProtocolLabel.Font.Color             := Font.Color; ServerProtocolComboBox.Color := Color; ServerProtocolComboBox.Font.Color := Font.Color;

  // proxytab
  ProxyTitleLabel.Font.Color           := Font.Color;

//Application.ProcessMessages;
end;

procedure TLoginForm.OrganizationApply;
begin
  if Assigned(gorg.LogoGraphic) then begin
    LogoImage.Hint := gorg.Www;
    TPicRec.PicFromGraphic(LogoImage.Picture, gorg.LogoGraphic, 100);
    LogoTitleLabel.Visible := true;
    LogoFooterLabel.Visible := true;
    LogoFooterLabel.Caption := gorg.Obj.&Object;
  //ImageRoundDo(LogoImage);
  end;
  Application.ProcessMessages;
end;

procedure TLoginForm.MemberApply;
begin
  if Assigned(gmbr.BadgeGraphic) then begin
    BadgeImage.Hint := gmbr.Info;
    TPicRec.PicFromGraphic(BadgeImage.Picture, gmbr.BadgeGraphic, 100);
    BadgeTitleLabel.Visible := true;
    BadgeFooterLabel.Visible := true;
    BadgeFooterLabel.Caption := gmbr.Info;
  //ImageRoundDo(BadgeImage);
  end;
  Application.ProcessMessages;
end;

procedure TLoginForm.UserApply;
begin
  if Assigned(gusr.AvatarGraphic) then begin
    AvatarImage.Hint := gusr.Info;
    TPicRec.PicFromGraphic(AvatarImage.Picture, gusr.AvatarGraphic, 100);
    AvatarTitleLabel.Visible := true;
    AvatarFooterLabel.Visible := true;
    AvatarFooterLabel.Caption := gusr.Username;
    ImageRoundDo(AvatarImage);
  end;
  Application.ProcessMessages;
end;

procedure TLoginForm.PersonApply;
begin
  if Assigned(gper.PictureGraphic) then begin
    PictureImage.Hint := gper.Info;
    TPicRec.PicFromGraphic(PictureImage.Picture, gper.PictureGraphic, 100);
    PictureTitleLabel.Visible := true;
    PictureFooterLabel.Caption := gper.Info;
    PictureFooterLabel.Visible := true;
    ImageRoundDo(PictureImage);
  end;
  Application.ProcessMessages;
end;

procedure TLoginForm.MenuUpdate(IvLabel: TLabel);
const
  VEC: TArray<string> = ['Login', 'Server', 'Proxy', 'Account', 'Password', 'Session', 'License', 'Privacy', 'Help'];
var
  i: integer;
  lab: TLabel;
begin
  // reset
  for i := Low(VEC) to High(VEC) do  begin
    lab := FindComponent(VEC[i] + 'Label') as TLabel;
    lab.Font.Color := TColRec.TColFromHtmlHexStr(gthe.Secondary30FgColor);
    lab.Font.Style := [];
  end;
  // selected
  IvLabel.Font.Color  := TColRec.TColFromHtmlHexStr(gthe.Accent10Color);
  IvLabel.Font.Style  := [fsBold];
end;

procedure TLoginForm.ControlsShow(IvShow: boolean);
begin
  // menu
  LoginLabel.Visible              := IvShow;
  ServerLabel.Visible             := IvShow;
  ProxyLabel.Visible              := IvShow;
  LicenseLabel.Visible            := IvShow;
  PrivacyLabel.Visible            := IvShow;
  //AccountLabel.Visible            := IvShow;
  //PasswordLabel.Visible           := IvShow;
  //SessionLabel.Visible            := IvShow;
  //HelpLabel.Visible               := IvShow;
//ExitLabel.Visible               := IvShow;

  // controls
  OrganizationLabel.Visible       := IvShow;
  OrganizationShape.Visible       := IvShow;
  OrganizationEdit.Visible        := IvShow;
  UsernameLabel.Visible           := IvShow;
  UsernameShape.Visible           := IvShow;
  UsernameEdit.Visible            := IvShow;
  PasswordLabel2.Visible          := IvShow;
  PasswordShape.Visible           := IvShow;
  PasswordEdit.Visible            := IvShow;
  EnterLabel.Visible              := IvShow;
  EnterShape.Visible              := IvShow;
  LoginAutoOptionCheckBox.Visible := IvShow;

  // info
//ServerWwwLabel.Visible          := IvShow;
//OsUserInfoLabel.Visible         := IvShow;

  // force
  Application.ProcessMessages;
end;

procedure TLoginForm.ControlsUpdate;
begin
  // appserver
  ServerWwwLabel.Caption := Format('Connecting to %s %s', [gaps.Info, giif.Str(ProxyUseCheckBox.Checked, 'throug proxy', 'without proxy')]);
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TLoginForm.FormCreate(Sender: TObject);
var
  env, pro: string; // environment, protocol
begin
  // identity
  Caption              := Format('%s Login', [TSysRec.ACRONYM]);
  SystemLabel.Caption  := TSysRec.NAME;
  ClientLabel.Caption  := TBynRec.Name;
  VersionLabel.Caption := TBynRec.Ver;

  // menu
  AccountLabel.Visible  := false;
  PasswordLabel.Visible := false;
  SessionLabel.Visible  := false;
  HelpLabel.Visible     := false;

  // pagecontrol
  TPgcRec.PagesShow(PageControl, false, LoginTabSheet);

  // theme
  gthe.Reset; // initially there is no organization set so reset to wks default theme
  ThemeApply;

  // init
  FLoginAttempts := 0;
  LoginLabelClick(nil); // 1sttablallways

  // logintab
  OrganizationEdit.Text      := gini.StrGet('Login/Organization', ''                   ); // Wks
  UsernameEdit.Text          := gini.StrGet('Login/Username'    , ''                   ); // puppadrillo
  PasswordEdit.Text          := gini.CryGet('Login/Password'    , ''                   ); // secret

  // servertab
  ServerWwwDevEdit.Text      := gini.StrGet('Server/WwwDev'     , 'localhost'          );
  ServerWwwTestEdit.Text     := gini.StrGet('Server/WwwTest'    , TSysRec.WWW + ':8080');
  ServerWwwProdEdit.Text     := gini.StrGet('Server/WwwProd'    , TSysRec.WWW    , true);
  env                        := gini.StrGet('Server/Environment', 'Prod'         , true);
  pro                        := gini.StrGet('Server/Protocol'   , 'http'         , true);
  ServerProtocolComboBox.ItemIndex := ServerProtocolComboBox.items.IndexOf(pro); ServerProtocolComboBoxChange(nil);
  if      SameText(env, 'Prod') then ServerProdRadioButton.Checked := true
  else if SameText(env, 'Test') then ServerTestRadioButton.Checked := true
  else                               ServerDevRadioButton.Checked  := true;
  ServerWwwLabel.Caption     := gaps.Info;

  // proxy
  ProxyUseCheckBox.Checked   := gini.BooGet('Proxy/Use'         , false                );
  ProxyAddressEdit.Text      := gini.StrGet('Proxy/Address'     , ''                   );
  ProxyPortEdit.Text         := gini.StrGet('Proxy/Port'        , ''                   );
  ProxyUsernameEdit.Text     := gini.StrGet('Proxy/Username'    , ''                   );
  ProxyPasswordEdit.Text     := gini.CryGet('Proxy/Password'    , ''                   );
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
  // focus
  try
    if PasswordEdit.Text     = '' then ActiveControl := PasswordEdit;
    if UsernameEdit.Text     = '' then ActiveControl := UsernameEdit;
    if OrganizationEdit.Text = '' then ActiveControl := OrganizationEdit;
  except
    ;
  end;
end;

procedure TLoginForm.FormActivate(Sender: TObject);
begin
  PostMessage(Handle, UM_ACTIVATED, 0, 0); // this will call TLoginForm.FormActivated
end;

procedure TLoginForm.FormActivated(var Message: TMessage);
var
//  fbk: string;
  i: integer;
begin
  // ctrls
  ControlsUpdate;

  // internetready
//if true then
    NetAndOsUserInfoLabel.Caption := 'Internet availability check has been skipped'
 {else
    if not TNetRec.InternetIsAvailable(fbk) then begin
      // info
    //TMesRec.I(fbk);
      NetAndOsUserInfoLabel.Caption := fbk;
      Application.ProcessMessages;
      Sleep(TSysRec.LONG_PAUSE_MS);
      // exit
    //ExitLabelClick(nil);
      TMesRec.W(fbk);
    end else begin
      NetAndOsUserInfoLabel.Caption := Format('%s for %s', [fbk, TNetRec.Info]);
      Application.ProcessMessages;
    end};

  // autologin
  LoginAutoOptionCheckBox.Checked := gini.BooGet(TBynRec.Obj + '/AutoLoginOption', false);
  if LoginAutoOptionCheckBox.Checked then begin
    // to allow the user to unckeck the autologin checkbox!
    i := 0;
    repeat
      Application.ProcessMessages;
      Sleep(10);
      Inc(i, 10);
    until i = 1000;
    // enter
    EnterLabelClick(nil);
  end;
end;

procedure TLoginForm.FormPaint(Sender: TObject);
begin
  TCnvRec.CnvRectangle(Canvas, 0, 0, Width, Height, TColRec.TColFromHtmlHexStr(gthe.Primary60BgColor), TColRec.TColFromHtmlHexStr(gthe.Secondary30FgColor), psSolid, 1);
end;

procedure TLoginForm.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbLeft then begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TLoginForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  env: string;
begin
  // logintab
  gini.StrSet('Login/Organization'  , OrganizationEdit.Text      );
  gini.StrSet('Login/Username'      , UsernameEdit.Text          );
  gini.CrySet('Login/Password'      , PasswordEdit.Text          );

  // servertab
       if ServerProdRadioButton.Checked then env := 'Prod'
  else if ServerTestRadioButton.Checked then env := 'Test'
  else                                       env := 'Dev';
  gini.StrSet('Server/WwwDev'       , ServerWwwDevEdit.Text      );
  gini.StrSet('Server/WwwTest'      , ServerWwwTestEdit.Text     );
  gini.StrSet('Server/WwwProd'      , ServerWwwProdEdit.Text     );        // D1F5B83E3D5A67
  gini.StrSet('Server/Environment'  , env                        );
  gini.StrSet('Server/Protocol'     , ServerProtocolComboBox.Text);

  // proxytab
  gini.BooSet('Proxy/Use'           , ProxyUseCheckBox.Checked   );
  gini.StrSet('Proxy/Address'       , ProxyAddressEdit.Text      );
  gini.StrSet('Proxy/Port'          , ProxyPortEdit.Text         );
  gini.StrSet('Proxy/Username'      , ProxyUsernameEdit.Text     );
  gini.CrySet('Proxy/Password'      , ProxyPasswordEdit.Text     );

  // form
  Action := caFree; // free
end;
{$ENDREGION}

{$REGION 'Menu'}
procedure TLoginForm.LoginLabelClick(Sender: TObject);
begin
  PageControl.ActivePage := LoginTabSheet;
  MenuUpdate(LoginLabel);
  Log('Enter your organization, username and password than click Enter');
end;

procedure TLoginForm.ServerLabelClick(Sender: TObject);
begin
  PageControl.ActivePage := ServerTabSheet;
  MenuUpdate(ServerLabel);
  Log('Enter in this form the remote application server setting');
end;

procedure TLoginForm.ProxyLabelClick(Sender: TObject);
begin
  PageControl.ActivePage := ProxyTabSheet;
  MenuUpdate(ProxyLabel);
  Log('Enter in this form your proxy setting');
end;

procedure TLoginForm.AccountLabelClick(Sender: TObject);
begin
  PageControl.ActivePage := AccountTabSheet;
  MenuUpdate(AccountLabel);
  Log('Create, update or delete here your account');
end;

procedure TLoginForm.PasswordLabelClick(Sender: TObject);
begin
  PageControl.ActivePage := PasswordTabSheet;
  MenuUpdate(PasswordLabel);
  Log('Change, reset or recover your password');
end;

procedure TLoginForm.SessionLabelClick(Sender: TObject);
begin
  PageControl.ActivePage := SessionTabSheet;
  MenuUpdate(SessionLabel);
  Log('See here your current and past sessions');
end;

procedure TLoginForm.PrivacyLabelClick(Sender: TObject);
begin
  PageControl.ActivePage := PrivacyTabSheet;
  MenuUpdate(PrivacyLabel);
  Log('See here the privacy statement');
end;


procedure TLoginForm.LicenseLabelClick(Sender: TObject);
begin
  PageControl.ActivePage := LicenseTabSheet;
  MenuUpdate(LicenseLabel);
  Log('See here the license statement');
end;

procedure TLoginForm.HelpLabelClick(Sender: TObject);
begin
  PageControl.ActivePage := HelpTabSheet;
  MenuUpdate(HelpLabel);
  Log('See here a brief help about this software');
end;
{$ENDREGION}

{$REGION 'Logo'}
procedure TLoginForm.LogoImageClick(Sender: TObject);
begin
  if not gorg.Www.IsEmpty then
    TUrlRec.Go(gorg.Www);
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TLoginForm.ExitLabelClick(Sender: TObject);
begin
  ModalResult := mrAbort; // ---> [ close form and Exit ]
end;

procedure TLoginForm.EnterLabelClick(Sender: TObject);
var
//boo: boolean;
  fbk: string;
begin
  // log
  Log(Format('Request login at %s', [gaps.Www]));

  {$REGION 'attempts'}
  if FLoginAttempts >= 3 then begin
    Log('Maximum of %d login attempts exceeded... EXIT', [FLoginAttempts], fmDanger);
    Sleep(LONG_PAUSE_MS);
    ModalResult := mrAbort; // ---> [ close form and Exit ]
    Exit;
  end else
    Inc(FLoginAttempts);

  // dblclickavoid
  ControlsShow(false);
  {$ENDREGION}

  {$REGION 'reset'}
  LogoImage.Picture := nil;
  BadgeImage.Picture := nil;
  AvatarImage.Picture := nil;
  PictureImage.Picture := nil;
  {$ENDREGION}

  // process
  Screen.Cursor := crHourGlass;
  try
    try

      {$REGION 'proxy'}
      // gpxy should be set at beginning via ini-data or proxytab-data... so 1st time, enter process will probably fail and the user must be fill-in te proxytab-data
      {$ENDREGION}

      {$REGION 'organizationrio'}
      Log('Requesting Organization data...', fmInfo);
      if not gorg.InitRio(OrganizationEdit.Text, gaps.Www, fbk) then begin
        Log('Organization problem: %s', [fbk], fmDanger);
        ControlsShow(true);
        Exit;
      end;
      OrganizationApply;
      Log('ORGANIZATION OK', fmSuccess);
      {$ENDREGION}

      {$REGION 'themerio'}
      Log('Requesting Theme data...', fmInfo);
      if not gthe.InitRio(gorg.ObjectId, fbk) then begin
        Log('Theme problem: %s', [fbk], fmDanger);
        ControlsShow(true);
        Exit;
      end;
      Log('THEME OK', fmSuccess);
      ThemeApply;
      Application.ProcessMessages;
      {$ENDREGION}

      {$REGION 'accountrio'}
      Log('Requesting Account existence...', fmInfo);
      if not gusr.ExistsRio(UsernameEdit.Text, fbk) then begin
        Log('Account problem: account does not exists, %s', [sLineBreak + fbk], fmDanger);
        ControlsShow(true);
        Exit;
      end;
      Log('Requesting Account is active...', fmInfo);
      if not gusr.IsActiveRio(UsernameEdit.Text, fbk) then begin
        Log('Account problem: account is not active, %s', [sLineBreak + fbk], fmDanger);
        ControlsShow(true);
        Exit;
      end;
      Log('ACCOUNT OK', fmSuccess);
      {$ENDREGION}

      {$REGION 'authenticationrio'}
      Log('Requesting Authentication...', fmInfo);
      if not gusr.IsAuthenticatedRio(UsernameEdit.Text, TCryRec.Cipher(ansistring(PasswordEdit.Text)), fbk) then begin
        Log('Authentication problem (%d): unable to authenticate, please check your credentials, %s', [FLoginAttempts, sLineBreak + fbk], fmDanger);
        ControlsShow(true);
        Exit;
      end;
      Log('AUTHENTICATION OK', fmSuccess);
      {$ENDREGION}

      {$REGION 'sessionrio'}
      Log('Building a new session...', fmInfo);
      Randomize();
      gses.Init('Win', TRndRec.RndInt(100000, 199999), 0, TNetRec.IpLan, TNetRec.Domain, TNetRec.Host, TNetRec.OsLogin, TBynRec.BinaryTag, TBynRec.Ver, gaps.Www, gorg.Obj.&Object, UsernameEdit.Text, fbk);
      Log('Saving the new session to server...', fmInfo);
      if not gses.InsertRio(fbk) then begin
        Log('Session problem: unable to save the new session to the server, %s', [sLineBreak + fbk], fmDanger);
        ControlsShow(true);
        Exit;
      end;
      Log('SESSION OK', fmSuccess);
      {$ENDREGION}

      {$REGION 'memberrio'}
      Log('Requesting Member data...', fmInfo); // here a person/user become the organization/member
      if not gmbr.InitRio(OrganizationEdit.Text, UsernameEdit.Text, fbk) then begin
        Log('Member problem: please check your member data, %s', [sLineBreak + fbk], fmDanger);
        ControlsShow(true);
        Exit;
      end;
      MemberApply;
      Log('MEMBER OK', fmSuccess);
      {$ENDREGION}

      {$REGION 'userrio'}
      Log('Requesting User data...', fmInfo);
      if not gusr.InitRio(UsernameEdit.Text, fbk) then begin
        Log('User problem: please check your user data, %s', [fbk], fmDanger);
        ControlsShow(true);
        Exit;
      end;
      UserApply;
      Log('USER OK', fmSuccess);
      {$ENDREGION}

      {$REGION 'personrio'}
      Log('Requesting Person data...', fmInfo);
      if not gper.InitRio(UsernameEdit.Text, fbk) then begin
        Log('Person problem: please check your personal data, %s', [sLineBreak + fbk], fmDanger);
        ControlsShow(true);
        Exit;
      end;
      PersonApply;
      Log('PERSON OK', fmSuccess);
      {$ENDREGION}

      {$REGION 'clientrio'}
      Log('Requesting Client existence...', fmInfo);
      if not TSysRec.BinaryExistsRio(TBynRec.BinaryName, fbk) then begin
        Log('Client warning: your client is not registered on the system, %s', [fbk], fmWarning);
        TMesRec.W('Your client is not registered on the system');
        ControlsShow(true);
        Exit;
      end;
      Log('Requesting Client version...', fmInfo);
      if not TSysRec.BinaryVersionIsOkRio(TBynRec.BinaryName, TBynRec.Ver, fbk) then begin
        Log('Client warning: your client version is not the latest, %s', [fbk], fmWarning);
        TMesRec.W('Your client version is not the latest');
        ControlsShow(true);
      //Exit;
      end;
     {Log('Requesting Client data...', fmInfo);
      if not TBynRec.InitRio(fbk) then begin
        Log('Client problem: unable to get Client data, %s', [fbk], fmDanger);
        ControlsShow(true);
        Exit;
      end;}
      Log('CLIENT OK', fmSuccess);
      {$ENDREGION}

      {$REGION 'systemrio'}
      Log('Requesting System (Wks) data...', fmInfo);
      if not TSysRec.InitRio(fbk) then begin
        Log('System problem: unable to get System (Wks) data, %s', [fbk], fmDanger);
        ControlsShow(true);
        Exit;
      end;
      Log('SYSTEM OK', fmSuccess);
      {$ENDREGION}

      {$REGION 'enter'}
      Log('Entering session %d...', [gses.SessionId], fmSuccess);
      Sleep(LONG_PAUSE_MS);
      ModalResult := mrOk;    // ---> [ close form and ENTER ]
      {$ENDREGION}

    except
      on e: Exception do begin
        ControlsShow(true);
        TMesRec.W(e.Message);
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;
{$ENDREGION}

{$REGION 'Login'}
procedure TLoginForm.LoginTabSheetShow(Sender: TObject);
begin
  ControlsUpdate;
end;

procedure TLoginForm.OrganizationEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['A'..'Z','a'..'z', #8]) then // #8=backspace
    Key := #0;
end;

procedure TLoginForm.OrganizationEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    EnterLabelClick(Sender)
  else if Key in [VK_ESCAPE] then
    ExitLabelClick(Sender);
end;

procedure TLoginForm.UsernameEditChange(Sender: TObject);
begin
  if UsernameEdit.Text = '' then begin
    PasswordEdit.Text := '';
    LogClear;
  end;
end;

procedure TLoginForm.UsernameEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['A'..'Z','a'..'z', #8]) then // #8=backspace
    Key := #0;
end;

procedure TLoginForm.UsernameEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    PasswordEdit.SetFocus
  else if Key in [VK_ESCAPE] then
    ExitLabelClick(Sender);
end;

procedure TLoginForm.WksLogoImageClick(Sender: TObject);
begin
  TUrlRec.Go(TSysRec.WWW);
end;

procedure TLoginForm.PasswordEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    EnterLabelClick(Sender)
  else if Key in [VK_ESCAPE] then
    ExitLabelClick(Sender);
end;

procedure TLoginForm.PasswordLabel2Click(Sender: TObject);
begin
  if PasswordEdit.PasswordChar = '*' then
    PasswordEdit.PasswordChar := #0
  else
    PasswordEdit.PasswordChar := '*';
end;

procedure TLoginForm.LoginAutoOptionCheckBoxClick(Sender: TObject);
begin
  gini.BooSet(TBynRec.Obj + '/AutoLoginOption', LoginAutoOptionCheckBox.Checked); // this is present also in the client options ()
end;
{$ENDREGION}

{$REGION 'Server'}
procedure TLoginForm.ServerPingButtonClick(Sender: TObject);
var
  fbk: string;
  suc: boolean;
begin
  suc := TNetRec.Ping(gaps.Www, fbk);
  Log(fbk, suc);
end;

procedure TLoginForm.ServerDevRadioButtonClick(Sender: TObject);
begin
  gaps.Environment := 'Dev';
end;

procedure TLoginForm.ServerTestRadioButtonClick(Sender: TObject);
begin
  gaps.Environment := 'Test';
end;

procedure TLoginForm.ServerProdRadioButtonClick(Sender: TObject);
begin
  gaps.Environment := 'Prod';
end;

procedure TLoginForm.ServerWwwDevEditChange(Sender: TObject);
begin
  gaps.WwwDev      := ServerWwwDevEdit.Text ;
end;

procedure TLoginForm.ServerWwwTestEditChange(Sender: TObject);
begin
  gaps.WwwTest     := ServerWwwTestEdit.Text;
end;

procedure TLoginForm.ServerWwwProdEditChange(Sender: TObject);
begin
  gaps.WwwProd     := ServerWwwProdEdit.Text;
end;

procedure TLoginForm.ServerProtocolComboBoxChange(Sender: TObject);
begin
  gaps.Protocol    := ServerProtocolComboBox.Text;
end;
{$ENDREGION}

{$REGION 'Proxy'}
procedure TLoginForm.ProxyGetViaRegistryButtonClick(Sender: TObject);
var
  pxy, fbk: string;  // proxy
  suc, pxu: boolean; // success, proxyuse
begin
  suc := gpxy.ProxyGetViaRegistry(pxy, pxu, fbk);
  Log(fbk, suc);
end;

procedure TLoginForm.ProxyGetViaWininetButtonClick(Sender: TObject);
var
  pxy, fbk: string;  // proxy
  suc, pxu: boolean; // success, proxyuse
begin
  suc := gpxy.ProxyGetViaWinInet(pxy, pxu, fbk);
  Log(fbk, suc);
end;

procedure TLoginForm.ProxyUseCheckBoxClick(Sender: TObject);
begin
  gpxy.Use := ProxyUseCheckBox.Checked;
end;

procedure TLoginForm.ProxyAddressEditChange(Sender: TObject);
begin
  gpxy.UrlOrAddress := ProxyAddressEdit.Text;
end;

procedure TLoginForm.ProxyPortEditChange(Sender: TObject);
begin
  gpxy.Port := ProxyPortEdit.Text;
end;

procedure TLoginForm.ProxyUsernameEditChange(Sender: TObject);
begin
  gpxy.Username := ProxyUsernameEdit.Text;
end;

procedure TLoginForm.ProxyPasswordEditChange(Sender: TObject);
begin
  gpxy.Password := ProxyPasswordEdit.Text;
end;
{$ENDREGION}

{$REGION 'License'}
procedure TLoginForm.LicenseTabSheetShow(Sender: TObject);
begin
  LicenseRichEdit.Text := sLineBreak + grva.Rva(LICENSE_MIT);
end;
{$ENDREGION}

{$REGION 'Privacy'}
procedure TLoginForm.PrivacyTabSheetShow(Sender: TObject);
begin
  PrivacyRichEdit.Text := sLineBreak + grva.Rva(PRIVACY_STATEMENT);
end;
{$ENDREGION}

{$REGION 'Mouse'}
procedure TLoginForm.ExitLabelMouseEnter(Sender: TObject);
begin
  (Sender as TLabel).Font.Color := TColRec.TColFromHtmlHexStr(gthe.DangerColor);
end;

procedure TLoginForm.ExitLabelMouseLeave(Sender: TObject);
begin
  (Sender as TLabel).Font.Color := TColRec.TColFromHtmlHexStr(gthe.Secondary30FgColor);
end;
{$ENDREGION}

end.
