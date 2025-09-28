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
  // system soap invokable interface
  ISystemSoapMainService = interface(IInvokable)
  ['{6C616E29-F6A9-492E-AB57-2F0C7C0BD712}']
    // system methods
    function  SystemInfoSoap                (var IvFbk: string): boolean; stdcall;
    function  SystemOutlineSoap             (var IvOutline: string; var IvFbk: string): boolean; stdcall;
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
    function  SystemObjectIdNextSoap        (const IvObj: string; var IvIdNext: integer; var IvFbk: string): boolean; stdcall;
    function  SystemObjectNewRio            (const IvObj, IvIdOrPath, IvObject, IvObjectKind, IvContentKind, IvFromOrganization, IvFromMember: string; var IvIdNew: integer): boolean; stdcall;
    function  SystemObjectTreeContent       (const IvObj, IvIdOrPath: string; IvWithChild, IvDescriptionBlockAdd, IvHeaderAndFooterOff, IvCommentRemove, IvLinesEmptyRemove: boolean                    ; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean; stdcall;
    function  SystemObjectTreeContentSave   (const IvObj, IvIdOrPath: string; IvWithChild, IvDescriptionBlockAdd, IvHeaderAndFooterOff, IvCommentRemove, IvLinesEmptyRemove: boolean; IvFileSpec: string; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean; stdcall;
    function  SystemObjSoapFieldGet         (const IvObj, IvIdOrPath, IvField: string;   var IvValue: variant; const IvDefault: variant): boolean; stdcall;
    function  SystemObjSoapFieldSet         (const IvObj, IvIdOrPath, IvField: string; const IvValue: variant): boolean; stdcall;
    // dba methods
    function  SystemDbaInfosSoap            (var IvBuild, IvMajorVersion, IvMinorVersion, IvBuildType, IvUpdateLevel, IvUpdateReference, IvFbk: string): boolean; stdcall;
    function  SystemDbaFilesPathsSoap       (var IvDataPath, IvLogPath, IvBackupPath, IvFbk: string): boolean; stdcall;
    function  SystemDbaDatabaseRebuildSoap  (var IvFbk: string): boolean; stdcall;
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

initialization

{$REGION 'Init'}
  InvRegistry.RegisterInterface(TypeInfo(ISystemSoapMainService));
{$ENDREGION}

end.
