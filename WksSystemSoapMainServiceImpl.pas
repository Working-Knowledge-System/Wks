unit WksSystemSoapMainServiceImpl;

interface

{$REGION 'Use'}
uses
    System.Types
  , System.SysUtils
  , Soap.InvokeRegistry
  , Soap.XSBuiltIns
  , WksSystemSoapMainServiceIntf
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TSystemSoapMainService = class(TInvokableClass, ISystemSoapMainService)
  public
    // system *** move Soap to the end ***
    function  SystemSoapInfo                (var IvFbk: string): boolean; stdcall;
    function  SystemSoapOutline             (var IvOutline: string; var IvFbk: string): boolean; stdcall;
    function  SystemSoapPrivacy             (var IvPrivacy: string; var IvFbk: string): boolean; stdcall;
    function  SystemSoapLicense             (var IvLicense: string; var IvFbk: string): boolean; stdcall;
    function  SystemSoapCopyright           (var IvCopyright: string; var IvFbk: string): boolean; stdcall;
  //function  SystemSoapContentGet          (const IvId: integer; var IvContent: string; const IvDefault: string; var IvFbk: string): boolean; stdcall;
  //function  SystemSoapContentSet          (const IvId: integer; const IvContent: string; var IvFbk: string): boolean; stdcall;
    function  SystemSoapSystemGet           (var IvSysRem: TSysRem; var IvFbk: string): boolean; stdcall;
    // person/user
    function  SystemPersonInitSoap          (const IvPerson: string; var IvPersonRem: TPerRem; var IvFbk: string): boolean; stdcall;
    function  SystemUserExistsSoap          (const IvUsername: string; var IvFbk: string): boolean; stdcall;
    function  SystemUserIsActiveSoap        (const IvUsername: string; var IvFbk: string): boolean; stdcall;
    function  SystemUserIsAuthenticatedSoap (const IvUsername, IvPassword: string; var IvFbk: string): boolean; stdcall;
    function  SystemUserInitSoap            (const IvUsername: string; var IvUserRem: TUsrRem; var IvFbk: string): boolean; stdcall;
    // organization/theme
    function  SystemOrganizationInitSoap    (const IvOrganization: string; var IvOrganizationRem: TOrgRem; var IvFbk: string): boolean; stdcall;
    function  SystemThemeInitSoap           (const IvOrganizationId: integer; var IvThemeRem: TTheRem; var IvFbk: string): boolean; stdcall;
    // member
    function  SystemMemberInitSoap          (const IvOrganization, IvUsername: string; var IvMemberRem: TMbrRem; IvFbk: string): boolean; stdcall;
    // client
    function  SystemClientExistsSoap        (const IvClient: string; var IvFbk: string): boolean; stdcall;
    function  SystemClientVersionIsOkSoap   (const IvClient, IvVer: string; var IvFbk: string): boolean; stdcall;
    // session
    function  SystemSessionInsertSoap       (const IvDateTimeBegin: TDateTime               ; const IvKind: string; const IvSessionId, IvFingerprintId: cardinal; const IvIpLan, IvDomain, IvComputer, IvOsLogin, IvClient, IvVersion, IvServer, IvOrganization, IvUsername: string; var IvFbk: string): boolean; stdcall;
    function  SystemSessionCloseSoap        (const IvDateTimeBegin, IvDateTimeEnd: TDateTime; const IvKind: string; const IvSessionId, IvFingerprintId: cardinal; const IvIpLan, IvDomain, IvComputer, IvOsLogin, IvClient, IvVersion, IvServer, IvOrganization, IvUsername: string; var IvFbk: string): boolean; stdcall;
    // object
    function  SystemObjectIdNextSoap        (const IvObj: string; var IvIdNext: integer; var IvFbk: string): boolean; stdcall;
    function  SystemObjectNewRio            (const IvObj, IvIdOrPath, IvObject, IvObjectKind, IvContentKind, IvFromOrganization, IvFromMember: string; var IvIdNew: integer): boolean; stdcall;
    function  SystemObjectTreeContent       (const IvObj, IvIdOrPath: string; IvWithChild: boolean                    ; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean; stdcall;
    function  SystemObjectTreeContentSave   (const IvObj, IvIdOrPath: string; IvWithChild: boolean; IvFileSpec: string; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean; stdcall;
    function  SystemObjSoapFieldGet         (const IvObj, IvIdOrPath, IvField: string;   var IvValue: variant; const IvDefault: variant): boolean; stdcall;
    function  SystemObjSoapFieldSet         (const IvObj, IvIdOrPath, IvField: string; const IvValue: variant): boolean; stdcall;
    // dba
    function  SystemDbaInfosSoap            (var IvBuild, IvMajorVersion, IvMinorVersion, IvBuildType, IvUpdateLevel, IvUpdateReference, IvFbk: string): boolean; stdcall;
    function  SystemDbaFilesPathsSoap       (var IvDataPath, IvLogPath, IvBackupPath, IvFbk: string): boolean; stdcall;
    function  SystemDbaDatabaseRebuildSoap  (var IvFbk: string): boolean; stdcall;
    function  SystemDbaCreateDdlSoap        (var IvHost, IvDateTimeCode, IvDdl, IvFbk: string): boolean; stdcall;
    function  SystemDbaDeleteDdlSoap        (var IvHost, IvDateTimeCode, IvDdl, IvFbk: string): boolean; stdcall;
    function  SystemDbaBackupDdlSoap        (var IvHost, IvDateTimeCode, IvDdl, IvFbk: string): boolean; stdcall;
    function  SystemDbaRestoreDdlSoap       (var IvHost, IvDateTimeCode, IvDdl, IvFbk: string): boolean; stdcall;
  end;
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    System.Classes
  , Data.DB
  , Vcl.Imaging.PNGImage
  ;
{$ENDREGION}

{$REGION 'TSystemSoapMainService'}

  {$REGION 'System'}
function TSystemSoapMainService.SystemSoapInfo(var IvFbk: string): boolean;
begin
  IvFbk := Format('%s %s - %s - SYSTEM Soap Main Service', [TWksRec.ACRONYM, TBynRec.Info, DateTimeToStr(Now)]);
  Result := true;
end;

function TSystemSoapMainService.SystemSoapOutline(var IvOutline, IvFbk: string): boolean;
var
  def, vnt: variant; // default
begin
  // default
  def :=         'WKS is a "Working Knowledge System".'
  + sLineBreak + 'It is a client-server framework/platform developed for research pourpose.'
  + sLineBreak + 'It is provided "as-is", without any express or implied warranty.'
  + sLineBreak + 'It is public domain and may be used for any commercial, business, governmental or institutional purpose.'
  + sLineBreak + 'In no event will the author(s) be held liable for any damages arising from the use of this software.'
  + sLineBreak + 'All the documentation and software included in this package is copyrighted by Wks';

  // get
  Result := TObjRec.FieldGet('System', '103', 'FldContent', vnt, def);
  IvOutline := vnt;
  IvFbk := 'Ok';
end;

function TSystemSoapMainService.SystemSoapPrivacy(var IvPrivacy, IvFbk: string): boolean;
var
  def, vnt: variant; // default
begin
  // default
  def :=         'WKS takes care of privacy implementing latest european GDPR directives.'
  + sLineBreak + 'For more information see the following links: https://gdpr.eu';

  // get
  Result := TObjRec.FieldGet('System', '103', 'FldContent', vnt, def);
  IvPrivacy := vnt;
  IvFbk := 'Ok';
end;

function TSystemSoapMainService.SystemSoapLicense(var IvLicense, IvFbk: string): boolean;
var
  def, vnt: variant; // default
begin
  // default
  def :=         'WKS implement the BSD License.'
  + sLineBreak + 'Type: Permissive.'
  + sLineBreak + 'Key Features: Allows users to do almost anything with the software as long as '
               + 'they include the original copyright and license notice in the derived software.'
  + sLineBreak + 'Prohibits the use of the name of the project or its contributors '
               + 'for promotional purposes without written permission.'
  + sLineBreak + 'For more information see the following links: https://';

  // get
  Result := TObjRec.FieldGet('System', '103', 'FldContent', vnt, def);
  IvLicense := vnt;
  IvFbk := 'Ok';
end;

function TSystemSoapMainService.SystemSoapCopyright(var IvCopyright, IvFbk: string): boolean;
begin
  IvCopyright := TWksRec.Copyright;
  IvFbk := 'Ok';
  Result := true;
end;

//function TSystemSoapMainService.SystemSoapContentGet(const IvId: integer; var IvContent: string; const IvDefault: string; var IvFbk: string): boolean;
//begin
//end;

//function TSystemSoapMainService.SystemSoapContentSet(const IvId: integer; const IvContent: string; var IvFbk: string): boolean;
//begin
//end;

function TSystemSoapMainService.SystemSoapSystemGet(var IvSysRem: TSysRem; var IvFbk: string): boolean;
begin
  IvFbk := 'Ok';
  Result := true;

  IvSysRem.Author      := TWksRec.AUTHOR;
  IvSysRem.Architect   := TWksRec.AUTHOR;
  IvSysRem.Acronym     := TWksRec.ACRONYM;
  IvSysRem.Name        := TWksRec.NAME;
  IvSysRem.Description := TWksRec.DESCRIPTION;
  IvSysRem.Copyright   := TWksRec.Copyright;
  IvSysRem.Slogan      := TWksRec.SLOGAN;
  IvSysRem.LogoBytes   := nil; // *** TBD ***
{
  if not Assigned(IvSysRem.Admin) then IvSysRem.Admin := TAdmRem.Create;
  IvSysRem.Admin.AdminCsv     := o.S['Admin.AdminCsv'    ];
  IvSysRem.Admin.PasswordCsv  := o.S['Admin.PasswordCsv' ];
  IvSysRem.Admin.EmailCsv     := o.S['Admin.EmailCsv'    ];
  IvSysRem.Admin.PhoneCsv     := o.S['Admin.PhoneCsv'    ];

  if not Assigned(IvSysRem.Network) then IvSysRem.Network := TNetRem.Create;
  IvSysRem.Network.Username   := o.S['Network.Username'  ];
  IvSysRem.Network.Password   := o.S['Network.Password'  ];
  IvSysRem.Network.Email      := o.S['Network.Email     '];

  if not Assigned(IvSysRem.Smtp) then IvSysRem.Smtp := TSmtRem.Create;
//IvSysRem.Smtp.Organization  := o.S['Smtp.Organization' ];
//IvSysRem.Smtp.Owner         := o.S['Smtp.Owner'        ];
//IvSysRem.Smtp.Account       := o.S['Smtp.Account'      ];
  IvSysRem.Smtp.Host          := o.S['Smtp.Host'         ];
  IvSysRem.Smtp.Port          := o.S['Smtp.Port'         ];
  IvSysRem.Smtp.Username      := o.S['Smtp.Username'     ];
  IvSysRem.Smtp.Password      := o.S['Smtp.Password'     ];

  if not Assigned(IvSysRem.Pop3) then IvSysRem.Pop3 := TPopRem.Create;
//IvSysRem.Pop3.Organization  := o.S['Pop3.Organization' ];
//IvSysRem.Pop3.Owner         := o.S['Pop3.Owner'        ];
//IvSysRem.Pop3.Account       := o.S['Pop3.Account'      ];
  IvSysRem.Pop3.Host          := o.S['Pop3.Host'         ];
  IvSysRem.Pop3.Port          := o.S['Pop3.Port'         ];
  IvSysRem.Pop3.Username      := o.S['Pop3.Username'     ];
  IvSysRem.Pop3.Password      := o.S['Pop3.Password'     ];
  IvSysRem.Pop3.TrySecureAuth := o.B['Pop3.TrySecureAuth'];
  IvSysRem.Pop3.NewerMsgFirst := o.B['Pop3.NewerMsgFirst'];
  IvSysRem.Pop3.CleanOnExit   := o.B['Pop3.CleanOnExit'  ];
}
end;
  {$ENDREGION}

  {$REGION 'Person/User'}
function  TSystemSoapMainService.SystemPersonInitSoap(const IvPerson: string; var IvPersonRem: TPerRem; var IvFbk: string): boolean;
var
  per: TPerRec;
  obr: TObjRem;
begin
  // exit
  Result := not IvPerson.IsEmpty;
  if not Result then begin
    IvFbk := 'Unable to load IvPersonRem, IvPerson is empty';
    glog.Log(IvFbk);
    Exit;
  end;

  // rec
  Result := per.InitDba(IvPerson, IvFbk);

  // rem
  if not Assigned(IvPersonRem) then
    IvPersonRem := TPerRem.Create;

  // master
  obr := TObjRem.Create;
  try
    per.Obj.RecToRem(obr);
    IvPersonRem.ObjRem := obr;
  finally
  //obr.Free; // freeatclientinrio
  end;

  // detail
  IvPersonRem.ObjectId     := per.ObjectId    ;
  IvPersonRem.Person       := per.Person      ;
  IvPersonRem.Name         := per.Name        ;
  IvPersonRem.Surname      := per.Surname     ;
  IvPersonRem.PictureBytes := TBarRec.BarFromGraphic(per.PictureGraphic);
end;

function  TSystemSoapMainService.SystemUserExistsSoap(const IvUsername: string; var IvFbk: string): boolean;
var
  usr: TUsrRec;
begin
  Result := usr.Exists(IvUsername, IvFbk);
end;

function  TSystemSoapMainService.SystemUserIsActiveSoap(const IvUsername: string; var IvFbk: string): boolean;
var
  usr: TUsrRec;
begin
  Result := usr.IsActive(IvUsername, IvFbk);
end;

function  TSystemSoapMainService.SystemUserIsAuthenticatedSoap(const IvUsername, IvPassword: string; var IvFbk: string): boolean;
var
  usr: TUsrRec;
begin
  Result := usr.IsAuthenticated(IvUsername, TCryRec.Decipher(ansistring(IvPassword)), IvFbk);
end;

function  TSystemSoapMainService.SystemUserInitSoap(const IvUsername: string; var IvUserRem: TUsrRem; var IvFbk: string): boolean;
var
  usr: TUsrRec;
//obr: TObjRem;
begin
  // exit
  Result := not IvUsername.IsEmpty;
  if not Result then begin
    IvFbk := 'Unable to load UserRem, IvUsername is empty';
    glog.Log(IvFbk);
    Exit;
  end;

  // rec
  Result := usr.InitDba(IvUsername, IvFbk);

  // rem
  if not Assigned(IvUserRem) then
    IvUserRem := TUsrRem.Create;

  // master
//obr := TObjRem.Create;
//try
//  usr.Obj.RecToRem(obr);
//  IvUserRem.Obj := obr;
//finally
////obr.Free; // freeatclientinrio
//end;

  // detail
  IvUserRem.PersonId    := usr.PersonId;
  IvUserRem.Username    := usr.Username;
  IvUserRem.Password    := usr.Password;
  IvUserRem.State       := usr.State;
  IvUserRem.AvatarBytes := TBarRec.BarFromGraphic(usr.AvatarGraphic);
end;
  {$ENDREGION}

  {$REGION 'Organization/Theme'}
function  TSystemSoapMainService.SystemOrganizationInitSoap(const IvOrganization: string; var IvOrganizationRem: TOrgRem; var IvFbk: string): boolean; // [B]
var
  org: TOrgRec;
  obr: TObjRem;
begin
  // exit
  Result := not IvOrganization.IsEmpty;
  if not Result then begin
    IvFbk := 'Unable to load OrganizationRem, IvOrganization is empty';
    glog.Log(IvFbk);
    Exit;
  end;

  // rec
  Result := org.InitDba(IvOrganization, IvFbk);

  // rem
  if not Assigned(IvOrganizationRem) then
    IvOrganizationRem := TOrgRem.Create;

  // master
  obr := TObjRem.Create;
  try
    org.Obj.RecToRem(obr);
    IvOrganizationRem.ObjRem := obr;
  finally
  //obr.Free; // freeatclientinrio
  end;

  // detail
  IvOrganizationRem.ObjectId      := org.ObjectId;
  IvOrganizationRem.Www           := org.Www;
  IvOrganizationRem.Phone         := org.Phone;
  IvOrganizationRem.Email         := org.Email;
  IvOrganizationRem.About         := org.About;
  IvOrganizationRem.Slogan        := org.Slogan;
  IvOrganizationRem.LogoBytes     := TBarRec.BarFromGraphic(org.LogoGraphic);
  IvOrganizationRem.LogoLongBytes := TBarRec.BarFromGraphic(org.LogoLongGraphic);
end;

function  TSystemSoapMainService.SystemThemeInitSoap(const IvOrganizationId: integer; var IvThemeRem: TTheRem; var IvFbk: string): boolean;
var
  the: TTheRec;
begin
  // exit
  Result := IvOrganizationId > 0;
  if not Result then begin
    IvFbk := 'Unable to load ThemeRem, OrganizationId is invalid (it should be a positive integer)';
    glog.Log(IvFbk);
    Exit;
  end;

  // rec
  Result := the.InitDba(IvOrganizationId, IvFbk);

  // rem
  if not Assigned(IvThemeRem) then
    IvThemeRem := TTheRem.Create;

  // detail
  IvThemeRem.ObjectId           := the.ObjectId          ;
  IvThemeRem.Theme              := the.Theme             ;
  IvThemeRem.Grade              := the.Grade             ;
  IvThemeRem.FontFamily         := the.FontFamily        ; // Verdana, Monserrat, ...
  IvThemeRem.FontWeight         := the.FontWeight        ; // 500..900
  IvThemeRem.SizeClass          := the.SizeClass         ;
  IvThemeRem.PaddingClass       := the.PaddingClass      ;
  IvThemeRem.BorderedClass      := the.BorderedClass     ;
  IvThemeRem.HighlightJs        := the.HighlightJs       ;
  IvThemeRem.Primary60BgColor   := the.Primary60BgColor  ;
  IvThemeRem.Secondary30FgColor := the.Secondary30FgColor;
  IvThemeRem.Accent10Color      := the.Accent10Color     ;
  IvThemeRem.ErrorColor         := the.ErrorColor        ;
  IvThemeRem.DangerColor        := the.DangerColor       ;
  IvThemeRem.WarningColor       := the.WarningColor      ;
  IvThemeRem.InfoColor          := the.InfoColor         ;
  IvThemeRem.SuccessColor       := the.SuccessColor      ;
end;
  {$ENDREGION}

  {$REGION 'Member'}
function  TSystemSoapMainService.SystemMemberInitSoap(const IvOrganization, IvUsername: string; var IvMemberRem: TMbrRem; IvFbk: string): boolean;
var
  mbr: TMbrRec;
  obr: TObjRem;
begin
  // exit
  Result := not (IvOrganization.IsEmpty or IvUsername.IsEmpty);
  if not Result then begin
    IvFbk := 'Unable to load MemberRem, IvOrganization and/or IvUsername are empty';
    glog.Log(IvFbk);
    Exit;
  end;

  // rec
  Result := mbr.InitDba(IvOrganization, IvUsername, IvFbk);

  // rem
  if not Assigned(IvMemberRem) then
    IvMemberRem := TMbrRem.Create;

  // master
  obr := TObjRem.Create;
  try
    mbr.Obj.RecToRem(obr);
    IvMemberRem.ObjRem := obr;
  finally
  //obr.Free; // freeatclientinrio
  end;

  // detail
  IvMemberRem.Id           := mbr.Id          ;
  IvMemberRem.PId          := mbr.PId         ;
  IvMemberRem.Organization := mbr.Organization;
  IvMemberRem.Area         := mbr.Area        ;
  IvMemberRem.State        := mbr.State       ;
  IvMemberRem.Member       := mbr.Member      ;
  IvMemberRem.Email        := mbr.Email       ;
  IvMemberRem.JobTitle     := mbr.JobTitle    ;
  IvMemberRem.JobRole      := mbr.JobRole     ;
  IvMemberRem.JobLevel     := mbr.JobLevel    ;
  IvMemberRem.BadgeBytes   := TBarRec.BarFromGraphic(mbr.BadgeGraphic);
end;
  {$ENDREGION}

  {$REGION 'Client'}
function  TSystemSoapMainService.SystemClientExistsSoap(const IvClient: string; var IvFbk: string): boolean;
begin
  Result := TBynRec.ClientExists(IvClient, IvFbk);
end;

function  TSystemSoapMainService.SystemClientVersionIsOkSoap(const IvClient, IvVer: string; var IvFbk: string): boolean;
begin
  Result := TBynRec.ClientVersionIsOk(IvClient, IvVer, IvFbk);
end;
  {$ENDREGION}

  {$REGION 'Session'}
function  TSystemSoapMainService.SystemSessionInsertSoap(const IvDateTimeBegin: TDateTime              ; const IvKind: string; const IvSessionId, IvFingerprintId: cardinal; const IvIpLan, IvDomain, IvComputer, IvOsLogin, IvClient, IvVersion, IvServer, IvOrganization, IvUsername: string; var IvFbk: string): boolean;
var
  wse: TWseRec;
begin
  wse.DateTimeBegin := IvDateTimeBegin ; // FldDateTimeBegin
  wse.DateTimeEnd   := TDatRec.ZERO_DAT; // FldDateTimeEnd
  wse.Kind          := IvKind          ; // FldKind
  wse.SessionId     := IvSessionId     ; // FldSessionId
  wse.FingerprintId := IvFingerprintId ; // FldFingerprintId
  wse.IpLan         := IvIpLan         ; // FldIpLan
  wse.Domain        := IvDomain        ; // FldDomain
  wse.Computer      := IvComputer      ; // FldComputer
  wse.OsLogin       := IvOsLogin       ; // FldOsLogin
  wse.Client        := IvClient        ; // FldClient
  wse.Version       := IvVersion       ; // FldVersion
  wse.Server        := IvServer        ; // FldServer
  wse.Organization  := IvOrganization  ; // FldOrganization
  wse.Username      := IvUsername      ; // FldUsername
  Result := wse.Insert(IvFbk);
end;

function  TSystemSoapMainService.SystemSessionCloseSoap(const IvDateTimeBegin, IvDateTimeEnd: TDateTime; const IvKind: string; const IvSessionId, IvFingerprintId: cardinal; const IvIpLan, IvDomain, IvComputer, IvOsLogin, IvClient, IvVersion, IvServer, IvOrganization, IvUsername: string; var IvFbk: string): boolean;
var
  wse: TWseRec;
begin
  wse.DateTimeBegin := IvDateTimeBegin ; // FldDateTimeBegin
  wse.DateTimeEnd   := TDatRec.ZERO_DAT; // FldDateTimeEnd
  wse.Kind          := IvKind          ; // FldKind
  wse.SessionId     := IvSessionId     ; // FldSessionId
  wse.FingerprintId := IvFingerprintId ; // FldFingerprintId
  wse.IpLan         := IvIpLan         ; // FldIpLan
  wse.Domain        := IvDomain        ; // FldDomain
  wse.Computer      := IvComputer      ; // FldComputer
  wse.OsLogin       := IvOsLogin       ; // FldOsLogin
  wse.Client        := IvClient        ; // FldClient
  wse.Version       := IvVersion       ; // FldVersion
  wse.Server        := IvServer        ; // FldServer
  wse.Organization  := IvOrganization  ; // FldOrganization
  wse.Username      := IvUsername      ; // FldUsername
  Result := wse.Close(IvFbk);
end;
  {$ENDREGION}

  {$REGION 'Object'}
function  TSystemSoapMainService.SystemObjectIdNextSoap(const IvObj: string; var IvIdNext: integer; var IvFbk: string): boolean;
begin
  Result := TObjRec.IdNext(IvObj, IvIdNext, IvFbk);
end;

function  TSystemSoapMainService.SystemObjectNewRio(const IvObj, IvIdOrPath, IvObject, IvObjectKind, IvContentKind, IvFromOrganization, IvFromMember: string; var IvIdNew: integer): boolean;
begin
  Result := TObjRec.New(IvObj, IvIdOrPath, IvObject, IvObjectKind, IvContentKind, IvFromOrganization, IvFromMember, IvIdNew);
end;

function  TSystemSoapMainService.SystemObjectTreeContent(const IvObj, IvIdOrPath: string; IvWithChild: boolean; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean;
begin
  Result := TDbaRec.ObjTreeContentDba(IvObj, IvIdOrPath, IvWithChild, IvAffected, IvObjName, IvHTreeContent, IvFbk);
end;

function  TSystemSoapMainService.SystemObjectTreeContentSave(const IvObj, IvIdOrPath: string; IvWithChild: boolean; IvFileSpec: string; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean;
var
  stl: TStringList;
begin
  Result := TDbaRec.ObjTreeContentDba(IvObj, IvIdOrPath, IvWithChild, IvAffected, IvObjName, IvHTreeContent, IvFbk);

  // saveremotely
  stl := TStringList.Create;
  try
    // no-multi-save-template
    stl.Text := IvHTreeContent;
    stl.SaveToFile(IvFileSpec);
    IvFbk := Format('%s tree-Content saved to remote server: %s', [IvObj, IvFileSpec]);

    // yes-multi-save-template
    // to be implemented, see CodeClient, CodeSave
  finally
    stl.Free;
  end;
end;

function  TSystemSoapMainService.SystemObjSoapFieldGet(const IvObj, IvIdOrPath, IvField: string; var IvValue: variant; const IvDefault: variant): boolean;
begin
  Result := TObjRec.FieldGet(IvObj, IvIdOrPath, IvField, IvValue, IvDefault);
end;

function  TSystemSoapMainService.SystemObjSoapFieldSet(const IvObj, IvIdOrPath, IvField: string; const IvValue: variant): boolean;
begin
  Result := TObjRec.FieldSet(IvObj, IvIdOrPath, IvField, IvValue);
end;
  {$ENDREGION}

  {$REGION 'Dba'}
function  TSystemSoapMainService.SystemDbaInfosSoap(var IvBuild, IvMajorVersion, IvMinorVersion, IvBuildType, IvUpdateLevel, IvUpdateReference, IvFbk: string): boolean;
var
  sql: string;
  dst: TDataSet;
begin
  // sql
  sql := ''
  + sLineBreak + 'select'
  + sLineBreak + '    serverproperty(''InstanceDefaultDataPath'') as FldInstanceDefaultDataPath'
  + sLineBreak + '  , serverproperty(''InstanceDefaultLogPath'')  as FldInstanceDefaultLogPath'
  + sLineBreak + '  , serverproperty(''ProductBuild'')            as FldProductBuild'
  + sLineBreak + '  , serverproperty(''ProductMajorVersion'')     as FldProductMajorVersion'
  + sLineBreak + '  , serverproperty(''ProductMinorVersion'')     as FldProductMinorVersion'
  + sLineBreak + '  , serverproperty(''ProductBuildType'')        as FldProductBuildType'
  + sLineBreak + '  , serverproperty(''ProductUpdateLevel'')      as FldProductUpdateLevel'
  + sLineBreak + '  , serverproperty(''ProductUpdateReference'')  as FldProductUpdateReference'
  ;
  // exec
  Result := TDbaRec.DsFromSql(sql, dst);
  try
    if not Result then
      IvFbk := 'No dba infos found'
    else begin
    //IvDataPath        := dst.Fields[0].AsString;
    //IvLogPath         := dst.Fields[1].AsString;
      IvBuild           := dst.Fields[2].AsString;
      IvMajorVersion    := dst.Fields[3].AsString;
      IvMinorVersion    := dst.Fields[4].AsString;
      IvBuildType       := dst.Fields[5].AsString;
      IvUpdateLevel     := dst.Fields[6].AsString;
      IvUpdateReference := dst.Fields[7].AsString;
      IvFbk := 'Dba infos found'
    end;
  finally
    FreeAndNil(dst);
  end;
end;

function  TSystemSoapMainService.SystemDbaFilesPathsSoap(var IvDataPath, IvLogPath, IvBackupPath, IvFbk: string): boolean;
var
  sql: string;
  dst: TDataSet;
begin
  // sql
  sql := ''
//+ sLineBreak + 'declare @a varchar(256); set @a = convert(varchar, serverproperty('InstanceDefaultDataPath'))'
//+ sLineBreak + 'declare @b varchar(256); set @b = convert(varchar, serverproperty('InstanceDefaultLogPath'))'
//+ sLineBreak + 'declare @c varchar(256); set @b = convert(varchar, serverproperty('InstanceDefaultLogPath'))'
//+ sLineBreak + ''
  + sLineBreak + 'declare @DefaultData nvarchar(512)'
  + sLineBreak + 'exec master.dbo.xp_instance_regread N''HKEY_LOCAL_MACHINE'', N''Software\Microsoft\MSSQLServer\MSSQLServer''           , N''DefaultData''    , @DefaultData output'
  + sLineBreak + ''
  + sLineBreak + 'declare @DefaultLog nvarchar(512)'
  + sLineBreak + 'exec master.dbo.xp_instance_regread N''HKEY_LOCAL_MACHINE'', N''Software\Microsoft\MSSQLServer\MSSQLServer''           , N''DefaultLog''     , @DefaultLog output'
  + sLineBreak + ''
  + sLineBreak + 'declare @DefaultBackup nvarchar(512)'
  + sLineBreak + 'exec master.dbo.xp_instance_regread N''HKEY_LOCAL_MACHINE'', N''Software\Microsoft\MSSQLServer\MSSQLServer''           , N''BackupDirectory'', @DefaultBackup output'
  + sLineBreak + ''
  + sLineBreak + 'declare @MasterData nvarchar(512)'
  + sLineBreak + 'exec master.dbo.xp_instance_regread N''HKEY_LOCAL_MACHINE'', N''Software\Microsoft\MSSQLServer\MSSQLServer\Parameters'', N''SqlArg0''        , @MasterData output'
  + sLineBreak + 'select @MasterData=substring(@MasterData, 3, 255)'
  + sLineBreak + 'select @MasterData=substring(@MasterData, 1, len(@MasterData) - charindex(''\'', reverse(@MasterData)))'
  + sLineBreak + ''
  + sLineBreak + 'declare @MasterLog nvarchar(512)'
  + sLineBreak + 'exec master.dbo.xp_instance_regread N''HKEY_LOCAL_MACHINE'', N''Software\Microsoft\MSSQLServer\MSSQLServer\Parameters'', N''SqlArg2'', @MasterLog output'
  + sLineBreak + 'select @MasterLog=substring(@MasterLog, 3, 255)'
  + sLineBreak + 'select @MasterLog=substring(@MasterLog, 1, len(@MasterLog) - charindex(''\'', reverse(@MasterLog)))'
  + sLineBreak + ''
  + sLineBreak + 'select'
  + sLineBreak + '    isnull(@DefaultData  , @MasterData) as FldDataPath'
  + sLineBreak + '  , isnull(@DefaultLog   , @MasterLog ) as FldLogPath'
  + sLineBreak + '  , isnull(@DefaultBackup, @MasterLog ) as FldBackupPath'
  ;
  // exec
  Result := TDbaRec.DsFromSql(sql, dst);
  try
    if not Result then
      IvFbk := 'No dba files paths found'
    else begin
      IvDataPath   := dst.Fields[0].AsString;
      IvLogPath    := dst.Fields[1].AsString;
      IvBackupPath := dst.Fields[2].AsString;
      IvFbk := 'Dba files paths found'
    end;
  finally
    FreeAndNil(dst);
  end;
