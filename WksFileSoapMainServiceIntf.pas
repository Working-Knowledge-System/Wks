unit WksFileSoapMainServiceIntf;

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
  // file soap invokable interface
  IFileSoapMainService = interface(IInvokable)
  ['{68D9B108-B538-4B35-AC6C-74AD32472B2C}']
    // file methods
    function  FileInfoSoap(var IvFbk: string): boolean; stdcall;
    function  FileSelectSoap(var IvFilRem: TFilRem; const IvWhitByteArray: boolean; var IvFbk: string): boolean; stdcall;
    function  FileInsertSoap({var} const IvFilRem: TFilRem; var IvFbk: string): boolean; stdcall;
    function  FileUpdateSoap(const IvFilRem: TFilRem; const IvUser: string; var IvFbk: string): boolean; stdcall;
    function  FileDeleteSoap(const IvFilRem: TFilRem; const IvUser: string; IvRecoverable: boolean; var IvFbk: string): boolean; stdcall;
    function  FileMoveSoap(const IvUId, IvObj: string; const IvObjectIdNew: integer; var IvFbk: string): boolean; stdcall;
    function  FileMoveIsAllowedSoap(const IvObj: string; const IvObjectId: integer; const IvUId, IvUser: string; var IvIsAllowed: boolean; var IvFbk: string): boolean; stdcall;
    function  FileVectorSoap(const IvObjectId: integer; IvObj: string; var IvFilRemVector: TFilRemVector; const IvWhitByteArray: boolean; var IvFbk: string): boolean; stdcall;
  //function  FileDatasetSoap(const IvSql: string; var IvDs: OleVariant; var IvFbk: string): boolean; stdcall;
  //function  FileUploadSoap...
  //function  FileDownloadSoap...
  //function  FileCheckOutSoap...
  //function  FileCheckOutCancelSoap...
  //function  FileCheckInSoap...
  //function  FileHistorySoap...
  end;
{$ENDREGION}

implementation

{$REGION 'Init'}
initialization
  InvRegistry.RegisterInterface(TypeInfo(IFileSoapMainService));
{$ENDREGION}

end.
