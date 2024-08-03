unit WksSystemSoapMainServiceIntf;

interface

{$REGION 'Use'}
uses
    System.Types
  , Soap.InvokeRegistry
  , Soap.XSBuiltIns
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  ISystemSoapMainService = interface(IInvokable)
  ['{6C616E29-F6A9-492E-AB57-2F0C7C0BD712}']
    // system *** move Soap to the end ***
    function  SystemSoapInfo                (var IvFbk: string): boolean; stdcall;
    function  SystemSoapOutline             (var IvOutline: string; var IvFbk: string): boolean; stdcall;
    function  SystemSoapPrivacy             (var IvPrivacy: string; var IvFbk: string): boolean; stdcall;
    function  SystemSoapLicense             (var IvLicense: string; var IvFbk: string): boolean; stdcall;
    function  SystemSoapCopyright           (var IvCopyright: string; var IvFbk: string): boolean; stdcall;
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

{$REGION 'Init'}
initialization
  InvRegistry.RegisterInterface(TypeInfo(ISystemSoapMainService));
{$ENDREGION}

end.