end;

function  TSystemSoapMainService.SystemDbaDatabaseRebuildSoap(var IvFbk: string): boolean;
var
  sql: string;
  aff: integer; // affected
begin
  // sql
  sql         := '-- reset'
  + sLineBreak + 'delete from DbaDatabase.dbo.TblServer'
  + sLineBreak + 'delete from DbaDatabase.dbo.TblDatabase'
  + sLineBreak + 'delete from DbaDatabase.dbo.TblTable'
  + sLineBreak + 'delete from DbaDatabase.dbo.TblField'
//+ sLineBreak + 'delete from DbaDatabase.dbo.TblIndex'
  + sLineBreak + ''
  + sLineBreak + '-- server insert'
  + sLineBreak + 'insert into DbaDatabase.dbo.TblServer'
  + sLineBreak + 'select'
  + sLineBreak + '    ''Wks''    as FldSystem'
  + sLineBreak + '  , ''WKS''    as FldServer'
  + sLineBreak + '  , ''Active'' as FldState'
  + sLineBreak + '  , null       as FldKind'
  + sLineBreak + '  , null       as FldLocation'
  + sLineBreak + '  , null       as FldSaUsername'
  + sLineBreak + '  , null       as FldSaPassword'
  + sLineBreak + '  , null       as FldDescription'
  + sLineBreak + '  , null       as FldNote'
  + sLineBreak + ''
  + sLineBreak + '-- databases insert'
  + sLineBreak + 'insert into DbaDatabase.dbo.TblDatabase'
  + sLineBreak + 'select'
  + sLineBreak + '    ''Wks''    as FldSystem'
  + sLineBreak + '  , name       as FldDatabase'
  + sLineBreak + '  , ''Active'' as FldState'
  + sLineBreak + '  , null       as FldKind'
  + sLineBreak + '  , null       as FldProvider       -- remove all and set only a connection string!'
  + sLineBreak + '  , null       as FldDataSource'
  + sLineBreak + '  , null       as FldInitialCatalog'
  + sLineBreak + '  , null       as FldUsername'
  + sLineBreak + '  , null       as FldPassword'
  + sLineBreak + '  , null       as FldOraServer'
  + sLineBreak + '  , null       as FldOraSchema'
  + sLineBreak + '  , null       as FldOraPort'
  + sLineBreak + '  , null       as FldOraSID'
  + sLineBreak + '  , null       as FldOraServiceName'
  + sLineBreak + '  , null       as FldDescription'
  + sLineBreak + '  , null       as FldNote'
  + sLineBreak + 'from'
  + sLineBreak + '    master.dbo.sysdatabases'
  + sLineBreak + 'where'
  + sLineBreak + '    name like ''Dba%'''
