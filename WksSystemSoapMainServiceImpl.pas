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
  // system class that implements the corresponding soap invokable interface
  TSystemSoapMainService = class(TInvokableClass, ISystemSoapMainService)
  public
    // system methods
    function  SystemInfoSoap                (var IvFbk: string): boolean; stdcall;
    function  SystemDescriptionSoap         (var IvDescription: string; var IvFbk: string): boolean; stdcall;
    function  SystemPrivacySoap             (var IvPrivacy: string; var IvFbk: string): boolean; stdcall;
    function  SystemLicenseSoap             (var IvLicense: string; var IvFbk: string): boolean; stdcall;
    function  SystemCopyrightSoap           (var IvCopyright: string; var IvFbk: string): boolean; stdcall;
    function  SystemSysRemGetSoap           (var IvSysRem: TSysRem; var IvFbk: string): boolean; stdcall;
  //function  SystemContentGetSoap          (const IvId: integer; var IvContent: string; const IvDefault: string; var IvFbk: string): boolean; stdcall;
  //function  SystemContentSetSoap          (const IvId: integer; const IvContent: string; var IvFbk: string): boolean; stdcall;
    // person/user methods
    function  SystemPersonInitSoap          (const IvPerson: string; var IvPersonRem: TPerRem; var IvFbk: string): boolean; stdcall;
    function  SystemUserExistsSoap          (const IvUsername: string; var IvFbk: string): boolean; stdcall;
    function  SystemUserIsActiveSoap        (const IvUsername: string; var IvFbk: string): boolean; stdcall;
    function  SystemUserIsAuthenticatedSoap (const IvUsername, IvPassword: string; var IvFbk: string): boolean; stdcall;
    function  SystemUserInitSoap            (const IvUsername: string; var IvUserRem: TUsrRem; var IvFbk: string): boolean; stdcall;
    // organization/theme methods
    function  SystemOrganizationInitSoap    (const IvOrganization, IvWww: string; var IvOrganizationRem: TOrgRem; var IvFbk: string): boolean; stdcall;
    function  SystemThemeInitSoap           (const IvOrganizationId: integer; var IvThemeRem: TTheRem; var IvFbk: string): boolean; stdcall;
    // member methods
    function  SystemMemberInitSoap          (const IvOrganization, IvUsername: string; var IvMemberRem: TMbrRem; IvFbk: string): boolean; stdcall;
    // binary methods
    function  SystemBinaryExistsSoap        (const IvBinary: string; var IvFbk: string): boolean; stdcall;
    function  SystemBinaryVersionIsOkSoap   (const IvBinary, IvVer: string; var IvFbk: string): boolean; stdcall;
    // session methods
    function  SystemSessionInsertSoap       (const IvDateTimeBegin: TDateTime               ; const IvKind: string; const IvSessionId, IvFingerprintId: cardinal; const IvIpLan, IvDomain, IvComputer, IvOsLogin, IvClient, IvVersion, IvServer, IvOrganization, IvUsername: string; var IvFbk: string): boolean; stdcall;
    function  SystemSessionCloseSoap        (const IvDateTimeBegin, IvDateTimeEnd: TDateTime; const IvKind: string; const IvSessionId, IvFingerprintId: cardinal; const IvIpLan, IvDomain, IvComputer, IvOsLogin, IvClient, IvVersion, IvServer, IvOrganization, IvUsername: string; var IvFbk: string): boolean; stdcall;
    // object methods
    function  SystemObjIdNextSoap           (const IvObj: string; var IvIdNext: integer; var IvFbk: string): boolean; stdcall;
    function  SystemObjNewSoap              (const IvObj, IvIdOrPath, IvObject, IvObjectKind, IvContentKind, IvOrganization, IvAuthor: string; var IvIdNew: integer): boolean; stdcall;
    function  SystemObjTreeContentSoap      (const IvObj, IvIdOrPath: string; IvWithChild, IvDescriptionBlockAdd, IvHeaderAndFooterAdd, IvCommentRemove, IvLinesEmptyRemove: boolean                          ; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean; stdcall;
    function  SystemObjTreeContentSaveSoap  (const IvObj, IvIdOrPath: string; IvWithChild, IvDescriptionBlockAdd, IvHeaderAndFooterAdd, IvCommentRemove, IvLinesEmptyRemove: boolean; IvRemoteFileSpec: string; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean; stdcall;
    function  SystemObjFieldGetSoap         (const IvObj, IvIdOrPath, IvField: string;   var IvValue: variant; const IvDefault: variant): boolean; stdcall;
    function  SystemObjFieldSetSoap         (const IvObj, IvIdOrPath, IvField: string; const IvValue: variant): boolean; stdcall;
    // dbacmd methods
    function  SystemDbaCmdExecSoap          (const IvSql: string; var IvAffected: integer; var IvFbk: string; IvTimeoutSec: integer): boolean; stdcall;
    // dba methods
    function  SystemDbaInfosSoap            (var IvBuild, IvMajorVersion, IvMinorVersion, IvBuildType, IvUpdateLevel, IvUpdateReference, IvFbk: string): boolean; stdcall;
    function  SystemDbaFilesPathsSoap       (var IvDataPath, IvLogPath, IvBackupPath, IvFbk: string): boolean; stdcall;
    function  SystemDbaRebuildSoap          (var IvFbk: string; IvReset: boolean = false): boolean; stdcall;
    function  SystemDbaCreateDdlSoap        (var IvHost, IvDateTimeCode, IvDdl, IvFbk: string): boolean; stdcall;
    function  SystemDbaDeleteDdlSoap        (var IvHost, IvDateTimeCode, IvDdl, IvFbk: string): boolean; stdcall;
    function  SystemDbaBackupDdlSoap        (var IvHost, IvDateTimeCode, IvDdl, IvFbk: string): boolean; stdcall;
    function  SystemDbaRestoreDdlSoap       (var IvHost, IvDateTimeCode, IvDdl, IvFbk: string): boolean; stdcall;
    // tbl methods
    function  SystemTblExistsSoap           (const IvTbl: string): boolean; stdcall;
    function  SystemTblIdExistsSoap         (const IvTbl: string; IvId: integer): boolean; stdcall;
    function  SystemTblIdMaxSoap            (const IvTbl, IvWhere: string): integer; stdcall;
    function  SystemTblIdAvailableSoap      (const IvTbl, IvWhere: string): integer; stdcall;
    function  SystemTblIdNextSoap           (const IvTbl: string; IvUseIdAvailable: boolean): integer; stdcall;
    function  SystemTblCheckSoap            (const IvSys, IvDba, IvTbl: string; var IvFbk: string): boolean; stdcall;
    // rec methods
    function  SystemRecInsertSoap           (const IvTbl: string; const IvValueVec: {TVariantVector}TArray<variant>; var IvFbk: string): boolean; stdcall;
    // fld methods
    function  SystemFldHasValueSoap         (const IvTbl, IvFld: string; const IvValue: variant; var IvFbk: string): boolean; stdcall;
    function  SystemFldGetSoap              (const IvTbl, IvFld: string; IvId: integer  ;   var IvValue: variant; IvDefault: variant; var IvFbk: string): boolean; stdcall;
    function  SystemFldGetWhereSoap         (const IvTbl, IvFld: string; IvWhere: string;   var IvValue: variant; IvDefault: variant; var IvFbk: string): boolean; stdcall;
    function  SystemFldSetSoap              (const IvTbl, IvFld: string; IvId: integer  ; const IvValue: variant                    ; var IvFbk: string): boolean; stdcall;
    function  SystemFldSetWhereSoap         (const IvTbl, IvFld: string; IvWhere: string; const IvValue: variant                    ; var IvFbk: string): boolean; stdcall;
    function  SystemFldIncSoap              (const IvTbl, IvFld: string; IvWhere: string                                            ; var IvFbk: string): boolean; stdcall;
    function  SystemFldDecSoap              (const IvTbl, IvFld: string; IvWhere: string                                            ; var IvFbk: string): boolean; stdcall;
    function  SystemFldDoMathSoap           (const IvTbl, IvFld: string; IvWhere: string; IvOperator: char; IvOperand: string       ; var IvFbk: string): boolean; stdcall;
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
function TSystemSoapMainService.SystemInfoSoap(var IvFbk: string): boolean;
begin
  IvFbk := Format('%s SYSTEM Soap Main Service (%s - %s)', [TSysRec.ACRONYM, TBynRec.Info, DateTimeToStr(Now)]);
  Result := true;
end;

function TSystemSoapMainService.SystemDescriptionSoap(var IvDescription, IvFbk: string): boolean;
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
  Result := TObjRec.FieldGet('System', '103', 'FldDescription', vnt, def);
  IvDescription := vnt;
  IvFbk := 'Ok';
end;

function TSystemSoapMainService.SystemPrivacySoap(var IvPrivacy, IvFbk: string): boolean;
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

function TSystemSoapMainService.SystemLicenseSoap(var IvLicense, IvFbk: string): boolean;
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

function TSystemSoapMainService.SystemCopyrightSoap(var IvCopyright, IvFbk: string): boolean;
begin
  IvCopyright := TSysRec.Copyright;
  IvFbk := 'Ok';
  Result := true;
end;

function TSystemSoapMainService.SystemSysRemGetSoap(var IvSysRem: TSysRem; var IvFbk: string): boolean;
begin
  IvFbk := 'Ok';
  Result := true;

  IvSysRem.Author      := TSysRec.AUTHOR;
  IvSysRem.Architect   := TSysRec.AUTHOR;
  IvSysRem.Acronym     := TSysRec.ACRONYM;
  IvSysRem.Name        := TSysRec.NAME;
  IvSysRem.Description := TSysRec.DESCRIPTION;
  IvSysRem.Copyright   := TSysRec.Copyright;
  IvSysRem.Slogan      := TSysRec.SLOGAN;
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
//IvSysRem.Smtp.Smtp          := o.S['Smtp.Smtp'         ];
  IvSysRem.Smtp.Host          := o.S['Smtp.Host'         ];
  IvSysRem.Smtp.Port          := o.S['Smtp.Port'         ];
  IvSysRem.Smtp.Username      := o.S['Smtp.Username'     ];
  IvSysRem.Smtp.Password      := o.S['Smtp.Password'     ];

  if not Assigned(IvSysRem.Pop3) then IvSysRem.f := TPopRem.Create;
//IvSysRem.Pop3.Pop3          := o.S['Pop3.Pop3'         ];
  IvSysRem.Pop3.Host          := o.S['Pop3.Host'         ];
  IvSysRem.Pop3.Port          := o.S['Pop3.Port'         ];
  IvSysRem.Pop3.Username      := o.S['Pop3.Username'     ];
  IvSysRem.Pop3.Password      := o.S['Pop3.Password'     ];
  IvSysRem.Pop3.TrySecureAuth := o.B['Pop3.TrySecureAuth'];
  IvSysRem.Pop3.NewerMsgFirst := o.B['Pop3.NewerMsgFirst'];
  IvSysRem.Pop3.CleanOnExit   := o.B['Pop3.CleanOnExit'  ];
}
end;

//function TSystemSoapMainService.SystemContentGetSoap(const IvId: integer; var IvContent: string; const IvDefault: string; var IvFbk: string): boolean;
//begin
//
//end;

//function TSystemSoapMainService.SystemContentSetSoap(const IvId: integer; const IvContent: string; var IvFbk: string): boolean;
//begin
//
//end;
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
function  TSystemSoapMainService.SystemOrganizationInitSoap(const IvOrganization, IvWww: string; var IvOrganizationRem: TOrgRem; var IvFbk: string): boolean; // [B]
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
  Result := org.InitDba(IvOrganization, IvWww, IvFbk);

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
  IvOrganizationRem.WwwAlt        := org.WwwAlt;
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
  IvThemeRem.State              := the.State             ;
  IvThemeRem.Grade              := the.Grade             ;
  IvThemeRem.FontFamily         := the.FontFamily        ; // Inconsolata, Consolas, Verdana, ...
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
  IvMemberRem.ObjectId     := mbr.ObjectId    ;
  IvMemberRem.Number       := mbr.Number      ;
  IvMemberRem.Member       := mbr.Member      ;
  IvMemberRem.Email        := mbr.Email       ;
  IvMemberRem.State        := mbr.State       ;
  IvMemberRem.Organization := mbr.Organization;
  IvMemberRem.Department   := mbr.Department  ;
  IvMemberRem.Area         := mbr.Area        ;
  IvMemberRem.Team         := mbr.Team        ;
  IvMemberRem.Site         := mbr.Site        ;
  IvMemberRem.Building     := mbr.Building    ;
  IvMemberRem.Workstation  := mbr.Workstation ;
  IvMemberRem.Phone        := mbr.Phone       ;
  IvMemberRem.JobTitle     := mbr.JobTitle    ;
  IvMemberRem.JobRole      := mbr.JobRole     ;
  IvMemberRem.JobLevel     := mbr.JobLevel    ;
  IvMemberRem.&Unit        := mbr.&Unit       ;
  IvMemberRem.CostCenter   := mbr.CostCenter  ;
  IvMemberRem.BadgeBytes   := TBarRec.BarFromGraphic(mbr.BadgeGraphic);
end;
  {$ENDREGION}

  {$REGION 'Binary'}
function  TSystemSoapMainService.SystemBinaryExistsSoap(const IvBinary: string; var IvFbk: string): boolean;
begin
  Result := TSysRec.BinaryExists(IvBinary, IvFbk);
end;

function  TSystemSoapMainService.SystemBinaryVersionIsOkSoap(const IvBinary, IvVer: string; var IvFbk: string): boolean;
begin
  Result := TSysRec.BinaryVersionIsOk(IvBinary, IvVer, IvFbk);
end;
  {$ENDREGION}

  {$REGION 'Session'}
function  TSystemSoapMainService.SystemSessionInsertSoap(const IvDateTimeBegin: TDateTime              ; const IvKind: string; const IvSessionId, IvFingerprintId: cardinal; const IvIpLan, IvDomain, IvComputer, IvOsLogin, IvClient, IvVersion, IvServer, IvOrganization, IvUsername: string; var IvFbk: string): boolean;
var
  ses: TSesRec;
begin
  ses.DateTimeBegin := IvDateTimeBegin ; // FldDateTimeBegin
  ses.DateTimeEnd   := TDatRec.ZERO_DAT; // FldDateTimeEnd
  ses.Kind          := IvKind          ; // FldKind
  ses.SessionId     := IvSessionId     ; // FldSessionId
  ses.FingerprintId := IvFingerprintId ; // FldFingerprintId
  ses.IpLan         := IvIpLan         ; // FldIpLan
  ses.Domain        := IvDomain        ; // FldDomain
  ses.Computer      := IvComputer      ; // FldComputer
  ses.OsLogin       := IvOsLogin       ; // FldOsLogin
  ses.Client        := IvClient        ; // FldClient
  ses.Version       := IvVersion       ; // FldVersion
  ses.Server        := IvServer        ; // FldServer
  ses.Organization  := IvOrganization  ; // FldOrganization
  ses.Username      := IvUsername      ; // FldUsername
  Result := ses.Insert(IvFbk);
end;

function  TSystemSoapMainService.SystemSessionCloseSoap(const IvDateTimeBegin, IvDateTimeEnd: TDateTime; const IvKind: string; const IvSessionId, IvFingerprintId: cardinal; const IvIpLan, IvDomain, IvComputer, IvOsLogin, IvClient, IvVersion, IvServer, IvOrganization, IvUsername: string; var IvFbk: string): boolean;
var
  ses: TSesRec;
begin
  ses.DateTimeBegin := IvDateTimeBegin ; // FldDateTimeBegin
  ses.DateTimeEnd   := TDatRec.ZERO_DAT; // FldDateTimeEnd
  ses.Kind          := IvKind          ; // FldKind
  ses.SessionId     := IvSessionId     ; // FldSessionId
  ses.FingerprintId := IvFingerprintId ; // FldFingerprintId
  ses.IpLan         := IvIpLan         ; // FldIpLan
  ses.Domain        := IvDomain        ; // FldDomain
  ses.Computer      := IvComputer      ; // FldComputer
  ses.OsLogin       := IvOsLogin       ; // FldOsLogin
  ses.Client        := IvClient        ; // FldClient
  ses.Version       := IvVersion       ; // FldVersion
  ses.Server        := IvServer        ; // FldServer
  ses.Organization  := IvOrganization  ; // FldOrganization
  ses.Username      := IvUsername      ; // FldUsername

//ses.Reset // *** done in gses.Close ***

  Result := ses.Close(IvFbk); 
end;
  {$ENDREGION}

  {$REGION 'Object'}
function  TSystemSoapMainService.SystemObjIdNextSoap(const IvObj: string; var IvIdNext: integer; var IvFbk: string): boolean;
begin
  Result := TObjRec.IdNext(IvObj, IvIdNext, IvFbk);
end;

function  TSystemSoapMainService.SystemObjNewSoap(const IvObj, IvIdOrPath, IvObject, IvObjectKind, IvContentKind, IvOrganization, IvAuthor: string; var IvIdNew: integer): boolean;
begin
  Result := TObjRec.DbaNew(IvObj, IvIdOrPath, IvObject, IvObjectKind, IvContentKind, IvOrganization, IvAuthor, IvIdNew);
end;

function  TSystemSoapMainService.SystemObjTreeContentSoap(const IvObj, IvIdOrPath: string; IvWithChild, IvDescriptionBlockAdd, IvHeaderAndFooterAdd, IvCommentRemove, IvLinesEmptyRemove: boolean; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean;
begin
  // tree contents flattened
  Result := TDbaRec.ObjTreeContentDba(IvObj, IvIdOrPath, IvWithChild, IvDescriptionBlockAdd, IvHeaderAndFooterAdd, IvCommentRemove, IvLinesEmptyRemove, IvAffected, IvObjName, IvHTreeContent, IvFbk);
end;

function  TSystemSoapMainService.SystemObjTreeContentSaveSoap(const IvObj, IvIdOrPath: string; IvWithChild, IvDescriptionBlockAdd, IvHeaderAndFooterAdd, IvCommentRemove, IvLinesEmptyRemove: boolean; IvRemoteFileSpec: string; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean;
var
  stl: TStringList;
begin
  // tree contents flattened
  Result := TDbaRec.ObjTreeContentDba(IvObj, IvIdOrPath, IvWithChild, IvDescriptionBlockAdd, IvHeaderAndFooterAdd, IvCommentRemove, IvLinesEmptyRemove, IvAffected, IvObjName, IvHTreeContent, IvFbk);

  // save locally (but remotely-executed from a client)
  stl := TStringList.Create;
  try
    // no-multi-save-template
    stl.Text := IvHTreeContent;
    stl.SaveToFile(IvRemoteFileSpec); // *** now... local ***
    IvFbk := Format('%s tree Content flattened and saved to: %s', [IvObj, IvRemoteFileSpec]);

    // yes-multi-save-template
    // to be implemented, see CodeClient, CodeSave
  finally
    stl.Free;
  end;
end;

function  TSystemSoapMainService.SystemObjFieldGetSoap(const IvObj, IvIdOrPath, IvField: string; var IvValue: variant; const IvDefault: variant): boolean;
begin
  Result := TObjRec.FieldGet(IvObj, IvIdOrPath, IvField, IvValue, IvDefault);
end;

function  TSystemSoapMainService.SystemObjFieldSetSoap(const IvObj, IvIdOrPath, IvField: string; const IvValue: variant): boolean;
begin
  Result := TObjRec.FieldSet(IvObj, IvIdOrPath, IvField, IvValue);
end;
  {$ENDREGION}

  {$REGION 'Dba'}
function TSystemSoapMainService.SystemDbaCmdExecSoap(const IvSql: string; var IvAffected: integer; var IvFbk: string; IvTimeoutSec: integer): boolean;
begin
  Result := TDbaRec.CmdExec(IvSql, IvAffected, IvFbk, IvTimeoutSec);
end;

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

function  TSystemSoapMainService.SystemDbaRebuildSoap(var IvFbk: string; IvReset: boolean = false): boolean;
var
  sql: TSbuRec;
  aff: integer; // affected
begin
  Result := false;

  // sql
if IvReset then begin
  sql.Add('-- reset');
  sql.Add('delete from DbaSystem.dbo.TblServer   where FldSystem = ''Wks''');
  sql.Add('delete from DbaSystem.dbo.TblDatabase where FldSystem = ''Wks''');
  sql.Add('delete from DbaSystem.dbo.TblTable    where FldSystem = ''Wks''');
  sql.Add('delete from DbaSystem.dbo.TblField    where FldSystem = ''Wks''');
  sql.Add('delete from DbaSystem.dbo.TblIndex    where FldSystem = ''Wks''');
//sql.Add('delete from DbaSystem.dbo.TblAccount  where FldSystem = ''Wks''');
end;
  sql.Add('-- vars');
  sql.Add('declare @dba sysname       -- database name');
  sql.Add('declare @tbl sysname       -- table');
  sql.Add('declare @sql nvarchar(max) -- query');
  sql.Add('');
  sql.Add('/* SERVER */');
  sql.Add('-- server insert if not exist');
  sql.Add('if exists (select 1 from DbaSystem.dbo.TblServer where FldSystem = ''Wks'')');
  sql.Add('    print(''Wks server entry already present'')');
  sql.Add('else begin');
  sql.Add('    insert into DbaSystem.dbo.TblServer');
  sql.Add('    select');
  sql.Add('        ''Wks''                                      as FldSystem');
  sql.Add('      , ''WKS''                                      as FldServer');
  sql.Add('      , ''Cloud''                                    as FldLocation');
  sql.Add('      , ''Working Knowledge System database server'' as FldPurpose');
  sql.Add('      , ''VPS1''                                     as FldKind');
  sql.Add('      , ''Active''                                   as FldState');
  sql.Add('      , null                                         as FldNote');
  sql.Add('    print(''Wks server NEW entry created'')');
  sql.Add('end;');
  sql.Add('');
  sql.Add('');
  sql.Add('/* DATABASES */');
  sql.Add('-- databases phisical');
  sql.Add('declare cur cursor fast_forward for');
  sql.Add('select');
  sql.Add('    name as FldDatabase');
  sql.Add('from');
  sql.Add('    master.dbo.sysdatabases');
  sql.Add('where');
  sql.Add('    name like ''Dba%''');
  sql.Add('order by');
  sql.Add('    name');
  sql.Add('');
  sql.Add('-- databases phisical walk');
  sql.Add('open cur');
  sql.Add('fetch next from cur into @dba');
  sql.Add('while @@fetch_status = 0 begin');
  sql.Add('');
  sql.Add('    -- dba definition insert if not exists');
  sql.Add('    if exists (select 1 from DbaSystem.dbo.TblDatabase where FldSystem = ''Wks'' and FldDatabase = @dba)');
  sql.Add('        print(''Wks '' + @dba + '' database entry already present'')');
  sql.Add('    else begin');
  sql.Add('        insert into DbaSystem.dbo.TblDatabase');
  sql.Add('        select');
  sql.Add('            ''Wks''    as FldSystem');
  sql.Add('          , @dba       as FldDatabase');
  sql.Add('          , null       as FldPurpose');
  sql.Add('          , null       as FldKind');
  sql.Add('          , ''Active'' as FldState');
  sql.Add('          , null       as FldNote');
  sql.Add('        print(''Wks '' + @dba + '' database NEW entry created'')');
  sql.Add('    end;');
  sql.Add('');
  sql.Add('    -- database phisical next');
  sql.Add('    fetch next from cur into @dba');
  sql.Add('end');
  sql.Add('close cur');
  sql.Add('deallocate cur');
  sql.Add('');
  sql.Add('');
  sql.Add('/* TABLES */');
  sql.Add('-- databases phisical');
  sql.Add('declare cur cursor fast_forward for');
  sql.Add('select');
  sql.Add('    name as FldDatabase             -- FldDatabase');
  sql.Add('from');
  sql.Add('    master.dbo.sysdatabases         -- DbaSystem.dbo.TblDatabase');
  sql.Add('where');
  sql.Add('    name like ''Dba%''              -- FldSystem = ''Wks''');
  sql.Add('order by');
  sql.Add('    FldDatabase');
  sql.Add('');
  sql.Add('-- databases phisical walk');
  sql.Add('open cur');
  sql.Add('fetch next from cur into @dba');
  sql.Add('while @@fetch_status = 0 begin');
  sql.Add('    print (''--================== database: '' + @dba)');
  sql.Add('');
  sql.Add('    -- tables phisical');
  sql.Add('    set @sql = ''');
  sql.Add('    declare cu2 cursor fast_forward for');
  sql.Add('    select t.name');
  sql.Add('    from   '' + @dba + ''.sys.tables t');
  sql.Add('    join   '' + @dba + ''.sys.schemas s on t.schema_id = s.schema_id');
  sql.Add('    where  s.name = ''''dbo'''';');
  sql.Add('');
  sql.Add('    -- tables phisical walk');
  sql.Add('    declare @tbl sysname');
  sql.Add('    open cu2');
  sql.Add('    fetch next from cu2 into  @tbl');
  sql.Add('    while @@fetch_status = 0 begin');
  sql.Add('        print(''''---------- table: '''' + @tbl)');
  sql.Add('');
  sql.Add('        -- table definition insert if not exists');
  sql.Add('        if exists (select 1 from DbaSystem.dbo.Tbltable where FldSystem = ''''Wks'''' and FldDatabase = '''''' + @dba + '''''' and FldTable = @tbl)');
  sql.Add('            print(''''Wks '' + @dba + ''.dbo.'''' + @tbl + '''' table entry already present'''')');
  sql.Add('        else begin');
  sql.Add('            insert into DbaSystem.dbo.TblTable');
  sql.Add('            select');
  sql.Add('                ''''Wks''''          as FldSystem');
  sql.Add('              , '''''' + @dba + '''''' as FldDatabase');
  sql.Add('              , @tbl             as FldTable');
  sql.Add('              , null             as FldPurpose');
  sql.Add('              , ''''Table''''    as FldKind');
  sql.Add('              , ''''Active''''   as FldState');
  sql.Add('              , null             as FldNote');
  sql.Add('              , null             as FldOrder');
  sql.Add('              , null             as FldFieldCount');
  sql.Add('              , null             as FldRowCount');
  sql.Add('              , null             as FldRecordOldest');
  sql.Add('              , null             as FldRecordYoungest');
  sql.Add('              , null             as FldSizeMb');
  sql.Add('              , null             as FldPrimaryKey');
  sql.Add('              , null             as FldForeignKey');
  sql.Add('              , null             as FldTable2');
  sql.Add('              , null             as FldPurpose2');
  sql.Add('            print(''''Wks '' + @dba + ''.dbo.'''' + @tbl + '''' table NEW entry created'''')');
  sql.Add('        end;');
  sql.Add('');
  sql.Add('        -- table phisical next');
  sql.Add('        fetch next from cu2 into @tbl');
  sql.Add('    end');
  sql.Add('    close cu2');
  sql.Add('    deallocate cu2');
  sql.Add('    ''');
  sql.Add('  --print(@sql)');
  sql.Add('    exec(@sql)');
  sql.Add('');
  sql.Add('  -- database definitions next');
  sql.Add('  fetch next from cur into @dba');
  sql.Add('end');
  sql.Add('close cur');
  sql.Add('deallocate cur');
  sql.Add('');
  sql.Add('');
  sql.Add('/* FIELDS */');
  sql.Add('-- tables definition');
  sql.Add('declare cur cursor fast_forward for');
  sql.Add('select --top(3)');
  sql.Add('    FldDatabase');
  sql.Add('  , FldTable');
  sql.Add('from');
  sql.Add('    DbaSystem.dbo.TblTable');
  sql.Add('where');
  sql.Add('    FldSystem = ''Wks''');
  sql.Add('order by');
  sql.Add('    FldDatabase');
  sql.Add('  , FldTable');
  sql.Add('');
  sql.Add('-- tables definition walk');
  sql.Add('open cur');
  sql.Add('fetch next from cur into @dba, @tbl');
  sql.Add('while @@fetch_status = 0 begin');
  sql.Add('    print(''---------- table: '' + @dba + ''.dbo.'' + @tbl)');
  sql.Add('');
  sql.Add('    -- field definition insert if not exists');
  sql.Add('    set @sql = ''');
  sql.Add('    use '' + @dba + ''');
  sql.Add('    insert into DbaSystem.dbo.TblField');
  sql.Add('    select');
  sql.Add('        ''''Wks''''                         as FldSystem');
  sql.Add('      , '''''' + @dba + ''''''              as FldDatabase');
  sql.Add('      , t.name                              as FldTable');
  sql.Add('      , c.name                              as FldField');
  sql.Add('      , ty.name                             as FldType');
  sql.Add('      , case');
  sql.Add('            when ty.name in (''''varchar'''', ''''char'''', ''''nvarchar'''', ''''nchar'''') then c.max_length');
  sql.Add('            when ty.name in (''''decimal'''', ''''numeric'''')                               then concat(c.precision, '''','''', c.scale)');
  sql.Add('            else null');
  sql.Add('        end                                 as FldLength');
  sql.Add('      , c.is_nullable                       as FldNullable');
  sql.Add('      , c.column_id                         as FldOrder');
  sql.Add('      , null                                as FldPurpose');
  sql.Add('      , null                                as FldKind');
  sql.Add('      , ''''Active''''                      as FldState');
  sql.Add('      , null                                as FldNote');
  sql.Add('      , null                                as FldField2');
  sql.Add('      , null                                as FldFldPurpose2');
  sql.Add('    from sys.tables t');
  sql.Add('    join sys.columns c on t.object_id = c.object_id');
  sql.Add('    join sys.types ty on c.user_type_id = ty.user_type_id');
  sql.Add('    where');
  sql.Add('        t.name = '''''' + @tbl + ''''''');
  sql.Add('    and c.name collate database_default not in (');
  sql.Add('        select FldField from DbaSystem.dbo.TblField');
  sql.Add('        where FldSystem = ''''Wks'''' and FldDatabase = '''''' + @dba + '''''' and FldTable = t.name collate database_default');
  sql.Add('        )');
  sql.Add('    order by');
  sql.Add('        t.name,');
  sql.Add('        c.column_id');
  sql.Add('   ''');
  sql.Add('  --print(@sql)');
  sql.Add('    exec(@sql)');
  sql.Add('');
  sql.Add('    -- database definitions next');
  sql.Add('    fetch next from cur into @dba, @tbl');
  sql.Add('end');
  sql.Add('close cur');
  sql.Add('deallocate cur');

  // exec
  Result := TDbaRec.CmdExec(sql.Text, aff, IvFbk);
  if not Result then
    IvFbk := 'Unable to update databases definitions, ' + IvFbk
  else
    IvFbk := 'Databases definitions update, ' + IvFbk;
end;

function  TSystemSoapMainService.SystemDbaCreateDdlSoap(var IvHost, IvDateTimeCode, IvDdl, IvFbk: string): boolean;
// todo:
// , [FldUId]       [uniqueidentifier] ROWGUIDCOL   NOT NULL
var
  dbp, lgp, bkp: string; // data, log, backup path
  tit, dba, des, tbl, com, fld, typ, len, nul{, pke, fke}: string; // title, dba, descr, tbl, comma, fld, type, lenght, null, primarykey, foreignkey
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
  sbu.Add(' *  create all databases and tables in a SQL Server instance'                                  );
  sbu.Add(' *  '                                                                                          );
  sbu.Add('\**********************************************************************************/'          );

  // dbaloop
  TDbaRec.DsFromSql('select * from DbaSystem.dbo.TblDatabase where FldSystem = ''Wks'' order by FldDatabase', u);
  try
    while not u.Eof do begin
      // zip
      dba := u.FieldByName('FldDatabase').AsString;
      des := u.FieldByName('FldPurpose').AsString;
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
      TDbaRec.DsFromSql(Format('select * from DbaSystem.dbo.TblTable where FldSystem = ''Wks'' and FldDatabase = ''%s'' order by FldTable', [dba]), v);
      try
        while not v.Eof do begin
          // zip
          tbl := v.FieldByName('FldTable').AsString;
          des := v.FieldByName('FldPurpose').AsString;
          if des <> '' then des := ' -- ' + des;
          idx := false;

          // build
          sbu.Anl(2);
          sbu.Add('CREATE TABLE [%s].[%s].[%s](%s', [dba, 'dbo', tbl, des]);

          // fieldsloop
          com := ' ';
          TDbaRec.DsFromSql(Format('select * from DbaSystem.dbo.TblField where FldSystem = ''Wks'' and FldDatabase = ''%s'' and FldTable = ''%s'' order by FldOrder', [dba, tbl]), w);
          try
            while not w.Eof do begin
              // zip
              fld := '[' + w.FieldByName('FldField').AsString + ']';
              typ := '[' + w.FieldByName('FldType').AsString  + ']';
              len :=       w.FieldByName('FldLength').AsString;
              if len = '-1' then len := 'max';
              if (len <> '') and (Length(len) <= 4) then typ := typ + '(' + len + ')'; // skip [image](2147483647), max is (8000)
              nul := giif.Str(w.FieldByName('FldNullable'    ).AsBoolean, 'NULL', 'NOT NULL');
            //pke := giif.Str(w.FieldByName('FldIsPrimaryKey').AsBoolean, 'PrimaryKey', '');
            //fke := giif.Str(w.FieldByName('FldIsForeignKey').AsBoolean, 'ForeignKey', '');
              des :=          w.FieldByName('FldPurpose').AsString;
            //if des <> '' then des := Format(' -- %s %s %s', [pke, fke, des]);
              if des <> '' then des := Format(' -- %s', [des]);

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
  sbu.Add('declare @p varchar(256); set @p = ''C:\$\Bakup\Dba'' -- rootpath without \Year\Week');
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
  sbu.Add('declare @k varchar(64); set @k = ''X:\$\Bak\Dba\2020\50''                                          -- backuppath (source)');
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
  sbu.Add('    --  FROM DISK = N''X:\$\Bak\Dba\2020\50\DbaAgent.bak'' WITH FILE = 1');
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

  {$REGION 'Tbl'}
function TSystemSoapMainService.SystemTblExistsSoap(const IvTbl: string): boolean;
begin
  Result := TDbaRec.TblExists(IvTbl);
end;

function TSystemSoapMainService.SystemTblIdExistsSoap(const IvTbl: string; IvId: integer): boolean;
begin
  Result := TDbaRec.TblIdExists(IvTbl, IvId);
end;

function TSystemSoapMainService.SystemTblIdMaxSoap(const IvTbl, IvWhere: string): integer;
begin
  Result := TDbaRec.TblIdMax(IvTbl, IvWhere);
end;

function TSystemSoapMainService.SystemTblIdAvailableSoap(const IvTbl, IvWhere: string): integer;
begin
  Result := TDbaRec.TblIdAvailable(IvTbl, IvWhere);
end;

function TSystemSoapMainService.SystemTblIdNextSoap(const IvTbl: string; IvUseIdAvailable: boolean): integer;
begin
  Result := TDbaRec.TblIdNext(IvTbl, IvUseIdAvailable);
end;

function TSystemSoapMainService.SystemTblCheckSoap(const IvSys, IvDba, IvTbl: string; var IvFbk: string): boolean;
begin
  Result := TDbaRec.TblCheck(IvSys, IvDba, IvTbl, IvFbk);
end;
  {$ENDREGION}

  {$REGION 'Rec'}
function TSystemSoapMainService.SystemRecInsertSoap(const IvTbl: string; const IvValueVec: TArray<variant>; var IvFbk: string): boolean; // TArray<variant> is serializable by SOAP
var
  avn: TArray<TVarRec>;
begin
  // convert to array of const
  avn := TVntRec.VntVecToTVarRecVec(IvValueVec);

  Result := TDbaRec.RecInsert(IvTbl, avn, IvFbk);
end;
  {$ENDREGION}

  {$REGION 'Fld'}
function TSystemSoapMainService.SystemFldHasValueSoap(const IvTbl, IvFld: string; const IvValue: variant; var IvFbk: string): boolean;
begin
  Result := TDbaRec.FldHasValue(IvTbl, IvFld, IvValue, IvFbk);
end;

function TSystemSoapMainService.SystemFldGetSoap(const IvTbl, IvFld: string; IvId: integer; var IvValue: variant; IvDefault: variant; var IvFbk: string): boolean;
begin
  Result := TDbaRec.FldGet(IvTbl, IvFld, IvId, IvValue, IvDefault, IvFbk);
end;

function TSystemSoapMainService.SystemFldGetWhereSoap(const IvTbl, IvFld: string; IvWhere: string; var IvValue: variant; IvDefault: variant; var IvFbk: string): boolean;
begin
  Result := TDbaRec.FldGetWhere(IvTbl, IvFld, IvWhere, IvValue, IvDefault, IvFbk);
end;

function TSystemSoapMainService.SystemFldSetSoap(const IvTbl, IvFld: string; IvId: integer; const IvValue: variant; var IvFbk: string): boolean;
begin
  Result := TDbaRec.FldSet(IvTbl, IvFld, IvId, IvValue, IvFbk);
end;

function TSystemSoapMainService.SystemFldSetWhereSoap(const IvTbl, IvFld: string; IvWhere: string; const IvValue: variant; var IvFbk: string): boolean;
begin
  Result := TDbaRec.FldSetWhere(IvTbl, IvFld, IvWhere, IvValue, IvFbk);
end;

function TSystemSoapMainService.SystemFldIncSoap(const IvTbl, IvFld: string; IvWhere: string; var IvFbk: string): boolean;
begin
  Result := TDbaRec.FldInc(IvTbl, IvFld, IvWhere, IvFbk);
end;

function TSystemSoapMainService.SystemFldDecSoap(const IvTbl, IvFld: string; IvWhere: string; var IvFbk: string): boolean;
begin
  Result := TDbaRec.FldDec(IvTbl, IvFld, IvWhere, IvFbk);
end;

function TSystemSoapMainService.SystemFldDoMathSoap(const IvTbl, IvFld: string; IvWhere: string; IvOperator: char; IvOperand: string; var IvFbk: string): boolean;
begin
  Result := TDbaRec.FldDoMath(IvTbl, IvFld, IvWhere, IvOperator, IvOperand, IvFbk);
end;
  {$ENDREGION}

{$ENDREGION}

initialization

{$REGION 'Init'}
   InvRegistry.RegisterInvokableClass(TSystemSoapMainService);
{$ENDREGION}

end.