//+ sLineBreak + 'and name not in(''master'', ''model'', ''msdb'', ''sa'', ''tempdb'')'
  + sLineBreak + 'order by'
  + sLineBreak + '    name'
  + sLineBreak + ''
  + sLineBreak + '-- cursor1'
  + sLineBreak + 'declare c1 cursor for'
  + sLineBreak + 'select'
  + sLineBreak + '    FldDatabase'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaDatabase.dbo.TblDatabase'
  + sLineBreak + 'order by'
  + sLineBreak + '    FldDatabase'
  + sLineBreak + ''
  + sLineBreak + '-- walk'
  + sLineBreak + 'declare @d sysname       -- database'
  + sLineBreak + 'declare @s nvarchar(max) -- sql'
  + sLineBreak + 'open c1'
  + sLineBreak + 'fetch next from c1 into @d'
  + sLineBreak + 'while @@fetch_status = 0 begin'
  + sLineBreak + ''
  + sLineBreak + '    -- insert tables'
  + sLineBreak + '    set @s = '''''
  + sLineBreak + '  + ''use '' + @d + '';'''
  + sLineBreak + '  + '' insert into DbaDatabase.dbo.TblTable'''
  + sLineBreak + '  + '' select'''
  + sLineBreak + '  + ''     ''''Wks''''          as FldSystem'''
  + sLineBreak + '  + ''   , '''''' + @d + '''''' as FldDatabase'''
  + sLineBreak + '  + ''   , table_name           as FldTable'''
  + sLineBreak + '  + ''   , ''''Active''''       as FldState'''
  + sLineBreak + '  + ''   , null                 as FldKind'''
  + sLineBreak + '  + ''   , null                 as FldRows'''
  + sLineBreak + '  + ''   , null                 as FldDescription'''
  + sLineBreak + '  + ''   , null                 as FldPrimaryKey'''
  + sLineBreak + '  + ''   , null                 as FldForeignKey'''
  + sLineBreak + '  + ''   , null                 as FldNote'''
  + sLineBreak + '  + '' from'''
  + sLineBreak + '  + ''     information_schema.tables'''
  + sLineBreak + '  + '' order by'''
  + sLineBreak + '  + ''    table_name''' // insert should honor this but it doesnt
//+ sLineBreak + '  --print(@s)'
  + sLineBreak + '  exec(@s)'
  + sLineBreak + ''
  + sLineBreak + '  -- insert fields'
  + sLineBreak + '    set @s = '''''
  + sLineBreak + '  + ''use '' + @d + '';'''
  + sLineBreak + '  + ''insert into DbaDatabase.dbo.TblField'''
  + sLineBreak + '  + '' select'''
  + sLineBreak + '  + ''     ''''Wks''''                                           as FldSystem'''
  + sLineBreak + '  + ''   , table_catalog                                         as FldDatabase'''
  + sLineBreak + '  + ''   , table_name                                            as FldTable'''
  + sLineBreak + '  + ''   , column_name                                           as FldField'''
  + sLineBreak + '  + ''   , ''''Active''''                                        as FldState'''
  + sLineBreak + '  + ''   , null                                                  as FldKind'''
  + sLineBreak + '  + ''   , data_type                                             as FldType'''
  + sLineBreak + '  + ''   , character_maximum_length                              as FldLength'''
  + sLineBreak + '  + ''   , case when is_nullable = ''''YES'''' then 1 else 0 end as FldIsNullable'''
  + sLineBreak + '  + ''   , null                                                  as FldIsPrimaryKey'''
  + sLineBreak + '  + ''   , null                                                  as FldIsForeignKey'''
  + sLineBreak + '  + ''   , ordinal_position                                      as FldOrder'''
  + sLineBreak + '  + ''   , null                                                  as FldDescription'''
  + sLineBreak + '  + ''   , null                                                  as FldNote'''
  + sLineBreak + '  + '' from'''
  + sLineBreak + '  + ''     information_schema.columns'''
  + sLineBreak + '  + '' where'''
  + sLineBreak + '  + ''     objectproperty(object_id(table_name), ''''IsTable'''') = 1'''
  + sLineBreak + '  + '' order by'''
  + sLineBreak + '  + ''     table_name'''
  + sLineBreak + '  + ''   , ordinal_position'''
//+ sLineBreak + '  + ''   , table_schema             as FldSchema'''
//+ sLineBreak + '  + ''   , case when character_maximum_length = -1 then ''''max'''' else character_maximum_length end as FldLength'''
//+ sLineBreak + '  --print(@s)'
  + sLineBreak + '    exec(@s)'
  + sLineBreak + ''
  + sLineBreak + '  -- next'
  + sLineBreak + '  fetch next from c1 into @d'
  + sLineBreak + 'end'
  + sLineBreak + '-- dispose'
  + sLineBreak + 'close c1'
  + sLineBreak + 'deallocate c1'
  ;
  // exec
  Result := TDbaRec.CmdExec(sql, aff, IvFbk);
  if not Result then
    IvFbk := 'Unable to rebuild databases definitions, ' + IvFbk
  else
    IvFbk := 'Databases definitions rebuilded, ' + IvFbk;
end;

function  TSystemSoapMainService.SystemDbaCreateDdlSoap(var IvHost, IvDateTimeCode, IvDdl, IvFbk: string): boolean;
// todo:
// , [FldUId]       [uniqueidentifier] ROWGUIDCOL   NOT NULL
var
  dbp, lgp, bkp: string; // data, log, backup path
  tit, dba, des, tbl, com, fld, typ, len, nul, pke, fke: string; // title, dba, descr, tbl, comma, fld, type, lenght, null, primarykey, foreignkey
  u, v, w: TDataset; // dba, tbl, fld
  idx: boolean; // fldid index
  sbu: TSbuRec;
begin
  // init
  IvHost         := UpperCase(TNetRec.Host);
  IvDateTimeCode := TDatRec.DatNowCode;
  tit := Format('WKS databases CREATE DDL script (%s - %s)', [IvHost, IvDateTimeCode]);
  Result := SystemDbaFilesPathsSoap(dbp, lgp, bkp, IvFbk);
  if not Result then
    Exit;

  // header
  sbu.Add('/**********************************************************************************\', true, 0 );
  sbu.Add(' *  '                                                                                          );
  sbu.Add(' *  ' + tit                                                                                    );
  sbu.Add(' *  '                                                                                          );
  sbu.Add(' *  create all databases and tables in a server instance'                                      );
  sbu.Add(' *  '                                                                                          );
  sbu.Add('\**********************************************************************************/'          );

  // dbaloop
  TDbaRec.DsFromSql('select * from DbaDatabase.dbo.TblDatabase order by FldDatabase', u);
  try
    while not u.Eof do begin
      // zip
      dba := u.FieldByName('FldDatabase').AsString;
      des := u.FieldByName('FldDescription').AsString;
      if des <> '' then des := ' -- ' + des;

      // build
      sbu.Anl(2);
      sbu.Add('------------------------------------------------------------------------------------ %s', [dba]);
      sbu.Add('USE [master]');
      sbu.Add('GO');

      sbu.Anl(2);
      sbu.Add('CREATE DATABASE [%s]', [dba]);
      sbu.Add('ON PRIMARY (NAME = N''%s''    , FILENAME = N''%s\%s.mdf''    , SIZE = 8192KB , FILEGROWTH = 65536KB)', [dba, dbp, dba]);
      sbu.Add('LOG ON     (NAME = N''%s_log'', FILENAME = N''%s\%s_log.ldf'', SIZE = 8192KB , FILEGROWTH = 65536KB)', [dba, lgp, dba]);
      sbu.Add('GO');

      sbu.Anl(2);
      sbu.Add('USE [%s]%s', [dba, des]);
      sbu.Add('GO');

      // tablesloop
      TDbaRec.DsFromSql(Format('select * from DbaDatabase.dbo.TblTable where FldDatabase = ''%s'' order by FldTable', [dba]), v);
      try
        while not v.Eof do begin
          // zip
          tbl := v.FieldByName('FldTable').AsString;
          des := v.FieldByName('FldDescription').AsString;
          if des <> '' then des := ' -- ' + des;
          idx := false;

          // build
          sbu.Anl(2);
          sbu.Add('CREATE TABLE [%s].[%s].[%s](%s', [dba, 'dbo', tbl, des]);

          // fieldsloop
          com := ' ';
          TDbaRec.DsFromSql(Format('select * from DbaDatabase.dbo.TblField where FldDatabase = ''%s'' and FldTable = ''%s'' order by FldOrder', [dba, tbl]), w);
          try
            while not w.Eof do begin
              // zip
              fld := '[' + w.FieldByName('FldField').AsString + ']';
              typ := '[' + w.FieldByName('FldType').AsString  + ']';
              len :=       w.FieldByName('FldLength').AsString;
              if len = '-1' then len := 'max';
              if (len <> '') and (Length(len) <= 4) then typ := typ + '(' + len + ')'; // skip [image](2147483647), max is (8000)
              nul := giif.Str(w.FieldByName('FldIsNullable'  ).AsBoolean, 'NULL', 'NOT NULL');
              pke := giif.Str(w.FieldByName('FldIsPrimaryKey').AsBoolean, 'PrimaryKey', '');
              fke := giif.Str(w.FieldByName('FldIsForeignKey').AsBoolean, 'ForeignKey', '');
              des :=          w.FieldByName('FldDescription').AsString;
              if des <> '' then des := Format(' -- %s %s %s', [pke, fke, des]);

              // build
              sbu.Add('  %s %-44s%-20s%16s%s', [com, fld, typ, nul, des]); // multipli di 4

              // fldidindex
              if (fld = '[FldId]') and (idx = false) then
                idx := true;

              // fieldnext
              w.Next;
              com := ',';
            end;
          finally
            FreeAndNil(w);
          end;

          // build
          sbu.Add(') ON [PRIMARY]');
          sbu.Add('GO');

          // index-unique
          if idx then begin
            sbu.Anl(2);
          //sbu.Add('CREATE UNIQUE NONCLUSTERED INDEX [IX_%s_FldId] ON [%s].[%s].[%s](', [tbl, dba, 'dbo', tbl]);
            sbu.Add('CREATE UNIQUE NONCLUSTERED INDEX [IX_%s] ON [%s].[%s].[%s]('      , [tbl, dba, 'dbo', tbl]);
            sbu.Add('    [FldId] ASC');
            sbu.Add(') ON [PRIMARY]');
            sbu.Add('GO');
          end;

          // tablenext
          v.Next;
        end;
      finally
        FreeAndNil(v);
      end;

      // dbanext
      u.Next;
    end;
  finally
    FreeAndNil(u);
  end;

  // end
  IvDdl := sbu.Text;
  IvFbk := tit + ' created';
end;

function  TSystemSoapMainService.SystemDbaDeleteDdlSoap(var IvHost, IvDateTimeCode, IvDdl, IvFbk: string): boolean;
var
  tit: string; // title
  sbu: TSbuRec;
begin
  // init
  IvHost         := UpperCase(TNetRec.Host);
  IvDateTimeCode := TDatRec.DatNowCode;
  tit := Format('WKS databases DELETE DDL script (%s - %s)', [IvHost, IvDateTimeCode]);

  // header
  sbu.Add('/**********************************************************************************\', true, 0 );
  sbu.Add(' *  '                                                                                          );
  sbu.Add(' *  ' + tit                                                                                    );
  sbu.Add(' *  '                                                                                          );
  sbu.Add(' *  delete all databases in a server instance'                                                 );
  sbu.Add(' *  '                                                                                          );
  sbu.Add('\**********************************************************************************/'          );

  // script
  sbu.Anl(2);
  sbu.Add('-- dbas');
  sbu.Add('declare @t table(FldDba varchar(64))');
  sbu.Add('insert into @t');
  sbu.Add('select');
  sbu.Add('    [name] as FldDba');
  sbu.Add('from');
  sbu.Add('    [master].[sys].[databases]');
  sbu.Add('where');
  sbu.Add('    [name] not in (''master'', ''model'', ''msdb'', ''tempdb'')');
  sbu.Add('and [name] like ''Dba%''');
  sbu.Add('--and [name] not in (''DbaPlace.bak'')');
  sbu.Add('order by 1');
  sbu.Add('--select * from @t');
  sbu.Anl(2);
  sbu.Add('-- cursor');
  sbu.Add('declare @b varchar(64) -- dba');
  sbu.Add('declare c cursor for select FldDba from @t  order by 1');
  sbu.Add('open c');
  sbu.Add('fetch next from c into @b');
  sbu.Add('while @@fetch_status = 0 begin');
  sbu.Add('    -- command');
  sbu.Add('    declare @x varchar(1024)');
  sbu.Add('    set @x =              ''alter database ['' + @b + ''] set single_user with rollback immediate;''');
  sbu.Add('    + char(13)+char(10) + ''drop  database ['' + @b + ''];''');
  sbu.Add('  --+ char(13)+char(10)');
  sbu.Add('  --+ ''go''');
  sbu.Add('  --+ char(13)+char(10)');
  sbu.Anl(2);
  sbu.Add('    -- go');
  sbu.Add('    print @x');
  sbu.Add('    exec(@x)');
  sbu.Anl(2);
  sbu.Add('    -- next');
  sbu.Add('    fetch next from c into @b');
  sbu.Add('end');
  sbu.Anl(2);
  sbu.Add('-- cursor dispose');
  sbu.Add('close c');
  sbu.Add('deallocate c');
  sbu.Anl(2);
  sbu.Add('-- end');
  sbu.Add('select ''System databases deletion done'' as FldResult');

  // end
  IvDdl := sbu.Text;
  IvFbk := tit + ' created';
  Result := true;
end;

function  TSystemSoapMainService.SystemDbaBackupDdlSoap(var IvHost, IvDateTimeCode, IvDdl, IvFbk: string): boolean;
var
  tit: string; // title
  sbu: TSbuRec;
begin
  // init
  IvHost         := UpperCase(TNetRec.Host);
  IvDateTimeCode := TDatRec.DatNowCode;
  tit := Format('WKS databases BACKUP DDL script (%s - %s)', [IvHost, IvDateTimeCode]);

  // header
  sbu.Add('/**********************************************************************************\', true, 0 );
  sbu.Add(' *  '                                                                                          );
  sbu.Add(' *  ' + tit                                                                                    );
  sbu.Add(' *  '                                                                                          );
  sbu.Add(' *  backup in the specified location all databases in a server instance'                       );
  sbu.Add(' *  if the backup file already exists it will overwrite it'                                    );
  sbu.Add(' *  if the backup file does not exist it will create it'                                       );
  sbu.Add(' *  '                                                                                          );
  sbu.Add('\**********************************************************************************/'          );

  // script
  sbu.Anl(2);
  sbu.Add('-- vars');
  sbu.Add('declare @p varchar(256); set @p = ''C:\$Bak\Dba'' -- rootpath without \Year\Week');
  sbu.Anl(2);
  sbu.Add('-- calc');
  sbu.Add('declare @d varchar(20) ; set @d = convert(varchar, getdate(), 112)                                                      -- date');
  sbu.Add('declare @y varchar(20) ; set @y = convert(varchar, datepart(yyyy, getdate()))                                           -- year');
  sbu.Add('declare @w varchar(20) ; set @w = convert(varchar, datepart(ww, getdate())); set @w = replicate(''0'', 2-len(@w)) + @w  -- week');
  sbu.Anl(2);
  sbu.Add('set @p = @p + ''\'' + @y + ''\'' + @w');
  sbu.Add('print ''Backup dir '' + @p');
  sbu.Anl(2);
  sbu.Add('-- ensuredir');
  sbu.Add('declare @r int -- result, exists');
  sbu.Add('exec master.dbo.xp_fileexist @p, @r output');
  sbu.Add('if @r = 0 begin');
  sbu.Add('  print ''Create dir '' + @p');
  sbu.Add('  exec master.dbo.xp_create_subdir @p');
  sbu.Add('end');
  sbu.Anl(2);
  sbu.Add('-- cursor');
  sbu.Add('declare @n varchar(256) -- databasename');
  sbu.Add('declare @f varchar(256) -- filenameforbackup');
  sbu.Add('declare c cursor for select [name] from master.dbo.sysdatabases');
  sbu.Add('where');
  sbu.Add('    [name] like ''Dba%''');
  sbu.Add('and [name] not like ''DbaZzz%''');
  sbu.Add('and [name] not like ''DbaLfoundry%''');
  sbu.Add('--and [name] not in ('''')');
  sbu.Add('order by 1');
  sbu.Add('open c');
  sbu.Add('fetch next from c into @n');
  sbu.Add('while @@fetch_status = 0 begin');
  sbu.Add('    -- filenameforbackup');
  sbu.Add('    set @f = @p + ''\'' + @n + ''.bak''');
  sbu.Add('  --print(@f)');
  sbu.Anl(2);
  sbu.Add('    -- doit');
  sbu.Add('    backup database @n to disk = @f');
  sbu.Anl(2);
  sbu.Add('    -- next');
  sbu.Add('    fetch next from c into @n');
  sbu.Add('end');
  sbu.Anl(2);
  sbu.Add('-- cursor dispose');
  sbu.Add('close c');
  sbu.Add('deallocate c');
  sbu.Anl(2);
  sbu.Add('-- end');
  sbu.Add('select ''System databases backup done'' as FldResult');

  // end
  IvDdl := sbu.Text;
  IvFbk := tit + ' created';
  Result := true;
end;

function  TSystemSoapMainService.SystemDbaRestoreDdlSoap(var IvHost, IvDateTimeCode, IvDdl, IvFbk: string): boolean;
var
  tit: string; // title
  sbu: TSbuRec;
  dp, lp, bp: string; // data, log, backup path
begin
  // init
  IvHost         := UpperCase(TNetRec.Host);
  IvDateTimeCode := TDatRec.DatNowCode;
  tit := Format('WKS databases RESTORE DDL script (%s - %s)', [IvHost, IvDateTimeCode]);
  Result := SystemDbaFilesPathsSoap(dp, lp, bp, IvFbk);
  if not Result then
    Exit;

  // header
  sbu.Add('/**********************************************************************************\', true, 0 );
  sbu.Add(' *  '                                                                                          );
  sbu.Add(' *  ' + tit                                                                                    );
  sbu.Add(' *  '                                                                                          );
  sbu.Add(' *  restore all databases backup files found in a directory'                                   );
  sbu.Add(' *  if the database already exists it will overwrite it'                                       );
  sbu.Add(' *  if the database does not exist it will create it'                                          );
  sbu.Add(' *  to enable xp_cmdshell: rightclick server > Facets > Surface Area Configuration > XPCmshellEnbled > true or run this:');
  sbu.Add(' *  ');
  sbu.Add(' *  EXEC sp_configure ''show advanced options'', 1 -- to allow advanced options to be changed' );
  sbu.Add(' *  RECONFIGURE                                    -- to update the currently configured value');
  sbu.Add(' +  GO');
  sbu.Add(' *  ');
  sbu.Add(' *  EXEC sp_configure ''xp_cmdshell'', 1           -- to enable the feature'                   );
  sbu.Add(' *  RECONFIGURE                                    -- to update the currently configured value');
  sbu.Add(' *  GO');
  sbu.Add(' *  ');
  sbu.Add(' *  the use of the following funcions require mssql 2012 at least'                             );
  sbu.Add(' *  - select serverproperty(''InstanceDefaultDataPath'')'                                      );
  sbu.Add(' *  - serverproperty(''InstanceDefaultLogPath'')'                                              );
  sbu.Add(' *  '                                                                                          );
  sbu.Add('\**********************************************************************************/'          );

  // script
  sbu.Anl(2);
  sbu.Add('-- vars');
  sbu.Add('declare @k varchar(64); set @k = ''X:\$Bak\Dba\2020\50''                                          -- backuppath (source)');
  sbu.Add('declare @e varchar(16); set @e = ''.bak''                                                         -- backupfileext');
  sbu.Add('declare @r varchar(96); set @r = ''C:\Program Files\Microsoft SQL Server\MSSQL12.WKS\MSSQL\DATA'' -- restorepath (target)');
  sbu.Add('--print @r');
  sbu.Anl(2);
  sbu.Add('-- files & dbas');
  sbu.Add('declare @f table(FldFile varchar(64)) -- files');
  sbu.Add('declare @l varchar(64); set @l = ''dir /B '' + @k + ''\*'' + @e -- filesfilter');
  sbu.Add('insert into @f exec master.wks.xp_cmdshell @l');
  sbu.Add('select FldFile, substring(FldFile, 0, charindex(''.'', FldFile)) as FldDba from @f where FldFile like ''Dba%'' /*and FldFile not in (''DbaPlace.bak'')*/ order by 1');
  sbu.Anl(2);
  sbu.Add('-- cursor');
  sbu.Add('declare @i varchar(64) -- file');
  sbu.Add('declare @b varchar(64) -- dba' );
  sbu.Add('declare c cursor for select FldFile, substring(FldFile, 0, charindex(''.'', FldFile)) as FldDba from @f where FldFile like ''Dba%'' /*and FldFile not in (''DbaPlace.bak'')*/ order by 1');
  sbu.Add('open c');
  sbu.Add('fetch next from c into @i, @b' );
  sbu.Add('while @@fetch_status = 0 begin');
  sbu.Add('    -- command');
  sbu.Add('    declare @x varchar(1024)');
  sbu.Add('    set @x = ');
  sbu.Add('    --  RESTORE DATABASE [DbaAgent]');
  sbu.Add('    --  FROM DISK = N''X:\$Bak\Dba\2020\50\DbaAgent.bak'' WITH FILE = 1');
  sbu.Add('    --, MOVE N''DbaAgent'' TO N''C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbaAgent.mdf''');
  sbu.Add('    --, MOVE N''DbaAgent_log'' TO N''C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbaAgent_log.ldf'',  NOUNLOAD,  STATS = 5');
  sbu.Add('       ''restore database ['' + @b + '']''');
  sbu.Add('    +  '' from disk=N'''''' + @k + ''\'' + @i + '''''' with file=1''');
  sbu.Add('    + '', move N'''''' + @b + '''''' to N''''''     + @r + ''\'' + @b + ''.mdf''''''     -- with db file move' );
  sbu.Add('    + '', move N'''''' + @b + ''_log'''' to N'''''' + @r + ''\'' + @b + ''_log.ldf'''''' -- with log file move');
  sbu.Add('    + '', NOUNLOAD''                                                                     -- ?'                 );
  sbu.Add('    + '', stats=5''                                                                      -- ?'                 );
  sbu.Add('  --+ char(13)+char(10)');
  sbu.Add('  --+ ''go''');
  sbu.Add('  --+ char(13)+char(10)');
  sbu.Anl(2);
  sbu.Add('    -- go');
  sbu.Add('    print @x');
  sbu.Add('    exec(@x)');
  sbu.Anl(2);
  sbu.Add('    -- next');
  sbu.Add('    fetch next from c into @i, @b');
  sbu.Add('end');
  sbu.Anl(2);
  sbu.Add('-- cursor dispose');
  sbu.Add('close c');
  sbu.Add('deallocate c');
  sbu.Anl(2);
  sbu.Add('-- end');
  sbu.Add('select ''System databases restore done'' as FldResult');

  // end
  IvDdl := sbu.Text;
  IvFbk := tit + ' created';
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Init'}
initialization
   InvRegistry.RegisterInvokableClass(TSystemSoapMainService);
{$ENDREGION}

end.

