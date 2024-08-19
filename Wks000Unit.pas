///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//                          __      __  _  __                                //
//                          \  \/\/  / | |/ /  ___                           //
//                           \      /  |   <  (_-<                           //
//                            \_/\_/   |_|\_\ /__/                           //
//                                                                           //
//                         Working Knowledge System                          //
//                                                                           //
//                      Copyright © 2010-present Wks inc.                    //
//                           All Rights Reserved.                            //
//                                                                           //
//                           https://www.wks.cloud                           //
//                              info@wks.cloud                               //
//                                                                           //
//                                                                           //
//                 see LICENSE file for license information                  //
///////////////////////////////////////////////////////////////////////////////

unit Wks000Unit;

interface

{$REGION 'Delphi'}
(*
  product                  prodver   packagever   compilerversion   conditionalver
  ----------------------------------------------------------------------------
  Delphi 11.* Alexandria   28        280          35.0              VER350
  Delphi 10.1 Berlin       24        240          31.0              VER310
  Delphi 10   Seattle      23        230          30.0              VER300


  alias    delphi                                                     mssql   bytes
  ------------------------------------------------------------------------------
   int8    shortint                   -128..127                               1
   int16   smallInt                -32,768..32,767                 smallint   2
   int32   integer             -2147483648..2147483647                  int   4
   int64              -9223372036854775808..9223372036854775807      bigint   8
  uint8    byte                          0..255                     tinyint   1
  uint16   word                          0..65535                             2
  uint32   cardinal                      0..4294967295                        4
  uint64                                 0..18446744073709551615              8


  conditionalcompiles:

  {$IF COMPILERVERSION < 31.0} v: TSuperArray {$ELSE} v: ISuperArray {$ENDIF};
  {$IF COMPILERVERSION < 32.0} TStringDynArray {$ELSE} TArray<string> {$ENDIF};

  {$IF NOT DECLARED(TStringDynArray)}
    {$IFDEF HAVE_RTTI}
  TStringDynArray = TArray<string>;
    {$ELSE}
  TStringDynArray = array of string;
    {$ENDIF}
  {$IFEND}
*)
{$ENDREGION}

{$REGION 'Help'}
(*
  Client--Server--Database
  ------------------------
  an object tipically migh have two similar commands, one to deal with the database and one to deal rio like:
  - function  IdNext{Dba}(IvIdNext: integer; varFbk: string);   with this, the server interact with the db
  - function  IdNextRio(IvIdNext: integer; varFbk: string);     with this, the server interact with the client

  Groups
  ------
  [O] = Object         = Obj (ex Xxx)
  [B] = usinessobjects = Person, User, Organization, Theme, Member


  Objects        Bmp
  -----------------------------
  Object         Image
  Person         Picture
  User           Avatar
  Organization   Logo, LogoLong
  Member         Avatar
*)
{$ENDREGION}

{$REGION 'Switches'}
{$I Wks000Inc.inc}
{$ENDREGION}

{$REGION 'Use'}
uses
    Winapi.Windows
  , System.Types
  , System.Classes
  , System.SysUtils
  , System.Rtti                   // TRttiType, TRttiField, TValue
  , System.Generics.Defaults      // tequalitycomparer
  , System.Generics.Collections   // json.getpairs, tdictionary
  , System.RegularExpressions     // regex
  , System.RegularExpressionsCore // regex
//, System.Diagnostics            // tstopwatch --> TProfiler
  , System.IniFiles               // tinifile
  , System.JSON                   // json
  , Vcl.Graphics                  // tgraphic
  , Vcl.Imaging.Jpeg              // tjpegimage
  , Vcl.Imaging.GIFImg            // tgifimage
  , Vcl.Imaging.PNGImage          // tpngimage
  , Vcl.Forms                     // application, screen, form
  , Vcl.ComCtrls                  // tpagecontrol
//, Vcl.Controls                  // tcontrol, twincontrol, crhourglass
  , Vcl.DBGrids                   // grid
  , Data.DB                       // dataset
  , Data.Win.ADODB                // adodb
  , Web.HTTPApp                   // twebrequest
  , Soap.SOAPHTTPClient           // thttprio
  , Soap.SOAPConn                 // soapconnection
  , Soap.InvokeRegistry           // tremotable
  , Rest.Json                     // jsonutils
  , ujachLogMgr                   // jachlog
  , ujachLogToDisk                //
  , ujachLogToSysLogIndyUDP       //
  , SynEdit                       // synedit
  , SynEditTypes                  // synedit types
//, SynEditMiscProcs              // synedit misc
  , SynEditRegexSearch            // synedit regex
  , SynEditSearch                 // synedit search
  , SynEditCodeFolding            // synedit scanforfoldranges
  , SynEditHighlighter            // synedit highlighter
  , SynHighlighterGeneral         //
  , SynHighlighterBAT             //
  , SynHighlighterCpp             //
  , SynHighlighterCSS             //
  , SynHighlighterDWS             //
  , SynHighlighterHTML            //
  , SynHighlighterJava            //
  , SynHighlighterJScript         //
  , SynHighlighterJSON            //
  , SynHighlighterPas             //
  , SynHighlighterPython          //
  , SynHighlighterSQL             //
  , SynHighlighterYAML            //
  , VirtualTrees                  // virtualstringtree
  , ArrayHelper                   // TArray<T> and TArrayRecord<T> helper
  , Agg2D                         // aggengine
  , AggBasics                     // aggutils
//, AggColor                      // aggcolors
  , AggPixelFormat                // aggblendmode ...
//, AggWin32Bmp                   // tpixelmap
  , Profiler                      // tprofiler delphiarea
  , WksSynHighlighterRUnit        // wks synedit highlighter for R lang
  ;
{$ENDREGION}

{$REGION 'Const'}
const
  OK_STR                  = 'Ok';
  NO_STR                  = 'No';
  NA_STR                  = 'Not Available';
  NOT_IMPLEMENTED_STR     = 'Not Implemented';
  NOT_AVAILABLE_STR       = 'Not available';
  UNKNOWN_STR             = 'Unknown';
  NO_DATA_STR             = 'No Data';
  WARNING_STR             = 'WARNING';
  EXCEPTION_STR           = 'EXCEPTION';
  TEMP_PATH               = 'C:\$Tmp';
//SERVER_SOAP_URL         = 'http://www.wks.cloud';
//SERVER_SOAP_RIO_URL     = {SERVER_SOAP_URL +}   '%s/Wks%sSoapProject.dll/soap/I%sSoapMainService';
  {$IF COMPILERVERSION < 32}
  DBA_PROVIDER            = 'SQLOLEDB.1';   // Microsoft OLE DB Provider for SQL Server
  DBA_CONNECTION_STR      = 'Provider='+DBA_PROVIDER+';Data Source=AIWYMSTEST\SQLEXPRESS;User ID=sa;Password=secret;Persist Security Info=True';
  {$ELSE}
  DBA_PROVIDER            = 'MSOLEDBSQL.1'; // Microsoft OLE DB Driver for SQL Server
  DBA_CONNECTION_STR      = 'Provider='+DBA_PROVIDER+';Data Source=LOCALHOST;User ID=sa;Password=secret@123;Persist Security Info=True';
  {$ENDIF}
//DBA_CLIENT_CONN_STR     = 'Provider='+DBA_PROVIDER+';Data Source=LOCALHOST;User ID=sa;Password=secret@123;Persist Security Info=True;Initial Catalog=DbaClient';
//DBA_REPORT_CONN_STR     = 'Provider='+DBA_PROVIDER+';Data Source=LOCALHOST;User ID=sa;Password=secret@123;Persist Security Info=True;Initial Catalog=DbaReport';
  DBA_CMD_TIMEOUT_SEC     = 10;
  DATASET_MAXRECORDS      = 10000; // ultimatetopmax
  CHARS_SPECIAL           = '~!@#$%^&*()_+=-';
  LICENSE_MIT             = 'MIT License'
             + sLineBreak + ''
             + sLineBreak + 'Copyright © 2010-[RvDatNowYear()] [RvWks()]'
             + sLineBreak + ''
             + sLineBreak + 'Permission is hereby granted, free of charge, to any person obtaining a copy'
             + sLineBreak + 'of this software and associated documentation files (the "Software"), to deal'
             + sLineBreak + 'in the Software without restriction, including without limitation the rights'
             + sLineBreak + 'to use, copy, modify, merge, publish, distribute, sublicense, and/or sell'
             + sLineBreak + 'copies of the Software, and to permit persons to whom the Software is'
             + sLineBreak + 'furnished to do so, subject to the following conditions:'
             + sLineBreak + ''
             + sLineBreak + 'The above copyright notice and this permission notice shall be included in all'
             + sLineBreak + 'copies or substantial portions of the Software.'
             + sLineBreak + ''
             + sLineBreak + 'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR'
             + sLineBreak + 'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,'
             + sLineBreak + 'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE'
             + sLineBreak + 'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER'
             + sLineBreak + 'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,'
             + sLineBreak + 'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE'
             + sLineBreak + 'SOFTWARE.';
  PRIVACY_STATEMENT       = 'At [RvWks()], we are committed to protecting your privacy.'
             + sLineBreak + 'This Privacy Statement explains how we collect, use, and safeguard'
             + sLineBreak + 'your personal information when you use our software.'
             + sLineBreak + ''
             + sLineBreak + 'Information We Collect'
             + sLineBreak + ''
             + sLineBreak + 'We may collect the following types of personal information:'
             + sLineBreak + ''
             + sLineBreak + '- Contact Information: Your name, email address, and phone number.'
             + sLineBreak + '- Usage Data:          Information about how you interact with our software,'
             + sLineBreak + '                       including log files, error reports, and analytics data.'
             + sLineBreak + '- Payment Details:     If applicable, payment information for purchasing our software.'
             + sLineBreak + ''
             + sLineBreak + 'How We Use Your Information'
             + sLineBreak + ''
             + sLineBreak + 'We use your personal information for the following purposes:'
             + sLineBreak + ''
             + sLineBreak + '- To communicate with you regarding updates, support, and other relevant information.'
             + sLineBreak + '- To provide and maintain our software services.'
             + sLineBreak + '- To improve our software and enhance the user experience.'
             + sLineBreak + '- To process payments, if applicable.'
             + sLineBreak + ''
             + sLineBreak + 'Data Security'
             + sLineBreak + ''
             + sLineBreak + 'We take data security seriously.'
             + sLineBreak + 'Your information is stored securely and protected'
             + sLineBreak + 'against unauthorized access, disclosure, or alteration.'
             + sLineBreak + ''
             + sLineBreak + 'Third-Party Services'
             + sLineBreak + ''
             + sLineBreak + 'We do not use any third-party services that collect and process data on our behalf.'
           //+ sLineBreak + 'Even if these services adhere to their own privacy policies.'
             + sLineBreak + ''
             + sLineBreak + 'Your Choices'
             + sLineBreak + ''
             + sLineBreak + '- You can update your personal information yourself or by contacting us.'
             + sLineBreak + '- You can opt out of receiving marketing communications.'
             + sLineBreak + '- You can request us to delete your account and all your personal data,'
             + sLineBreak + '  but the logs will not deleted for security reason.'
             + sLineBreak + ''
             + sLineBreak + 'Contact Us'
             + sLineBreak + ''
             + sLineBreak + 'If you have any questions or concerns about our privacy practices,'
             + sLineBreak + 'please contact us at [RvWksEmail()].'
             + sLineBreak + ''
             + sLineBreak + 'Thank you for trusting [RvWks()] with your data.'
             + sLineBreak + ''
             + sLineBreak + '12/20/2010';
  USER_AGENT_WKS          = '';
  USER_AGENT_BROWSER      = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.78';

  {$REGION 'Datetime'}
  DAT_LongDayNames_ISO8601: array[1..7] of string = ( // opposed to FormatSettings.LongDayNames that starts with sunday!
    'Monday'
  , 'Tuesday'
  , 'Wednesday'
  , 'Thursday'
  , 'Friday'
  , 'Saturday'
  , 'Sunday'
  );
  {$ENDREGION}

  MyArray: TArray<string> = ['First','Second','Third']; // *** WARNING if not present errors happens later ***
{$ENDREGION}

{$REGION 'Enum'}
type
//TTriStateEnum     = (tsTrue, stFalse, tsUnknown);
  TWebFrameworkEnum = (wfNone, wfW3, wfBs);
  TCaseEnum         = (cAsIs, cLower, cUpper, cCapital, cCapitalAll);
  TFbkModeEnum      = (fmNone, fmInfo, fmSuccess, fmWarning, fmDanger, fmError); // transparent, blue, green, orange, red, black
  TImgTormEnum      = (itNone, itBottom, itTop, itTopBottom);
  TProcessKindEnum  = (pkUnknown, pk32Bit, pk64Bit);
  THvDirEnum        = (hvHorizontal, hvVertical);
{$ENDREGION}

{$REGION 'Helper'}
type
  TColorHelper = record helper for TColor
    function  ToString: string;                                                    // return the constant name if is a symbolic constant (such as clBlack)
    procedure FromString(const IvString: string; IvDefault: TColor = clWhite);     // return a TColor from a get '$00FF8800'
    function  ToHexString: string;                                                 // return rrggbb hex string
    procedure FromHexString(const IvString: string; IvDefault: TColor = clWhite);  // return a TColor from a rrggbb hex digit string <-- ColorFromRgbHexStr(IvString)
    function  ToHtmlString(IvPrefix: boolean = true): string;                      // return an html string color like #02FF88 (rrggbb)
    procedure FromHtmlString(const IvString: string; IvDefault: TColor = clWhite); // return a TColor from an html string like #02FF88 (rrggbb)
    procedure ToRgb(var IvR, IvG, IvB: byte);
    procedure FromRgb(IvR, IvG, IvB: byte);
    function  ToRgbTriple: TRGBTriple; // (const IvColor: TColor)
    procedure FromRgbTriple(const IvRgbTriple: TRGBTriple);
  end;

  TArrayHlp = record
  public
    class procedure RemoveWith<T>(var IvArray: TArray<T>; const IvValue: T); static;
  end;

  TRectHlp = record helper for TRect
  private
    function  WGet: integer; inline;
    procedure WSet(const Value: integer); inline;
    function  HGet: integer; inline;
    procedure HSet(const Value: integer); inline;
    function  TRGet: TPoint;
    procedure TRSet(const Value: TPoint);
  public
    procedure Move(DX, DY: integer);
    procedure LTWHAssign(Left, Top, Width, Height: integer);
    function  LTOfCentered(IvInnerCenteredW, IvInnerCenteredH: integer): TPoint;
    property  W : integer read WGet  write WSet ;
    property  H : integer read HGet  write HSet ;
    property  TR: TPoint  read TRGet write TRSet;
  end;
{$ENDREGION}

{$REGION 'Type'}
type

  {$REGION 'Forward'}
//type
// ... forwarddeclarations
  {$ENDREGION}

  {$REGION 'Vectors'}
//TBooleanVector = TBooleanDynArray {array of boolean};
//TBooleanMatrix = array of TBooleanVector;

//TIntegerVector = TIntegerDynArray {array of integer};
//TIntegerMatrix = array of TIntegerVector;

//TDoubleVector  = TDoubleDynArray {array of double};
//TDoubleMatrix  = array of array of double;

  TStringVector  = TArray<string> {TStringDynArray} {array of string};
//TStringMatrix  = array of TStringVector;

//TByteVector    = TByteDynArray {array of byte};       // like TIdBytes
//TByteMatrix    = array of TByteVector;

//TBitmapVector  = array of TBitmap;
//TBitmapMatrix  = array of TBitmapVector;

  TVariantVector = TArray<variant> {array of variant};  // this is a dynamic array of variants that is resizable (an open array is not resizable!)
//TVarRecVector  = array of TVarRec;                    // TConstArray

//TRgbVector     = array[0..65535] of TRGBTriple;       // color
//PRgbVector     = ^TRgbVector;                         // color
  {$ENDREGION}

  {$REGION 'Obj'}
  // *************************************************************************** OBJECT (MASTER, FIXED PART)
//TObjKindEnum = (  // objectkind
//  okXxx           // prototype
//, okPerson        // \__ PersonClient
//, okUser          // /
//, okOrganization  // organization
//, okMember        //member = structure
//);

  TObjRem = class(TRemotable)
  private
    FId              : integer      ;
    FPId             : integer      ;
    FId8             : string       ;
    FOrder           : integer      ;
    FRev             : integer      ;
    FCreated         : TDateTime    ;
    FUpdated         : TDateTime    ;
    FFromOrganization: string       ;
    FFromDepartment  : string       ;
    FFromArea        : string       ;
    FFromTeam        : string       ;
    FFromMember      : string       ;
    FToOrganization  : string       ;
    FToDepartment    : string       ;
    FToArea          : string       ;
    FToTeam          : string       ;
    FToMember        : string       ;
    FJobGradeMin     : integer      ; // ToMemberJobGradeMin
  //ToMemberJobTitle : string       ; // ToMemberJobRole + ToMemberJobLevel
    FRoute           : string       ;
    FObjectKind      : string       ;
    FContentKind     : string       ;
    FDataKind        : string       ;
    FState           : string       ;
    FTitle           : string       ;
    FSubtitle        : string       ;
    FDescription     : string       ;
    FSpare           : string       ;
    FEncrypted       : boolean      ;
    FPersist         : boolean      ;
    FImage           : TByteDynArray;
    FContentPrev     : string       ;
    FContent         : string       ;
    FData            : string       ;
    FNote            : string       ;
    FObject          : string       ;
  //procedure RemFromRec(IvObjRec: TObjRec);
  published
    property Id              : integer       read FId               write FId              ;
    property PId             : integer       read FPId              write FPId             ;
    property Id8             : string        read FId8              write FId8             ;
    property Order           : integer       read FOrder            write FOrder           ;
    property Rev             : integer       read FRev              write FRev             ;
    property Created         : TDateTime     read FCreated          write FCreated         ;
    property Updated         : TDateTime     read FUpdated          write FUpdated         ;
    property FromOrganization: string        read FFromOrganization write FFromOrganization;
    property FromDepartment  : string        read FFromDepartment   write FFromDepartment  ;
    property FromArea        : string        read FFromArea         write FFromArea        ;
    property FromTeam        : string        read FFromTeam         write FFromTeam        ;
    property FromMember      : string        read FFromMember       write FFromMember      ;
    property ToOrganization  : string        read FToOrganization   write FToOrganization  ;
    property ToDepartment    : string        read FToDepartment     write FToDepartment    ;
    property ToArea          : string        read FToArea           write FToArea          ;
    property ToTeam          : string        read FToTeam           write FToTeam          ;
    property ToMember        : string        read FToMember         write FToMember        ;
    property JobGradeMin     : integer       read FJobGradeMin      write FJobGradeMin     ;
  //property ToMemberJobTitle: string        read FToMemberJobTitle write FToMemberJobTitle;
    property Route           : string        read FRoute            write FRoute           ;
    property ObjectKind      : string        read FObjectKind       write FObjectKind      ;
    property ContentKind     : string        read FContentKind      write FContentKind     ;
    property DataKind        : string        read FDataKind         write FDataKind        ;
    property State           : string        read FState            write FState           ;
    property Title           : string        read FTitle            write FTitle           ;
    property Subtitle        : string        read FSubtitle         write FSubtitle        ;
    property Description     : string        read FDescription      write FDescription     ;
    property Spare           : string        read FSpare            write FSpare           ;
    property Encrypted       : boolean       read FEncrypted        write FEncrypted       ;
    property Persist         : boolean       read FPersist          write FPersist         ;
    property Image           : TByteDynArray read FImage            write FImage           ;
    property ContentPrev     : string        read FContentPrev      write FContentPrev     ;
    property Content         : string        read FContent          write FContent         ;
    property Data            : string        read FData             write FData            ;
    property Note            : string        read FNote             write FNote            ;
    property &Object         : string        read FObject           write FObject          ;
  end;

  TObjRec = record
    Id              : integer  ;
    PId             : integer  ;
    Id8             : string   ;
    Order           : integer  ;
    Rev             : integer  ;
    Created         : TDateTime;
    Updated         : TDateTime;
    FromOrganization: string   ;
    FromDepartment  : string   ;
    FromArea        : string   ;
    FromTeam        : string   ;
    FromMember      : string   ;
    ToOrganization  : string   ;
    ToDepartment    : string   ;
    ToArea          : string   ;
    ToTeam          : string   ;
    ToMember        : string   ;
    JobGradeMin     : integer  ; // ToMemberJobGradeMin
  //ToMemberJobTitle: string   ; // ToMemberJobRole + ToMemberJobLevel
    Route           : string   ;
    ObjectKind      : string   ;
    ContentKind     : string   ;
    DataKind        : string   ;
    State           : string   ;
    Title           : string   ;
    Subtitle        : string   ;
    Description     : string   ;
    Spare           : string   ;
    Encrypted       : boolean  ;
    Persist         : boolean  ;
    Image{Graphic}  : TGraphic ;
    ContentPrev     : string   ;
    Content         : string   ;
    Data            : string   ;
    Note            : string   ;
    &Object         : string   ;
    procedure Free;
    procedure Reset;
    function  InitDba(IvObj: string; IvId: integer): boolean;
    procedure RecFromRem(IvObjRem: TObjRem);
    procedure RecToRem(var IvObjRem: TObjRem);
  private
  public
          function  ObjObjectSafe: string;
    class function  ObjPropertyVector(): TArray<string>; static;
    class function  ObjKindVector(): TArray<string>; static;
    class function  HasProperty(const IvProperty: string): boolean; static;
    class function  IsBusinessObj(const IvObj: string): boolean; static;
    class function  IdNext(const IvObj: string; var IvIdNext: integer; var IvFbk: string): boolean; static; // IvObj = Xxx, Person, Account, Code ...
    class function  IdNextRio(const IvObj: string; var IvIdNext: integer; var IvFbk: string): boolean; static;
    class function  New(IvObj, IvIdOrPath, IvObject, IvObjectKind, IvContentKind, IvFromOrganization, IvFromMember: string; var IvIdNew: integer): boolean; static;
    class function  NewRio(IvObj, IvIdOrPath, IvObject, IvObjectKind, IvContentKind, IvFromOrganization, IvFromMember: string; var IvIdNew: integer): boolean; static;
          function  ContentKindIsMarkdown: boolean;
    class function  FieldGet(const IvObj, IvIdOrPath, IvField: string;   var IvValue: variant; const IvDefault: variant): boolean; static;
    class function  FieldSet(const IvObj, IvIdOrPath, IvField: string; const IvValue: variant): boolean; static;
  end;

  // *************************************************************************** OBJECT (DETAIL, VARIABLE PART)
//TXxxFieldRec = record
//  Field: string;
//  Value: variant;
//end;
//TXxxFieldRecArr = array of TXxxFieldRec; // FXxxFieldRecArr := TArray<TXxxFieldRec>.Create();
  {$ENDREGION}

  {$REGION 'Normal'}
  TAaaRec = record // primordial or not categorized stuff
    class function  FileVer(const IvFileName: string = ''): string; static;         // 1.0.0.0
    class function  ProcessKind: TProcessKindEnum; static;                          // unknown, 32bit, 64bit
    class function  ProcessKindAsText: string; static;                              // unknown, 32bit, 64bit
  //class function  ProcIs32Bit: boolean; static;                                   // t/f
  //class function  Proc3264Bits: string; static;                                   // 32bit | 64bit
  end;

  TAggRec = record // agg2d

    {$REGION 'Help'}
    {
    Zip
    -------------------------------------------------------
    vg                          agg2d vector graphic engine
    xo, yo                      origin
    x0, y0, x1, y1, x2, y2      coordinates
    cs                          coordinate system
    xl                          cs x length
    yl                          cs y length
    lc                          line color
    lw                          line width
    fc                          fill color
    ra                          radius
    ww                          width
    hh                          height
    sz                          size
    sc                          scale
    ip, jp                      col, row pitch
    imin, imax, jmin, jmax      col, row min-max indexes
    r --> a                     rotation --> angle deg

    Rotation
    --------
    Rotation must be done in the original 'origin' (top-left or bottom-left) then you can traslate where you want
    For example suppose you have a bmp 100x100 and want to draw a big circle in the middle and a small circle that rotate arount
                   ______________________
                  ^               _      |                                              origin O is in bottom-left corner
                  |              |.|     | smallcircle       - vg.Translate(w2, h2);    origin now is moved in C
                  |              /¯      |                   - vg.Circle(0, 0, R);      draw a circle in C with radius R
                  |           R /        |                   - vg.Translate(-Cx, -Cy);  move 'origin' back to O
                  |            /  30°    |                   - vg.Rotate(Deg2Rad(60));  rotate cs 60 deg ccw
                h |          +  -----    |                   - vg.Translate(w2, h2);    after rotation go back again to C
                  |           C          |                   - AggCircle(R, 0, 5);      now draw a small circle (along the x axis, at R from C)
                  |                      |
                  |                      |
                  |                      |
                  |                      |
          origin  O¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯>
                             w
    }
    {$ENDREGION}

    {$REGION 'Const'}
  const
    AGG_Y_UP           = false;

    AGG_TEXT_UP        = not AGG_Y_UP;
    AGG_TEXT_HEIGHT    = 10.0;
    AGG_TEXT_COLOR     = '000000ff'; // RGBA
    AGG_TEXT_FONT      = 'Tahoma';   // 'Arial', 'Times New Roman', 'Courier New', 'Verdana', 'Tahoma', 'Lucida Console', 'Galleria', 'Briquet'  filename containing the font face to be used
    AGG_TEXT_ALIGNMENT = 'cc';       // center-center
    AGG_TEXT_HINTS     = true;       // sembra influenzi leggermente lo spessore del testo
    AGG_TEXT_ROUND_OFF = true;       // rounds to integers the text x y origin
    {$ENDREGION}

  public

    {$REGION 'General'}
    class procedure Attach(agg: TAgg2D; IvBitmap: TBitmap; IvYAsisUp: boolean = false); static; // like the old aggpas
    class procedure BmpAlphaSet(IvBmp: TBitmap; IvAlpha: byte); static;
    class procedure DrawSetup(agg: TAgg2D; IvLineWidth: double = 1.0; IvLineColor: string = '000000'; IvFillColor: string = 'ffffff'); static;
    {$ENDREGION}

    {$REGION 'Text'}
    class procedure Text(agg: TAgg2D; x, y: double; s: string; h: double = AGG_TEXT_HEIGHT; color: string = AGG_TEXT_COLOR; align: string = AGG_TEXT_ALIGNMENT; flip: boolean = AGG_TEXT_UP; bold: boolean = false; italic: boolean = false; font: ansistring = AGG_TEXT_FONT; rotate: double = 0.0); overload; static; // 1 text line
    {$ENDREGION}

    {$REGION 'Box'}
    class procedure Box(agg: TAgg2D; cx, cy, w, h: double; round: double = 0; rotate: double = 0); static;
    {$ENDREGION}

    {$REGION 'Star'}
    class procedure Star(agg: TAgg2D; cx, cy, r1, r2, angle: double; rays: integer; lw: double; lc, fc: string); static;
    {$ENDREGION}

    {$REGION 'Graphic'}
    class procedure GraphicSmashCentered(agg: TAgg2D; IvGraphic: TGraphic; cx, cy, newh: double); static; // draw the graphic centered in cx,cy and new height
    {$ENDREGION}

  end;

  TApsRec = record // applicationserver(isapi,soap,rest) settings(loginform)
  //Port       : string; // server port
    Protocol   : string; // server protocol // http/https
    WwwDev     : string; // clientconectto localhost         \
    WwwTest    : string; // clientconectto www.rumors.cloud   |-- client connects here
    WwwProd    : string; // clientconectto www.wks.cloud     /
    Environment: string; // clientconectto Dev, Test, Prod    |-- drives one of the above, may drive also db env?
  public
    function  Info: string;
    function  Www: string;    // *** add IvAbsolute also in ObjUrl ***              //        www.abc.com (noport, noprotocol)
    function  Url: string;                                                          // http://www.abc.com
  end;

  TAskRec = record // only inputs, for message and feedback use TMesRec
    class function  Yes(IvMessage: string = 'Continue ?'): boolean; overload; static;
    class function  Yes(IvMessageFormatString: string; IvVarRecVector: array of TVarRec): boolean; overload; static;
  //class function  YesFmt(IvMessageFormatString: string; IvVarRecVector: array of TVarRec): boolean; static;
    class function  No(IvMessage: string = 'Continue ?'): boolean; static;
    class function  NoFmt(IvMessageFormatString: string; IvVarRecVector: array of TVarRec): boolean; static;
    class function  YesNoCancel(IvMessage: string = 'Continue ?'): integer; static; // 0=mrYes 1=mrNo 2=mrCancel
    class function  Str(IvCaption, IvPrompt, IvDefault: string; var IvStr: string): boolean; static;
    class function  Int(IvCaption, IvPrompt: string; IvDefault: integer; var IvInt: integer): boolean; static;
  end;

  TBarRec = record // bytearray
    class function  BarFromBmp(const IvBmp: TBitmap): TByteDynArray; static;
    class function  BarFromPng(const IvPng: TPngImage): TByteDynArray; static;
    class function  BarFromPic(const IvPic: TPicture): TByteDynArray; static;
    class function  BarFromGraphic(const IvGraphic: TGraphic): TByteDynArray; static;
  end;

  {$REGION 'TBflRec'}
//TBflRec = record // blobfield
  //class procedure FromPicture(var IvBlobField: TBlobField; IvPicture: TPicture); static; // 20120224 by Thomas Wassermann, based on an Idea of Emiliano Sos
  //class procedure ToPicture(IvBlobField: TBlobField; var IvPicture: TPicture); static;
  //class procedure FromGraphic(var IvBlobField: TBlobField; IvGraphic: TGraphic); static;
  //class procedure ToGraphic(IvBlobField: TBlobField; var IvGraphic: TGraphic); static;
  //class procedure FromByteArray(var IvBlobField: TBlobField; IvByteArray: TByteDynArray); static;
  //class procedure ToByteArray(IvBlobField: TBlobField; var IvByteArray: TByteDynArray); static;
//end;
  {$ENDREGION}

  TBmpRec = record // bitmap
    class function  BmpIsValid(IvBmp: TBitmap; var IvFbk: string): boolean; static;
    class function  BmpFromByteArray(const IvByteArray: TByteDynArray): TBitmap; static;
    class function  BmpFromPng(const IvPng: TPngImage): TBitmap; static;
    class function  BmpFromRes(IvResourceName: string; IvBmp: TBitmap; IvFbk: string): boolean; static;
    class procedure BmpBmpDraw(IvBmp: TBitmap; IvPoint: TPoint; IvBmp2: TBitmap ; IvCentered: boolean = false; IvTransparent: boolean = false); static;
    class procedure BmpPicDraw(IvBmp: TBitmap; IvRect : TRect ; IvPic : TPicture; IvCentered: boolean = false; IvTransparent: boolean = false); static;
    class procedure BmpBoxDraw(IvBmp: TBitmap; IvRect : TRect ; IvLineSize: integer; IvLineColor, IvFillColor: TColor; IvFillet: integer = 0; IvBrushStyle: TBrushStyle = bsSolid; IvPenMode: TPenMode = pmCopy; IvShape: char = 'R'); static; // Rectangle, Circle, Ellipse
    class procedure BmpTxtDraw(IvBmp: TBitmap; IvPoint: TPoint; IvStr: string; IvBrushStyle: TBrushStyle = bsSolid; IvTextColor: TColor = clCaptionText); overload; static;
    class procedure BmpTxtDraw(IvBmp: TBitmap; IvText: string; IvTextFont: string; IvTextSize: integer; IvTextColor: TColor; IvTextStyleSet: TFontStyles; IvLabelBrushColor: TColor; IvLabelBrushStyle: TBrushStyle; IvLabelPenColor: TColor; IvLabelPenStyle: TPenStyle; IvLabelPenWidth: integer; IvLabelGap: integer; IvOutlinePenColor: TColor; IvOutlinePenStyle: TPenStyle; IvOutlinePenWidth: integer; IvDrawOutline: boolean); overload; static;
    class procedure BmpResourceDraw(IvBmp: TBitmap; IvPoint: TPoint; IvResource: string; IvCentered: boolean = false); static;
    class procedure BmpResourceDrawCentered(IvBmp: TBitmap; IvRect: TRect; IvResource: string); static;
    class procedure BmpExceptionDraw(IvBmp: TBitmap; IvE: Exception); static;
    class procedure BmpAlphaPremultiply(IvBmp: TBitmap); static; // some functions like UpdateLayeredWindow only works correctly with bitmap with premultiplied alpha (rbg = rgb * alpha / 255)
  end;                                                           // in a pre-multiplied bitmap, none of pixels can have color values that exceed the alpha value of that pixel

  TBolRec = record // boolean
  public
    class function  BolFromInt(IvInteger: integer): boolean; static;
    class function  BolToInt(IvBool: boolean): integer; static;
    class function  BolToStr(IvBool: boolean; IvLowerCase: boolean = false): string; static; // WARNING: also in SysyUtils
    class function  BolFromStr(IvStr: string; IvDefault: boolean = false): boolean; static;  // see StrAsBool
    class function  BolVecToBinaryStr(IvBoolVec: TArray<boolean>): string; static;           // [false, true, false]  -->  '010'
    class function  BolVecFromBinaryStr(IvBinaryStr: string): TArray<boolean>; static;       // '010'  -->  [false, true, false]
  end;

  TBynBitness = (pebUnknown, peb16, peb32, peb64); // PE = portable executable file format

  TBynKind    = (pekUnknown, pekExe, pekDll);

  TBynRec = record // binary exe/dll   *** SEE TCtxRec ***                          // Xxx = Object = Client
  private
    class var BinarySpecChache: string;                                             // static field is shared by all instances of TBynRec
  public
    class function  ExeSpec: string; static;                                        // C:\...\WksXxx*Project.exe
    class function  DllSpec: string; static;                                        // C:\...\WksXxx*Project.dll
    class function  Kind(const IvBynarySpec: string): TBynKind; static;             // exe/dll
    class function  KindAsText(const IvBynarySpec: string): string; static;         // IsExe, IsDll
    class function  Bitness(const IvBynarySpec: string = ''): TBynBitness; static;  // see: https://forum.tomshw.it/threads/struttura-pe-portable-executable-exe.717625 , https://learn.microsoft.com/en-us/windows/win32/debug/pe-format?redirectedfrom=MSDN
    class function  BitnessAsText(const IvBynarySpec: string = ''): string; static; // 16bit, 32bit, 64bit
    class function  BinarySpec: string; static;                                     // C:\Aaa\WksXxx*Project.exe
    class function  BinaryDir: string; static;                                      // C:\Aaa
    class function  BinaryTag: string; static;                                      // WksXxx*
    class function  BinaryName: string; static;                                     // WksXxx*Project
    class function  BinaryNameExt: string; static;                                  // WksXxx*Project.exe/dll
    class function  IsClient: boolean; static;                                      // Wks*ClientProject.exe
    class function  IsDemon : boolean; static;                                      // Wks*[Demon|Service]Project.exe
    class function  IsServer: boolean; static;                                      // Wks*[Isapi|Soap|Rest]Project.exe
    class function  IsEditor: boolean; static;                                      // Wks*EditorProject.exe
    class function  Obj: string; static;                                            // Xxx, Account, Agent, File, Page, Task, ...
    class function  Role: string; static;                                           // Client, Isapi, Soap, Rest, Datasnap, Service, Deamon, Editor
    class function  Version(Instance: THandle; out iMajor, iMinor, iRelease, iBuild: integer): boolean; static; // 1.0.0.0 (reading resource, not the file!) *** MOVE TO TFsyRec ***
    class function  Ver: string; static;                                            // 1.0.0.0
    class function  VerBit: string; static;                                         // 1.0.0.0 - 32bit
    class function  Name: string; static;                                           // WKS XXX Client
    class function  Info: string; static;                                           // WKS XXX Client 1.0.0.0 - 32bit
    class function  ClientExists(IvClient: string; var IvFbk: string): boolean; static;
    class function  ClientExistsRio(var IvFbk: string): boolean; static;
    class function  ClientVersionIsOk(IvClient, IvVer: string; var IvFbk: string): boolean; static;
    class function  ClientVersionIsOkRio(var IvFbk: string): boolean; static;
  end;

  TChaRec = record // char
    class function  CharIsAZ(const IvChar: char): boolean; static; // A..Z only
    class function  CharSpecialRnd: char; static;
  end;

  {$REGION 'TChartRec'}

    {$REGION 'Help'}
    {
    TChartRec
      |
      |_TXChartAxisRec
      |
      |_TYChartAxisRec
      |
      |_TChartSerieRecVector
          |
          |_TChartPointRecVector
    }
    {$ENDREGION}

  TChartTitleRec = record
    Caption: string;
//public
  //function  ToJson: string;
  end;

  TChartLabelRec = record
  //Caption: string;
    Prefix  : string;
    Suffix  : string;
    AngleDeg: string;
//public
  //function  ToJson: string;
  end;

  TChartAxisRec = record
    TitleRec: TChartTitleRec;
    LabelRec: TChartLabelRec;
//public
  //function  ToJson: string;
  end;

  TChartPointRec = record
    Name   : string;
    XLabel : string; // if present override x
    X      : variant;
    Y      : variant;
    Z      : variant;
    Color  : variant;
    Shape  : string;
    Size   : string;
    ToolTip: string; // override tooltip at serie level
//public
  //function  ToJson: string;
  end;

  TChartPointRecVector = array of TChartPointRec;

  TChartSerieRec = record
    ReportId      : integer; // key
    Order         : integer;
    State         : string ;
    Dataset       : string ; // key
    Chart         : string ; // key
    Serie         : string ; // key
    Kind          : string ; // Column
    Title         : string ;
    Legend        : string ;
    LegendOn      : boolean;
    ToolTip       : string ;
    ToolTipShared : boolean;
    XLabelField   : string ;
    XField        : string ;
    YField        : string ;
    ZField        : string ;
    ToolTipField  : string ;
    ColorField    : string ;
    SizeField     : string ;
    ShapeField    : string ;
    PointRecVector: TChartPointRecVector;
  //public
    //function  ToJson: string;
  end;

  TChartSerieRecVector = array of TChartSerieRec;

  TChartRec = record
    ReportId      : integer; // key
    Order         : integer;
    Dataset       : string ; // key
    Chart         : string ; // key
    State         : string ;
    Title         : string ;
    Subtitle      : string ;
    Description   : string ;
    Width         : string ; // 640px, 100%
    Height        : string ; // 320px, 100%
    TitleOn       : boolean;
    PanelOn       : boolean;
    PanelClosed   : boolean;
    XAxisRec      : TChartAxisRec;
    YAxisRec      : TChartAxisRec;
    SerieRecVector: TChartSerieRecVector;
  public
    procedure Init(IvDs: TDataSet; IvChart, IvWidth, IvHeight, IvTitle, IvXCaption, IvYCaption, IvXLabelAngleDeg, IvYLabelAngleDeg: string; IvSerieRecVector: TChartSerieRecVector);
  //function  ToJson: string;
    function  ToCanvasJs: string;
    function  ToPlotly: string;
  end;

  TChartRecVector = array of TChartRec;
  {$ENDREGION}

  TCnvRec = record // canvas
    class function  CnvTextWidth(IvString: string; IvFont: TFont): integer; static;
    class procedure CnvFontSet(IvCanvas: TCanvas; IvFontName: string; IvFontSize: integer = 8; IvFontColor: TColor = clBlack; IvFontStyleSet: TFontStyles = []); static;
    class procedure CnvBrushSet(IvCanvas: TCanvas; IvBrushColor: TColor; IvBrushStyle: TBrushStyle); static;
    class procedure CnvPenSet(IvCanvas: TCanvas; IvPenColor: TColor; IvPenStyle: TPenStyle; IvPenWidth: integer); static;
    class procedure CnvBrushPenSet(IvCanvas: TCanvas; IvBrushColor: TColor; IvBrushStyle: TBrushStyle; IvPenColor: TColor; IvPenStyle: TPenStyle; IvPenWidth: integer = 1); static;
    class procedure CnvRectangle(IvCanvas: TCanvas; IvX, IvY, IvW, IvH: integer; IvBgBrushColor, IvPenColor: TColor; IvPenStyle: TPenStyle; IvPenWidth: integer); static;
  end;

  {$REGION 'TCodKindEnum'}
  TCodKindEnum = ( // codekind --> contentkind *** search JAVA for all places to change ***
    ckBat      // x             0
  , ckCss      //        x      1
  , ckCsv      //        x      2
  , ckDws      // x             3
  , ckHtml     //        x      4
  , ckIni      //        x      5
//, ckIss      // x
  , ckJava     // x             6
  , ckJs       // x             7
  , ckJsl      // x             8
  , ckJson     //        x      9
  , ckMd       //        x      10
  , ckPas      // x             11
  , ckPy       // x             12
  , ckR        // x             13
  , ckSql      // x             14
  , ckTxt      //        x      15
  , ckXml      //        x      16
  , ckYaml     //        x      17
  );           // EXEC   DATA   ENUM
  {$ENDREGION}

  TCoiRec = record // codeitem --> contentkind
    Tag{ContentKindEnub}: TCodKindEnum;
    Lang                : string;
    Kind{ContentKind}   : string;
    Comm           : string; // commentsingleline
    Comm1          : string; // commentmultilinesbegin
    Comm2          : string; // commentmultilinesend
    DlgDefaultExt  : string;
    DlgFilter      : string;
    ContentTemplate: string;
    JsonTemplate   : string;
    Test           : string;
  end;

  TCoiRecVec = array of TCoiRec;

  TCodRec = record // code(kind) --> contentkind
  const
    BAT   : TCoiRec = (Tag: TCodKindEnum.ckBat ; Lang: 'BAT'     ; Kind: 'Bat' ; Comm: '::'; Comm1: '::'  ; Comm2: '::' ; DlgDefaultExt: '.bat' ; DlgFilter: 'BAT files (*.bat)|*.bat'
          ; ContentTemplate: '/* bat-template */'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : ':: test'
          + sLineBreak     + '');

    CSS   : TCoiRec = (Tag: TCodKindEnum.ckCss ; Lang: 'CSS'     ; Kind: 'Css' ; Comm: '--'; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.css' ; DlgFilter: 'CSS files (*.css)|*.css'
          ; ContentTemplate: '/* css-template */'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '/* test */'
          + sLineBreak     + '');

    CSV   : TCoiRec = (Tag: TCodKindEnum.ckCsv ; Lang: 'CSV'     ; Kind: 'Csv' ; Comm: '--'; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.csv' ; DlgFilter: 'CSV files (*.csv)|*.csv'
          ; ContentTemplate: '/* csv-template */'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '/* test */'
          + sLineBreak     + '');

    DWS   : TCoiRec = (Tag: TCodKindEnum.ckDws ; Lang: 'DWS'     ; Kind: 'Dws' ; Comm: '//'; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.dws' ; DlgFilter: 'DWS files (*.dws)|*.dws'
          ; ContentTemplate: '/* dws-template */'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '/* test */'
          + sLineBreak     + 'var x: string = ''abc'';');

    HTML  : TCoiRec = (Tag: TCodKindEnum.ckHtml; Lang: 'HTML'    ; Kind: 'Html'; Comm: '--'; Comm1: '<!--'; Comm2: '-->'; DlgDefaultExt: '.html'; DlgFilter: 'HTML files (*.html)|*.html'
          ; ContentTemplate: '<!-- html-template -->'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '<!-- test  -->'
          + sLineBreak     + '');

    INI  : TCoiRec = (Tag: TCodKindEnum.ckIni  ; Lang: 'INI'     ; Kind: 'Ini' ; Comm: ',' ; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.ini' ; DlgFilter: 'INI files (*.ini)|*.ini'
          ; ContentTemplate: '; ini-template'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '[section]'
          + sLineBreak     + 'key=value');

    JAVA  : TCoiRec = (Tag: TCodKindEnum.ckJava; Lang: 'JAVA'    ; Kind: 'Java'; Comm: '//'; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.java'; DlgFilter: 'JAVA files (*.java)|*.java'
          ; ContentTemplate: '// java-template'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '// test'
          + sLineBreak     + '');

    JS    : TCoiRec = (Tag: TCodKindEnum.ckJs  ; Lang: 'JS'      ; Kind: 'Js'  ; Comm: '//'; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.js'  ; DlgFilter: 'JS files (*.js)|*.js'
          ; ContentTemplate: '// js-template'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '// test'
          + sLineBreak     + 'var a = "hello";' + sLineBreak + 'alert(a);');

    JSL   : TCoiRec = (Tag: TCodKindEnum.ckJsl ; Lang: 'JSL'     ; Kind: 'Jsl' ; Comm: '//'; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.jsl' ; DlgFilter: 'JSL files (*.jsl)|*.jsl'
          ; ContentTemplate: '// jsl-template'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '// test'
          + sLineBreak     + '');

    JSON  : TCoiRec = (Tag: TCodKindEnum.ckJson; Lang: 'JSON'    ; Kind: 'Json'; Comm: '--'; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.json'; DlgFilter: 'JSON files (*.json)|*.json'
          ; ContentTemplate: '// json-template'
          + sLineBreak     + '{}'
          ; JsonTemplate:    ''
          ; Test:            '// test'
          + sLineBreak     + '{"id": 123}');

    MD    : TCoiRec = (Tag: TCodKindEnum.ckMd  ; Lang: 'MARKDOWN'; Kind: 'Md'  ; Comm: '--'; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.md'  ; DlgFilter: 'MARKDOWN files (*.md)|*.md'
          ; ContentTemplate: '// markdown-template'
          + sLineBreak     + '{}'
          ; JsonTemplate:    ''
          ; Test:            '// test'
          + sLineBreak     + '{"id": 123}');

    PAS   : TCoiRec = (Tag: TCodKindEnum.ckPas ; Lang: 'PASCAL'  ; Kind: 'Pas' ; Comm: '//'; Comm1: '(*'  ; Comm2: '*)' ; DlgDefaultExt: '.pas' ; DlgFilter: 'PASCAL files (*.pas)|*.pas'
          ; ContentTemplate: '// pascal-template'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '// test'
          + sLineBreak     + '');

    PY    : TCoiRec = (Tag: TCodKindEnum.ckPy  ; Lang: 'PYTHON'  ; Kind: 'Py'  ; Comm: '#' ; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.py'  ; DlgFilter: 'PYTHON files (*.py)|*.py'
          ; ContentTemplate: '## python-template'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '## test'
          + sLineBreak     + 'print(2 + 2)');

    R     : TCoiRec = (Tag: TCodKindEnum.ckR   ; Lang: 'R'       ; Kind: 'R'   ; Comm: '#' ; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.r'   ; DlgFilter: 'R files (*.r)|*.r'
          ; ContentTemplate: '## r-template'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '## test'
          + sLineBreak     + '');

    SQL   : TCoiRec = (Tag: TCodKindEnum.ckSql ; Lang: 'SQL'     ; Kind: 'Sql' ; Comm: '--'; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.sql' ; DlgFilter: 'SQL files (*.sql)|*.sql'
          ; ContentTemplate: '-- sql-template'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '-- test'
          + sLineBreak     + 'select getdate() as FldDateTime');

    TXT   : TCoiRec = (Tag: TCodKindEnum.ckTxt ; Lang: 'TXT'     ; Kind: 'Txt' ; Comm: '--'; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.txt' ; DlgFilter: 'TEXT files (*.txt)|*.txt'
          ; ContentTemplate: '-- txt-template'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '-- test'
          + sLineBreak     + '');

    XML   : TCoiRec = (Tag: TCodKindEnum.ckXml ; Lang: 'XML'     ; Kind: 'Xml' ; Comm: '--'; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.xml' ; DlgFilter: 'XML files (*.xml)|*.xml'
          ; ContentTemplate: '-- xml-template'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '-- test'
          + sLineBreak     + '');

    YAML  : TCoiRec = (Tag: TCodKindEnum.ckHtml; Lang: 'YAML'    ; Kind: 'Yaml'; Comm: '#' ; Comm1: '/*'  ; Comm2: '*/' ; DlgDefaultExt: '.yaml'; DlgFilter: 'YAML files (*.yaml)|*.yaml'
          ; ContentTemplate: '<!-- yaml-template -->'
          + sLineBreak     + ''
          ; JsonTemplate   : ''
          ; Test           : '<!-- test  -->'
          + sLineBreak     + '');

    HEADER_BLOCK_TEMPLATE  = '~~[REGION ''HEADER'']' // ~~ = comment chars replaced with chars language-specific
             + sLineBreak  + '~~ -----------------------------------------------------------------------------'
             + sLineBreak  + '~~ title      :  ...'
             + sLineBreak  + '~~ description:  ...'
             + sLineBreak  + '~~ link       :  ...'
             + sLineBreak  + '~~ '
             + sLineBreak  + '~~ author     :  [RvUsername()]'
             + sLineBreak  + '~~ created    :  [RvDatNow()]'
             + sLineBreak  + '~~ copyright  :  © [RvOrganization()] [RvDatNowYear()]'
             + sLineBreak  + '~~ licence    :  BDS'
             + sLineBreak  + '~~ -----------------------------------------------------------------------------'
             + sLineBreak  + '~~[ENDREGION]'
             + sLineBreak  + sLineBreak;
    FOLDING_BLOCK_TEMPLATE = '~~[REGION ''...'']' // ~~ = comment chars replaced with chars language-specific
             + sLineBreak  + '~~[ENDREGION]'
             + sLineBreak  + sLineBreak;
    SECTION_BLOCK_TEMPLATE = '~~ ----------------------------------------------------------------------------- ...'
             + sLineBreak  + sLineBreak;
  public
    Obj            : TObjRec;
    ObjectId       : integer; // FldObjectId
    ReturnAs       : string ; // FldReturnAs        AsScript, AsCsv, AsJson, AsHtml, AsText, AsXml
    ReturnMimeType : string ; // FldReturnMimeType
    OutputDirectory: string ; // FldOutputTo
    OutputTo       : string ; // FldOutputDirectory
    OutputFileName : string ; // FldOutputFileName
    RunCommand     : string ; // FldRunCommand
    class function  Vector(): TCoiRecVec; static;
    class function  CommentStr(IvCodKindEnum: TCodKindEnum): string; overload; static;  // rowcomment
    class function  CommentStr(IvCodKindStr: string): string; overload; static;         // bystr
    class function  Comment1Str(IvCodKindEnum: TCodKindEnum): string; overload; static; // blockcommentbegin, like: /* or <!--
    class function  Comment1Str(IvCodKindStr: string): string; overload; static;        // bystr
    class function  Comment2Str(IvCodKindEnum: TCodKindEnum): string; overload; static; // blockcommentend  , like: */ or -->
    class function  Comment2Str(IvCodKindStr: string): string; overload; static;        // bystr
    class function  CodeKindEnumFromInt(IvCodeKindInt: integer): TCodKindEnum; static;  //   0 --> ckBat
    class function  CodeKindEnumFromStr(IvCodeKindStr: string): TCodKindEnum; static;   // Bat --> ckBat
          procedure Reset(IvResetObjAlso: boolean = false);
          function  InitDba(IvId: integer; var IvFbk: string): boolean;
  //      function  InitRio(IvId: integer; var IvFbk: string): boolean;
  end;

  TColRec = record // color
    class function  TColToColorRef(IvColor: TColor): TColorRef; static;

    class function  TColIsDark(IvColor: TColor): boolean; static;                                      // brightness < 128

    class function  TColDarken(IvColor: TColor; IvPercentage: integer): TColor; static;                //
    class function  TColLighten(IvColor: TColor; IvPercentage: integer): TColor; static;               //

    class function  TColAnti(IvColor: TColor): TColor; static;                                         // complementary, inverted color
    class function  TColAntiBw(IvColor: TColor): TColor; static;                                       // black or white for a given color

    class function  TColToHtmlHexStr(IvColor: TColor): string; static;                                 // clRed     -> '#rrggbb'
    class function  TColFromHtmlHexStr(IvHColor: string; IvDefault: TColor = clNone): TColor; static;  // '#rrggbb' -> clRed

    class function  TColFromHtmlNameStr(IvHColor: string; IvDefault: TColor = clNone): TColor; static; // 'red'     -> clRed
    class function  TColToHtmlNameStr(IvTColor: TColor; IvDefault: string = 'black'): string; static;  // clRed     -> 'red'

    class procedure TColToHsl(const IvColor: TColor; out H, S, L: word; IvKind: integer = 0); static;
    class function  TColFromHsl(const H, S, L: word): TColor; static;
    
    class function  R(IvColor : TColor): byte; overload; static;
    class function  R(IvHColor: string): byte; overload; static;
    class function  G(IvColor : TColor): byte; overload; static;
    class function  G(IvHColor: string): byte; overload; static;
    class function  B(IvColor : TColor): byte; overload; static;
    class function  B(IvHColor: string): byte; overload; static;
    
    class function  H(IvColor : TColor): double; static;                      // hue
    class function  S(IvColor : TColor): double; static;                      // saturation
    class function  L(IvColor : TColor): double; static;                      // luminosity = luminance = brightness = 0.25*red + 0.625*green + 0.125*blue (simplified formula)

    class function  HColW3(IvFbkMode: TFbkModeEnum = fmInfo): string; static; // w3.css html color from fbkmode
  //class function  HColBs(IvFbkMode: TFbkModeEnum = fmInfo): string; static; // bootstrap html color from fbkmode

    class function  ToStr(IvColor: TColor): string; static;                   // tcolor to 'clRed'
    class function  FromStr(IvString: string): TColor; static;                // 'clRed' to tcolor

    class function  ToHexStr(IvColor: TColor): string; static;                                     //
    class function  FromHexStr(IvHexString: string; IvDefault: string = '808080'): TColor; static; //

    class function  TColorRnd(IvStart: byte = 127): TColor; static;                                // for red green and blue byte, select $00, $33, $66, $99, $cc or $ff or rather: random(6) * $33 so the resulting 216 possible combinations will not look dark
    class function  TColorRnd2(const IvMix: TColor = clWhite): TColor; static;                     //
    class function  ColorAggRnd(IvStart: byte = 127; IvAlpha: string = '40'): string; static;      // return rrggbbaa suitable for aggpas
    class function  ColorHexRnd: string; static;
    class function  ColorHexaRnd: string; static;

    class function  StrIsHtmlHexColor(const IvColorStr: string): boolean; static;
    class function  StrIsHtmlRgbColor(const IvColorStr: string): boolean; static;
    class function  StrIsHtmlNameColor(const IvColorStr: string): boolean; static;
  end;

  TCryRec = record // crypto

    {$REGION 'Help'}
    (*
      Convention
      ----------
      Plain       original text not encrypted
      Cipher      encrypted text
      Key         the method to pass from Chipher to Plain
      Salt        random piece of data combined with your plain text, usally appended

      Cryptographic Hashes
      --------------------
      MD5         collision resistance can be broken in less than a second
      SHA1        collision resistance can be broken
      SHA2        no significant attack has been demonstrated

      Non Cryptographic Hashes
      ------------------------
      BobJenkins  ???

      Block Size
      ----------
                  block-size   key-size
      ------------------------------------------
      DES         64 bits      56 bits, insecure      Data Encryption Standard (not any more, to easy to break)
      Tripe DES   64 bits      56, 112, 168 bits
      AES         64 bits      128, 192, 256 bits     Advanced Encryption Standard

      so how to encrypt large amount of data?
      we use Block Modes like these:

      ECB         Electronic Code Block
      CBC         Cypher Block Chaining
      CFB
      OFB
      CRT
      XEX         XOr encrypt XOr

      and Padding:

      Bit paddibg
      Byte padding
      ANSI X.923
      PKC S7

      there are block-cyphers and stream-cyphers

      Initialization Vector (IV)
      --------------------------
      - is a random walue
      - public, can be sent in clear (for example at beginning of the cyfered data)

      Use Cases
      ---------
      Password    ???
      HMAC        message authentication, messages transmission based on a shared key

      Symmetric-Key Cryptography
      --------------------------

       ------------          -------------------          ------------
      | Plain Text |        |    Cypher Text    |        | Plain Text |
       ------------          -------------------          ------------
                |             ^               |             ^
                v             |               v             |
               -----------------             -----------------
              | Encrypt Process |           | Decrypt Process |
               -----------------             -----------------
                              |               ^
                              v               |
                            ----------------------
                           | Shared Key  (SECRET) |
                           |         +            |
                           | Init Vector (PUBLIC) |
                            ----------------------

      Asymmetric-Key Cryptography
      ---------------------------
       ------------          -------------------          ------------
      | Plain Text |        |    Cypher Text    |        | Plain Text |
       ------------          -------------------          ------------
                |             ^               |             ^
                v             |               v             |
               -----------------             -----------------
              | Encrypt Process |           | Decrypt Process |
               -----------------             -----------------
                              |               ^
                              v               |
                       ------------       -------------
                      | Public Key |     | Private Key |
                       ------------       -------------

      Borland
      -------
      Description:  cipher/decipher (encode/decode) 32 bits module, 2^48 variants, 0..255 strings

      Purpose:      Good for encrypting passwors and text, it is very hard to try hack

      Hint:         1) Avoid use StartKey less than 256
                    2) If it use only for internal use you may use default keys, but MODIFY them before compiling

      Parameters:   IvString   = long string (max 2 GB) that need to cipher/decipher
                    IvStartKey = 1st key
                    IvMultKey  = 2nd key
                    IvAddKey   = 3rd key

      RC4
      ---
      It’s fast, extremely reliable and nearly unbreakable
      I do not remember how many thousands of computers were used to crack it, but it was many
      So for normal use by us mere mortals, RC4 is one of the easiest ways to add some very good protection
      from: https://jonlennartaasenden.wordpress.com/2012/05/15/rc4-encryption-revisited

      SCRYPT
      ---
      https://github.com/JackTrapper/scrypt-for-delphi
    *)
    {$ENDREGION}

  const
    // borland
    CRYPTO_KEY_MIN_LEN = 5;
    CRYPTO_START_KEY   = 42427; // default StartKey (31316 + 1) DO NOT CHANGE
    CRYPTO_MULT_KEY    = 28917; // default Mult Key
    CRYPTO_ADD_KEY     = 56581; // default Add Key
  public
    class function  KeyIsValidAndSecure(const IvKey: string; var IvFbk: string): boolean; static;
    // borland
    class function  Cipher(const IvString: ansistring; IvStartKey: integer = CRYPTO_START_KEY; IvMultKey: integer = CRYPTO_MULT_KEY; IvAddKey: integer = CRYPTO_ADD_KEY): string; static;
    class function  Decipher(const IvString: ansistring; IvStartKey: integer = CRYPTO_START_KEY; IvMultKey: integer = CRYPTO_MULT_KEY; IvAddKey: integer = CRYPTO_ADD_KEY): string; static;
    // sha2
    class function  CipherSha2(IvString: string): string; static;            // returns hash value of the provided string
    class function  CipherSha2HMac(IvString, IvKey: string): string; static; // returns a string representation associated with the HMAC authentication (hash-based message authentication code)
    class function  DecipherSha2(IvString: string): string; static;
    class function  DecipherSha2HMac(IvString, IvKey: string): string; static;
    // winapi
    class procedure FileCrypt(const IvFileSource, IvFileDestination, IvPassword: string; IvCrypt: boolean); static;
  end;

  THlsRec = record // color in the HLS model
  const
    MaxFactor = 100; // percentage 0..100
  public
    class function  Brighten(Color: TColor; Factor: integer): TColor; static;                            // Factor: 0..MaxFactor
    class function  Darken(Color: TColor; Factor: integer): TColor; static;                              // Factor: 0..MaxFactor
    class function  BrightnessChange(Color: TColor; Factor: integer): TColor; static;                    // Factor: -MaxFactor..MaxFactor
    class function  SetLuminanceToRGBValue(Value, CurrentLum, NewLum: Integer): byte; static;            // for luminance in the HLS model: Value: 0..255 RGB value, CurrentLum: 0..510, NewLum: 0..510
    class function  SetLuminanceToRGBValues(Color: TColor; CurrentLum, NewLum: integer): TColor; static; // for fast calculation, you must precalculate CurrentLum and convert Color to RGB
    class function  SetLuminanceToRGB(Color: TColor; NewLum: integer): TColor; static;                   // NewLum: 0..510
    class function  TColLuminance(Color: TColor): integer; static;                                       // Result: 0..510
  end;

  TCsvRec = record // csv
    class function  CsvRowField(IvCsvRow: string; IvFieldId: integer): string; static;
    class function  CsvRowFieldAppend(var IvCsvRow: string; IvField: string): string; static;
  end;

  TCtxRec = record // context
    function  HostName: string;
    function  UserLogged: string;
    function  WksModule: string; // Xxx = Object, Page, Code, ...
  end;

  TCtyRec = record // contenttype/mimetype
  const
    // application
    CTY_APP_JSON        = 'application/json';
    CTY_APP_JS          = 'application/javascript';
    CTY_APP_OCTETSTREAM = 'application/octet-stream';
    CTY_APP_PDF         = 'application/pdf';
    CTY_APP_XML         = 'application/xml';
    CTY_APP_ZIP         = 'application/zip';

    // audio

    // font

    // example

    // image
    CTY_IMG_BMP         = 'image/bmp' ;
    CTY_IMG_GIF         = 'image/gif' ;
    CTY_IMG_PNG         = 'image/png' ;
    CTY_IMG_TIF         = 'image/tiff';

    // message

    // model

    // multipart

    // text
    CTY_TXT_HTML        = 'text/html'        ; // ; charset=' + TEncoding.UTF8.MIMEName;
    CTY_TXT_CSS         = 'text/css'         ;
    CTY_TXT_CSV         = 'text/csv'         ;
    CTY_TXT_XML         = 'text/xml'         ;
    CTY_TXT_SSE         = 'text/event-stream';

    // video
  end;

  TDatRec = record // datetime
  const
    ZERO_DAT       = 0.0;
    ZERO_STR       = '12/30/1899 00:00:00';
    ZERO_MSSQL_STR = '1900-01-01 00:00:00.000';
  //NULL_DATE      = -693594; // not good! represents an impossible date of 00/00/0000 ShowMessage(FormatDateTime('dd.mm.yyyy', -693594)) pops up dlg with 00.00.0000, DevExpress use -700000
    MSSQLFORMAT    = 'yyyymmdd hh:nn:ss.zzz';
  public
    // is
    class function  DatIsZero(IvDateTime: TDateTime): boolean; static;                                                // check if datetime is zero
    // year
    class function  DatYear(IvDateTime: TDateTime; IvInc: integer = 0): integer; static;                              // 2020
    // quarter
    class function  DatQuarter(IvDateTime: TDateTime; IvInc: integer = 0): integer; static;                           // 1..4
    // month
    class function  DatMonth(IvDateTime: TDateTime; IvInc: integer = 0): integer; static;                             // 1..12
    class function  DatMonthStr(IvDateTime: TDateTime; IvInc: integer = 0; IvLength: integer = -1): string; static;   // January..December
    // week
    class function  DatWeekIso(IvDateTime: TDateTime; IvInc: integer = 0): integer;static;                            // 1..52(53) (ISO 8601)
    class function  DatWeekWork(IvDateTime, IvWeekWorkOneStartDateTime: TDateTime): integer; static;                  // 1..52(53)  this depends on the start of the 1st workweek in an Organization
    class function  DatWeekDayId(IvDateTime: TDateTime; IvInc: integer = 0): integer; static;                         // 1=monday, 2=tuesday, 3=wednesday, 4=thursday, 5=friday, 6=saturday, 7=sunday (ISO 8601)
    class function  DatWeekDayStr(IvDateTime: TDateTime; IvInc: integer = 0; IvLength: integer = -1): string; static; // Mon,Tue,Wed,Thu,Fri,Sat,Sun | Monday..Sunday (ISO 8601)
    // day
    class function  DatDay(IvDateTime: TDateTime; IvInc: integer = 0): integer; static;                               // 1..31
    // hour
    class function  DatHour(IvDateTime: TDateTime; IvInc: integer = 0): integer; static;                              // 0..23
    // minute
    class function  DatMinute(IvDateTime: TDateTime; IvInc: integer = 0): integer; static;                            // 0..59
    // second
    class function  DatSecond(IvDateTime: TDateTime; IvInc: integer = 0): integer; static;                            // 0..59
    // ms
    // ...
    // iso8601
    class function  DatFromIso(IvDateTimeIso: string; IvDefault: TDateTime; IvInputIsUTC: boolean = true): TDateTime; static;
    class function  DatToIso(IvDateTime: TDateTime; IvInputIsUTC: boolean = true): string; static;
    // mssql
    class function  DatToSql(IvDateTime: TDateTime): string; static;                                                  // 07/19/1960 11:00:00 --> 19600719110000
    class function  DatFromSql(IvDateTimeStr: string): TDateTime; static;                                             // 19600719110000 --> 07/19/1960 11:00:00
    // datecode
    class function  DateToCode(IvDateTime: TDateTime): string; static;                                                // datetime       --> YyyyMmDd
    class function  DateFromCode(IvYyyyMmDdHhMmSs: string): TDate; static;                                            // YyyyMmDdHhMmSs --> date
    // timecode
    class function  TimeToCode(IvDateTime: TDateTime): string; static;                                                // datetime       --> YyyyMmDd
    class function  TimeFromCode(IvYyyyMmDdHhMmSs: string): TTime; static;                                            // YyyyMmDdHhMmSs --> time
    // datetimecode
    class function  DtToCode(IvDateTime: TDateTime): string; static;                                                  // full datetime code
    class function  DtFromCode(IvYyyyMmDdHhMmSs: string): TDateTime; static;                                          // full datetime code
    // now
    class function  DatNowStr             : string  ; static;                                                         // 07/19/1960 11:00:00
    class function  DatNowDateStr         : string  ; static;                                                         // 07/19/1960
    class function  DatNowTimeStr         : string  ; static;                                                         // 11:00:00
    class function  DatNowYear            : integer ; static;                                                         // 1960
    class function  DatNowQuarter         : integer ; static;
    class function  DatNowMonth           : integer ; static;
    class function  DatNowWeek{Iso}       : integer ; static;
    class function  DatNowDay             : integer ; static;
    class function  DatNowHour            : integer ; static;
    class function  DatNowMinute          : integer ; static;
    class function  DatNowSecond          : integer ; static;
    class function  DatNowAmPm            : string  ; static;
    class function  DatNowCode            : string  ; static;                                                         // 19600719-110000
    class function  DatNowMs{FromMidNight}: cardinal; static;                                                         // return the number of ms from midnight 00:00:00 until now
    // diff
    class procedure DateDiff(IvDateStart, IvDateEnd: TDateTime; out IvYears, IvMonths, IvDays, IvHours: integer); static;
  end;

  TDbaCls = class // database class (persistent object with a persistent connection across an entire form or webmodule)
  const
    DBA_CONN_STR = DBA_CONNECTION_STR;
  private
    FAdoConn: TADOConnection;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TDbaRec = record // database record (not persistent connection! instead, create a class to have a persistent object with a persistent connection across an entire form or webmodule)
  const
    DBA_CONN_STR = DBA_CONNECTION_STR;
  public
    // general
    class function  DsFromSql(const IvSql: string; out IvDs: TDataset; var IvAffected: integer; var IvFbk: string; IvFalseIfDsIsEmpty: boolean = true): boolean; overload; static;
    class function  DsFromSql(const IvSql: string; out IvDs: TDataset                         ; var IvFbk: string; IvFalseIfDsIsEmpty: boolean = true): boolean; overload; static;
    class function  DsFromSql(const IvSql: string; out IvDs: TDataset                                            ; IvFalseIfDsIsEmpty: boolean = true): boolean; overload; static;
    class function  CmdExec(const IvSql: string; var IvAffected: integer; var IvFbk: string; IvTimeoutSec: integer = DBA_CMD_TIMEOUT_SEC): boolean; static;
    class function  Scalar(const IvSql: string; const IvDefault: variant): variant; static;
    class function  CsvFromSql(IvSql: string; IvHeaderOn: boolean = true): string; static;
    // table
    class function  TblExists(const IvDbaSchTbl: string): boolean; static;
    class function  TblIdMax             (const IvTbl: string; IvWhere: string = ''): integer; static;
    class function  TblIdAvailable       (const IvTbl: string; IvWhere: string = ''): integer; static; // where FldDocumentId = 105 in DbaDocument.dbo.TblParagraph
    class function  TblIdNext            (const IvTbl: string; IvUseIdAvailable: boolean = true): integer; static; // use IdMax if false
    // object
    class function  ObjIdFromIdOrPath    (const IvObj, IvIdOrPath: string): integer; static;
    class function  ObjExists            (const IvObj, IvIdOrPath: string): boolean; static;
    class function  ObjFieldGet          (const IvObj, IvField, IvIdOrPath: string; IvDefault: variant): variant; static;                                                                                                  // see TRioRec
    class function  ObjFieldSet          (const IvObj, IvField, IvIdOrPath: string; IvValue  : variant; var IvFbk: string): boolean; static;                                                                               // see TRioRec
    class function  ObjDetailFieldSet    (const IvObj, IvField, IvIdOrPath: string; IvValue  : variant; var IvFbk: string): boolean; static;                                                                               // see TRioRec
    class function  ObjTblHasField       (const IvObj, IvFld: string): boolean; static;
    // hierarchy
    class function  ObjTreeContentDba    (const IvObj, IvIdOrPath: string; IvWithChild: boolean                    ; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean; static;              // return a concatenation of FldContent of one object and all childs
    class function  ObjTreeContentRio    (const IvObj, IvIdOrPath: string; IvWithChild: boolean                    ; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean; static;
    class function  ObjTreeContentRioSave(const IvObj, IvIdOrPath: string; IvWithChild: boolean; IvFileSpec: string; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean; static;
    class function  HPath                (const IvTbl, IvField: string; const IvId: integer; IvDivider: string = '/'; IvStopAtOrganization: boolean = true): string; static;                                               // Root/Organization/W/Wks/Modules | Wks/Modules
    class function  HLevel               (const IvTbl: string; const IvId: integer): integer; static;                                                                                                                      // 0=Root, 1=Organization, ...
    class procedure HParentsDs           (const IvTbl, IvFldCsv: string; const IvId: integer; var IvDs: TDataSet                   ; IvWhere: string = ''; IvOrderBy: string = ''; InIncludeObj: boolean = false); static; // all parents of id
    class procedure HChildsDs            (const IvTbl, IvFldCsv: string; const IvId: integer; var IvDs: TDataSet                   ; IvWhere: string = ''; IvOrderBy: string = ''; InIncludeObj: boolean = false); static; // all childs of id
    class function  HTreeDs              (const IvTbl, IvFldCsv: string; const IvId: integer; var IvDs: TDataSet; var IvFbk: string; IvWhere: string = ''; IvOrderBy: string = ''): boolean; static;                       // parent+item+child
    class function  HIsDescendant        (const IvTbl: string; const IvId, IvPId: integer): boolean; static;                                                                                                               // true only if id belongs to pid
    // other
    class function  SelectVec<T>         (const IvSql: string{; var IvFbk: string}): TArray<T>; static;
  end;

  TDicRec = record
    class function  DicStrStrFromKeyValueCsv(IvKeyValueCsv: string; IvSeparator: string = ','): TDictionary<string, string>; static; // this must be disposed
    class function  DicValueFromKeyFromKeyValueCsv(IvKey, IvKeyValueCsv: string; IvDefault: string = ''; IvSeparator: string = ','): string; static;
  end;

  TDocRec = record // document
  public
    class function  DocKindVector(): TArray<string>; static;
  end;

  TDosRec = record // dos
  public
    class function  DosIsValid(IvDosCommands: string; var IvFbk: string): boolean; static;
    class function  DosExec(IvCommandLine: string; var IvOutput: string; IvWorkDir: string = 'C:\Temp'): boolean; static; // capture dos process output as a string // ex ProcessOutput
  end;

  TDstRec = record // dataset

    {$REGION 'Help'}
(*
    State        Meaning
    ----------------------------------------------------------------------------
    dsInactive   Dataset is not active, so no records can be shown.
    dsBrowse     Standard state when browsing through the record set.
    dsInsert     A new record has been inserted, but is not yet posted.
    dsEdit       The dataset is in edit-mode, data may be changed
    dsSetKey     Index searching is enabled (Setkey)
    dsCalcFields An OnCalcFields event is executed.
    dsFilter     An OnFilterRecord event is executed, data can not be changed.


    Methods      Events ( BeforeEvent - OnExecutingMethod - AfterEvent)
    ----------------------------------------------------------------------------
    Edit         BeforeEdit   - Edit   - AfterEdit
    Insert       BeforeInsert - Insert - AfterInsert
    Post         BeforePost   - Post   - AfterPost
    Cancel       BeforeCancel - Cancel - AfterCancel
    Delete       BeforeDelete - Delete - AfterDelete

    the Before events launch before a dataset enters the specific state.
    the After  events launch when the dataset is just in the specific state
    the On     events ...

    For example you could use a AfterInsert event for applying default values in the new record


    Searching    http://edn.embarcadero.com/article/29176
    ----------------------------------------------------------------------------
    Methods        Notes
    ----------------------------------------------------------------------------
    FindKey        fast, make use of the current index to perform the search   if cds.FindKey([Edit.Text]) then
    FindNearest    fast, idem                                                  cds.FindNearest([Edit.Text])
        use array of values to search

    GotoKey        same searching as FindKey
    GotoNearest    same searching as FindNearest
        use a search key buffer ...

    Locate         moves to the found record
    Lookup         do not move to the found record, returns a variant containing data from the located record
        do not use only the index, can serch all the fields, still fast

        function  Locate(const KeyFields: string; const KeyValues: variant; Options: TLocateOptions): boolean
        If you are locating a record based on a single field, the first argument is the
        name of that field and the second argument is the value you are searching for

    locate        if cds.Locate('Company', 'Ocean Paradise', []) then ...
        To search on more than one field, pass a semicolon-separated string of field names in the first argument,
        and a variant array containing the search values corresponding to the field list in the second argument.

        TLocateOptions set. This set can contain up to two flags, loCaseInsensitive and loPartialKey.
        loCaseInsensitive to ignore case in your search and
        loPartialKey to match any value that begins with the values you pass

        If the search is successful, Locate makes the located record the current record and returns a value of True.
        If the search is not successful, Locate returns False, and the cursor does not move.

    lookup        function  Lookup(const KeyFields: string; const KeyValues: variant; const ResultFields: string): variant;
        v := cds.Lookup('Company', 'Ocean Paradise', []);

        The KeyFields and KeyValues parameters of Lookup are identical in purpose to those in the Locate method
        ResultFields is a semicolon separated string of field names whose values you want returned
        If Lookup fails to find the record you are searching for, it returns a null variant
        Otherwise, it returns a variant containing the field values requested in the ResultFields parameter.

    note: use GetKeyFields and GetKeyValues methods for defining the KeyFields and KeyValues parameters
*)
      {$ENDREGION}

  public
    // filter
    class procedure DsFilterList(IvDs: TDataSet; IvStrToSearch: string; IvFieldToSearchCsv, IvFieldToShowInList: string; IvStringList: TStrings); static;
    // vector
    class procedure DsRecordToFldAndValueVectors(IvDs: TDataSet; var IvFldVec: TStringVector; var IvValueVec: TVariantVector; IvNoFld: boolean = true); static;
    // field
    class function  FieldValueToJsonValue(IvField: TField): string; static;                // Field.Value --> "Xxx", 123, null, {}
    class function  FieldToJson(IvField: TField; IvNoFld: boolean = false): string;static; // Field.Value --> "FldXxx": "Abc"
    // record
  //class procedure RecordToJson     (IvDst: TDataSet; var IvSuperObject: superobject.ISuperObject; IvNoFld: boolean = false; IvRowNoAdd: boolean = false); overload;
    class function  RecordToJson     (IvDst: TDataSet; IvNoFld: boolean = false; IvRowNoAdd: boolean = false): string; overload; static;
    // json *** change to procedure and add IvAffected: integer ***
    class procedure DstToJsonKeyValue(IvDst: TDataSet; var IvJson: string; IvNoFld: boolean = false); static;                                       // used in <select><option> {"key1":"aaa","key2":"bbb",...} only field[0] and field[1] are considered
    class function  DstToJson        (IvDst: TDataSet; var IvJson: string; IvNoFld: boolean = false; IvRowNoAdd: boolean = false): integer; static; // {"Fld1":"aa1","Fld2":"bb1",...},{"Fld1":"aa2","Fld2":"bb2",...}, ..., will returns the number of affected elements
    // xml *** change to procedure and add IvAffected: integer ***
    class function  DstToXml         (IvDst: TDataSet; var IvXml : string; IvNoFld: boolean = false; IvRowNoAdd: boolean = false): integer; static; //
    // txt
    class procedure DstToTxt         (IvDst: TDataSet; var IvTxt : string; IvNoFld: boolean = false; IvRowNoAdd: boolean = false; IvHeaderAdd: boolean = false); static;
    class procedure DstToCsv         (IvDst: TDataSet; var IvCsv : string; IvNoFld: boolean = false; IvRowNoAdd: boolean = false; IvHeaderAdd: boolean = false); static;
    class procedure DstToHtml        (IvDst: TDataSet; var IvHtml: string; IvNoFld: boolean = false; IvRowNoAdd: boolean = false; IvHeaderAdd: boolean = true ); static; // *** DUPLICATED, see THtmRec ***
  end;

  TEnvRec = record // environment
  const
    ENV_DEV_HOST  = 'WIN-BRTRBSP3L29';
    ENV_TEST_HOST = '';
    ENV_PROD_HOST = '';
  public
    class function  EnvIsDev: boolean; static;
    class function  EnvIsTest: boolean; static;
    class function  EnvIsProd: boolean; static;
  end;

  TEnuRec = record // enum
    class function EnumToInt<T>(const IvEnumValue: T): integer; static; // simply use Ord() ?
    class function EnumToStr<T>(IvEnumValue: T; IvRootRemove: boolean = true): string; static; // rrDddddd (rr = root, does not vary, Dddddd = Desinence, does vary)
    class function EnumFromInt<T>(IvEnumInt: integer; IvDefault: T): T; static;
    class function EnumFromStr<T>(IvEnumStr: string; IvDefault: T): T; static;
  end;

  TEscRec = record // escapechars
    class function  CharEscape(IvTxt: string): string; static;
    class function  CharUnEscape(IvTxt: string): string; static;
  end;

  TFbkRec = record // feedback
  private
    Msg: string;
    Description: string;
    Mode: TFbkModeEnum;
  public
    procedure Init      (IvMsg: string; IvDesc: string = ''; IvFbkModeEnum: TFbkModeEnum = fmWarning);
  //procedure InfoSet   (IvMsg: string);
  //procedure SuccessSet(IvMsg: string);
  //procedure WarningSet(IvMsg: string);
  //procedure DangerSet (IvMsg: string);
    class function  W(IvWarning: string): string; static;
    class function  WFmt(IvFormatString: string; IvVarRecVector: array of TVarRec): string; static;
    class function  ExistsStr(IvSubj, IvObj: string; IvBoolean: boolean): string; static;
  end;

  TFrmRec = record // form
    class procedure FormStayOnTop(IvFormHandle: HWND; IvOn: boolean); static;
    class procedure FormInit(IvForm: TForm); static;
  end;

  TFsyRec = record // filesystem

    {$REGION 'Help'}
    (*
      old with compiler warning     new XE
      ------------------------------------------------------------------------------
      IncludeTrailingBackslash      IncludeTrailingPathDelimiter
    *)
    {$ENDREGION}

//const
  //FSY_FILE_ALREADY_EXISTS            = 'File already exists';
  //FSY_FILE_ALREADY_EXISTS_REPLACE_IT = 'File already exists, do you whant to replace it?';
  public
    // dir
    class function  DirExists(IvDir: string; var IvFbk: string): boolean; static;
    class function  DirForce(IvDir: string; var IvFbk: string): boolean; static; // create dirs in sequence as needed
    // file
    class function  FileExists(IvFile: string; var IvFbk: string): boolean; static;
    class function  FileCreate(IvFile: string; IvText: string = ''): boolean; static;
    class function  FileDeleteByWildcards(IvDir, IvPattern: string; var IvFbk: string; IvDeleteReadOnlyFiles: boolean = false): boolean; static;
    class function  FileOpenAsText(const IvFile: string; var IvFbk: string): boolean; static;
    class function  FileNameClean(const IvFileName: string; const IvReplaceWith: Char = '_'): string; static; // remove/replace forbidden chars (all platforms windows\unix)
    // filesttr
    class function  FileAttrSet(const IvFile: string; const IvAttr: dword; const IvSet: boolean): boolean; static; // set file attributes
    class function  FileAttrReset(const IvPath, IvMask: string; IvRecursive: boolean): boolean; static;
    class function  FileAttrReadOnlySet(IvFile: string; var IvFbk: string): boolean; static;
    class function  FileAttrReadOnlyUnset(IvFile: string; var IvFbk: string): boolean; static;
  end;

  TGraRec = record // graphic
  public
    class function  ClassFromExt(IvExt: string): TGraphicClass; static;
    class function  ClassFromStream(const IvStream: TStream): TGraphicClass; static;
    class procedure ToBlobField(IvGraphic: TGraphic; var IvBlobField: TBlobField); static;
    class procedure FromBlobField(var IvGraphic: TGraphic; IvBlobField: TBlobField); static;
    class procedure FromByteArray(var IvGraphic: TGraphic; IvByteArray: TByteDynArray); static;
    class function  PictureDlgLoad(var IvGraphic: TGraphic; var IvFbk: string): boolean; static;
    class function  PictureDlgSave(IvGraphic: TGraphic; IvFileName, IvExt: string; var IvFbk: string): boolean; static;
  end;

  TGriRec = record // grid
  public
    class procedure GriColumnsWidthSet(IvDbGrid: TDBGrid; IvWidthVector: TIntegerDynArray); static;
    class procedure GriColumnsWidthFit(IvDbGrid: TDBGrid); static;
    class procedure GriColumnsMemoHide(IvDbGrid: TDBGrid); static;
    class procedure GriTitleFix(IvDbGrid: TDBGrid); static; // remove Fld
    class procedure GriFix(IvDbGrid: TDBGrid); static; // allabove
    class function  GriFocused: TDBGrid; static;
  end;

  TGuiRec = record // *** MOVE TO TCtxRec ? , NAME MISLEADING ? ***
    Selection: string;  // current string to searc into a Memo with ctrl+f
    SelLength: integer; // remember caret position
  end;

  TPagRec = record // (html)page
    // master
    Obj                     : TObjRec;

    // detail
    ObjectId                : integer;
    Page                    : string ;
    Menu                    : string ;
    Popup                   : string ;
    Icon                    : string ;
    Head                    : string ;
    Css                     : string ;
    Js                      : string ;
    JsAfter                 : string ;
    Header                  : string ;
    Footer                  : string ;
    UniPage                 : string ;
    ContainerOn             : boolean;
    ContentFixed            : boolean;
    Centered                : boolean;
    TitleShow               : boolean;
    SubtitleShow            : boolean;
    TopNavOff               : boolean;
    SystemInfoOff           : boolean;
    TopSpace                : integer;
    BottomSpace             : integer;
    LeftSpace               : integer;
    RightSpace              : integer;
    AuthenticationNeeded    : boolean;

    // derived
    // ...
  public
    procedure Reset(IvResetObjAlso: boolean = false);
    function  InitDba(IvId: integer): boolean;
  end;

  THtmRec = record // html
  const
    HTM_TAG_SINGLE_CSV   = 'doctype,track,source,param,meta,link,area,input,img,iframe,hr,base,basefont,col,br,wbr';
    HTM_INPUT_MONO_CSV   = 'color,date,datetime,email,file,hidden,image,month,number,password,range,search,tel,text,textarea,time,url,week'; // <input type="text">
    HTM_INPUT_MULTI_CSV  = 'checkbox,radio,select'; // datalist ?
    HTM_INPUT_BUTTON_CSV = 'button,reset,search,submit';
  type
    TListModeEnum = (lmUnordered, lmOrdered, lmDefinition);

    THtmInputOptionRec = record // option definition for selectitems, radios or checkboxes
      CoName  : string;
      Value   : string;
      Caption : string;
      Selected: boolean;
    end;

    THtmInputOptionRecVector = array of THtmInputOptionRec;
  public
    class function  Attr(IvAttr, IvValue: string; IvIfTrue: boolean = true): string; static;                                    // attr="value"
    class function  AttrFromVec(IvAttr: string; IvValueVec: TStringVector): string; static;                                     // returns attr ="va1 va2 ..." from ['va1', 'va2', '...']
    class function  AttrClassFromVec(IvClassVec: TStringVector): string; static;                                                // returns class="cl1 cl2 ..." from ['cl1', 'cl2', '...']
    class function  AttrStyleFromVec(IvStyleVec: TStringVector): string; static;                                                // returns style="st1 st2 ..." from ['st1', 'st2', '...']
    class procedure ValAdd(var IvValuesCurr: string; IvValuesToAdd: string; IvSep: string; IvIfTrue: boolean = true); static;   // presuppone 'cls1 cls2' or 'sty1:aaa;sty2:bbb;'
    class function  IdName(IvCoName: string = ''): string; static;                                                              // id="Co1234" name="Co1234" transform to a THatRec
    class function  A(IvHref, IvCaption: string; IvTitle: string = ''; IvTarget: string = ''; IvClass: string = ''; IvStyle: string = ''): string; static;
    class function  H(IvLevel: integer; IvTitle: string; IvClass: string = ''; IvStyle: string = ''): string; static;
    class function  P(IvContent: string; IvDimmed: boolean = false; IvItalic: boolean = false): string; static;
    class function  Br(IvCount: integer): string; static;
    class function  Hr(IvWidthPerc: integer = 100; IvColor: string = '#eee'): string; static;
    class function  Space(IvPx: integer = 8; IvKind: string = 'H'): string; static;                                             // H : <span style="width:%dpx"></span> | V : <div style="height:%dpx"></div>
    class function  Img(IvSrc: string; IvAlt: string = ''; IvW: integer = 0; IvH: integer = 0; IvIsCard: boolean = false; IvTorn: TImgTormEnum = itNone{, IvClass, IvStyle: string}): string; static;
    class function  Code(IvCode: string; IvLanguage: string = 'plaintext'): string; static;
    class function  Panel(IvFbk: TFbkRec; IvDismisible: boolean = true): string; static;  // *** MERGE WITH THtmRec.Collapse ***
    class function  Collapse(IvTitle, IvSubtitle, IvBody: string; IvHhLevel: integer = 1; IvCoName: string = ''; IvTitlesCenter: boolean = false; IvPanelOn: boolean = true; IvPanelClosed: boolean = false): string; static;
    class function  Alert (IvTitle: string; IvText: string = ''; IvClass: string = ''; IvStyle: string = ''): string; static;
    class function  AlertI(IvTitle: string; IvText: string = ''): string; static;
    class function  AlertS(IvTitle: string; IvText: string = ''): string; static;
    class function  AlertW(IvTitle: string; IvText: string = ''): string; static;
    class function  AlertD(IvTitle: string; IvText: string = ''): string; static;
    class function  AlertE(IvTitle: string; IvText: string = ''): string; static;
    class function  Modal   (IvShow: boolean; IvCoName, IvBody: string; IvHeader: string = ''; IvFooter: string = ''; IvFbkMode: TFbkModeEnum = fmNone; IvCopyButtonOn: boolean = false): string; static;
    class function  ModalBtn(IvBtnCaption   , IvCoName, IvBody: string; IvHeader: string = ''; IvFooter: string = ''; IvFbkMode: TFbkModeEnum = fmNone; IvCopyButtonOn: boolean = false): string; static;
    class function  GridRow(IvValueVec, IvClassVec, IvStyleVec: TArray<string>; IvBorderDgOn: boolean = false): string; static;
    class function  Btn(IvCaption: string; IvTitle: string = ''; IvClass: string = ''; IvStyle: string = ''; IvOnClick: string = ''): string; static; // no <form> necessary)
    class function  BtnX(IvCoName: string; IvFollowLink: string = ''; IvFbkMode: TFbkModeEnum = fmNone): string; static;        // close just the panel/modal and optionally go to the given link
    class function  BtnOk(IvCoModalName: string): string; static;                                                               // standard buttons Ok that close the passed modalpanel
    class function  BtnStd(IvKind: string; IvRedirectToPageId: integer = 0; IvData: string = ''): string; static;               // standard buttons like Close, Home, Back, ...
    class function  Elem(IvTag, IvKind, IvCoName: string; IvTitle: string = ''                 ; IvValue: string = ''         ; IvClass: string = ''; IvStyle: string = ''; IvTail: string = ''                                                                               ; IvDisabled: boolean = false                                                     ; IvReadOnly: boolean = false): string; static;
    class function  Choice  (   IvKind, IvCoName        , IvTitle: string     ; IvOptCaptionVec, IvOptValueVec: TArray<string>; IvClass: string = ''; IvStyle: string = ''; IvTail: string = ''; IvValueVec: TArray<string> = {$IF CompilerVersion < 32.0}nil{$ELSE}[]{$ENDIF}; IvDisabledVec: TArray<string> = {$IF CompilerVersion < 32.0}nil{$ELSE}[]{$ENDIF}; IvReadOnly: boolean = false): string; static;
    class function  Select  (           IvCoName        , IvTitle: string     ; IvOptCaptionVec, IvOptValueVec: TArray<string>; IvClass: string = ''; IvStyle: string = ''; IvTail: string = ''; IvValueVec: TArray<string> = {$IF CompilerVersion < 32.0}nil{$ELSE}[]{$ENDIF}; IvDisabledVec: TArray<string> = {$IF CompilerVersion < 32.0}nil{$ELSE}[]{$ENDIF}; IvReadOnly: boolean = false): string; static;
    class function  Radio   (           IvCoName        , IvTitle: string     ; IvOptCaptionVec, IvOptValueVec: TArray<string>; IvClass: string = ''; IvStyle: string = ''; IvTail: string = ''; IvValueVec: TArray<string> = {$IF CompilerVersion < 32.0}nil{$ELSE}[]{$ENDIF}; IvDisabledVec: TArray<string> = {$IF CompilerVersion < 32.0}nil{$ELSE}[]{$ENDIF}; IvReadOnly: boolean = false): string; static;
    class function  Checkbox(           IvCoName        , IvTitle: string     ; IvOptCaptionVec, IvOptValueVec: TArray<string>; IvClass: string = ''; IvStyle: string = ''; IvTail: string = ''; IvValueVec: TArray<string> = {$IF CompilerVersion < 32.0}nil{$ELSE}[]{$ENDIF}; IvDisabledVec: TArray<string> = {$IF CompilerVersion < 32.0}nil{$ELSE}[]{$ENDIF}; IvReadOnly: boolean = false): string; static;
    class function  FormLine(   IvKind, IvCoName        , IvTitle: string     ; IvOptCaptionVec, IvOptValueVec: TArray<string>; IvClass: string = ''; IvStyle: string = ''; IvTail: string = ''; IvValueVec: TArray<string> = {$IF CompilerVersion < 32.0}nil{$ELSE}[]{$ENDIF}; IvDisabledVec: TArray<string> = {$IF CompilerVersion < 32.0}nil{$ELSE}[]{$ENDIF}; IvReadOnly: boolean = false; IvLabel: string = ''; IvHelp: string = ''; IvLabelWidth: integer = 200; IvHelpWidth: integer = 200): string; static;
    class function  Form(                                                                 IvCoName, IvAction, IvMethod, IvBody: string                                                                                                                                                                                                  ; IvClass: string = ''; IvStyle: string = ''; IvEnctype: string = ''; IvValidatorCsv: string = ''): string; overload; static;
    class function  Form(                                                                 IvCoName, IvAction, IvMethod, IvSubmitCaption: string; IvLabelWidth, IvHelpWidth: integer; IvTitleVec, IvKindVec, IvCoNameVec, IvValueVec, IvPlaceholderVec, IvClassVec, IvStyleVec, IvTailVec: TArray<string>; IvRequiredVec: TArray<boolean>; IvClass: string = ''; IvStyle: string = ''; IvEnctype: string = ''; IvValidatorCsv: string = ''): string; overload; static;
    class function  FormModal(IvTitle, IvFaIcon: string; IvCtrlButtonVec: TArray<string>; IvCoName, IvAction, IvMethod, IvSubmitCaption: string; IvLabelWidth, IvHelpWidth: integer; IvTitleVec, IvKindVec, IvCoNameVec, IvValueVec, IvPlaceholderVec, IvClassVec, IvStyleVec, IvTailVec: TArray<string>; IvRequiredVec: TArray<boolean>; IvClass: string = ''; IvStyle: string = ''; IvEnctype: string = ''; IvValidatorCsv: string = ''): string; static;
    class function  List(IvItemVec: TArray<string>; IvMode: TListModeEnum = lmUnordered): string; static;
    class function  TableFromDs(IvDs: TDataset; IvDefault: string = ''; IvClass: string = ''; IvStyle: string = ''; IvEditable: boolean = false; IvEditJson: string = ''; IvDir: THvDirEnum = hvHorizontal; IvDsHeaderOff: boolean = false; IvDsRecordCountOff: boolean = false): string; static;
    class function  TableFromSql(IvSql: string; IvDefault: string = ''; IvClass: string = ''; IvStyle: string = ''; IvEditable: boolean = false; IvEditJson: string = ''; IvDir: THvDirEnum = hvHorizontal; IvDsHeaderOff: boolean = false; IvDsRecordCountOff: boolean = false): string; static;
    class function  RepeatFromDs(IvDs: TDataSet; IvHtmlBody: string; IvHtmlHeader: string = ''; IvHtmlFooter: string = ''; IvHtmlDefault: string = ''): string; static;
    class function  RepeatFromSql(IvSql: string; IvHtmlBody: string; IvHtmlHeader: string = ''; IvHtmlFooter: string = ''; IvHtmlDefault: string = ''): string; static;
    class function  Report(IvId: integer; IvDefaultIfAnyDsIsEmpty: string = ''): string; static;
    class function  SlidesFromDs(IvDs: TDataSet; IvHtmlSlideBody: string; IvHtmlHeader: string = ''; IvHtmlFooter: string = ''; IvHtmlDefault: string = ''; IvSlideId: integer = 1): string; static; // similar to repeater
    class function  SlidesFromSql(IvSql: string; IvHtmlSlideBody: string; IvHtmlHeader: string = ''; IvHtmlFooter: string = ''; IvHtmlDefault: string = ''; IvSlideId: integer = 1): string; static; // similar to repeater
    class function  TopNav(IvId, IvPId: integer): string; static;
    class function  Page(IvPage: TPagRec{; IvTopNavOff: boolean = false; IvSystemInfoOff: boolean = false}): string; overload; static;
    class function  Page(IvId: integer; IvTopNavOff: boolean = false; IvSystemInfoOff: boolean = false): string; overload; static;
    class function  Page(IvTitle: string = ''; IvContent: string = ''; IvTopNavOff: boolean = false; IvSystemInfoOff: boolean = false): string; overload; static;
    class function  PageSimple: string; static;
    class function  PageDefault: string; static;
    class function  PageFeedback(IvFbk: TFbkRec): string; static;
    class function  PageInfo(IvMsg: string; IvDesc: string = ''): string; static;
    class function  PageSuccess(IvMsg: string; IvDesc: string = ''): string; static;
    class function  PageWarning(IvMsg: string; IvDesc: string = ''): string; static;
    class function  PageDanger(IvMsg: string; IvDesc: string = ''): string; static;
    class function  PageException(IvE: Exception; IvDesc: string = ''): string; static;
  end;

  THttRec = record // http   https://www.loggly.com/blog/http-status-code-diagram
  const
    HTTP_HEADER_EXPIRE                     = 'Mon, 19 Jul 1960 05:00:00 GMT';

    HTTP_STATUS_100_CONTINUE               = 100;    HTTP_STATUS_100_CONTINUE_STR           = '100 - OK to continue with request';
  //HTTP_STATUS_101                        = 101;  //HTTP_STATUS_101_SWITCH_PROTOCOLS_STR   = '101 - server has switched protocols in upgrade header';
  //HTTP_STATUS_102                        = 102;                                                 // Processing';
  //HTTP_STATUS_103                        = 103-199;                                             // Unassigned';

    HTTP_STATUS_200_OK                     = 200;    HTTP_STATUS_200_OK_STR                 = '200 - OK request completed';
  //HTTP_STATUS_201                        = 201;  //HTTP_STATUS_201_CREATED_STR            = '201 - object created, reason = new URI;
  //HTTP_STATUS_202                        = 202;  //HTTP_STATUS_202_ACCEPTED_STR           = '202 - Accepted, async completion (TBS)';
  //HTTP_STATUS_203                        = 203;  //HTTP_STATUS_203_PARTIAL_STR            = '203 - partial completion, Non-Authoritative Information';
  //HTTP_STATUS_204                        = 204;  //HTTP_STATUS_204_NO_CONTENT_STR         = '204 - No Content, no info to return';
  //HTTP_STATUS_205                        = 205;  //HTTP_STATUS_205_RESET_CONTENT_STR      = '205 - reset content, request completed, but clear form';
  //HTTP_STATUS_206                        = 206;  //HTTP_STATUS_206_PARTIAL_CONTENT_STR    = '206 - partial content GET furfilled';
  //HTTP_STATUS_207                        = 207;                                                 // Multi-Status';
  //HTTP_STATUS_208                        = 208;                                                 // Already Reported';
  //HTTP_STATUS_209                        = 209-225;                                             // Unassigned';
  //HTTP_STATUS_226                        = 226;                                                 // IM Used';
  //HTTP_STATUS_227                        = 227-299;                                             // Unassigned';

  //HTTP_STATUS_300                        = 300;  //HTTP_STATUS_300_AMBIGUOUS_STR          = '300 - Multiple Choices, server couldn't decide what to return';
  //HTTP_STATUS_301                        = 301;  //HTTP_STATUS_301_MOVED_STR              = '301 - object permanently moved';
    HTTP_STATUS_302_REDIRECT               = 302;    HTTP_STATUS_302_REDIRECT_STR           = '302 - Object temporarily moved';
  //HTTP_STATUS_303                        = 303;  //HTTP_STATUS_303_REDIRECT_METHOD_STR    = '303 - redirection w/ new access method'; // see Other
  //HTTP_STATUS_304                        = 304;  //HTTP_STATUS_304_NOT_MODIFIED_STR       = '304 - if-modified-since was not modified'; // not modified
  //HTTP_STATUS_305                        = 305;  //HTTP_STATUS_305_USE_PROXY_STR          = '305 - redirection to proxy, location header specifies proxy to use'; // Use Proxy
  //HTTP_STATUS_306                        = 306;                                                 // (Unused)';
  //HTTP_STATUS_307_REDIRECT_KEEP_VERB_STR = 307;  //HTTP_STATUS_307_REDIRECT_KEEP_VERB_STR = '307 - HTTP/1.1: keep same verb'; // Temporary Redirect
  //HTTP_STATUS_308                        = 308;                                                 // Permanent Redirect';
  //HTTP_STATUS_309                        = 309-399;                                             // Unassigned';

    HTTP_STATUS_400_BAD_REQUEST            = 400;  //HTTP_STATUS_400_BAD_REQUEST_STR        = '400 - Bad Request, invalid syntax';
    HTTP_STATUS_401_UNAUTHORIZED           = 401;    HTTP_STATUS_401_UNAUTHORIZED_STR       = '401 - Unauthorized, access denied';
  //HTTP_STATUS_402                        = 402;  //HTTP_STATUS_402_PAYMENT_REQ_STR        = '402 - payment required';
    HTTP_STATUS_403_FORBIDDEN              = 403;    HTTP_STATUS_403_FORBIDDEN_STR          = '403 - Request forbidden';
  //HTTP_STATUS_404                        = 404;  //HTTP_STATUS_404_NOT_FOUND_STR          = '404 - object not found';
    HTTP_STATUS_405_BAD_METHOD             = 405;    HTTP_STATUS_405_BAD_METHOD_STR         = '405 - Method is not allowed';
  //HTTP_STATUS_406                        = 406;  //HTTP_STATUS_406_NON_ACCEPTABLE_STR     = '406 - Not Acceptable, no response acceptable to client found';
  //HTTP_STATUS_407                        = 407;  //HTTP_STATUS_407_PROXY_AUTH_REQ_STR     = '407 - proxy authentication required';
  //HTTP_STATUS_408                        = 408;  //HTTP_STATUS_408_REQUEST_TIMEOUT_STR    = '408 - Request Timeout, server timed out waiting for request';
  //HTTP_STATUS_409                        = 409;  //HTTP_STATUS_409_CONFLICT_STR           = '409 - Conflict, user should resubmit with more info';
  //HTTP_STATUS_410                        = 410;  //HTTP_STATUS_410_GONE_STR               = '410 - Gone, the resource is no longer available';
  //HTTP_STATUS_411                        = 411;  //HTTP_STATUS_411_LENGTH_REQUIRED_STR    = '411 - Length Required'; ???
  //HTTP_STATUS_411                        = 411;  //HTTP_STATUS_411_AUTH_REFUSED_STR       = '411 - couldn't authorize client'; ???
  //HTTP_STATUS_412                        = 412;  //HTTP_STATUS_412_PRECOND_FAILED_STR     = '412 - Precondition Failed, the server refused to accept request w/o a length';
  //HTTP_STATUS_413                        = 413;  //HTTP_STATUS_413_REQUEST_TOO_LARGE_STR  = '413 - Payload Too Large, precondition given in request failed';
  //HTTP_STATUS_414                        = 414;  //HTTP_STATUS_414_URI_TOO_LONG_STR       = '414 - URI Too Long, request entity was too large';
  //HTTP_STATUS_415                        = 415;  //HTTP_STATUS_415_UNSUPPORTED_MEDIA_STR  = '415 - request URI too long';
  //HTTP_STATUS_416                        = 416;                                                 // unsupported media type'; // Range Not Satisfiable
  //HTTP_STATUS_417                        = 417;                                                 // Expectation Failed';
  //HTTP_STATUS_418                        = 418-420;                                             // Unassigned';
  //HTTP_STATUS_421                        = 421;                                                 // Misdirected Request';
  //HTTP_STATUS_422                        = 422;                                                 // Unprocessable Entity';
  //HTTP_STATUS_423                        = 423;                                                 // Locked';
  //HTTP_STATUS_424                        = 424;                                                 // Failed Dependency';
  //HTTP_STATUS_425                        = 425;                                                 // Unassigned';
  //HTTP_STATUS_426                        = 426;                                                 // Upgrade Required';
  //HTTP_STATUS_427                        = 427;                                                 // Unassigned';
  //HTTP_STATUS_428                        = 428;                                                 // Precondition Required';
  //HTTP_STATUS_429                        = 429;                                                 // Too Many Requests';
  //HTTP_STATUS_430                        = 430;                                                 // Unassigned';
  //HTTP_STATUS_431                        = 431;                                                 // Request Header Fields Too Large ;
  //HTTP_STATUS_432                        = 432-450;                                             // Unassigned';
  //HTTP_STATUS_451                        = 451;                                                 // Unavailable For Legal Reasons';
  //HTTP_STATUS_451                        = 449;  //HTTP_STATUS_451_RETRY_WITH_STR         = '449 - retry after doing the appropriate action';
  //HTTP_STATUS_452                        = 452-499;                                             // Unassigned';

    HTTP_STATUS_500_SERVER_ERROR           = 500;    HTTP_STATUS_500_SERVER_ERROR_STR       = '500 - Internal server error';
    HTTP_STATUS_501_NOT_SUPPORTED          = 501;    HTTP_STATUS_501_NOT_SUPPORTED_STR      = '501 - Not Implemented, required not supported';
  //HTTP_STATUS_502                        = 502;  //HTTP_STATUS_502_BAD_GATEWAY_STR        = '502 - Bad Gateway, error response received from gateway';
  //HTTP_STATUS_503                        = 503;  //HTTP_STATUS_503_SERVICE_UNAVAIL_STR    = '503 - Service Unavailable, temporarily overloaded';
  //HTTP_STATUS_504                        = 504;  //HTTP_STATUS_504_GATEWAY_TIMEOUT_STR    = '504 - Gateway Timeout timed out waiting for gateway';
  //HTTP_STATUS_505                        = 505;  //HTTP_STATUS_505_VERSION_NOT_SUP_STR    = '505 - HTTP version not supported';
  //HTTP_STATUS_506                        = 506;                                                 // Variant Also Negotiates';
  //HTTP_STATUS_507                        = 507;                                                 // Insufficient Storage';
  //HTTP_STATUS_508                        = 508;                                                 // Loop Detected';
  //HTTP_STATUS_509                        = 509;                                                 // Unassigned';
  //HTTP_STATUS_510                        = 510;                                                 // Not Extended';
  //HTTP_STATUS_511                        = 511;                                                 // Network Authentication Required';
  //HTTP_STATUS_512                        = 512-599;                                             // Unassigned';
  public
    class function  Get(IvUrl: string; var IvContent, IvFbk: string; IvDefault: string = ''): boolean; static;// returninternetcontent
  end;

  TId8Rec = record // A..Z: 26^8 = 208,827,064,576  +  0..9: 36^8 = 2821,109,907,456 codes
  public
    class function  Generate: string; static;
  end;

  TIifRec = record // inlineif
    function  NxN(IvVar: variant): variant;                                                       // if not exists return null else the variant
    function  NxD(IvStr: string; IvDefault: string = ''): string;                                 // if not exists return default else return string
    function  NxR(IvStr: string; IvSize: integer = 4): string;                                    // if not exists return random string (of 4 chars by default)
    function  ExR(IvStr: string; IvElse: string = ''): string;                                    // if exists return str else
    function  ExA(IvStr, IvAppend: string): string;                                               // if exists return str+append else empty
    function  ExP(IvStr, IvPrepend: string): string;                                              // if exists return prepend+str else empty
    function  ExFmt(IvStr: string; IvFormat: string; IvVec: array of TVarRec): string; overload;  // if exists format else empty
    function  ExFmt(IvStr: string; IvFormat: string): string; overload;                           // if exists format (use ivstr as the only element of ivvec) else empty
    function  Str(IvTest: boolean; IvValueTrue: string; IvValueFalse: string = ''): string;       // simple iif str
    function  Int(IvTest: boolean; IvValueTrue, IvValueFalse: integer): integer;                  // simple iif int
    function  BtR(IvTest: boolean; IvReturn: string): string;                                     // if true return else empty
    function  BfR(IvTest: boolean; IvReturn: string): string;                                     // if false return else empty
  end;

  TIisRec = record // inlineis
    function  Nx(IvStr: string): boolean;                                                         // is not existent  = empty
    function  Ex(IvStr: string): boolean;                                                         // is existent      = not empty
    function  Same(IvStrVec: TArray<string>; IvStr: string): boolean;                             // true if one of vector = ivstr
  end;

  TIniCls = class // ini read/write are by prefix: Root/Organization/W/Wks/User
  private                                                            //domain/oslogin
    FIniFile: TIniFile;
  public
    constructor Create;
    destructor  Destroy; override;
    procedure SectionIdent(const IvPath: string; var IvSection, IvIdent: string); // path --> section/ident
    function  StrGet(const IvPath: string; IvDefault: string = ''; IvForceDefaultIfKeyIsEmpty: boolean = false): string;        // normally if a key EXISTS and is EMPTY (like Key=), the IvDefault is not forced
    procedure StrSet(const IvPath, IvValue: string);                                                                            // with IvForceDefaultIfKeyIsEmpty = true the IvDefault is forced even if the key exists and is empty
    function  IntGet(const IvPath: string; IvDefault: integer = {0}-1): integer;    // force not needed
    procedure IntSet(const IvPath: string; IvValue: integer);
    function  FloGet(const IvPath: string; IvDefault: double = {0}-1): double;      // force not needed
    procedure FloSet(const IvPath: string; IvValue: double);
    function  BooGet(const IvPath: string; IvDefault: boolean = false): boolean; // force not needed
    procedure BooSet(const IvPath: string; IvValue: boolean);
    procedure SliGet(const IvPath: string; IvStrings: TStrings; IvDefaultCsv: string = ''; IvForceDefaultIfKeyIsEmpty: boolean = false);
    procedure SliSet(const IvPath: string; IvStrings: TStrings);
    function  TxtGet(const IvPath: string; IvDefaultBr: string = ''; IvForceDefaultIfKeyIsEmpty: boolean = false): string;
    procedure TxtSet(const IvPath, IvValue: string);
    function  CryGet(const IvPath: string; IvDefault: string = ''; IvForceDefaultIfKeyIsEmpty: boolean = false): string;
    procedure CrySet(const IvPath, IvValue: string);
    function  HksGet(const IvPath: string; IvDefault: string = ''; IvForceDefaultIfKeyIsEmpty: boolean = false): TShortCut; // Hks=HotKeyShortcut
    procedure HksSet(const IvPath: string; IvValue: TShortCut); // Hks=HotKeyShortcut
  end;

  TJinRec = record // jsoninilike
    class procedure Load<T: class, constructor>(var IvObject: T); static;
    class procedure Save<T: class>(var IvObject: T); static;
  end;

  TJsoRec = record // json/superobject

    {$REGION 'Help'}
    (*
    escapes
    =======
    \"  double quote
    \\  backslash
    \/  lash
    \b  backspace (ascii code 08)
    \f  form feed (ascii code 0c)
    \n  new line
    \r  carriage return
    \t  tab
    \u  followed by four-hex-digits
    {}  urly braces do not have to be escaped

    https://github.com/hgourvest/superobject
    https://github.com/onryldz/x-superobject
    *)
    {$ENDREGION}

  public
    class function  Escape(IvJsonStr: string): string; static;   // encode
    class function  Pretty(IvJsonStr: string): string; static;
    class function  Compiled(IvJsonStr: string): string; static; // nocomment, noemptylines, rva
    class function  IsValid(IvJsonStr: string; var IvFbk: string): boolean; static;
  end;

  TJteRec = record // jsontemplate standards
    class function  ServerInfo(IvDescription, IvTechnology: string; IvPathInfoVec: TArray<string>): string; static;
  end;

  TKvaRec = record // keyvalue
    K{ey}: string;
    V{al}: string;
  public
    class function Build(IvK, IvV: string): TKvaRec; static;
  end;

  TKvaRecVec = array of TKvaRec;
//TKvaRecVec = TArray<TKvaRec>;

  TLogRec = record // log
    procedure Log(IvStr: string); overload;
    procedure Log(IvFormat: string; const IvArgs: array of const); overload;
    procedure Log(IvException: Exception; IvMore: string = ''); overload;
    procedure LogToFile(IvStr: string; IvFileName: string = 'LogToFile.txt');
  end;

  TLorRec = record // loremipsum
  const
    WORD_VECTOR: array[0..502] of string = (
      'a'
    , 'ac'
    , 'accommodare'
    , 'accumsan'
    , 'accusata'
    , 'ad'
    , 'adhuc'
    , 'adipisci'
    , 'adipiscing'
    , 'adolescens'
    , 'adversarium'
    , 'aenean'
    , 'aeque'
    , 'affert'
    , 'agam'
    , 'alia'
    , 'alienum'
    , 'aliquam'
    , 'aliquet'
    , 'aliquid'
    , 'aliquip'
    , 'altera'
    , 'alterum'
    , 'amet'
    , 'an'
    , 'ancillae'
    , 'animal'
    , 'ante'
    , 'antiopam'
    , 'aperiri'
    , 'appareat'
    , 'appetere'
    , 'aptent'
    , 'arcu'
    , 'assueverit'
    , 'at'
    , 'atomorum'
    , 'atqui'
    , 'auctor'
    , 'audire'
    , 'augue'
    , 'autem'
    , 'bibendum'
    , 'blandit'
    , 'brute'
    , 'causae'
    , 'cetero'
    , 'ceteros'
    , 'civibus'
    , 'class'
    , 'commodo'
    , 'commune'
    , 'comprehensam'
    , 'conceptam'
    , 'conclusionemque'
    , 'condimentum'
    , 'congue'
    , 'consectetuer'
    , 'consectetur'
    , 'consequat'
    , 'consetetur'
    , 'constituam'
    , 'constituto'
    , 'consul'
    , 'contentiones'
    , 'conubia'
    , 'convallis'
    , 'convenire'
    , 'corrumpit'
    , 'cras'
    , 'cu'
    , 'cubilia'
    , 'cum'
    , 'curabitur'
    , 'curae'
    , 'cursus'
    , 'dapibus'
    , 'debet'
    , 'decore'
    , 'definiebas'
    , 'definitionem'
    , 'definitiones'
    , 'delectus'
    , 'delenit'
    , 'delicata'
    , 'deseruisse'
    , 'deserunt'
    , 'deterruisset'
    , 'detracto'
    , 'detraxit'
    , 'diam'
    , 'dicam'
    , 'dicant'
    , 'dicat'
    , 'dicit'
    , 'dico'
    , 'dicta'
    , 'dictas'
    , 'dictum'
    , 'dictumst'
    , 'dicunt'
    , 'dignissim'
    , 'dis'
    , 'discere'
    , 'disputationi'
    , 'dissentiunt'
    , 'docendi'
    , 'doctus'
    , 'dolor'
    , 'dolore'
    , 'dolorem'
    , 'dolores'
    , 'dolorum'
    , 'doming'
    , 'donec'
    , 'dui'
    , 'duis'
    , 'duo'
    , 'ea'
    , 'eam'
    , 'efficiantur'
    , 'efficitur'
    , 'egestas'
    , 'eget'
    , 'ei'
    , 'eirmod'
    , 'eius'
    , 'elaboraret'
    , 'electram'
    , 'eleifend'
    , 'elementum'
    , 'elit'
    , 'elitr'
    , 'eloquentiam'
    , 'enim'
    , 'eos'
    , 'epicurei'
    , 'epicuri'
    , 'equidem'
    , 'erat'
    , 'eripuit'
    , 'eros'
    , 'errem'
    , 'error'
    , 'erroribus'
    , 'eruditi'
    , 'esse'
    , 'est'
    , 'et'
    , 'etiam'
    , 'eu'
    , 'euismod'
    , 'eum'
    , 'euripidis'
    , 'evertitur'
    , 'ex'
    , 'expetenda'
    , 'expetendis'
    , 'explicari'
    , 'fabellas'
    , 'fabulas'
    , 'facilis'
    , 'facilisi'
    , 'facilisis'
    , 'falli'
    , 'fames'
    , 'fastidii'
    , 'faucibus'
    , 'felis'
    , 'fermentum'
    , 'ferri'
    , 'feugait'
    , 'feugiat'
    , 'finibus'
    , 'fringilla'
    , 'fugit'
    , 'fuisset'
    , 'fusce'
    , 'gloriatur'
    , 'graece'
    , 'graeci'
    , 'graecis'
    , 'graeco'
    , 'gravida'
    , 'gubergren'
    , 'habemus'
    , 'habeo'
    , 'habitant'
    , 'habitasse'
    , 'hac'
    , 'harum'
    , 'has'
    , 'hendrerit'
    , 'himenaeos'
    , 'hinc'
    , 'his'
    , 'homero'
    , 'honestatis'
    , 'iaculis'
    , 'id'
    , 'idque'
    , 'ignota'
    , 'iisque'
    , 'imperdiet'
    , 'impetus'
    , 'in'
    , 'inani'
    , 'inceptos'
    , 'inciderint'
    , 'indoctum'
    , 'inimicus'
    , 'instructior'
    , 'integer'
    , 'intellegat'
    , 'intellegebat'
    , 'interdum'
    , 'interesset'
    , 'interpretaris'
    , 'invenire'
    , 'invidunt'
    , 'ipsum'
    , 'iriure'
    , 'iudicabit'
    , 'ius'
    , 'iusto'
    , 'iuvaret'
    , 'justo'
    , 'labores'
    , 'lacinia'
    , 'lacus'
    , 'laoreet'
    , 'latine'
    , 'laudem'
    , 'lectus'
    , 'legere'
    , 'legimus'
    , 'leo'
    , 'liber'
    , 'libero'
    , 'libris'
    , 'ligula'
    , 'litora'
    , 'lobortis'
    , 'lorem'
    , 'luctus'
    , 'ludus'
    , 'luptatum'
    , 'maecenas'
    , 'magna'
    , 'magnis'
    , 'maiestatis'
    , 'maiorum'
    , 'malesuada'
    , 'malorum'
    , 'maluisset'
    , 'mandamus'
    , 'massa'
    , 'mattis'
    , 'mauris'
    , 'maximus'
    , 'mazim'
    , 'mea'
    , 'mediocrem'
    , 'mediocritatem'
    , 'mei'
    , 'mel'
    , 'meliore'
    , 'melius'
    , 'menandri'
    , 'mentitum'
    , 'metus'
    , 'mi'
    , 'minim'
    , 'mnesarchum'
    , 'moderatius'
    , 'molestiae'
    , 'molestie'
    , 'mollis'
    , 'montes'
    , 'morbi'
    , 'movet'
    , 'mucius'
    , 'mus'
    , 'mutat'
    , 'nam'
    , 'nascetur'
    , 'natoque'
    , 'natum'
    , 'ne'
    , 'nec'
    , 'necessitatibus'
    , 'neglegentur'
    , 'neque'
    , 'netus'
    , 'nibh'
    , 'nihil'
    , 'nisi'
    , 'nisl'
    , 'no'
    , 'nobis'
    , 'noluisse'
    , 'nominavi'
    , 'non'
    , 'nonumes'
    , 'nonumy'
    , 'noster'
    , 'nostra'
    , 'nostrum'
    , 'novum'
    , 'nulla'
    , 'nullam'
    , 'numquam'
    , 'nunc'
    , 'ocurreret'
    , 'odio'
    , 'offendit'
    , 'omittam'
    , 'omittantur'
    , 'omnesque'
    , 'oporteat'
    , 'option'
    , 'oratio'
    , 'orci'
    , 'ornare'
    , 'ornatus'
    , 'partiendo'
    , 'parturient'
    , 'patrioque'
    , 'pellentesque'
    , 'penatibus'
    , 'per'
    , 'percipit'
    , 'pericula'
    , 'periculis'
    , 'perpetua'
    , 'persecuti'
    , 'persequeris'
    , 'persius'
    , 'pertinacia'
    , 'pertinax'
    , 'petentium'
    , 'pharetra'
    , 'phasellus'
    , 'placerat'
    , 'platea'
    , 'platonem'
    , 'ponderum'
    , 'populo'
    , 'porro'
    , 'porta'
    , 'porttitor'
    , 'posidonium'
    , 'posse'
    , 'possim'
    , 'possit'
    , 'postea'
    , 'postulant'
    , 'posuere'
    , 'potenti'
    , 'praesent'
    , 'pretium'
    , 'pri'
    , 'primis'
    , 'principes'
    , 'pro'
    , 'prodesset'
    , 'proin'
    , 'prompta'
    , 'propriae'
    , 'pulvinar'
    , 'purus'
    , 'putent'
    , 'quaeque'
    , 'quaerendum'
    , 'quaestio'
    , 'qualisque'
    , 'quam'
    , 'quas'
    , 'quem'
    , 'qui'
    , 'quidam'
    , 'quis'
    , 'quisque'
    , 'quo'
    , 'quod'
    , 'quot'
    , 'recteque'
    , 'referrentur'
    , 'reformidans'
    , 'regione'
    , 'reprehendunt'
    , 'reprimique'
    , 'repudiandae'
    , 'repudiare'
    , 'reque'
    , 'rhoncus'
    , 'ridens'
    , 'ridiculus'
    , 'risus'
    , 'rutrum'
    , 'sadipscing'
    , 'saepe'
    , 'sagittis'
    , 'sale'
    , 'salutatus'
    , 'sanctus'
    , 'saperet'
    , 'sapien'
    , 'sapientem'
    , 'scelerisque'
    , 'scripserit'
    , 'scripta'
    , 'sea'
    , 'sed'
    , 'sem'
    , 'semper'
    , 'senectus'
    , 'senserit'
    , 'sententiae'
    , 'signiferumque'
    , 'similique'
    , 'simul'
    , 'singulis'
    , 'sit'
    , 'sociis'
    , 'sociosqu'
    , 'sodales'
    , 'solet'
    , 'sollicitudin'
    , 'solum'
    , 'sonet'
    , 'splendide'
    , 'suas'
    , 'suavitate'
    , 'sumo'
    , 'suscipiantur'
    , 'suscipit'
    , 'suspendisse'
    , 'tacimates'
    , 'taciti'
    , 'tale'
    , 'tamquam'
    , 'tantas'
    , 'tation'
    , 'te'
    , 'tellus'
    , 'tempor'
    , 'tempus'
    , 'theophrastus'
    , 'tibique'
    , 'tincidunt'
    , 'torquent'
    , 'tortor'
    , 'tota'
    , 'tractatos'
    , 'tristique'
    , 'tritani'
    , 'turpis'
    , 'ubique'
    , 'ullamcorper'
    , 'ultrices'
    , 'ultricies'
    , 'unum'
    , 'urbanitas'
    , 'urna'
    , 'usu'
    , 'ut'
    , 'utamur'
    , 'utinam'
    , 'utroque'
    , 'varius'
    , 'vehicula'
    , 'vel'
    , 'velit'
    , 'venenatis'
    , 'veniam'
    , 'verear'
    , 'veri'
    , 'veritus'
    , 'vero'
    , 'verterem'
    , 'vestibulum'
    , 'viderer'
    , 'vidisse'
    , 'vim'
    , 'viris'
    , 'vis'
    , 'vitae'
    , 'vituperata'
    , 'vituperatoribus'
    , 'vivamus'
    , 'vivendo'
    , 'viverra'
    , 'vix'
    , 'vocent'
    , 'vocibus'
    , 'volumus'
    , 'voluptaria'
    , 'voluptatibus'
    , 'voluptatum'
    , 'volutpat'
    , 'vulputate'
    , 'wisi'
    );
  public
    class function  Word: string; static;
    class function  Words      (IvMin , IvMax: integer; IvCapitalize: integer = 0; IvAddPeriod: boolean = false): string; static; // 0=nocapital, 1=1stwordcapital, >1=allwordscapital
    class function  Title      (IvMin , IvMax: integer; IvCapitalize: integer = 1; IvAddPeriod: boolean = false): string; static;
    class function  Paragraphs (IvPMin, IvPMax, IvWMin, IvWMax: integer): string; static;
    class function  HTitle     (IvMin , IvMax: integer; IvH: integer = 0; IvCapitalize: integer = 1; IvAddPeriod: boolean = false): string; static;
    class function  HParagraphs(IvPMin, IvPMax, IvWMin, IvWMax: integer): string; static;
  end;

  TLstRec = record // list (commaseparated)
    function  LstAppend(IvLst, IvStr: string; IvSpaceAdd: boolean = false): string;
    function  LstPrepend(IvLst, IvStr: string; IvSpaceAdd: boolean = false): string;
  end;

  TMbrRec = record // member [B]
    // master
    Obj         : TObjRec;

    // detail
    ObjectId    : integer; // FldObjectId
    Id          : integer;
    PId         : integer;
    Organization: string;
    Department  : string;
    Area        : string;
    Team        : string;
    Site        : string;
    Member      : string;
    Email       : string;
    State       : string;
    JobTitle    : string;
    JobRole     : string;
    JobLevel    : string;
    BadgeGraphic: TGraphic;

    // derived
    JobGrade    : integer; // 0, 10, 11, 12, 20, 21, 22, ...
  public
    function  Info: string;
    procedure Free;
    procedure Reset(IvResetObjAlso: boolean = false);
    function  InitDba(IvOrganization, IvUsername: string; var IvFbk: string): boolean; // a user after a login (username available) become a member
    function  InitRio(IvOrganization, IvUsername: string; var IvFbk: string): boolean;
    function  IsAdmin: boolean;                                                        // jobgrade >= 70
    function  HomePath: string;                                                        // C:\$Per\I\IarussiFedericoCarloBrian
    function  BadgeFile: string;                                                       // C:\$Per\I\IarussiFedericoCarloBrian\FCBIarussi_Wks_Badge.png
    function  HomeUrl(IvRelative: boolean = true): string;                             // /Person/I/IarussiFedericoCarloBrian
    function  BadgeUrl(IvRelative: boolean = true): string;                            // /Person/I/IarussiFedericoCarloBrian/FCBIarussi_Wks_Badge.png
    procedure BadgeGenerate(var IvBadge: TBitmap; IvOrganization, IvSite, IvUsername: string);
  end;

  TMbrRem = class(TRemotable)
  private
    // master
    FObjRem      : TObjRem      ;

    // detail
    FObjectId    : integer      ;
    FId          : integer      ;
    FPId         : integer      ;
    FOrganization: string       ;
    FDepartment  : string       ;
    FArea        : string       ;
    FTeam        : string       ;
    FSite        : string       ;
    FMember      : string       ;
    FEmail       : string       ;
    FState       : string       ;
    FJobTitle    : string       ;
    FJobRole     : string       ;
    FJobLevel    : string       ;
    FBadgeBytes  : TByteDynArray;
  published
    property ObjRem      : TObjRem       read FObjRem       write FObjRem      ;
    property ObjectId    : integer       read FObjectId     write FObjectId    ;
    property Id          : integer       read FId           write FId          ;
    property PId         : integer       read FPId          write FPId         ;
    property Organization: string        read FOrganization write FOrganization;
    property Department  : string        read FDepartment   write FDepartment  ;
    property Area        : string        read FArea         write FArea        ;
    property Team        : string        read FTeam         write FTeam        ;
    property Site        : string        read FSite         write FSite        ;
    property Member      : string        read FMember       write FMember      ;
    property Email       : string        read FEmail        write FEmail       ;
    property State       : string        read FState        write FState       ;
    property JobTitle    : string        read FJobTitle     write FJobTitle    ;
    property JobRole     : string        read FJobRole      write FJobRole     ;
    property JobLevel    : string        read FJobLevel     write FJobLevel    ;
    property BadgeBytes  : TByteDynArray read FBadgeBytes   write FBadgeBytes  ;
  end;

  TMesRec = record // only messages feedbacks, for inputs use TAskRec
  // use:
  // - delphi Vcl.Dialogs and Vcl.ExtDlgs - https://stackoverflow.com/questions/4979556/how-to-use-the-ttaskdialog
  // - synopse SynTaskDialog
  // if you need plain winapi dialog use the WksDlgWinApiUnit
  public
    class procedure MsgShow(IvMessage: string; IvTitle: string = ''; IvKind: string = ''); static; // type: '', iI, wW, eE
    class procedure I(IvMessage: string; IvTitle: string = ''); overload; static;
    class procedure I(IvMessageFormatStr: string; IvVarRecVector: array of TVarRec; IvTitle: string = ''); overload; static;
    class procedure W(IvMessage: string; IvTitle: string = ''); overload; static;
    class procedure W(IvMessageFormatStr: string; IvVarRecVector: array of TVarRec; IvTitle: string = ''); overload; static;
    class procedure E(IvMessage: string; IvTitle: string = ''); overload; static;
    class procedure E(IvMessageFormatStr: string; IvVarRecVector: array of TVarRec; IvTitle: string = ''); overload; static;
    class procedure IW(IvMessage: string; IvSuccess: boolean; IvTitle: string = ''); overload; static;
    class procedure IW(IvMessageFormatStr: string; IvVarRecVector: array of TVarRec; IvSuccess: boolean; IvTitle: string = ''); overload; static;
    class procedure NA; static;        // show a NOT_AVAILABLE message
    class procedure NI; static;        // show a NOT_IMPLEMENTED message
    class procedure CANCELLED; static; // show a USER_CANCELLED_ACTION message
          procedure About;
          procedure AboutHyperlinkClicked(Sender: TObject);
    class procedure AutoClose(const IvCaption, IvPrompt: string; IvDurationMs: integer = 2000); static;
    class procedure AutoCloseFmt(const IvCaption, IvPrompt: string; IvVarRecVector: array of TVarRec; IvDurationMs: integer); static;
  end;

  TMkdRec = record // markdownwksdialect

    {$REGION 'help'}
    {
    unichar     ***       all line is abouot the same char

    headed      # ...     a line is prefixed with something

    shelled     __...__   a line starts and ends with the same char, one or more

    boxed       [...]     a line start with a parenthesis and ends with the corresponding parenthesis

    fenced      ```       a block starts with a line with 3 equal chars and end with a line wit the same 3 chars
                ...
                ```
    }
    {$ENDREGION}

  type
    TMkdItemRec = record
      Itm: string;
      Exa: string;
      Rex: string;
      Reo: TRegExOptions;
      New: string;
    end;
  const
    MKD_ITEM_VEC: array [0..38] of TMkdItemRec = (
    // unichars
      (Itm: 'Spaces'            ; Exa: ' ___ '                         ; Rex: '( [_]{1,10} )'                          ; Reo: [roMultiLine] ; New: '&nbsp;&nbsp;&nbsp;'                            )
    , (Itm: 'Linebreaks'        ; Exa: ' '                             ; Rex: '^([ ]{1,6})$'                           ; Reo: [roMultiLine] ; New: '<br>'                                          )
    , (Itm: 'Horizontal rule'   ; Exa: '*** or ---'                    ; Rex: '^([*-]{3})$' {3,10}                     ; Reo: [roMultiLine] ; New: '<hr style="width:x%">'                         )
    // headed
    , (Itm: 'Header 1'          ; Exa: '# Header 1'                    ; Rex: '^[ \t]*(#{1}\s)(.*)$'                   ; Reo: [roMultiLine] ; New: '<h1>%s</h1>'                                   )
    , (Itm: 'Header 2'          ; Exa: '## Header 2'                   ; Rex: '^[ \t]*(#{2}\s)(.*)$'                   ; Reo: [roMultiLine] ; New: '<h2>%s</h2>'                                   )
    , (Itm: 'Header 3'          ; Exa: '### Header 3'                  ; Rex: '^[ \t]*(#{3}\s)(.*)$'                   ; Reo: [roMultiLine] ; New: '<h3>%s</h3>'                                   )
    , (Itm: 'Header 4'          ; Exa: '#### Header 4'                 ; Rex: '^[ \t]*(#{4}\s)(.*)$'                   ; Reo: [roMultiLine] ; New: '<h4>%s</h4>'                                   )
    , (Itm: 'Header 5'          ; Exa: '##### Header 5'                ; Rex: '^[ \t]*(#{5}\s)(.*)$'                   ; Reo: [roMultiLine] ; New: '<h5>%s</h5>'                                   )
    , (Itm: 'Header 6'          ; Exa: '###### Header 6'               ; Rex: '^[ \t]*(#{6}\s)(.*)$'                   ; Reo: [roMultiLine] ; New: '<h6>%s</h6>'                                   )
    // shelled1
    , (Itm: 'Superscript'       ; Exa: '^text superscript^'            ; Rex: '(\^{1})(.*?)(\^{1})'                    ; Reo: [roMultiLine] ; New: '<sup>%s</sup>'                                 )
    , (Itm: 'Subscript'         ; Exa: '~text subscript~'              ; Rex: '(\~{1})(\w+?)(\~{1})'                   ; Reo: [roMultiLine] ; New: '<sub>%s</sub>'                                 )
    // shelled2
    , (Itm: 'Text bold'         ; Exa: '**text bold**'                 ; Rex: '(\*{2})(.*?)(\*{2})'                    ; Reo: [roMultiLine] ; New: '<b>%s</b>'                                     )
    , (Itm: 'Text italic'       ; Exa: '//text italic//'               ; Rex: '(\/{2})(.*?)(\/{2})'                    ; Reo: [roMultiLine] ; New: '<i>%s</i>'                                     )
    , (Itm: 'Text underline'    ; Exa: '__text underline__'            ; Rex: '(\_{2})(.*?)(\_{2})'                    ; Reo: [roMultiLine] ; New: '<u>%s</u>'                                     )
    , (Itm: 'Text strikethrough'; Exa: '~~text strikethrough~~'        ; Rex: '(\~{2})(.*?)(\~{2})'                    ; Reo: [roMultiLine] ; New: '<s>%s</s>'                                     )
    , (Itm: 'Text added'        ; Exa: '++text added++'                ; Rex: '(\+{2})(.*?)(\+{2})'                    ; Reo: [roMultiLine] ; New: '<ins>%s</ins>'                                 )
    , (Itm: 'Text removed'      ; Exa: '--text removed--'              ; Rex: '(\-{2})((\S)*([ \t]*\S+)+?)(\-{2})'     ; Reo: [roMultiLine] ; New: '<del>%s</del>'                                 )
    , (Itm: 'Text info'         ; Exa: '==text info=='                 ; Rex: '(\={2})(.*?)(\={2})'                    ; Reo: [roMultiLine] ; New: '<kbd>%s</kbd>'                                 )
    , (Itm: 'Text warning'      ; Exa: '%%text warning%%'              ; Rex: '(\%{2})(.*?)(\%{2})'                    ; Reo: [roMultiLine] ; New: '<em>%s</em>'                                   )
    , (Itm: 'Text highlight'    ; Exa: '!!text highlight!!'            ; Rex: '(\!{2})(.*?)(\!{2})'                    ; Reo: [roMultiLine] ; New: '<mark>%s</mark>'                               )
    , (Itm: 'Inline quote'      ; Exa: '""inline quote""'              ; Rex: '(\"{2})(.*?)(\"{2})'                    ; Reo: [roMultiLine] ; New: '<q>%s</q>'                                     )
    , (Itm: 'Inline code'       ; Exa: '``inline code``'               ; Rex: '(\`{2})(.*?)(\`{2})'                    ; Reo: [roMultiLine] ; New: '<code>%s</code>'                               )
    , (Itm: 'Citation'          ; Exa: ',,citation,, by Igi'           ; Rex: '(\,{2})(.*?)(\,{2})'                    ; Reo: [roMultiLine] ; New: '<cite>%s</cite>'                               )
    , (Itm: 'Abbreviation'      ; Exa: '..abbreviation..'              ; Rex: '(\.{2})(\w*?)(\.{2})'                   ; Reo: [roMultiLine] ; New: '<abbr>%s</abbr>'                               )
    , (Itm: 'Abbr with descr'   ; Exa: '..abbr:description..'          ; Rex: '(\.{2})(\w*?) : ([ \w]*?)(\.{2})'       ; Reo: [roMultiLine] ; New: '<abbr title="%s">%s</abbr>'                    ) // <acronym>
    , (Itm: 'Font Awesome'      ; Exa: '::home:: ::arrow-top::'        ; Rex: '(\:{2})(\w*?[-\w]*?)(\:{2})'            ; Reo: [roMultiLine] ; New: '<i class="fa fa-%s"></i>'                      )
    , (Itm: 'Progress bar'      ; Exa: '##60%##'                       ; Rex: '(\#{2})(\d{1,3})%(\#{2})'               ; Reo: [roMultiLine] ; New: '<progress value="%s" max="100">%s%%</progress>') // 0..100
    , (Itm: 'Meter bar'         ; Exa: '##60##'                        ; Rex: '(\#{2})(\d+)(\#{2})'                    ; Reo: [roMultiLine] ; New: '<meter value="%f">%s%%</meter>'                ) // value
  //, (Itm: 'Meter bar 2'       ; Exa: '##0,60,100##'                  ; Rex: '(\#{2})(\d+,\d+,\d+)(\#{2})'            ; Reo: [roMultiLine] ; New: '<meter value="%f">%s%%</meter>'                ) // min,low,optimun,high,max , value
    // mixed
    , (Itm: 'Center'            ; Exa: '>>centered<<'                  ; Rex: '^[ \t]*>>(.*)<<[ \t]*$'                 ; Reo: [roMultiLine] ; New: '<center>%s</center>'                           )
    , (Itm: 'Left'              ; Exa: '<<left aligned<<'              ; Rex: '^[ \t]*<<(.*)<<[ \t]*$'                 ; Reo: [roMultiLine] ; New: '<div class="w3-left-align">%s</div>'           )
    , (Itm: 'Right'             ; Exa: '>>right aligned>>'             ; Rex: '^[ \t]*>>(.*)>>[ \t]*$'                 ; Reo: [roMultiLine] ; New: '<div class="w3-right-align">%s</div>'          )
    // zoned
    , (Itm: 'Block quote'       ; Exa: '>\n> blockquote\n>\n>'         ; Rex: '((?:^(?:>|<br>>) ?.*?$\n)+)'            ; Reo: [roMultiLine, roSingleLine]; New: '<br><blockquote>%s</blockquote>'  )
    , (Itm: 'List (unordered)'  ; Exa: '- item\n- item>'               ; Rex: '((?:^(?:[ \t]*[-\*•]) +.*?$\n)+)'       ; Reo: [roMultiLine, roSingleLine]; New: '<ul>%s</ul>'                      )
    // notable
    , (Itm: 'Url'               ; Exa: 'http://www.abc.com'            ; Rex: '(^| )((http:|https:)\S+)( |$)' {|www\.} ; Reo: [roMultiLine] ; New: '%s<a href="%s" target="_blank">%s</a>%s'       ) // warning: canreintroduceitself
    , (Itm: 'Email'             ; Exa: 'abc@example.com'               ; Rex: '(^| )([-\w\.]+@[-\w]+\.[-\w]{2,4})( |$)'; Reo: [roMultiLine] ; New: '%s<a href="mailto:%s">%s</a>%s'                ) // warning: canreintroduceitself
    // special
    , (Itm: 'Link (classic)'    ; Exa: '[Go](www.go.it "Title")'       ; Rex: '(\[.*\])(\(.*\))'                       ; Reo: [roMultiLine] ; New: '<a href="%s" title="%s">%s</a>'                )
  //, (Itm: 'Link'              ; Exa: '(www.go.it|Go|Title|*)'        ; Rex: '\(([^)]+?\|)+(.+?)\)'                   ; Reo: [roMultiLine] ; New: '<a href="%s" title="%s" target="%s">%s</a>'    )
    , (Itm: 'Link'              ; Exa: '(www.go.it|Go|Title|*)'        ; Rex: '\((http|www|\/)(.+?)\)'                 ; Reo: [roMultiLine] ; New: '<a href="%s" title="%s" target="%s">%s</a>'    )
    , (Itm: 'Image (classic)'   ; Exa: '![Img](www.go.it/x.png)'       ; Rex: '!(\[.*\])(\(.*\))'                      ; Reo: [roMultiLine] ; New: '<img src="%s" alt="%s">'                       )
  //, (Itm: 'Image'             ; Exa: '[/img/a.png|alt|w|h|card|torn]'; Rex: '\[(.+?\|)+(.+?)\]'                      ; Reo: [roMultiLine] ; New: '<img src="%s" alt="%s">'                       )
    , (Itm: 'Image'             ; Exa: '[/img/a.png|alt|w|h|card|torn]'; Rex: '\[(http|www|\/)(.+?)\]'                 ; Reo: [roMultiLine] ; New: '<img src="%s" alt="%s">'                       )
    // fenced
  //, (Itm: 'Code block (fence)'; Exa: '```\n code block \n```'        ;Rex: '^```[ \t]*(\w*)\r\n([\s\S]*?)```$'       ;Reo: [roMultiLine] ; New: '<pre><code class="%s">%s</code></pre>'          )
    );
  public
    class function  Process(IvContent: string): string; static;
  end;

  TMjtRec = record // memberjobtitle --> enum?
  const
    TITLE_PROFESSOR            = 'Professor'    ; // 4
    TITLE_SCIENTIST            = 'Scientist'    ; // 3
    TITLE_ENGINEER             = 'Engineer'     ; // 2
    TITLE_TECHNICIAN           = 'Technician'   ; // 1
    TITLE_OPERATOR             = 'Operator'     ; // 0
  end;

  TMjrRec = record // memberjobrole --> enum?
  const
    ROLE_SYSTEM                = 'System'       ; // 9
    ROLE_ARCHITECT             = 'Architect    '; // 8
    ROLE_ADMINISTRATOR         = 'Administrator'; // 7
    ROLE_EXECUTIVE             = 'Executive'    ; // 6
    ROLE_HEAD                  = 'Head'         ; // 5
    ROLE_DIRECTOR              = 'Director'     ; // 4
    ROLE_MANAGER               = 'Manager'      ; // 3
    ROLE_SUPERVISOR            = 'Supervisor'   ; // 2
    ROLE_MEMBER                = 'Member'       ; // 1
    ROLE_USER                  = 'User'         ; // 0
  end;

  TMjlRec = record // memberjoblevel(skill) --> enum?
  const
    LEVEL_PRINCIPAL            = 'Principal'    ; // 3
    LEVEL_STAFF                = 'Staff'        ; // 2
    LEVEL_SENIOR               = 'Senior'       ; // 1
    LEVEL_JUNIOR               = 'Junior'       ; // 0
  end;

  TMjgRec = record // memberjobgrade = role + level = function + experience

    {$REGION 'help'}
    (*
    0 = nessuna funzione
                       points                    JOB GRADE
        --------------------------------------------------------------------------
    ^  | System        | 9 |    90                                                |
    |  |---------------|---|------------------------------------------------------|
    |  | Architech     | 8 |    80                                                |
    |  |---------------|---|------------------------------------------------------|
    |  | Administrator | 7 |    70    |    71    |    72    |    73    |    74    |
    |  |---------------|---|------------------------------------------------------|
    F  | Executive     | 6 |    60                                                |
    U  |---------------|---|------------------------------------------------------|
    N  | Head          | 5 |    50                                                |
    C  |---------------|---|------------------------------------------------------|
    T  | Director      | 4 |    40                                                |
    I  |---------------|---|------------------------------------------------------|
    O  | Manager       | 3 |    30    |    31    |    32    |    33    |    34    |
    N  |---------------|---|----------|----------|----------|----------|----------|
    N  | Supervisor    | 2 |    20    |    21    |    22    |    23    |    24    |
    A  |---------------|---|----------|----------|----------|----------|----------|
    L  | Member        | 1 |    10    |    11    |    12    |    13    |    14    |
    |  |---------------|---|----------|----------|----------|----------|----------|
    |  | User          | 0 |    00    |          |          |          |          |
    |  |--------------------------------------------------------------------------|
    |  | ROLE     _______/ |     0    |     1    |     2    |     3    |     4    | points
    |  |  _______/         |----------|----------|----------|----------|----------|
    |  | /           LEVEL |   Guest  |  Junior  |  Senior  |   Staff  | Principal|
       --------------------------------------------------------------------------
                           ---------------- E X P E R I E N C E ---------------->  0 = nessuna esperienza
    *)
    {$ENDREGION}

  const
    GRADE_SYSTEM           = 90;
    GRADE_ARCHITECT        = 80;
    GRADE_ADMINISTRATOR    = 70; GRADE_ADMINISTRATOR_JUNIOR = 71; GRADE_ADMINISTRATOR_SENIOR = 72; GRADE_ADMINISTRATOR_STAFF = 73; GRADE_ADMINISTRATOR_PRINCIPAL = 74;
    GRADE_EXECUTIVE        = 60;
    GRADE_HEAD             = 50;
    GRADE_DIRECTOR         = 40;
    GRADE_MANAGER_GUEST    = 30; GRADE_MANAGER_JUNIOR       = 31; GRADE_MANAGER_SENIOR       = 32; GRADE_MANAGER_STAFF       = 33; GRADE_MANAGER_PRINCIPAL       = 34;
    GRADE_SUPERVISOR_GUEST = 20; GRADE_SUPERVISOR_JUNIOR    = 21; GRADE_SUPERVISOR_SENIOR    = 22; GRADE_SUPERVISOR_STAFF    = 23; GRADE_SUPERVISOR_PRINCIPAL    = 24;
    GRADE_MEMBER_GUEST     = 10; GRADE_MEMBER_JUNIOR        = 11; GRADE_MEMBER_SENIOR        = 12; GRADE_MEMBER_STAFF        = 13; GRADE_MEMBER_PRINCIPAL        = 14;
    GRADE_USER_GUEST       = 00;
  public
    class function  Grade(IvJobRole, IvJobLevel: string): integer; static;
  end;

  TNamRec = record // name

    {$REGION 'Help'}
    {
      naming conventions
      --------------------------
      pascal:   FedericoIarussi
      camel:    federicoIarussi
      snake:    federico_iarussi
      const:    FEDERICO_IARUSSI
    }
    {$ENDREGION}

  public
    class function  Rnd(IvSize: integer = 4; IvPrefix: string = ''; IvSuffix: string = ''; const IvCharSet: string = 'abcdefghijklmnopqrstuvwxyz'): string; static; // use TRndRec
    class function  RndInt(IvName: string; IvRndIntSize: integer = 4): string; static;                 // 1234 ensuring 4 digits
    class function  Co(IvName: string = ''): string; overload; static;                                 // CoAaa | CoGjsy
    class function  Co(IvNameFmt: string; IvVarRecVector: array of TVarRec): string; overload; static; // CoAaa | CoGjsy
    class function  CoNameRnd(IvName: string = ''): string; static;                                    // CoNameGjsy
    class function  CoRemove(IvName: string): string; static;                                          // CoAaa --> Aaa
    class function  IsNameNum(IvNameNum, IvName: string): boolean; static;                             // Dog0, Dog1, Dog2, ...
    class function  NamePart(IvNameNum: string): string; static;                                       // Dog7 --> Dog
    class function  NumPart(IvNameNum: string): string; static;                                        // Dog7 --> 7
    class function  NameNumPrev(IvNameNum: string): string; static;                                    // Dog7 --> Dog6, Dog2 --> Dog , Dog1 --> Dog , Dog --> Dog
    class function  NameNumNext(IvNameNum: string): string; static;                                    // Dog7 --> Dog8, Dog1 --> Dog2, Dog  --> Dog2, ...
    class function  Username(IvName, IvUsername: string): string; static;                              // Federico Carlo Brian, Iarussi --> fcbiarussi
  end;

  TNetRec = record // network
    Username: string;                                                     // wks
    Password: string;                                                     // secret
    Email   : string;                                                     // wks@wks.cloud
  public
    class function  Info   : string; static;                              // giarussi@zbook.domain
    class function  Info2  : string; static;                              // OsUser: giarussi@zbook.domain   Lan: 127.0.0.0   Wan: 127.0.0.0
    class function  Domain : string; static;                              // WKS
    class function  Host   : string; static;                              // PHOBOS (computername)
    class function  OsLogin: string; static;                              // puppadrillo
    class function  IpLan  : string; static;                              // 192.168.0.1
    class function  IpWan  : string; static;                              // 212.237.10.198
    class function  IpLanFn(var IvIpLan, IvFbk: string): boolean; static; // 192.168.0.1
    class function  IpWanFn(var IvIpWan, IvFbk: string): boolean; static; // 212.237.10.198
    class function  InternetIsAvailable(var IvFbk: string): boolean; static;
    class function  PingStateFromCode(IvCode: integer): string; static;
    class function  PingRaw(const IvAddress: string; var IvFbk: string): boolean; static;
    class function  PingWmi(const IvAddress: string; IvRetries, IvBufferSize: Word; var IvFbk: string): boolean; static;
    class function  Ping(IvAddress: string; var IvFbk: string; IvRetries: integer = 1): boolean; static;
  end;

  TOrgRec = record // organization [B]
    // master
    Obj            : TObjRec;

    // detail
    ObjectId       : integer; // FldObjectId
    Www            : string;
    Phone          : string;
    Email          : string;
    About          : string;
    Slogan         : string;
    LogoGraphic    : TGraphic; // binaryimage
    LogoLongGraphic: TGraphic; // forslides

    // derived
    HomePageId: integer;
  public
    function  Info: string;                                                // WKS - Working Knowledge System
    procedure Free;
    procedure Reset(IvOrganizationOrWwwDefault: string; IvResetObjAlso: boolean = false); // *** ELIMINATE DICOTOMY IF POSSIBLE ***
    function  InitDba(IvOrganization: string; var IvFbk: string): boolean; // use "Organization"
    function  InitRio(IvOrganization: string; var IvFbk: string): boolean; // use "Organization" to select the organization (in clients we use Organization as a convenient way)
    function  InitByWww(IvWww: string; var IvFbk: string): boolean;        // use "www.organization.com" to select the organization (in isapi servers it is a convenient way to get the organame = sitename)
    function  TreeDir(IvOrganization: string = ''): string;                // Root/Organization/W
    function  TreePath(IvOrganization: string = ''): string;               // Root/Organization/W/Wks
    function  HomePath: string;                                            // C:\$Org\W\Wks
    function  LogoFile: string;                                            // C:\$Org\W\Wks\Wks_Logo.png
    function  LogoLongFile: string;                                        // C:\$Org\W\Wks\Wks_LogoLong.png
    function  HomeUrl(IvRelative: boolean = true): string;                 // /Organization/W/Wks
    function  LogoUrl(IvRelative: boolean = true; IvInverted: boolean = false): string; // /Organization/W/Wks/Wks_Logo.png
    function  LogoLongUrl(IvRelative: boolean = true): string;                          // /Organization/W/Wks/Wks_LogoLong.png
    function  IconUrl(IvRelative: boolean = true): string;                              // /Organization/W/Wks/Wks_Icon.ico
  end;

  TOrgRem = class(TRemotable)
  private
    // master
    FObjRem       : TObjRem;

    // detail
    FObjectId     : integer      ;
    FWww          : string       ;
    FPhone        : string       ;
    FEmail        : string       ;
    FAbout        : string       ;
    FSlogan       : string       ;
    FLogoBytes    : TByteDynArray;
    FLogoLongBytes: TByteDynArray;
  published
    property ObjRem       : TObjRem       read FObjRem        write FObjRem       ;
    property ObjectId     : integer       read FObjectId      write FObjectId     ;
    property Www          : string        read FWww           write FWww          ;
    property Phone        : string        read FPhone         write FPhone        ;
    property Email        : string        read FEmail         write FEmail        ;
    property About        : string        read FAbout         write FAbout        ;
    property Slogan       : string        read FSlogan        write FSlogan       ;
    property LogoBytes    : TByteDynArray read FLogoBytes     write FLogoBytes    ;
    property LogoLongBytes: TByteDynArray read FLogoLongBytes write FLogoLongBytes;
  end;

//TPagRec = record ... see before THtmRec

  TPatRec = record // pathfile
    class function  Volume(IvFile: string): string; static;                      // C:\Path\Name.ext --> C:  *** WARNING: will not include the final \ ***
    class function  Path(IvFile: string): string; static;                        // C:\Path\Name.ext --> C:\Path
    class function  Head(IvFile: string; IvElemCount: integer): string; static;  // IvElemCount = 2  --> C:\Path
    class function  Tail(IvFile: string; IvElemCount: integer): string; static;  // IvElemCount = 2  --> \Path\Name.ext
    class function  NameDotExt(IvFile: string): string; static;                  // C:\Path\Name.ext --> Name.ext
    class function  Name(IvFile: string): string; static;                        // C:\Path\Name.ext --> Name
    class function  NameChange(const IvFile, IvNameNew: string): string; static; // C:\Path\Name.ext --> C:\Path\Newname.ext
    class function  Ext(IvFile: string): string; static;                         // C:\Path\Name.ext --> .ext
    class function  ExtChange(const IvFile, IvExtNew: string): string; static;   // C:\Path\Name.ext --> C:\Path\Name.txt
    class function  DelimiterEnsure(IvPath: string): string; static;             // C:\Path -> C:\Path\
    class function  ExtHas(IvFile: string): boolean; static;                     // C:\Path\Name.ext -> true if path has an extension
    class function  ExtEnsure(IvExt: string): string; static;                    // txt -> .txt
    class function  TreePathNormalize(IvThreePath: string): string; static;      // change \ or . to /
    class function  TreePathIs(IvThreePath: string): boolean; static;            //
  end;

  TPerRec = record // person [B]
    // master
    Obj           : TObjRec;

    // detail
    ObjectId      : integer ; // FldObjectId
    Person        : string  ;
    Name          : string  ;
    Surname       : string  ;
    Phone         : string  ;
    Email         : string  ;
    PictureGraphic: TGraphic;

    // derived
    // ...
  public
    function  Info(IvSurnameName: boolean = false): string;
    procedure Free;
    procedure Reset(IvResetObjAlso: boolean = false);
    function  InitDba(IvPerson: string; var IvFbk: string): boolean;
    function  InitRio(IvPerson: string; var IvFbk: string): boolean;
    function  NameCompact: string;                                               // Federico Carlo Brian --> Federico C.B.
    function  SurnameNameSafe: string;                                           // Federico Carlo Brian Iarussi --> IarussiFedericoCarloBrian - Alfonso D'Anna --> DAnnaAlfonso
    function  FileSpecWithTags(IvTagVec: TArray<string>; IvExt: string): string; // C:\$Per\I\IarussiFedericoCarloBrian\IarussiFedericoCarloBrian_Tag0_Tag1_[...].png
    function  HomePath: string;                                                  // C:\$Per\I\IarussiFedericoCarloBrian
    function  PictureFile: string;                                               // C:\$Per\I\IarussiFedericoCarloBrian\IarussiFedericoCarloBrian_Picture.png
    function  HomeUrl(IvRelative: boolean = true): string;                       // /Person/I/IarussiFedericoCarloBrian
    function  PictureUrl(IvRelative: boolean = true): string;                    // /Person/I/IarussiFedericoCarloBrian/IarussiFedericoCarloBrian_Picture.png
  end;

  TPerRem = class(TRemotable)
  private
    // master
    FObjRem      : TObjRem      ;

    // detail
    FObjectId    : integer      ;
    FPerson      : string       ;
    FName        : string       ;
    FSurname     : string       ;
    FPhone       : string       ;
    FEmail       : string       ;
    FPictureBytes: TByteDynArray;
  published
    property ObjRem      : TObjRem       read FObjRem       write FObjRem      ;
    property ObjectId    : integer       read FObjectId     write FObjectId    ;
    property Person      : string        read FPerson       write FPerson      ;
    property Name        : string        read FName         write FName        ;
    property Surname     : string        read FSurname      write FSurname     ;
    property Phone       : string        read FPhone        write FPhone       ;
    property Email       : string        read FEmail        write FEmail       ;
    property PictureBytes: TByteDynArray read FPictureBytes write FPictureBytes;
  end;

  TPgcRec = record // pagecontrolctrl
  public
    class function  Subject(IvPageControl: TPageControl): string; static; // return current tab or subtab caption
    class procedure PagesShow(IvPageControl: TPageControl; IvShow: boolean; IvPageActive: TTabSheet); static;
    class procedure PagePrev(IvPageControl: TPageControl); static;
    class procedure PageNext(IvPageControl: TPageControl); static;
  end;

  TPicRec = record // picture
    class function  PicGraphicClassDetectFromStream(IvStream: TStream): TGraphicClass; static;
    class procedure PicToStream(IvPicture: TPicture; var IvStream: TStream); static;
    class procedure PicFromStream(var IvPicture: TPicture; const IvStream: TStream); static;
    class function  PicFromByteArray(const IvByteArray: TByteDynArray): TPicture; static;
    class procedure PicFromGraphic(IvPicture: TPicture; IvGraphic: TGraphic; IvSize: integer); static;
    class procedure PicFromUrl(IvUrl: string; var IvPicture: TPicture); static; // scrape, http://www.benibela.de/sources_en.html#internettools
  //class function  PicFromBmp(const IvBmp: TBitmap): TPicture; static;
  //class function  PicFromPng(const IvPng: TPngImage): TPicture; static;
  end;

  TPngRec = record // png
    class function  PngFromByteArray(const IvByteArray: TByteDynArray): TPngImage; static;
    class function  PngFromBmp(const IvBmp: TBitmap): TPngImage; static;
  end;

  TPwdRec = record // password
    class function  PwdRnd: string; static;
  end;

  TPxyRec = record // proxyservercoords
  public
    Use         : boolean;
    UrlOrAddress: string; // url or ip
    Port        : string;
    Username    : string;
    Password    : string;
  public
    function  AddressAndPort: string;
    function  ProxyGetViaRegistry(var IvProxy: string; var IvProxyUse: boolean; var IvFbk: string; IvProtocol: string = 'Http'): boolean; // unreliable, MS may change registry key where proxy info are stored
    function  ProxyGetViaWinInet (var IvProxy: string; var IvProxyUse: boolean; var IvFbk: string; IvProtocol: string = 'Http'): boolean;  // more correct way to get proxy info but require IE 3.x (or higher)
  end;

  TRefRec = record // rc resource file, not compiled
  end;

  {$REGION 'TReportRec'}

    {$REGION 'Edit'}
  TReportEdiRec = record // editinfo (table)
    Editable : boolean;
    Select   : string ;
    Insert   : string ;
    Update   : string ;
    Delete   : string ;
  //EditIni  : string ; // legacy edit info
    Json     : string ;
    // remove
  //ReportId         : integer; // report id ref
  //DatasetName      : string ; // the specific dataset(s?) in the report
  //InsertIfNotExists: boolean; // insert the record if it does not exists for update
  //Table            : string ; // table to change
  //KeyFieldList     : string ; // fields key, not changeable
  //OwnerField       : string ; // the person that can change
  //OneWayField      : string ; // not reversible toggle
  //OneWayRange      : string ; // toggle values
  //FieldList        : string ; // fields to change
  //ValueRange       : string ; // admitted values (actually for all fields!, should be separated lists one for each field to change)
  //UpdatedField     : string ; // updated field
  //EnabledStateList : string ; // will update records only in these states (Active, OnHold, ...
  public
    procedure LoadFrom(IvEditable: boolean; IvSelect, IvInsert, IvUpdate, IvDelete{, IvEditIni}, IvJson: string); // ?
  end;
    {$ENDREGION}

    {$REGION 'Param'}
  TReportParamRec = record // TParamRec va in collisione con TParagraphRec (TFormRec) *** WARNING *** C'E' UN DUPLICATO TParRec ***
    ReportId      : integer;
    Order         : integer;
    State         : string ;
    Param         : string ;
    Default       : string ;
    Caption       : string ;
    Placeholder   : string ; // text showed inside the control to help user during field fill-in
    Description   : string ;
    Help          : string ; // message showed in case the param value validation is not successful
    Kind          : string ; // [Text,List,ListEx,...]
    Hidden        : boolean; // is there as a value but is not visible
    Required      : boolean; // user have to enter a value
    Disabled      : boolean; // visible but muted
    LineGrid12    : string ; // on the same row label(n/12) and ctrl(rest)
    OptionCsv     : string ; // get option values=captions from a csvlist if exist (valcaptions,valcaptions2,...)
    OptionJson    : string ; // get option values/captions from a json if exist and append to the previous one ({value: captions, value2: captions2, ...})
    OptionQuery   : string ; // get option values/captions from a query if exist and append to the previous one (select aaa FldValue, bbb FldCaptions from ...)
    ConnStr       : string ; // used to run the optionquery, if empty use the default system connstr
    ConnLib       : string ; // ADO | FD
    &Class        : string ;
    Style         : string ;
  //Format        : string ;
  //ReadOnly      : boolean;
  //AjaxValidate  : string ;
  //Switch        : string ;
  //ToOrganization: string ;
  //ToDepartment  : string ;
  //ToArea        : string ;
  //ToActivity    : string ;
  //ToTeam        : string ;
  //ToMember      : string ;
    Value         : string ;
//public
  //function  ToJson: string;
  end;

  TReportParamRecVector = array of TReportParamRec;
    {$ENDREGION}

    {$REGION 'Dataset'}
  TReportDataSetRec = record
    ReportId       : integer; // FldObjectId
    Order          : integer; // FldOrder
    State          : string ; // FldState
    Dataset        : string ; // FldDataset
    Title          : string ; // FldTitle
    Description    : string ; // FldDescription
    Mode           : string ; // FldMode
    ConnStr        : string ; // FldConnStr
    ConnLib        : string ; // FldConnLib
  //ParamStr       : string ; // FldParamStr
  //DefaultStr     : string ; // FldDefaultStr
    Language       : string ; // FldLanguage       // Sql, Mql(Mongo)
    MaxRecords     : integer; // FldMaxRecords     // select top(max)
  //MaxRecordsCsv  : integer; // FldMaxRecordsCsv
    Select         : string ; // FldSelect
    SelectDev      : string ; // FldSelectDev
    SelectBak      : string ; // FldSelectBak
    Insert         : string ; // FldInsert
    Update         : string ; // FldUpdate
    Delete         : string ; // FldDelete
    ViewerCsv      : string ; // FldViewerCsv
    Editable       : boolean; // FldEditable
    EditorCsv      : string ; // FldEditorCsv
    EditIni        : string ; // FldEditIni
    Json           : string ; // FldJson           // ex EditJson
    Switch         : string ; // FldSwitch         // +D...
    Classs         : string ; // FldClass
    Style          : string ; // FldStyle
    TitleOn        : boolean; // FldTitleOn
    PanelOn        : boolean; // FldPanelOn
    PanelClosed    : boolean; // FldPanelClosed
    TimeoutSec     : integer; // FldTimeoutSec
    FeedbackIfEmpty: string ; // FldFeedbackIfEmpty
  //ExportJson     : string ; // in pdf
    ChartRecVector : TChartRecVector;
  public
  //function  ToJson: string;
    function  EditInfoRec: TReportEdiRec;
  end;

  TReportDataSetRecVector = array of TReportDataSetRec;
    {$ENDREGION}

    {$REGION 'Report'}
  TReportRec = record
    // master
    Obj                        : TObjRec;

    // detail
    ObjectId                   : integer;  // FldObjectId
    Export                     : string ;  // FldExport
    Source                     : string ;  // FldSource
    Store                      : string ;  // FldStore
    Environment                : string ;  // FldEnvironment
    ValidatorCsv               : string ;  // FldValidatorCsv
    ViewerCsv                  : string ;  // FldViewerCsv
    ReportTitleOn              : boolean;  // FldReportTitleOn
    ReportPanelOn              : boolean;  // FldReportPanelOn
    ReportPanelClosed          : boolean;  // FldReportPanelClosed
    ParamsTitleOn              : boolean;  // FldParamsTitleOn
    ParamsPanelOn              : boolean;  // FldParamsPanelOn
    ParamsPanelClosed          : boolean;  // FldParamsPanelClosed
    DsHeaderOff                : boolean;  // FldDsHeaderOff
    DsRecordCountOff           : boolean;  // FldDsRecordCountOff
    Link                       : string ;  // FldLink
    Header                     : string ;  // FldHeader
    Footer                     : string ;  // FldFooter
    Code                       : string ;  // FldCode
    CodeState                  : string ;  // FldCodeState
    CodeKind                   : string ;  // FldCodeKind
    Alias                      : string ;  // FldAlias
    Classs                     : string ;  // FldClass
    Style                      : string ;  // FldStyle
    Layout                     : string ;  // FldLayout
    ParamRecVector             : TReportParamRecVector;
    DatasetRecVector           : TReportDataSetRecVector;

    // derived
    // ...
  private
    function  ParamDbaSelect  (var IvParamRecVector  : TReportParamRecVector  ; IvReportId: integer                                    ; var IvFbk: string): boolean;
    function  DatasetDbaSelect(var IvDatasetRecVector: TReportDataSetRecVector; IvReportId: integer                                    ; var IvFbk: string): boolean;
    function  ChartDbaSelect  (var IvChartRecVector  : TChartRecVector        ; IvReportId: integer; IvDatasetName             : string; var IvFbk: string): boolean;
    function  SerieDbaSelect  (var IvSerieRecVector  : TChartSerieRecVector   ; IvReportId: integer; IvDatasetName, IvChartName: string; var IvFbk: string): boolean;
  public
  //function  ToJson: string;
    function  DbaSelect(var IvFbk: string): boolean;
  end;
    {$ENDREGION}

  {$ENDREGION}

  TRexRec = record // regularexpression
  const

    {$REGION 'General'}
    REX_EMPTY_LINE_PAT        = '(?m)^[ \t]*\r?\n';                                 //^[ \t]*(\r\n?|\n)$';
    REX_EMPTY_LINE_PAT2       = '(?:\r?\n){2,}';                                    // \r?\n is both Windows and Linux compatible. {2,} means "two or more instances"
    REX_URL_PAT               = 'https?:\/\/.*';
    {$ENDREGION}

    {$REGION 'Comment'}
    REX_HTML_COMMENT_PAT      = '<!--.*?-->';                                       // html comment

    REX_SQL_COMMENT_PAT       = '(--(.*|[\r\n]))$';                                 // sql comment at end of line (only --)
  //REX_SQL_COMMENT_PAT2      = '^\s*-{2,2}[^-].*$';                                // sql comment full line (only 2 --, also collide with markdown <h2> titles)

    REX_PY_COMMENT_PAT        = '^#.*\n$';                                          // python comment, single line
  //REX_PY_COMMENT_PAT        = '^\s*#.*$|\s*#.*$';                                 // nop, remove also inside strings '#...' and "#..."

    REX_CPP_COMMENT_PAT       = '\/\*[\s\S]*?\*\/|([^:]|^)\/\/.*$';                 // cpp /**/ or //
                                                                                    // this WILL remove:
                                                                                    //   /* multi-line comments */
                                                                                    //   // single-line comments
                                                                                    // will NOT remove:
                                                                                    //   String var1 = "this is /* not a comment. */";
                                                                                    //   char *var2 = "this is // not a comment, either.";
                                                                                    //   url = 'http://not.comment.com';
    {$ENDREGION}

    {$REGION 'Rv'}
    REX_RV_DOLLAR_PAT         = '\$(\w+)\$';                                        // match any $Xxx$ tag
    REX_RV_COMMENT_PAT        = '\[--Rv.*?\(.*?\)\]';                               // rv comment like [--RvAaa(bbb|ccc)] // \[--Rv[^]]*?\] | \[--Rv.*--\]
  //REX_RV_CHECK_PAT          = '\[Rv.*?(\(.*?\))?\]'; *problem*                    // used to check existence of [RvXxx()] tag with or without (...)
    REX_RV_CHECK_PAT          = '\[Rv\w*?(\(.*?\))\]';                              // used to check existence of [RvXxx()] (tag with without (...) was causing a problem)
  //REX_RV_PAT                = '\[Rv(\w*?)(\((.*?)\))?\]';                         // capture [RvXxx()] or [RvXxx(aaa, bbb, ...)]
    REX_RV_PAT2               = '\[(Rv(\w*?)|Rv(\w*?)\((.*?)\)?)\]';                // capture [RvXxx] or [RvXxx()] or [RvXxx(aaa, bbb, ...)]
    REX_RV_RECURSIVE_PAT      = '\[Rv'                                              // match the outher beginning "[Rv"
                              +   '(\w*?)'                                          // group1 (match any word for the function name like AaaBbb)
                              +   '('                                               // group2-start (the start point for the recursive (?2) call)

                              +     '\('                                            // match the opening "("

                              +       '('                                           // inner group3-start

                              +         '(?>[^()]+)'                                // 1stAlternative: subpattern, everything that is non-parentheses (one or more times)
                              +           '|'                                       //   or
                              +         '(?2)'                                      // 2ndAlternative: recursive match wath is defined in the group2

                              +       ')*'                                          // inner group3-end (any number of times)

                              +     '\)'                                            // match the closing ")"

                              +   ')'                                               // group2-end
                              + '\]';                                               // match the end "]"    ...   group0 will match all [RvAaaBbb(...)]
                             // \[Rv(\w*?)(\(((?>[^()]+)|(?2))*\))\]
                             // \[Rv(\w*?)(\( (  [^()]+ |(?2))*\))\]
    REX_RV_DSANYRECORD_PAT    = '\[RvDsLookup\((.*?)\)\]';                          // [RvDsLookup(123|FldContent)] is replaced with the content of record/object with FlId=123
    {$ENDREGION}

  public
    function  RexHas(IvStr, IvPattern: string; IvOpt: TRegExOptions): boolean;
    procedure RexReplace(var IvStr: string; IvReOut, IvStrIn: string; IvOpt: TRegExOptions = [roIgnoreCase, roSingleLine]; IvCount: integer = {0}-1); // {0}-1=replaceall
  end;

  TRicRec = record // richedit
  public
    class procedure TextAdd(IvRichEdit: TRichEdit; IvString: string; IvColorFg: TColor; IvColorBg: TColor = clWindow; IvAlign: TAlignment = taLeftJustify; IvSize: integer = 8; IvBold: boolean = false; IvUnderline: boolean = false; IvItalic: boolean = false; IvStrikeOut: boolean = false); static; // no newline
    class procedure RowAdd (IvRichEdit: TRichEdit; IvString: string; IvColorFg: TColor; IvColorBg: TColor = clWindow; IvAlign: TAlignment = taLeftJustify; IvSize: integer = 8; IvBold: boolean = false; IvUnderline: boolean = false; IvItalic: boolean = false; IvStrikeOut: boolean = false); static; // with newline
    class procedure RowCol(IvRichEdit: TRichEdit; var IvRow, IvCol: integer); static;
  end;

  TRioRec = record // httprio
    class function  HttpRio(IvObj: string = 'System'): THTTPRIO; static; // create then set url, agent and proxy
    class function  HttpRioAgentSet(var IvFbk: string; var IvHttpRio: THTTPRIO; IvAgentBrowserUse: boolean = true): boolean; static;
    class function  HttpRioProxySet(var IvFbk: string; var IvHttpRio: THTTPRIO; IvProxyUrl, IvProxyPort, IvUsername, IvPassword: string): boolean; static;
    class function  HttpRioUrlSet  (var IvFbk: string; var IvHttpRio: THTTPRIO; IvObj: string = 'System'; IvService: string = 'Main'): boolean; static;
  //class function  ObjFieldGet(IvObj, IvField, IvIdOrPath: string; IvDefault: variant; IvDept: integer = 0): variant; static; // see TDbaCls
  //class procedure ObjFieldSet(IvObj, IvField, IvIdOrPath: string; IvValue  : variant; var IvFbk: string): boolean; static;   // see TDbaCls
  end;

  TRndRec = record // random
    class function  RndInt(IvBegin, IvEnd: integer): integer; static;
    class function  RndStr(IvSize: integer = 4; IvCapitalize: boolean = false): string; static;
    class function  RndName(IvSize: integer = 4; IvPrefix: string = ''; IvSuffix: string = ''; const IvCharSet: string = 'abcdefghijklmnopqrstuvwxyz'): string; static;
  end;

  TRstRec = record // resourcestrings
  const
    RST_OK = 'Ok';
  end;

  TRvaRec = record // replacevalues

    {$REGION 'Help'}
    {
         __ Funcs path
        /
    [RvAaaBbb(Arg0| Arg1| Arg2)]
              ________________
                      \__ Args list

    Variable/Placeholder/TagsReplacement

    NOTE: if args list is empty parentesis are still necessary, like this: RvXxx()
    NOTE: consider changing [RvFoo()] to [=Foo()]
    }
    {$ENDREGION}

    {$REGION 'Const'}
    {
  const
    RV_RECURSION_MAX = 99;
    }
    {$ENDREGION}

  private
    procedure RvaIf(var s: string);
    procedure RvaIfElse(var s: string);
    function  RvaFunction(f, a: TArray<string>): string;
  public
    function  Rva(IvStr: string; IvCommentRemove: boolean = false; IvEmptyLinesRemove: boolean = false; IvTrim: boolean = false; IvRecMax: integer = 10): string;
    function  RvaRecord(IvString: string; const IvRecType: TRttiType; const IvRec: Pointer): string;                        // $Aaa$ -> 123 where IvRec.Aaa=123, ...
    function  RvaDsRecord(IvString: string; IvDsVec: TArray<TDataset>): string;                                             // $FldAaa$ -> 123 where IvDs -> FldAaa=123, ...
    function  RvaJson(IvString, IvJsonStr: string; IvReplaceFlag: TReplaceFlags = [rfReplaceAll {, rfIgnoreCase}]): string; // recursively replace all [Rv<json.path>()] with SO(IvJsonStr)['json.path'].Value // $Aaa.Bbb$ -> 123      where IvJsonStr = {"Aaa": {"Bbb": 123}, ...}
  end;

  TSbuRec = record // stringbuilder (see: TStringBuilder)
  public
    Text: string;
    procedure Clr;                                                                                                               // clear all
    procedure Anl(IvNl: integer = 1);                                                                                            // add newline
    procedure Anp(IvStr   : string; IvIfTrue: boolean = true);                                                                   // no prefix
    procedure Add(IvStr   : string; IvIfTrue: boolean = true; IvNlPrefix: integer = 1); overload;                                // add at the bottom of current text with a newline before with optional one after
    procedure Add(IvFormat: string; IvVarRecVec: array of TVarRec; IvIfTrue: boolean = true; IvNlPrefix: integer = 1); overload; // format version
    procedure Aif(IvStrT, IvStrF: string; IvTest: boolean; IvIfTrue: boolean = true; IvNlPrefix: integer = 1); overload;         // add strt if test is true else add strf
    procedure Top(IvStr: string; IvIfTrue: boolean = true);                                                                      // add at the top of current text with a newline                                                 // wrap current text between A and Z
    procedure Wra(IvA, IvZ: string);                                                                                             // wrap current text between A and Z
    procedure SaveToFile(IvFile: string);                                                                                        //
  end;

  TSopRec = record // soap
  const
    SOAP_FIX_VALUE                         = '<Value xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="xsd:string"></Value>';
    SOAP_URL                               = 'http://%s';                                                    // %s=website:port (localhost, www.abc.com)
    SOAP_DLL_URL                           =          '/Wks%sSoapProject.dll';                               // %1=Xxx
    SOAP_WSDL_PUBLISH_URL                  =                               '/soap/IWSDLPublish';             // ?
    SOAP_DATAMODULE_URL                    =                               '/soap/I%sSoap%sDataModule';      // %1=Xxx, %2=Main (IvObj, ivservice=Main as a default)
    SOAP_WSDL_URL                          =                               '/wsdl/I%sSoap%sService';         // %1=Xxx, %2=Main (IvObj, ivservice)
    SOAP_RIO_URL                           =                               '/soap/I%sSoap%sService';         // %1=Xxx, %2=Main
    SOAP_SERVICE                           =                                     'I%sSoap%sServiceservice';  // %1=Xxx, %2=Main
    SOAP_PORT                              =                                     'I%sSoap%sServicePort';     // %1=Xxx, %2=Main
//    SOAP_SERVER_RIO_URL_FOUND_NO_RS        = 'SOAP server, unable to find RIO service url %s';               // 'SOAP server, impossibile trovare url per servizio RIO di %s';
//    SOAP_SERVER_RIO_URL_FOUND_OK_RS        = 'SOAP server, found RIO service url %s';                        // 'SOAP server, trovato url per servizio RIO di %s';
//    SOAP_SERVER_DATAMODULE_URL_FOUND_NO_RS = 'SOAP server, unable to find datamodule url %s';                // 'SOAP server, impossibile trovare url di connessione a %s';
//    SOAP_SERVER_DATAMODULE_URL_FOUND_OK_RS = 'SOAP server, found datamodule url %s';                         // 'SOAP server, trovato url di connessione a %s';
  public
    class function  SoapUrl               (var IvFbk: string; var IvUrl : string; IvObj: string = 'System'): boolean; static;
    class function  SoapRioUrl            (var IvFbk: string; var IvUrl : string; IvObj: string = 'System'; IvService: string = 'Main'): boolean; static;
    class function  SoapRioWsdl           (var IvFbk: string; var IvWsdl: string; IvObj: string = 'System'; IvService: string = 'Main'): boolean; static;
    class function  SoapDataModuleUrl     (var IvFbk: string; var IvUrl : string; IvObj: string = ''; IvService: string = 'Main'): boolean; static; // IWSDLPublish or IXxxSoapYyyDataModule (datamodule: Xxx=Object, Yyy=Service=Main)
    class function  SoapConnectionAgentSet(var IvFbk: string; var IvSoapConnection: TSoapConnection; IvAgentBrowserUse: boolean = true): boolean; static;
    class function  SoapConnectionProxySet(var IvFbk: string; var IvSoapConnection: TSoapConnection; IvProxyUrl, IvProxyPort, IvUsername, IvPassword: string): boolean; static;
    class function  SoapConnectionUrlSet  (var IvFbk: string; var IvSoapConnection: TSoapConnection; IvObj: string = ''; IvService: string = 'Main'): boolean; static;
    class procedure SoapProviderCsv(IvSoapConnection: TSoapConnection; var IvCsv: string); static;
  end;

  TSqlRec = record
  public
    class function  DbaMainFromTbl(IvTbl: string): string; static;   // DbaXxx               from DbaXxx.dbo.TblXxxYyy
    class function  TblMasterFromObj(IvObj: string): string; static; // DbaXxx.dbo.TblObject from Xxx
    class function  TblDetailFromObj(IvObj: string): string; static; // DbaXxx.dbo.TblXxx    from Xxx
    class function  FldMainFromTbl(IvTbl: string): string; static;   // FldXxx               from DbaXxx.dbo.TblXxxYyy
    class function  WhereEnsure(IvWhere: string): string; static;
    class function  OrderByEnsure(IvOrderBy: string): string; static;
    class function  Val(IvValue: variant; IvDefault: string = 'null'): string; static; // unquoted, quoted or null
    class function  SqlFilterRv(IvField, IvValue: string): string; static;
    class function  SqlFilter(IvStrToSearch, IvFieldToSearchCsv: string; IvAdditionalExplicitFilter: string = ''; IvUsePercent: boolean = true): string; static;
    class function  SqlDistinct(IvTbl, IvFld, IvItemDefault: string): string; static;
    class function  SqlSelectFromTblObjectById(IvObject: string; IvId: integer): string; static; // select * from DbaXxx.dbo.TblObject where FldId = 123
    class function  SqlSelectFromTblDetailById(IvObject: string; IvId: integer): string; static; // select * from DbaXxx.dbo.TblXxx where FldObjectId = 123
  end;

  {$REGION 'TStkEnum'}
  TStkEnum = ( //  statekind
    skActive
  , skCancelled
  , skCompleted
  , skDone
  , skInactive
  , skNew
  , skOngoing
  , skOnhold
  , skPlanned
  , skTesting
  , slUnderconstruction
  , skUnknown
  , skValidating
  , skValidated
  );
  {$ENDREGION}

  TStiRec = record //  stateitem
    Name: string;
    Color: string;
    ColorT: TColor;
  end;

  TStiRecVec = TArray<TStiRec>;

  TStaRec = record // state *** add any new entry also in TStkEnum and Vector function ***
  const                                          // w3-color
    ACTIVE           : TStiRec = (Name: 'Active'           ; Color: 'green'    ; ColorT: clGreen    );
    CANCELLED        : TStiRec = (Name: 'Cancelled'        ; Color: 'darkgray' ; ColorT: clGrayText );
    COMPLETED        : TStiRec = (Name: 'Completed'        ; Color: 'green'    ; ColorT: clGreen    );
    DONE             : TStiRec = (Name: 'Done'             ; Color: 'green'    ; ColorT: clGreen    );
    INACTIVE         : TStiRec = (Name: 'Inactive'         ; Color: 'gray'     ; ColorT: clGray     );
    NEW              : TStiRec = (Name: 'New'              ; Color: 'black'    ; ColorT: clBlack    );
    ONGOING          : TStiRec = (Name: 'Ongoing'          ; Color: 'orange'   ; ColorT: clWebOrange);
    ONHOLD           : TStiRec = (Name: 'OnHold'           ; Color: 'gray'     ; ColorT: clGray     );
    PLANNED          : TStiRec = (Name: 'Planned'          ; Color: 'yellow'   ; ColorT: clYellow   );
    TESTING          : TStiRec = (Name: 'Testing'          ; Color: 'purple'   ; ColorT: clPurple   );
    UNDERCONSTRUCTION: TStiRec = (Name: 'Underconstruction'; Color: 'orange'   ; ColorT: clWebOrange);
    UNKNOWN          : TStiRec = (Name: 'Unknown'          ; Color: 'red'      ; ColorT: clOlive    );
    VALIDATED        : TStiRec = (Name: 'Validated'        ; Color: 'green'    ; ColorT: clGreen    );
    VALIDATING       : TStiRec = (Name: 'Validating'       ; Color: 'orangered'; ColorT: clTeal     );
  public
    class function  Vector: TStiRecVec; static;
    class function  IsActive(IvState: string): boolean; static;
    class function  ColorW3FromState(IvState: string): string; static;
  end;

  TStdRec = record // standardstuff
    class function  StdInfo(IvInfo, IvInfo2, IvInfo3: string): string; static;
    class function  StdException(IvE: Exception): string; overload; static;
    class function  StdException(IvEStr: string): string; overload; static;
    class function  StdNotImplemented(IvWhat: string): string; static;
  end;

  TStlRec = record // stringlist
  public
    class function  StlSort(IvStringList: TStringList; IvIndex1, IvIndex2: integer; IvAscending: integer = 1): integer; static;
    class function  StlSortAsc(IvStringList: TStringList; IvIndex1, IvIndex2: integer): integer; static;
    class function  StlSortDesc(IvStringList: TStringList; IvIndex1, IvIndex2: integer): integer; static;
  end;

  TStmRec = record // stream
  public
    class function  ToByteArray(IvStream: TMemoryStream): TByteDynArray; static;
    class procedure FromByteArray(const IvByteArray: TByteDynArray; IvStream: TStream); static;
  end;

  TStrRec = record // string (see TVecRec)
    class function  StrIs09(const IvString: string): boolean; static;                                                    // 01 only
    class function  StrIsInteger(IvStr: string): boolean; static;                                                        // str is like 123
    class function  StrIsFloat(const IvString: string): boolean; static;                                                 // str is like 0.123
    class function  StrIsNumeric(const IvString: string): boolean; static;                                               // str is like 123 or 0.123
    class function  StrIsPath(IvStr: string): boolean; static;                                                           // str is like Aaa/Bbb/.../Xxx
    class function  StrIsChars(IvStr: string; IvChar: char; var IvCount: integer): boolean; static;                      // str is all the same char, return the number of chars
    class function  StrIsShelledWith(IvStr, IvChars: string): boolean; static;                                           // str starts and ends witthe same specific char(s) like ..str..
    class function  StrIsShell(IvStr: string): boolean; static;                                                          // str starts and ends with the same char(s) like **str**
    class function  StrIsBoxed(IvStr: string; var IvBoxA, IvBoxZ: char): boolean; static;                                // str is in between () | [] | {}, returns boxchars
    class function  StrHas(IvStr, IvSubStr: string; IvCaseInsensitive: boolean = true): boolean; static;                 // str contains substr
    class function  StrHasRex(IvStr, IvRex: string; IvOpt: TRegExOptions): boolean; static;                              // str contains a regex pattern
    class function  StrHasWithOpt(IvString, IvSubString: string; IvWholeWord: boolean; IvMatchCase: boolean): boolean; static;                       // contains with options
    class function  StrOccurences(const IvString, IvSubString: string; IvWholeWord: boolean = false; IvMatchCase: boolean = false): integer; static; // count occurrences with options
    class function  StrPosWithOpt(IvString, IvSubString: string; IvWholeWord: boolean; IvMatchCase: boolean): integer; static;                       // pos with options
    class function  StrReplaceWithOpt(IvString, IvStrOut, IvStrIn: string; IvWholeWord: boolean; IvMatchCase: boolean): string; static;              // replace wiyh options
    class function  StrReplace(IvStr, IvOut, IvIn: string): string; static;                                              //
    class function  StrCapitalize(IvStr: string; IvAll: boolean = true): string; static;                                 // 'this IS a test' --> 'This is a test' | 'This Is A Test'
    class function  StrCase(IvStr: string; IvCase: TCaseEnum = cAsIs): string; static;                                   // change a string case in several ways
    class function  StrCollapse(IvStr: string; IvCapitalize: boolean = false): string; static;                           // 'This is a Test' --> Thisisatest | ThisIsATest
    class function  StrExpand(IvStr: string; IvDelimiter: string = ' '{; IvCase: TCaseEnum = cAsIs}): string; static;    // 'ThisIsATest'    --> 'This Is A Test' but 'This_IsA_Test' --> 'ThisIs ATest'
    class function  StrCamelCaseFromVec(IvVec: TArray<string>): string; static;                                          // ['aaa', 'BbB']   --> aaaBbb
    class function  StrPascalCaseFromVec(IvVec: TArray<string>): string; static;                                         // ['aaa', 'BbB']   --> AaaBbb
    class function  StrCommentRemove(IvStr: string; IvPythonCommentRemove: boolean = false): string; static;             // remove all types of comments
    class function  StrEmptyLinesRemove(IvStr: string): string; static;                                                  // remove all emtpy lines
    class function  StrShellIt(IvStr, IvStartEndStr: string): string; static;                                            // enclose str between same chars
    class function  StrUnShell(IvStr: string): string; static;                                                           // remove same chars from str
    class function  StrShellThick(IvStr: string): integer; static;                                                       // remove same chars from str
    class function  StrShellChrs(IvStr: string): string; static;                                                         // remove same chars from str
    class function  StrUnBox(IvStr: string): string; static;                                                             // remove () | [] | {} from str
    class function  StrLeft(IvStr: string; IvLen: integer): string; static;                                              //
    class function  StrRight(IvStr: string; IvLen: integer): string; static;                                             //
    class function  StrLeftOf(IvTag, IvString: string; IvTagInclude: boolean = false; IvCaseSensitive: boolean = true): string; static;                           //
    class function  StrRightOf(IvTag, IvString: string; IvTagInclude: boolean = false; IvCaseSensitive: boolean = true; IvLast: boolean = false): string; static; // use the 1st tag in the string
    class function  StrBetween(IvTagLeft, IvTagRight, IvString: string; IvCaseSensitive: boolean = true): string; static;                                         // or Inside s1 = '[', s2 = ']', s3 = 'abc[xxx]def' -> 'xxx'
    class function  StrDel(IvStr, IvStrOrCharToDelete: string): string; static;                                          //
    class function  StrReplicate(IvStr: string; IvN: integer): string; static;                                           // repear a string n times
  //class function  StrSplitB(IvString: string; IvDelimiters: string = ','): TStringDynArray; static;                    // DUP see TVecRecVecFromStr() returning a TArray<string>
    class function  StrWordAppend(IvStr, IvWord: string): string; static;                                                // src + ' ' + word
    class function  StrKeep(IvStr: string; const IvCharToKeepSet: TSysCharSet): string; static;                          //
    class function  StrClean(IvStr: string): string; static;                                                             // remove any char not in [A..Z][a..z]
    class function  StrCoalesce(IvStrVector: TArray<string>; IvDefault: string = ''): string; static;                    // return the 1st non empty value in vector
    class function  StrConcat(IvStrVector: TArray<string>; IvDelimiter: string = ''): string; static;                    // ['aaa', 'BbB']   --> aaa_BbB
    class procedure StrInsertAt(var IvStr: string; const IvStrToInsert: string; IvAtPos: integer); static;               // insert str into a string at given position
    class function  StrCommentHas(IvStr, IvComment: string; out IvBlanks: integer): boolean; static;                     // return true if str is like '# aaa' or '  # aaa' , return how many blanks at the beginning of the string
    class function  StrCommentToggle(IvStr, IvComment: string; IvAtBegin: boolean = false; IvReplace: boolean = false): string; static;
    class function  StrSafe(IvStr: string): string; static;                                                              // camelcase removing spaces and punctuation chars
    class function  StrRemoveFirst(IvStr: string; IvCharCount: integer): string; static;                                 //
    class function  StrRemoveLast(IvStr: string; IvCharCount: integer): string; static;                                  //
  end;

  TTxtRec = record // text
  public                                                                                            // count all kinds of charcters in a memo
    class function  TxtCharsFrequency(IvText: TStrings; var IvDigits{, IvNumbers}, IvLetters, IvLowers, IvUppers, IvPucts, IvSeps, IvSymbols, IvWhites: integer; var IvFbk: string): boolean; static;
    class function  TxtWordCount(IvText: TStrings; IvWord: string): integer; static;
    class function  TxtWordFirst(IvText: TStrings): string; static;
    class function  TxtWordDensity(IvText: TStrings; IvWord: string): single; static;
    class function  TxtWordsCount(IvText: TStrings): integer; static;                                             // returns how many words are in the given text
    class function  TxtWordsVector(IvText: TStrings; var IvStringVector: TStringVector): integer; static;         // returns all words in a vector
    class function  TxtWordsDistinctVector(IvText: TStrings; var IvStringVector: TStringVector): integer; static; // returns all distinct words in a vector
    class function  TxtWordsFrequencyVector(IvText: TStrings; var IvKvv: TKvaRecVec): integer; static;            // returns all distinct words + frequencies in a vector
  end;

  TWseRec = record // session (it exists if user is logged in or not, a session contains several requests)
    DateTimeBegin  : TDateTime;
    DateTimeEnd    : TDateTime; // for browser websessions it might not exixst since the user rarely will explicitly logoff a website
    Kind           : string;    // Web|Win|Android|Apple
    SessionId      : cardinal;  //
    FingerprintId  : cardinal;  // clientpcfingherprint   via js for browser and not implemented for winclients (may exceed integer range ence string!
    IpLan          : string;    // clientaddr             possible for browser and winclients
    Domain         : string;    // clientdomain           impossible with recent browsers, possible for winclients
    Computer       : string;    // clientcomputer         idem
    OsLogin        : string;    // clientoslogin          idem
    Client         : string;    // clientapp              browsername or winclientname
    Version        : string;    // clientversion          useless for browser ok for winclients
    Server         : string;    // serverhost             browser or winclient contact this server(web)
    Organization   : string;    // loginorganization      supplied during login in browser or winclients
    Username       : string;    // loginusername          idem
  public
    function  Info: string;
    function  Exists(IvDateTimeBegin: TDateTime; IvSessionId: integer; var IvFbk: string): boolean;
    function  IsValid(var IvFbk: string): boolean; // userisloggedin
    function  Init(IvKind: string; IvSessionId, IvFingerprintId: cardinal; IvIpLan, IvDomain, IvComputer, IvOsLogin, IvClient, IvVersion, IvServer, IvOrganization, IvUsername: string; var IvFbk: string): boolean;
    function  Insert(var IvFbk: string): boolean;
    function  InsertRio(var IvFbk: string): boolean;
    function  Select(var IvFbk: string): boolean;
    function  Update(var IvFbk: string): boolean; // set FldUsername
    function  Close(var IvFbk: string): boolean;  // set FldDateTimeEnd
    function  CloseRio(var IvFbk: string): boolean;
  end;

  TSygRec = record // syneditglobalsearch (should be saved to the ini/registry)
    SearchText     : string ;
    SearchHistory  : string ;
    ReplaceText    : string ;
    ReplaceHistory : string ;
    CaseSensitive  : boolean;
    WholeWord      : boolean;
    RegEx          : boolean;
    Backwards      : boolean; // or forward (up or down)
    SearchFromCaret: boolean; // if not search the entirescope
    SelectionOnly  : boolean;
  end;

  TSynRec = record // synedit
  private
      SynEditSearch     : TSynEditSearch;
      SynEditRegexSearch: TSynEditRegexSearch;
  public
    CodeKind: TCodKindEnum; // *** this must be set before using ScanForFoldRanges() ***
  public
    {class} procedure Setup(IvSynEdit: TCustomSynEdit; IvTabWidth: integer = 4; IvCodKind: TCodKindEnum = ckTxt; IvFoldingLineShow: boolean = false); {static;}
    {class} procedure CharOnOff(IvSynEdit: TCustomSynEdit; IvOn: boolean); {static;}
    {class} function  PositionPoint(IvSynEdit: TCustomSynEdit; IvColumn, IvLine: integer): TPoint; {static;}
    {class} procedure SearchPrev(IvSynEdit: TCustomSynEdit; IvString: string); {static;}
    {class} procedure SearchNext(IvSynEdit: TCustomSynEdit; IvString: string); {static;}
    {class} procedure KeyUp(IvSynEdit: TCustomSynEdit{; var IvSearch: string}; IvCodeKindEnum: TCodKindEnum; var Key: Word; Shift: TShiftState); {static;} // *** should use CodeKind? ***
    {class} procedure SearchReplaceFormShow(IvSynEdit: TCustomSynEdit; var IvGlobalSearch: TSygRec; IvReplace: boolean); {static;}
    {class} procedure SearchReplaceDo(IvSynEdit: TCustomSynEdit; var IvGlobalSearch: TSygRec; IvReplace: boolean); {static;}
    {class} procedure OnReplaceText(IvSynEdit: TCustomSynEdit; const ASearch, AReplace: string; Line, Column: Integer; var Action: TSynReplaceAction); {static;}
    {class} procedure InsertTextAtCaret(IvSynEdit: TCustomSynEdit; IvString: string); {static;}
    {class} procedure InsertHeader(IvSynEdit: TCustomSynEdit); {static;}
    {class} procedure InsertSection(IvSynEdit: TCustomSynEdit); {static;}
    {class} procedure InsertContentTemplate(IvSynEdit: TCustomSynEdit); {static;}
    {class} procedure InsertJsonTemplate(IvSynEdit: TCustomSynEdit); {static;}
    {class} procedure ScanForFoldRanges(Sender: TObject; TopFoldRanges: TSynFoldRanges; LinesToScan: TStrings; FromLine: Integer; ToLine: Integer); {static;}
    {class} function  Focused: TCustomSynEdit; {static;}
    {class} function  Highlighter(IvOwner: TComponent; IvCodeKindEnum: TCodKindEnum): TSynCustomHighlighter; {static;} // *** should use CodeKind? ***
    {class} function  LineCurrentText(IvSynEdit: TCustomSynEdit): string;
    {class} procedure LineCurrentTextSet(IvSynEdit: TCustomSynEdit; IvString: string);
    {class} procedure InsertRegion(IvSynEdit: TCustomSynEdit); {static;} // Folding
    {class} procedure RegionCollapse(IvSynEdit: TCustomSynEdit);
    {class} procedure RegionExpand(IvSynEdit: TCustomSynEdit);
    {class} procedure CaretMoveToLine(IvSynEdit: TCustomSynEdit; IvLineNumber: integer);
  end;

  {$REGION 'TTasKindEnum'}
  TTasKindEnum = ( // taskkind
    pkPortfolio    // Portfolio         Organization
  , pkProgram      // |_Program         |_Department
  , pkPackage      //   |_Package         |_Area
  , pkProject      //     |_Project         |_Team
  , pkPhase        //       |_Phase           |
  , pkGroup        //         |_Group         |
  , pkTask         //           |_Task        |_Member
  );
  {$ENDREGION}

  TTblRec = record // htmtable
  public
    class function TblEditJsonStr(IvTable: string; IvKeyFieldVec: TArray<string>; IvEditFieldVec: TArray<string>): string; static;
  end;

  TThiRec = record // themeitem
    Theme: string; // name
    P60  : string; // 60% primary
    S30  : string; // 30% secondary
    A10  : string; // 10% accent
  end;

  TTheRec = record // theme [B]
  const
    // theme
    THEME_DEF               = 'black'              ; // guithemename
    GRADE_DEF               = 'w3-theme'           ; // see: TW3fRec w3-theme-<color>.css
    FONT_FAMILY_DEF         = 'Verdana'            ; // Verdana, sans-serif
    FONT_WEIGHT_DEF         = '500'                ; // 500..900
    SIZE_CLASS_DEF          = ''                   ; //
    PADDING_CLASS_DEF       = 'w3-padding-x-large' ; //
    BORDERED_CLASS_DEF      = ''                   ; //
    HIGHLIGHTJS_THEME_DEF   = 'agate'              ; // highlightjsthemename
    PRIMARY60BG_COLOR_DEF   = 'FFFFFF'             ; // white
    SECONDARY30FG_COLOR_DEF = '7A7A7A'             ; // gray
    ACCENT10_COLOR_DEF      = '4F81BD'             ; // windowsblue
    ERROR_COLOR_DEF         = '404040'             ; // black
    DANGER_COLOR_DEF        = 'FF4300'             ; // red
    WARNING_COLOR_DEF       = 'FF6A00'             ; // darkorange
    INFO_COLOR_DEF          = '0055FF'             ; // blue
    SUCCESS_COLOR_DEF       = '007F00'             ; // green
    // vectors
  //THEME_VEC            : TArray<string> = TW3fRec.THEME_NAME_VEC;
    GRADE_VEC            : TArray<string> = ['w3-theme', 'w3-theme-gradient'];
    FONT_FAMILY_VEC      : TArray<string> = ['Constantia', 'Courier New', 'Inconsolata', 'Inter', 'Montserrat', 'Poppins', 'Roboto', 'Roboto Mono', 'Verdana']; // Font, sans-serif
    FONT_WEIGHT_VEC      : TArray<string> = ['lighter', '100', '200', '300', 'normal', '400', '500', '600', 'bold', '700', '800', 'bolder', '900'];
    SIZE_CLASS_VEC       : TArray<string> = ['w3-tiny', 'w3-small', 'w3-large', 'w3-xlarge', 'w3-xxlarge', 'w3-xxxlarge', 'w3-jumbo'];
    PADDING_CLASS_VEC    : TArray<string> = ['w3-padding-small', 'w3-padding-large', 'w3-padding-x-large', 'w3-padding-16', 'w3-padding-24', 'w3-padding-32'];
    BORDERED_CLASS_VEC   : TArray<string> = ['w3-border', 'w3-card'];
    HIGHLIGHTJS_THEME_VEC: TArray<string> = ['agate', 'arta', 'default', 'devibeans', 'github', 'idea', 'nord', 'obsidian', 'purebasic', 'sunburst', 'vs', 'xcode'];
  public
    // identity
    ObjectId          : integer;
    Theme             : string;
    Grade             : string;
    // webframwork
  //Framework         : TWebFrameworkEnum;
    // main
  //LogoGraphic       : string; // @orgapath
    FontFamily        : string; // font-family like "Times", "Arial", "Courier", "Montserrat" and/or generic-family, like "serif", "sans-serif", "cursive", "fantasy", "monospace"
    FontWeight        : string; // 500..900
    // classes                  my be duplicate all for w3 and bs?
    SizeClass         : string;
    PaddingClass      : string;
    BorderedClass     : string;
    // codehighlighter
    HighlightJs       : string; // themename
    // guicolors
    Primary60BgColor  : string;
    Secondary30FgColor: string;
    Accent10Color     : string;
    // fbkmodecolor
    ErrorColor        : string;
    DangerColor       : string;
    WarningColor      : string;
    InfoColor         : string;
    SuccessColor      : string;
    // typographycolor
  //HoverColor: string;
  //SelectedColor: string;
  //MutedColor: string;
  //HighlightColor: string;
  public
    procedure Reset; // set to wks default theme
    function  InitDba(IvOrganizationId: integer; var IvFbk: string): boolean;
    function  InitRio(IvOrganizationId: integer; var IvFbk: string): boolean;
  end;

  TTheRem = class(TRemotable)
  private
    FObjectId          : integer;
    FTheme             : string;
    FGrade             : string;
    FFontFamily        : string;
    FFontWeight        : string;
    FSizeClass         : string;
    FPaddingClass      : string;
    FBorderedClass     : string;
    FHighlightJs       : string;
    FPrimary60BgColor  : string;
    FSecondary30FgColor: string;
    FAccent10Color     : string;
    FErrorColor        : string;
    FDangerColor       : string;
    FWarningColor      : string;
    FInfoColor         : string;
    FSuccessColor      : string;
  published
    property ObjectId          : integer       read FObjectId           write FObjectId          ;
    property Grade             : string        read FGrade              write FGrade             ;
    property Theme             : string        read FTheme              write FTheme             ;
    property FontFamily        : string        read FFontFamily         write FFontFamily        ;
    property FontWeight        : string        read FFontWeight         write FFontWeight        ;
    property SizeClass         : string        read FSizeClass          write FSizeClass         ;
    property PaddingClass      : string        read FPaddingClass       write FPaddingClass      ;
    property BorderedClass     : string        read FBorderedClass      write FBorderedClass     ;
    property HighlightJs       : string        read FHighlightJs        write FHighlightJs       ;
    property Primary60BgColor  : string        read FPrimary60BgColor   write FPrimary60BgColor  ;
    property Secondary30FgColor: string        read FSecondary30FgColor write FSecondary30FgColor;
    property Accent10Color     : string        read FAccent10Color      write FAccent10Color     ;
    property ErrorColor        : string        read FErrorColor         write FErrorColor        ;
    property DangerColor       : string        read FDangerColor        write FDangerColor       ;
    property WarningColor      : string        read FWarningColor       write FWarningColor      ;
    property InfoColor         : string        read FInfoColor          write FInfoColor         ;
    property SuccessColor      : string        read FSuccessColor       write FSuccessColor      ;
  end;

  TTicRec = record // tickcount
  private
    Tick: cardinal;
  public
    procedure Init;
    function  ElapsedMs: cardinal;
  end;

  TUrlRec = record // url
    // protocoll userinfo
    //    |         |
    // /¯¯¯¯¯\/¯¯¯¯¯¯¯¯¯¯¯¯\
    // http://login:password@somehost.somedomain.com:8080/somepath/somethingelse.dll/Action?param1=val&param2=val#nose
    // \__/   \___/ \______/ \_____________________/ \__/\_________________________/ \____/ \___________________/ \__/
    //  |       |      |               |              |              |                 |             |             |
    // scheme username password      host           port           path           pathinfo       query         fragment
  const // *** MOVE TO cnst SECTION ***
  //GOOGLEDOTCOM   = 'http://www.google.com';
  //MYIPDOTNET     = 'https://www.wks.cloud/WksYourIpIsapiProject.dll';
  //MYIPDOTNET     = 'http://requestbin.net/ip';                                // double reading to avoid DoS
  //MYIPDOTNET     = 'http://ipinfo.io/ip';                                     //
    MYIPDOTNET     = 'https://ifconfig.co/ip';                                  //
  //UNSPLASHDOTCOM = 'https://source.unsplash.com';                             // images & bg
  public
    Scheme   : string; // http // protocol
    Username : string; // login
    Password : string; // password
    Host     : string; // somehost.somedomain.com
    Port     : string; // 8080
    Path     : string; // /some_path/something_else.html/dll
    PathInfo : string; // /some_path/something_else.html/dll
    QueryInfo: string; // ?param1=val&param2=val
    Fragment : string; // nose
  public
    function  Parse(IvUrl: string; IvPart: string = ''): string;                                   // also load all above members
    function  PatInfo(IvUrl: string): string;                                                      // class-procedures cannot access instance-members
    class function  HttpRemove(IvUrl: string): string; static;
    class function  ProtocolEnsure(IvUrl: string; IvProtocol: string = 'http://'; IvSecure: boolean = false): string; static; // ensure url begins with http:// or https://
    class function  Encode(IvQueryClearValue: string): string; static;                             // only query fields part?
    class function  Decode(IvQueryObscureValue: string): string; static;                           // only query fields part?
    class function  IsValid(IvUrl: string): boolean; static;
    class function  Exists(IvUrl: string; IvCheck: boolean = false{; IvProtocol: string = 'http://'}): boolean; static;
    class procedure Open(IvUrl: string); static;                                                   // open a NEW browser/tab
    class procedure Go(IvUrl: string); static;                                                     // launch the url in the already available browser/tab
    class procedure GoEdge(IvUrl: string); static;
    class procedure GoChrome(IvUrl: string); static;
    class procedure GoFirefox(IvUrl: string); static;
  end;

  TUsrRec = record // user (hosted by person) [B]
  const
    USER_CANCELLED_ACTION = 'User cancelled the action';
  public
    // master
  //Obj          : TObjRec;

    // detail
    PersonId     : integer ; // link to PersonId (DbaPerson.dbo.TblObject.FldId)
    Username     : string  ;
    Password     : string  ;
    AvatarGraphic: TGraphic;
    State        : string  ; // *** can be set only by a user with Admin role ***
  public
    function  Info: string;
    procedure Free;
    procedure Reset;
    function  InitDba(IvUsername: string; var IvFbk: string): boolean;    // web and win sessions should be differenziated?
    function  InitRio(IvUsername: string; var IvFbk: string): boolean;
    function  Exists(IvUsername: string; var IvFbk: string): boolean;
    function  ExistsRio(IvUsername: string; var IvFbk: string): boolean;
    function  IsActive(IvUsername: string; var IvFbk: string): boolean;
    function  IsActiveRio(IvUsername: string; var IvFbk: string): boolean;
    function  IsAuthenticated(IvUsername, IvPassword: string; var IvFbk: string): boolean;
    function  IsAuthenticatedRio(IvUsername, IvPassword: string; var IvFbk: string): boolean;
    function  HomePath: string;                                        // C:\$Per\I\IarussiFedericoCarloBrian
    function  AvatarFile: string;                                      // C:\$Per\I\IarussiFedericoCarloBrian\IarussiFedericoCarloBrian_Avatar.png | fcbiarussi_Avatar.png
    function  HomeUrl(IvRelative: boolean = true): string;             // /Person/I/IarussiFedericoCarloBrian
    function  AvatarUrl(IvRelative: boolean = true): string;           // /Person/I/IarussiFedericoCarloBrian/IarussiFedericoCarloBrian_Avatar.png | fcbiarussi_Avatar.png
    procedure AvatarGenerate(var IvAvatar: TBitmap; IvSize: integer = 200);
    procedure AvatarGenerateAI(var IvAvatar: TBitmap; IvSize: integer = 200; IvAiInstructions: string = '');
  end;

  TUsrRem = class(TRemotable)
  private
    // master
  //FObjRem      : TObjRem;

    // detail
    FPersonId   : integer      ;
    FUsername   : string       ;
    FPassword   : string       ;
    FState      : string       ;
    FAvatarBytes: TByteDynArray;
  published
  //property ObjRem     : TObjRem       read FObjRem      write FObjRem     ;
    property PersonId   : integer       read FPersonId    write FPersonId   ;
    property Username   : string        read FUsername    write FUsername   ;
    property Password   : string        read FPassword    write FPassword   ;
    property State      : string        read FState       write FState      ;
    property AvatarBytes: TByteDynArray read FAvatarBytes write FAvatarBytes;
  //property About      : string        read FAbout       write FAbout      ;
  //property Email      : string        read FEmail       write FEmail      ;
  //property Data       : string        read FData        write FData       ;
  end;

  TVecRec = record // vector (see TStrRec)
    class function  VecNx(IvStringVec: array of string): boolean; static;                                                             // is not exists  = empty
    class function  VecEx(IvStringVec: array of string): boolean; static;                                                             // is existent    = not empty
    class function  VecHas(const IvString: string; IvStringVector: TStringVector; IvCaseSensitive: boolean = false): boolean; static; //
    class function  VecFromStr(IvStr: string; IvDelimChars: string = ','; IvTrim: boolean = true): TArray<string>; static;            // This, is,A  ,Test                     --> ['This', 'Is', 'A', 'Test']
    class function  VecFromStrCamel(IvStr: string; IvCase: TCaseEnum = cAsIs): TArray<string>; static;                                // ThisIsATest                           --> ['This', 'Is', 'A', 'Test']
    class function  VecToList(IvStrVec: TArray<string>; IvDelimiter: string = ','; IvQuoted: boolean = false): string; static;        // ['Aaa', 'Bbb', ...]                   --> Aaa,Bbb,...
    class function  VecToListFmt(IvStrVec: TArray<string>; IvDelimiter: string = ','; IvItemFmt: string = '%s'): string; static;      // ['Aaa', 'Bbb', ...],  '{"fld": "%s"}' --> {"fld": "Aaa"}, {"fld": "Bbb"}, ...
    class function  VecCollapse(IvStrVec: TArray<string>): string; static;                                                            // ['Aaa', 'Bbb', ...]                   --> AaaBbb...
    class procedure VecRemoveWith(var IvStrVec: TArray<string>; IvStr: string); static;                                               // ['Aaa', '', ' ', 'Ccc']               --> ['Aaa', 'Ccc']
  end;

  TVntRec = record
    class function  VntIsEmpty(const IvVariant: variant): boolean; static;
    class function  VntIsWhite(const IvVariant: variant): boolean; static; // isclear(isunassigned or interfacesettonil or customvariantreturningtruefromitsIsClearmethod) or isempty or isnull
    class function  VntToInt(const IvVariant: variant; IvDefault: integer = 0): integer; static;
    class function  VntToStr(IvVariant: variant; IvDefault: string = ''): string; static;
    class function  VntVecToCsv(IvVarRecVector: array of TVarRec): string; static;
  end;

  TVstRec = record // virtualstringtree
  const
    ROOT_ID         =   1;
    ZZZ_ID          =   2;
    TEMP_ID         =   3;
    TEST_ID         =   4;
    HELP_ID         =   5;
    TEMPLATE_ID     =   6;
    ORGANIZATION_ID =   7;
    PUBLIC_ID       =   8;
    SYSTEM_ID       =   9;
    RESERVED_ID     =  10;
  //SYS_1ST_ID      =   1; // 1st system id
  //SYS_LAST_ID     = 100; // last system id
  public
    class function  NodePath       (IvVst: TBaseVirtualTree; IvNode: PVirtualNode; IvDelimiter: char = '/'; IvUseLevels: boolean = false): string; static;
    class procedure NodeInfo       (IvVst: TBaseVirtualTree; IvNode: PVirtualNode; var IvPath, IvCaption: string; var IvKey, IvLevel, IvChildCount: integer); static;
    class function  NodeHasChildren(                         IvNode: PVirtualNode): boolean; static;
    class procedure NodeParamSet   (IvVst: TBaseVirtualTree; IvNode: PVirtualNode; IvObj: string; IvDs: TDataSet); static;
    class procedure NodeParamGet   (IvVst: TBaseVirtualTree; IvNode: PVirtualNode; var IvId, IvPId, IvOrder: integer; var IvName, IvObj, IvObjectKind, IvContentKind, IvState, IvOrganization, IvData: string); static;
    class procedure OnPaintText    (IvVst: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType); static;
    class procedure OnCompareNodes (IvVst: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: integer); static;
    class procedure OnGetImageIndex(IvVst: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex); static;
  end;

  TW3fRec = record // w3framework

    {$REGION 'help'}
    { framework   color1          color2            color3          note
    ----------------------------------------------------------------------------
      bootstap    primarycolor    secondarycolor                    1stlearned
      android     primarycolor    primarydarc       accentcolor     adopted
      w3css       primarycolor    primarydarc       accentcolor     newone
    }
    {$ENDREGION}

  const
  //FILE_VEC:             array [0..3] of string = ('C:\$Inc\w3\w3.js', 'C:\$Inc\w3\w3color.js', 'C:\$Inc\w3\w3.css', 'C:\$Inc\w3\w3-theme-%s.css');
    FILE_VEC                    : TArray<string> = ['C:\$Inc\w3\w3.js', 'C:\$Inc\w3\w3color.js', 'C:\$Inc\w3\w3.css', 'C:\$Inc\w3\w3-theme-%s.css'];

    THEME_NAME_VEC              : TArray<string> = ['amber'      ,'black'      ,'blue'       ,'blue-grey'  ,'brown'      ,'cyan'       ,'dark-grey'  ,'deep-orange','deep-purple','green'      ,'grey'       ,'indigo'     ,'khaki'      ,'light-blue' ,'light-green','light-grey' ,'lime'       ,'orange'     ,'pink'       ,'purple'     ,'red'        ,'silver'     ,'teal'       ,'white'      ,'yellow'     ];
    THEME_COLOR_VEC             : TArray<string> = ['#ffc107'    ,'#0f0f0f'    ,'#2196f3'    ,'#607d8b'    ,'#795548'    ,'#00bcd4'    ,'#616161'    ,'#ff5722'    ,'#673ab7'    ,'#4caf50'    ,'#9e9e9e'    ,'#3f51b5'    ,'#f0e68c'    ,'#87ceeb'    ,'#8bc34a'    ,'#e7e7e7'    ,'#cddc39'    ,'#ffa500'    ,'#e91e63'    ,'#9c27b0'    ,'#f44336'    ,'#c0c0c0'    ,'#009688'    ,'#ffffff'    ,'#ffeb3b'    ];

    THEME_PRIMARY_60_COLOR_VEC  : TArray<string> = ['#ffc107'    ,'#0f0f0f'    ,'#2196f3'    ,'#607d8b'    ,'#795548'    ,'#00bcd4'    ,'#616161'    ,'#ff5722'    ,'#673ab7'    ,'#4caf50'    ,'#9e9e9e'    ,'#3f51b5'    ,'#f0e68c'    ,'#87ceeb'    ,'#8bc34a'    ,'#e7e7e7'    ,'#cddc39'    ,'#ffa500'    ,'#e91e63'    ,'#9c27b0'    ,'#f44336'    ,'#c0c0c0'    ,'#009688'    ,'#ffffff'    ,'#ffeb3b'    ];
    THEME_SECONDARY_30_COLOR_VEC: TArray<string> = ['#000000'    ,'#ffffff'    ,'#ffffff'    ,'#ffffff'    ,'#ffffff'    ,'#000000'    ,'#ffffff'    ,'#ffffff'    ,'#ffffff'    ,'#ffffff'    ,'#ffffff'    ,'#ffffff'    ,'#000000'    ,'#000000'    ,'#000000'    ,'#000000'    ,'#000000'    ,'#ffffff'    ,'#000000'    ,'#ffffff'    ,'#ffffff'    ,'#000000'    ,'#ffffff'    ,'#ffffff'    ,'#000000'    ];
    THEME_ACCENT_10_COLOR_VEC   : TArray<string> = ['#ffa500'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ,'#ff0000'    ];

//  THEME_VEC: array [0..24] of TThiRec = (
//    (Theme: 'amber'      ; P60: '#ffc107'; S30: '#000000'; A10: '#ff0000')
//  , (Theme: 'black'      ; P60: '#0f0f0f'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'blue'       ; P60: '#2196f3'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'blue-grey'  ; P60: '#607d8b'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'brown'      ; P60: '#795548'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'cyan'       ; P60: '#00bcd4'; S30: '#000000'; A10: '#ff0000')
//  , (Theme: 'dark-grey'  ; P60: '#616161'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'deep-orange'; P60: '#ff5722'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'deep-purple'; P60: '#673ab7'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'green'      ; P60: '#4caf50'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'grey'       ; P60: '#9e9e9e'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'indigo'     ; P60: '#3f51b5'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'khaki'      ; P60: '#f0e68c'; S30: '#000000'; A10: '#ff0000')
//  , (Theme: 'light-blue' ; P60: '#87ceeb'; S30: '#000000'; A10: '#ff0000')
//  , (Theme: 'light-green'; P60: '#8bc34a'; S30: '#000000'; A10: '#ff0000')
//  , (Theme: 'light-grey' ; P60: '#e7e7e7'; S30: '#000000'; A10: '#ff0000')
//  , (Theme: 'lime'       ; P60: '#cddc39'; S30: '#000000'; A10: '#ff0000')
//  , (Theme: 'orange'     ; P60: '#ffa500'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'pink'       ; P60: '#e91e63'; S30: '#000000'; A10: '#ff0000')
//  , (Theme: 'purple'     ; P60: '#9c27b0'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'red'        ; P60: '#f44336'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'silver'     ; P60: '#c0c0c0'; S30: '#000000'; A10: '#ff0000')
//  , (Theme: 'teal'       ; P60: '#009688'; S30: '#ffffff'; A10: '#ff0000')
//  , (Theme: 'white'      ; P60: '#ffffff'; S30: '#000000'; A10: '#ff0000')
//  , (Theme: 'yellow'     ; P60: '#ffeb3b'; S30: '#000000'; A10: '#ff0000')
//  );
  public
    class function  W3ColorFromTheme(IvTheme: string): string; static;
    class function  W3ThemeCssGenerate(IvTheme, IvH60PrimaryBgColor, IvH30SecondaryFgColor, IvH10AccentColor: string): string; static; // https://blog.logrocket.com/building-color-palette-css
    class function  W3ThemeTestHtmlGenerate: string; static;
    class procedure W3WebFilesGenerate; static;
  end;

  TSysRem = class(TRemotable) // sys=wks   -->   TOrgRem or TSysRem   *** TEMPORARY ***
  private
    FAuthor     : string;
    FArchitect  : string;
    FAcronym    : string;
    FName       : string;
    FDescription: string;
    FCopyright  : string;
    FSlogan     : string;
    FLogoBytes  : TByteDynArray; // --> LogoGraphic
//    FAdmin      : TAdmRem;
//    FNetwork    : TNetRem;
//    FSmtp       : TSmtRem;
//    FPop3       : TPopRem;
  published
    property Author     : string        read FAuthor      write FAuthor     ;
    property Architect  : string        read FArchitect   write FArchitect  ;
    property Acronym    : string        read FAcronym     write FAcronym    ;
    property Name       : string        read FName        write FName       ;
    property Description: string        read FDescription write FDescription;
    property Copyright  : string        read FCopyright   write FCopyright  ;
    property Slogan     : string        read FSlogan      write FSlogan     ;
    property LogoBytes  : TByteDynArray read FLogoBytes   write FLogoBytes  ;
//    property Admin      : TAdmRem       read FAdmin       write FAdmin      ;
//    property Network    : TNetRem       read FNetwork     write FNetwork    ;
//    property Smtp       : TSmtRem       read FSmtp        write FSmtp       ;
//    property Pop3       : TPopRem       read FPop3        write FPop3       ;
  end;

//TSviRec = record //  serviceitem
//  Name: string;
//  DisplayName: string;
//  ExePath: string;
//end;

  TSvcRec = record // wks services
  public
    class function ServiceName(IvName: string): string; static;
    class function DisplayName(IvName: string): string; static;
    class function ExePath(IvName: string): string; static;
  end;

  TWksRec = record // wks   -->   TOrgRec or TSysRec
  const
    // identity
    AUTHOR                 = 'puppadrillo';
    ACRONYM                = 'WKS';
    NAME                   = 'Working Knowledge System';
    DESCRIPTION            = 'Cloud integrated knowledge management system';
  //COPYRIGHT              = '© 2010-present Wks';
    SLOGAN                 = 'Programmed for progress';
    WWW                    = 'www.wks.cloud';
    PHONE                  = '348/5904744';
    EMAIL                  = 'info@wks.cloud';
    // paths
    HOME_PATH              = 'C:\$\X\Win32\Debug';
    INC_PATH               = 'C:\$Inc';
    HOME_URL               = 'http://' + WWW;
    LOGO_URL               = '/Organization/W/Wks/WksLogo.png';
    LOGO_LONG_URL          = '/Organization/W/Wks/WksLogoLong.png';
    ICON_URL               = '/Organization/W/Wks/WksIcon.ico';
    // options
    URL_CHECK              = true;
    // files
  //FILE_VEC: array [0..2] of string = ('C:\$Inc\wks\wks.js' , 'C:\$Inc\wks\wks.css' , 'C:\$\X\Win32\Debug\Default.htm');
    FILE_VEC:         TArray<string> = ['C:\$Inc\wks\wks.js'{, 'C:\$Inc\wks\wks.css'}, 'C:\$\X\Win32\Debug\Default.htm'];
    // ids
    HELP_PAGE_HOME_ID      = 5;
    // sleep
    LOG_PAUSE_MS           =  100;                  // inter log pause
    SHORT_PAUSE_MS         = 1000;                  // pause after a success (ie succesful login)
    MEDIUM_PAUSE_MS        = 2000;                  //
    LONG_PAUSE_MS          = 3000;                  // pause after a failure (ie unsuccessful login attempt)
  public
    class function  Info: string; static;                        // returns 'WKS www.wks.cloud'
    class function  Copyright: string; static;                   // returns '© 2010-2024 Wks'
    class procedure WksWebFilesGenerate; static;                 // generate wks.js (not wks.css) from DbaCode + Default.htm directly
    class function  InitDba(var IvFbk: string): boolean; static; // *** not implemented but used in LoginForm ***
    class function  InitRio(var IvFbk: string): boolean; static; // *** not implemented but used in LoginForm ***
  end;

  TWicRec = record // windowsimagecomponent
    class function  WicImgFormat(IvGraphic: TGraphic): string; static;
  end;

  TWinRec = record // windows-os *** GENERALIZE TO TOpsRec INCLUDING LINUX ***
  public
    class function  OsName: string; static;
    class function  OsVersion: string; static;
    class function  OsInfo: string; static;
    class procedure WinDesktopRefresh; static;
    class function  WinShellExec(IvHandle: HWnd; IvCommand: string; var IvFbk: string): boolean; static;
    class function  WinNewProcess(IvCommand: string; IvWait: boolean = false; IvHide: boolean = false): boolean; static; // the characters before the first space encountered (or if no space ) is interpreted as the EXE to execute, the rest of the string is the argument line
    class function  WinNewProcess2(const IvFileName, IvParams, IvWorkingDir: string; IvWaitUntilTerminated, IvWaitUntilIdle, IvRunMinimized: boolean; var IvErrorCode: integer): boolean; static;
  end;

  TWorRec = record // word
    class function  WordDbaSelectRnd(const IvLanguage: string = 'Italian'): string; static;
    class function  WordFantasyRnd(const IvLen: integer = 8; IvStartWithVowel: boolean = false): string; static;
  end;

  TWsiRec = record // website
    Www: string;                                     // www.wks.com (copied from TWrqRec)
  public
    function  Url(IvSecure: boolean = true): string; // http(s)://www.wks.com
  end;

  TWrqRec = record // webrequest
    WebRequestOrig: TWebRequest; // original web request
    FingerprintId : cardinal   ; // remove
    SessionId     : cardinal   ; // remove, already in TWseRec
    RequestId     : cardinal   ; // remove
    PageId        : integer    ; // remove
    DateTime      : TDateTime  ; // onclient
    Method        : string     ; // get, post, ...
    Protocol      : string     ; //
    Host          : string     ; // www.wks.com
    Url           : string     ; // /WksPageIsapiProject.dll
    PathInfo      : string     ; // /View
    Query         : string     ; // ?CoId&Co...
    Error         : string     ; // if not empty cause the display of a simple page wit the error
  //Obj           : string     ; // Page,Document,...
  //OId           : integer    ; // consider to upgrade to ObjectId giving the possibility to access all objects (Xxx=Object, Account, Agent, Code, ...)
  public
    function  FieldCookieExists  (IvField: string): boolean;
    function  FieldQueryExists   (IvField: string): boolean;
    function  FieldContentExists (IvField: string): boolean;
    function  FieldExists        (IvField: string): boolean;
    function  FieldCookieGet     (IvField: string; IvDefault: variant): variant; // get a cookie from client browser
    function  FieldQueryGet      (IvField: string; IvDefault: variant): variant;
    function  FieldContentGet    (IvField: string; IvDefault: variant): variant;
    function  FieldGet           (IvField: string; IvDefault: variant): variant; overload;
    function  FieldGet           (IvField: string; var IvValue: variant; IvDefault: variant; IvFalseIfValueIsEmpty: boolean = true): boolean; overload;
    function  FieldGet           (IvField: string; var IvValue: string ; IvDefault: string ; IvFalseIfValueIsEmpty: boolean = true): boolean; overload;
    function  DbaInsert(IvInMs: integer; var IvFbk: string): boolean;
    function  ScriptNameUrl(IvRelative: boolean = true): string; // /WksPageIsapiProject.dll
  end;

  TWrsRec = record // webresponse
  public
    class procedure ResponseSet(IvResponse: TWebResponse; IvContent: string             ; IvContentType: string = TCtyRec.CTY_TXT_HTML; IvStatusCode: integer = THttRec.HTTP_STATUS_200_OK); overload; static;
    class procedure ResponseSet(IvResponse: TWebResponse; IvContentStream: TStringStream; IvContentType: string = TCtyRec.CTY_TXT_HTML; IvStatusCode: integer = THttRec.HTTP_STATUS_200_OK); overload; static;
    class procedure ResponseCustomHeaderAdd(IvWebResponse: TWebResponse; IvCustomHeaderKeyValVec: TStringVector); static;
  //class procedure ResponseCustomHeaderAddCors(IvWebResponse: TWebResponse);
    class procedure FieldCookieSet   (IvResponse: TWebResponse; IvCookie: string; IvValue: variant; IvExpireInXDay: double = 8/24; IvDomain: string = ''; IvPath: string = '/'); static; // set a cookie in client browser
    class procedure FieldCookieDelete(IvResponse: TWebResponse; IvCookie: string; IvDomain: string = ''; IvPath: string = '/'); static;                                                  // delete a cookie in client browser
    class function  SendRedirectJsStr(IvUrl: string): string; static;
  end;

  TWmoRec = record // webmodule
    class procedure OnWebModuleCreate; static;
    class procedure OnWebModuleDestroy; static;
    class procedure OnWebModuleException(IvWebResponse: TWebResponse; IvE: Exception); static;
    class procedure BeforeDispatch(IvWebRequest: TWebRequest; IvWebResponse: TWebResponse; var IvWrq: TWrqRec; var IvTic: TTicRec); static;
    class procedure AfterDispatch (IvWebRequest: TWebRequest; IvWebResponse: TWebResponse; var IvWrq: TWrqRec; var IvTic: TTicRec); static;
  //class procedure BeforeSend;?
  //class procedure AfterSend;?
  end;

  TZipRec = record
    class procedure ZipFile(IvZipFileSpec, IvFileToZipSpec: string); static;
  end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Const ii'}
const

  {$REGION 'JachLog'}
  LOG_DIR                 = 'C:\$Log'     ;
  LOG_FILE_PREFIX         = 'Wks'         ;
  LOG_SYSLOG_HOST         = '51.38.98.160';
  LOG_SYSLOG_PORT         = 514           ;
  LOG_TOPIC_ID_MAX        = 4             ;
  LOG_TOPIC_GENERAL       = 0             ;
  LOG_TOPIC_ENVIRONMENT   = 1             ;
  LOG_TOPIC_NETWORK       = 2             ;
  LOG_TOPIC_LOGIN         = 3             ;
  LOG_TOPIC_AUTHORIZATION = 4             ;
  LOG_TOPIC_VEC: array[0..LOG_TOPIC_ID_MAX] of string = ('GENERAL', 'ENVIRONMENT', 'NETWORK', 'LOGIN', 'AUTHORIZATION');
  {$ENDREGION}

{$ENDREGION}

{$REGION 'GlobalVars'}
var
  // globalvar
  glo_h: cardinal;                 // handle
  glo_i: byte;                     // count

  // globaljachlogobjects
  gjlog : TjachLog;                // jachlog
  gjldsk: TjachLogToDisk;          // jachlogdisk
  gjludp: TjachLogToSysLogIndyUDP; // jachlogsysudp

  // globalprofiler
  gpro: TProfiler;                 // tprofiler

  // globalclassutils
  gini: TIniCls;                   // inifile

  // globalrecordsutils
  giif: TIifRec;                   // inlineif
  giis: TIisRec;                   // inlineis
  glog: TLogRec;                   // log with outputdebugstring and jachlog
  glst: TLstRec;                   // list
  grex: TRexRec;                   // regex
  gvec: TVecRec;                   // vectorutils
  grva: TRvaRec;                   // rvaglobal

  // globalrecordscontextany
  gctx: TCtxRec;                   // contextutilities
//gnet: TNetRec;                   // network

  // globalrecordscontextclient
  gaps: TApsRec;                   // applicationservercoords (used and populated only in clients/editors)
  gpxy: TPxyRec;                   // proxycoords
  gsyg: TSygRec;                   // syneditglobalsearch
  gsyn: TSynRec;                   // syneditglobal
  ggui: TGuiRec;                   // guiglobal
  grio: TRioRec;                   // httprio

  // globalrecordscontextweb(isapi)
  gwsi: TWsiRec;                   // website    (www and url copied from TWrqRec)
  gwse: TWseRec;                   // websession (can be from browser or from a winclient and is the container of several webrequests)
  gwrq: TWrqRec;                   // webrequest (*** CAGNOLINA ***)

  // globalrecordsbusinessobjects
  gper: TPerRec;                   // personstuff        [B] *** WARNING, contains Image, PictureGraphic that need to be free ***
  gusr: TUsrRec;                   // userstuff          [B] *** WARNING, contains AvatarGraphic that need to be free ***
  gorg: TOrgRec;                   // organization stuff [B] *** WARNING, contains Image, LogoGraphic, LogoLongGraphic that need to be free ***
  gthe: TTheRec;                   // theme              [B]
  gmbr: TMbrRec;                   // memberstuff        [B] *** WARNING, contains Image, BadgeGraphic that need to be free ***
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    Winapi.Winsock                // ulong twsadata
  , Winapi.ActiveX                // cominitialize ienumvariant
  , Winapi.WinInet                // hinternet urlcrack canonizeurl
  , Winapi.ShellAPI               // shellexecute
  , Winapi.Messages               // winmsg
  ,{WInapi.}Wcrypt2               // windows CryptoAPI2 (see if embarcadero has imported it in its own file)
  , Winapi.RichEdit               // trichedit
  , System.TypInfo                //
  , System.DateUtils              //
  , System.IOUtils                //
  , System.UITypes                //
  , System.Variants               //
  , System.StrUtils               //
  , System.Character              // char utils
  , System.Bindings.EvalProtocol  // IScope, ICompiledBinding
  , System.Bindings.Evaluator     //
  , System.Bindings.EvalSys       //
  , System.Math                   // mathstuff
  , System.Hash                   // thashsha2
  , System.Win.ComObj             // createoleobject, eoleexception, olevariant
  , System.NetEncoding            // tnetencoding
  , System.AnsiStrings            // StrLComp
  , System.Zip                    // compression
  , Vcl.GraphUtil                 // colorrgbtohls, colorhlstorgb, ColorToWebColor{Hex}Str/WebColor{Hex}StrToColor, ColorToWebColorName/WebColorNameToColor
  , Vcl.ExtActns                  // tbrowseurl
  , Vcl.Dialogs                   // MessageDlg
  , Vcl.StdCtrls                  // tlabel
  , Vcl.Menus                     // shortcuttotext
  , Vcl.ExtDlgs                   // topenpicturedialog, tsavepicturedialog
  , Winapi.Wincodec               // GUID_CONTAINERFORMATICO
  , Web.Win.IsapiHTTP             // isapihttp tisapirequest
  , SOAP.HTTPUtil                 // htmlescape
  , IdURI                         // tiduri
  , IdHTTP                        // TIdHTTP
  , JclExprEval                   // TEvaluator
  , JclAnsiStrings                // ansistringutils
//, JclStrings                    // stringutils
  , superobject                   // json
//, superdate                     // javatodelphidatetime
//, MarkdownProcessor             // md, not used
//, GraphicEx                     // used to determine a graphicclass from a stream, but not used anymore *** DANGER using it results in a not working TDBImage ***
  , ImagingTypes                  // timagedata, vampire
  , Imaging                       // vampyre
  , DTDBTreeView                  // dtdbtree
  , WksSearchFormUnit             // searchform
  , WksReplaceFormUnit            // replaceform
  , WksReplaceConfirmFormUnit     // replaceconfirmform
  , WksSystemSoapMainServiceIntf  // SystemSoapOrganizationGet ...
  ;
{$ENDREGION}

{$REGION 'Helper'}

  {$REGION 'TArrayHlp'}
class procedure TArrayHlp.RemoveWith<T>(var IvArray: TArray<T>; const IvValue: T);
var
  i, z: integer; // idx, count
  c: IEqualityComparer<T>; // defaultcomparer for T
begin
  // obtain an equality comparer for our type T
  c := TEqualityComparer<T>.Default;

  // step through the array until we find a match, or reach the end
  z := 0;
  while (z <= High(IvArray)) and not c.Equals(IvArray[z], IvValue) do
    Inc(z);
  // here z is either the index of the first match or one off the end

  // loop over the rest of the array copying non-matching values to the next slot
  for i := z to High(IvArray) do begin
    if not c.Equals(IvArray[i], IvValue) then begin
      IvArray[z] := IvArray[i];
      Inc(z);
    end;
  end;

  // resize the array
  SetLength(IvArray, z);
end;    
  {$ENDREGION}

  {$REGION 'TColorHelper'}
function  TColorHelper.ToString: string;
begin
  Result := ColorToString(Self);
end;

procedure TColorHelper.FromString(const IvString: string; IvDefault: TColor);
begin
  if IvString = '' then
    Self := IvDefault
  else
    Self := StringToColor(IvString);
end;

function  TColorHelper.ToHexString: string;
begin
  Result := IntToHex(GetRValue(Self), 2)  // red
          + IntToHex(GetGValue(Self), 2)  // green
          + IntToHex(GetBValue(Self), 2); // blue
end;

procedure TColorHelper.FromHexString(const IvString: string; IvDefault: TColor);
begin
  if IvString = '' then
    Self := IvDefault
  else
    Self := Rgb(
      StrToInt('$' + Copy(IvString, 1, 2)) // red
    , StrToInt('$' + Copy(IvString, 3, 2)) // green
    , StrToInt('$' + Copy(IvString, 5, 2)) // blue
    );
end;

function  TColorHelper.ToHtmlString(IvPrefix: boolean): string;
begin
  Result := Format('%.2x%.2x%.2x', [GetRValue(Self), GetGValue(Self), GetBValue(Self)]);
  if IvPrefix then
    Result := '#' + Result;
end;

procedure TColorHelper.FromHtmlString(const IvString: string; IvDefault: TColor);
var
  hco: string;
begin
  if Copy(IvString, 1, 1) = '#' then
    hco := IvString
  else
    hco := '#' + IvString;
  Self := StringToColor('$' + Copy(hco, 6, 2) + Copy(hco, 4, 2) + Copy(hco, 2, 2));
end;

procedure TColorHelper.ToRgb(var IvR, IvG, IvB: byte);
begin
  ;
end;

procedure TColorHelper.FromRgb(IvR, IvG, IvB: byte);
begin
  Self := RGB(IvR, IvG, IvB);
end;

function  TColorHelper.ToRgbTriple: TRGBTriple;
begin
  Result.rgbtRed   := GetRValue(Self);
  Result.rgbtGreen := GetGValue(Self);
  Result.rgbtBlue  := GetBValue(Self);
end;

procedure TColorHelper.FromRgbTriple(const IvRgbTriple: TRGBTriple);
begin
  Self := RGB(IvRgbTriple.rgbtRed, IvRgbTriple.rgbtGreen, IvRgbTriple.rgbtBlue);
end;
  {$ENDREGION}

  {$REGION 'TRectHlp'}
function  TRectHlp.WGet: integer;
begin
  Result := Right - Left;
end;

procedure TRectHlp.WSet(const Value: integer);
begin
  Right := Left + Value;
end;

function  TRectHlp.HGet: integer;
begin
  Result := Bottom - Top;
end;

procedure TRectHlp.HSet(const Value: integer);
begin
  Bottom := Top + Value;
end;

function  TRectHlp.TRGet: TPoint;
begin
  Result.X := Right;
  Result.Y := Top;
end;

procedure TRectHlp.TRSet(const Value: TPoint);
begin
  Top   := Value.Y;
  Right := Value.X;
end;

procedure TRectHlp.LTWHAssign(Left, Top, Width, Height: integer);
begin
  Self.Left   := Left;
  Self.Top    := Top;
  Self.Right  := Left+Width {-1};
  Self.Bottom := Top+Height {-1};
end;

procedure TRectHlp.Move(DX, DY: integer);
begin
  if DX <> 0 then begin
    Inc(Left,DX);
    Inc(Right,DX);
  end;
  if DY <> 0 then begin
    Inc(Top,DY);
    Inc(Bottom,DY);
  end;
end;

function  TRectHlp.LTOfCentered(IvInnerCenteredW, IvInnerCenteredH: integer): TPoint;
begin
  Result.X := Left + (W - IvInnerCenteredW) div 2;
  Result.Y := Top + (H - IvInnerCenteredH) div 2;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Type'}

  {$REGION 'TAaaRec'}
class function  TAaaRec.FileVer(const IvFileName: string): string;
var
  fn: string;           // filename
  iz: dword;            // infosize
  vb: pointer;          // verbuf
  vz: uint;             // versize
  wn: uint;             // wnd
  fi: PVSFixedFileInfo; // fixedfileinfo
begin
  // def
  if IvFileName.IsEmpty then
    fn := GetModuleName(HInstance)
  else
    fn := IvFileName;

  // result
  Result := '';
  iz := GetFileVersioninfoSize(PChar(fn), wn);
  if iz <> 0 then begin
    GetMem(vb, iz);
    try
      if GetFileVersionInfo(PChar(fn), wn, iz, vb) then begin
        VerQueryValue(vb, '\', Pointer(fi), vz);
        Result :=       IntToStr(fi.dwFileVersionMS div $10000)
                + '.' + IntToStr(fi.dwFileVersionMS and $0FFFF)
                + '.' + IntToStr(fi.dwFileVersionLS div $10000)
                + '.' + IntToStr(fi.dwFileVersionLS and $0FFFF);
      end;
    finally
      FreeMem(vb);
    end;
  end;
end;

(*class function  TAaaRec.ProcIs32Bit: boolean;
type
  TIsWow64Process = function(AHandle: DWORD; var AIsWow64: bool): bool; stdcall;
var
  hIsWow64Process: TIsWow64Process;
  hKernel32: dword;
  IsWow64: bool;
begin
  Result := false;
  hKernel32 := Winapi.Windows.LoadLibrary('kernel32.dll');
  if hKernel32 = 0 then
    Exit;
  try
    @hIsWow64Process := Winapi.Windows.GetProcAddress(hKernel32, 'IsWow64Process');
    if not System.Assigned(hIsWow64Process) then
      Exit;
    IsWow64 := false;
    if hIsWow64Process(Winapi.Windows.GetCurrentProcess, IsWow64) then
      Result := IsWow64;
  finally
    Winapi.Windows.FreeLibrary(hKernel32);
  end;
end;

class function  TAaaRec.Proc3264Bits: string;
begin
  if ProcIs32Bit then
    Result := '32bit'
  else
    Result := '64bit';
end;*)

class function TAaaRec.ProcessKind: TProcessKindEnum;
type
  TIsWow64Process = function(AHandle: DWORD; var AIsWow64: bool): bool; stdcall;
var
  hIsWow64Process: TIsWow64Process;
  hKernel32: dword;
  IsWow64: bool;
begin
  Result := pkUnknown;
  hKernel32 := Winapi.Windows.LoadLibrary('kernel32.dll');
  if hKernel32 = 0 then
    Result := pk32Bit
  else try
    @hIsWow64Process := Winapi.Windows.GetProcAddress(hKernel32, 'IsWow64Process');
    if not System.Assigned(hIsWow64Process) then
      Exit;
    IsWow64 := false;
    if hIsWow64Process(Winapi.Windows.GetCurrentProcess, IsWow64) then
      Result := pk64Bit
    else
      Result := pk32Bit;
  finally
    Winapi.Windows.FreeLibrary(hKernel32);
  end;
end;

class function TAaaRec.ProcessKindAsText: string;
const
  VALUES: array [0..2] of string = ('Unknown', '32Bit', '64Bit');
begin
  Result := VALUES[Ord(ProcessKind)];
end;
{$ENDREGION}

  {$REGION 'TAggRec'}
class procedure TAggRec.Attach(agg: TAgg2D; IvBitmap: TBitmap; IvYAsisUp: boolean);
var
  yup: integer;
begin
  // set 4bytes depth
  IvBitmap.PixelFormat := TPixelFormat.pf32bit;

//AggBmpAlpha(IvBadge, $ff);
//BitmapAlphaTransparency(IvBadge, 0); // beforeaggattach

  // yup
  if IvYAsisUp then
    yup := 1
  else
    yup := -1;

  // textup
  agg.FlipText := not IvYAsisUp;

  // attach
  agg.Attach(IvBitmap.ScanLine[IvBitmap.Height - 1], IvBitmap.Width, IvBitmap.Height, yup * IvBitmap.Width * 4);

// there is a problem when resizing the pixel map
// re-attaching both Agg2D or Agg2dImage each time the pixel map is resized will fix the problem:
//
// pm.SetSize(aWidth, aHeight);
//
// Agg2d.Attach(pm.Buffer, pm.Width, pm.Height, -pm.Stride);
//   or
// Agg2dImage.Attach(pm.Buffer, pm.Width, pm.Height, -pm.Stride);
end;

class procedure TAggRec.DrawSetup(agg: TAgg2D; IvLineWidth: double; IvLineColor, IvFillColor: string);
begin
  agg.LineWidth := IvLineWidth;
  agg.LineColor.FromHexStr(IvLineColor);
  agg.FillColor.FromHexStr(IvFillColor);
end;

class procedure TAggRec.Text(agg: TAgg2D; x, y: double; s: string; h: double; color, align: string; flip, bold, italic: boolean; font: ansistring; rotate: double);
const
  DDX         =  0.0;     // text origin addition after rounding on x axis [in subpixels] (allows shifting by eg. 0.5 to achieve less blur)
  DDY         = -0.5;     // text origin addition after rounding on y axis [in subpixels] (allows shifting by eg. 0.5 to achieve less blur)
  FONT_CHACHE = fcVector; // fcRaster
  // fcRaster
  // font manager internally caches the bitmap representations of glyphs at given font height.
  // consequently skipping over the vector-to-surface step speeds up the final text rendering
  // on the other side, font cached as raster cannot be further transformed (like rotated and so)
  // fcVector
  // font manager internally caches the vectorial representations of glyphs.
  // this gives the font renderer a great flexibility over the rasterization process (all transformations can be applied)
  // but it's a little bit slower because the vector-to-surface process is involved on rendering of each glyph
begin
  // exit
  if s = '' then
    Exit;

  // setup
  agg.NoLine;                         // text without borders
//agg.LineWidth(0.1*t);               // ?
//agg.LineColor.FromHexStr(color);    // text border color
  agg.FillColor.FromHexStr(color);    // text internal color
//agg.TextHints := AGG_TEXT_HINTS;    // ?
//agg.FlipText := flip;               // changes the vertical direction of fonts (false = font is upside-down)
  agg.Font(PAnsiChar(font), h, bold, italic, FONT_CHACHE, Deg2Rad(rotate));

  // alignment
       if SameText(align, 'tl') then agg.TextAlignment(tahLeft  , tavTop   )    //  |LT       M|T       RT|  top alignement
  else if SameText(align, 'tc') then agg.TextAlignment(tahCenter, tavTop   )    //  |----------+----------|
  else if SameText(align, 'tr') then agg.TextAlignment(tahRight , tavTop   )    //  |          |          |

  else if SameText(align, 'cl') then agg.TextAlignment(tahLeft  , tavCenter)    //  |          |          |
  else if SameText(align, 'cc') then agg.TextAlignment(tahCenter, tavCenter)    //  |LC-------C+C-------RC|  center alignememt
  else if SameText(align, 'cr') then agg.TextAlignment(tahRight , tavCenter)    //  |          |          |

  else if SameText(align, 'bl') then agg.TextAlignment(tahLeft  , tavBottom)    //  |          |          |
  else if SameText(align, 'bc') then agg.TextAlignment(tahCenter, tavBottom)    //  |----------+----------|
  else if SameText(align, 'br') then agg.TextAlignment(tahRight , tavBottom);   //  |LB       M|B       RB|  bottom alignement

  // draw
  agg.Text(x, y, ansistring(s), not AGG_TEXT_ROUND_OFF, DDX, DDY);
end;

class procedure TAggRec.BmpAlphaSet(IvBmp: TBitmap; IvAlpha: byte);
var
  i, j: integer;
  t: ^byte; // transparency
begin
  if not Assigned(IvBmp) or IvBmp.Empty or (IvBmp.PixelFormat <> pf32bit) then
    Exit;

  for j := 0 to IvBmp.Height - 1 do begin
    t := Pointer(PtrComp(IvBmp.ScanLine[j]) + 3);
    for i := 0 to IvBmp.Width - 1 do begin
      t^ := IvAlpha;
      Inc(PtrComp(t), 4);
    end;
  end;
end;

class procedure TAggRec.Box(agg: TAgg2D; cx, cy, w, h, round, rotate: double);
begin
  if round > 0 then
    agg.RoundedRect(cx-w/2, cy-h/2, cx+w/2, cy+h/2, round)
  else
    agg.Rectangle(cx-w/2, cy-h/2, cx+w/2, cy+h/2);
end;

class procedure TAggRec.GraphicSmashCentered(agg: TAgg2D; IvGraphic: TGraphic; cx, cy, newh: double);
var
  bmp: TBitmap;
  agi: TAgg2DImage;
  new, neh, sca: double; // newwidth, newheight, scale
begin
  bmp := TBitmap.Create;
  try
    bmp.PixelFormat := pf32bit;    // data must be 32bits, this also set channel alpha to 00 (trasparent)
    bmp.Transparent := true;
    bmp.TransparentColor := clBlack;
    bmp.TransparentMode := tmAuto;
    bmp.Assign(IvGraphic);
    TAggRec.BmpAlphaSet(bmp, $ff); // set alpha channel: transparent = 00..ff = opaque
    agi := TAgg2DImage.Create(bmp.ScanLine[bmp.Height - 1], bmp.Width, bmp.Height, 4 * bmp.Width);
    try
      agg.ImageFilter := ifBilinear;
    //agg.ImageResample := irOnZoomOut; // irNever, irAlways
      agg.ImageBlendMode := bmDestination;
      sca := newh / bmp.Height; // max(bmp.Width, bmp.Height)
      new := bmp.Width  * sca;
      neh := bmp.Height * sca;
      agg.TransformImage(agi,  0, 0, bmp.Width, bmp.Height,  cx-new/2, cy-neh/2, cx+new/2, cy+neh/2);
    finally
      agi.Free;
    end;
  finally
    bmp.Free;
  end;
end;

class procedure TAggRec.Star(agg: TAgg2D; cx, cy, r1, r2, angle: double; rays: integer; lw: double; lc, fc: string);
begin
  DrawSetup(agg, lw, lc, fc);
  agg.Star(cx, cy, r1, r2, angle, rays);
end;
{$ENDREGION}

  {$REGION 'TApsRec'}
function TApsRec.Info: string;
begin
  Result := '';
  if not Url.IsEmpty then
    Result := Result + Url;
  if not Environment.IsEmpty then
    Result := Result + ' (' + Environment + ')';
end;

function TApsRec.Www: string;
begin
//Result := '';
//if Environment.IsEmpty then
//  Exit;

  if      SameText(Environment, 'Prod') then
    Result := WwwProd
  else if SameText(Environment, 'Test') then
    Result := WwwTest
  else
    Result := WwwDev;
end;

function TApsRec.Url: string;
begin
  Result := '';
  if (not Protocol.IsEmpty) and (not Www.IsEmpty) then Result := Format('%s://%s', [Protocol, Www]);
end;
  {$ENDREGION}

  {$REGION 'TAskRec'}
class function  TAskRec.Yes(IvMessage: string): boolean;
begin
  Result := MessageDlg(IvMessage, mtConfirmation, [mbYes, mbNo], 0) = 6{=mrYes}; // mt=messagetype, mb=messagebutton, mr=modalresult in Vcl.Controls unit
end;

class function TAskRec.Yes(IvMessageFormatString: string; IvVarRecVector: array of TVarRec): boolean;
begin
  Result := Yes(Format(IvMessageFormatString, IvVarRecVector));
end;

//class function  TAskRec.YesFmt(IvMessageFormatString: string; IvVarRecVector: array of TVarRec): boolean;
//begin
//  Result := Yes(Format(IvMessageFormatString, IvVarRecVector));
//end;

class function  TAskRec.No(IvMessage: string): boolean;
begin
  Result := MessageDlg(IvMessage, mtConfirmation, [mbNo, mbYes], 0) = 7{=mrNo};
end;

class function  TAskRec.NoFmt(IvMessageFormatString: string; IvVarRecVector: array of TVarRec): boolean;
begin
  Result := No(Format(IvMessageFormatString, IvVarRecVector));
end;

class function TAskRec.YesNoCancel(IvMessage: string): integer;
begin
  Result := MessageDlg(IvMessage, mtConfirmation, [mbYes, mbNo, mbCancel], 0);

  // handle the user's response
//case Result of
//  mrYes:
//    ShowMessage('You clicked Yes.');
//  mrNo:
//    ShowMessage('You clicked No.');
//  mrCancel:
//    ShowMessage('You clicked Cancel.');
//else
//  ShowMessage('Unexpected response.');
//end;
end;

class function  TAskRec.Int(IvCaption, IvPrompt: string; IvDefault: integer; var IvInt: integer): boolean;
var
  s, d: string;
begin
  s := IvInt.ToString;
  d := IvDefault.ToString;
  Result := Str(IvCaption, IvPrompt, d, s);
  IvInt := StrToIntDef(s, IvDefault);
end;

class function  TAskRec.Str(IvCaption, IvPrompt, IvDefault: string; var IvStr: string): boolean;
begin
  // i
//IvStr  := Inputbox(IvCaption, IvPrompt, IvDefault);
//Result := true;

  // ii
  IvStr := IvDefault;
  Result := Vcl.Dialogs.InputQuery(IvCaption, IvPrompt, IvStr);
end;
  {$ENDREGION}

  {$REGION 'TBarRec'}
class function TBarRec.BarFromBmp(const IvBmp: TBitmap): TByteDynArray;
var
  mes: TMemoryStream;
begin
  if not Assigned(IvBmp) then
    Exit;

  mes := TMemoryStream.Create;
  try
    IvBmp.SaveToStream(mes);
    mes.Position := 0;
    SetLength(Result, mes.size);
    mes.ReadBuffer(Result[0], mes.size);
  finally
    mes.free;
  end;
end;

class function TBarRec.BarFromPng(const IvPng: TPngImage): TByteDynArray;
var
  mes: TMemoryStream;
begin
  if not Assigned(IvPng) then
    Exit;

  mes := TMemoryStream.Create;
  try
    IvPng.SaveToStream(mes);
    mes.Position := 0;
    SetLength(Result, mes.size);
    mes.ReadBuffer(Result[0], mes.size);
  finally
    mes.free;
  end;
end;

class function TBarRec.BarFromPic(const IvPic: TPicture): TByteDynArray;
var
  mes: TMemoryStream;
begin
  if not Assigned(IvPic) then
    Exit;

  mes := TMemoryStream.Create;
  try
    IvPic.Graphic.SaveToStream(mes);
    mes.Position := 0;
    SetLength(Result, mes.Size);
    mes.ReadBuffer(Result[0], mes.Size);
  finally
    mes.Free;
  end;
end;

class function TBarRec.BarFromGraphic(const IvGraphic: TGraphic): TByteDynArray;
var
  mes: TMemoryStream;
begin
  if not Assigned(IvGraphic) then
    Exit;

  mes := TMemoryStream.Create;
  try
    IvGraphic.SaveToStream(mes);
    mes.Position := 0;
    SetLength(Result, mes.Size);
    mes.ReadBuffer(Result[0], mes.Size);
  finally
    mes.Free;
  end;
end;
  {$ENDREGION}

  {$REGION 'TBmpRec'}
class function  TBmpRec.BmpIsValid(IvBmp: TBitmap; var IvFbk: string): boolean;
begin
  Result := Assigned(IvBmp);
  if not Result then begin
    IvFbk := 'Bitmap is not assigned';
    Exit;
  end;

  Result := not IvBmp.Empty;
  if not Result then begin
    IvFbk := 'Bitmap is empty';
    Exit;
  end;

  Result := (IvBmp.Width * IvBmp.Height) > 0;
  if not Result then begin
    IvFbk := 'Bitmap has either width or height equal to zero';
    Exit;
  end;

  IvFbk := Format('Bitmap %dx%d is valid', [IvBmp.Width, IvBmp.Height])
end;

class function  TBmpRec.BmpFromByteArray(const IvByteArray: TByteDynArray): TBitmap;
var
  m: TMemoryStream;
  p: pointer;
begin
  // create
  Result := TBitmap.Create;

  // exit
  if Length(IvByteArray) = 0 then
    Exit;

  // load
  m := TMemoryStream.Create;
  try
    p := @IvByteArray[0];
    m.Write(p^, Length(IvByteArray));
    m.Position := 0;
    Result.LoadFromStream(m);
  finally
    m.Free;
  end;
end;

class function  TBmpRec.BmpFromPng(const IvPng: TPngImage): TBitmap;
begin
  try
    Result := TBitmap.Create;
    try
      Result.Assign(IvPng);
    //Result.SaveToFile('image.bmp');
    finally
    //Result.Free; *** consumer will free ***
    end;
  finally
    IvPng.Free;
  end;
end;

class function TBmpRec.BmpFromRes(IvResourceName: string; IvBmp: TBitmap; IvFbk: string): boolean;
begin
  // exit
  Result := Assigned(IvBmp);
  if not Result then begin
    IvFbk := 'Unable to load bitmap, bitmap is not assigned';
    Exit;
  end;
  Result := not IvResourceName.IsEmpty;
  if not Result then begin
    IvFbk := 'Unable to load bitmap, resource name is empty';
    Exit;
  end;

  // load
  IvBmp.LoadFromResourceName(hInstance, IvResourceName);
  Result := TBmpRec.BmpIsValid(IvBmp, IvFbk);
  if not Result then
    IvFbk := 'Unable to load bitmap from resource'
  else
    IvFbk := 'Bitmap loaded from resource';
end;

class procedure TBmpRec.BmpBmpDraw(IvBmp: TBitmap; IvPoint: TPoint; IvBmp2: TBitmap; IvCentered, IvTransparent: boolean);
begin
  // bmp2
  if IvTransparent then begin // bottom left pixel is used to ser transparent color
    IvBmp2.Transparent     := true;
    IvBmp2.TransparentMode := tmAuto;
  end;

  // bmp
//IvBmp.Canvas.Pen.Style := psSolid;
//IvBmp.Canvas.Pen.Mode := pmCopy;
//IvBmp.Canvas.Pen.Width := IvLineSize;
//IvBmp.Canvas.Pen.Color := IvLineColor;
//IvBmp.Canvas.Brush.Color := IvFillColor;
//IvBmp.Canvas.Brush.Style := IvBrushStyle;
  IvBmp.Canvas.Draw(IvPoint.X, IvPoint.Y, IvBmp2);
end;

class procedure TBmpRec.BmpPicDraw(IvBmp: TBitmap; IvRect: TRect; IvPic: TPicture; IvCentered, IvTransparent: boolean);
var
  p: TPoint;
  b: TBitmap;
begin
  p := IvRect.LTOfCentered(IvPic.Width, IvPic.Height);
  b := TBitmap.Create;
  b.Assign(IvPic.Graphic);
  BmpBmpDraw(IvBmp, p, b, IvCentered, IvTransparent);
  b.Free;
end;

class procedure TBmpRec.BmpBoxDraw(IvBmp: TBitmap; IvRect: TRect; IvLineSize: integer; IvLineColor, IvFillColor: TColor; IvFillet: integer = 0; IvBrushStyle: TBrushStyle = bsSolid; IvPenMode: TPenMode = pmCopy; IvShape: char = 'R');
begin
  with IvBmp.Canvas do begin
    // init
    Pen.Style   := psSolid;
    Pen.Mode    := IvPenMode;    // pmCopy = ???, pmMask = semitransparent
    Pen.Width   := IvLineSize;
    Pen.Color   := IvLineColor;
    Brush.Color := IvFillColor;
    Brush.Style := IvBrushStyle; // bsSolid, bsClear;

    // rectangle
    if IvShape = 'R' then begin
      if IvLineSize = 0 then begin
        if IvFillet = 0 then
          FillRect(IvRect)
        else
          FillRect(IvRect); // temp
      end else begin
        if IvFillet = 0 then
          Rectangle(IvRect)
        else
          RoundRect(IvRect, IvFillet, IvFillet);
      end;

    // circle
    end else if IvShape = 'C' then begin
      Ellipse(IvRect);

    // ellipse
    end else if IvShape = 'E' then begin
      Ellipse(IvRect);

    end;
  end;
end;

class procedure TBmpRec.BmpTxtDraw(IvBmp: TBitmap; IvPoint: TPoint; IvStr: string; IvBrushStyle: TBrushStyle; IvTextColor: TColor);
begin
  // font
//IvBmp.Canvas.Font.Name := 'Segoe UI';
  IvBmp.Canvas.Font.Color := IvTextColor;
//IvBmp.Canvas.Font.Style := [fsBold]; // []
//IvBmp.Canvas.Font.Height := 16;

  // pen
  IvBmp.Canvas.Pen.Style := psSolid;
  IvBmp.Canvas.Pen.Mode := pmCopy;
//IvBmp.Canvas.Pen.Width := IvLineSize;
//IvBmp.Canvas.Pen.Color := IvLineColor;

  // brush
//IvBmp.Canvas.Brush.Color := IvFillColor;
  IvBmp.Canvas.Brush.Style := IvBrushStyle; // bsSolid, bsClear;

  // write
  IvBmp.Canvas.TextOut(IvPoint.X, IvPoint.Y, IvStr);
end;

class procedure TBmpRec.BmpTxtDraw(IvBmp: TBitmap; IvText, IvTextFont: string; IvTextSize: integer; IvTextColor: TColor; IvTextStyleSet: TFontStyles; IvLabelBrushColor: TColor; IvLabelBrushStyle: TBrushStyle; IvLabelPenColor: TColor; IvLabelPenStyle: TPenStyle; IvLabelPenWidth, IvLabelGap: integer; IvOutlinePenColor: TColor; IvOutlinePenStyle: TPenStyle; IvOutlinePenWidth: integer; IvDrawOutline: boolean);
var
  g, k, l: integer;
  w, h{, m, n}: integer;
  d: TPoint;
  r: TRect;
  s: TSize;
begin
  // set font
  TCnvRec.CnvFontSet(IvBmp.Canvas, IvTextFont, IvTextSize, IvTextColor, IvTextStyleSet);

  // text geometry
  S := IvBmp.Canvas.TextExtent(IvText);
  G := IvLabelGap + IvLabelPenWidth;
  K := Round(IvTextSize / 3);
  L := Round(S.cy - 4/3*IvTextSize);
  if IvLabelPenWidth > 0 then Dec(L);

  // geometry
  W := IvLabelPenWidth + IvLabelGap + S.cx + IvLabelGap + IvLabelPenWidth - 0;
  H := IvLabelPenWidth + IvLabelGap + S.cy + IvLabelGap + IvLabelPenWidth - K - L;
//M := W div 2;
//N := H div 2;
  R := Rect(0, 0, W, H);

  // bmp
  with IvBmp do begin
    Width := W - (1 - IvLabelPenWidth mod 2);
    Height := H - (1 - IvLabelPenWidth mod 2);
    // clear
    TCnvRec.CnvBrushPenSet(Canvas, clFuchsia, bsSolid, clNone, psClear, 0);
    Canvas.FillRect(R);
    Transparent := true;
    TransparentMode := tmFixed;
    TransparentColor := clFuchsia;
  end;

  // draw
  with IvBmp.Canvas do begin
    // label interior & outline
    R := Rect(0, 0, W + (1 - IvLabelPenWidth mod 2), H + (1 - IvLabelPenWidth mod 2));
    InflateRect(R, -IvLabelPenWidth div 2, -IvLabelPenWidth div 2);
    TCnvRec.CnvBrushPenSet(IvBmp.Canvas, IvLabelBrushColor, IvLabelBrushStyle, IvLabelPenColor, IvLabelPenStyle, IvLabelPenWidth);
    if IvLabelPenWidth > 0 then Rectangle(R) else FillRect(R);

    // text interior letters
    D := Point(G, G-K);
    TCnvRec.CnvBrushPenSet(IvBmp.Canvas, clNone, bsClear, clNone, psClear, 0);
    TextOut(d.X, d.Y, IvText);

    // text outlines letters
    if IvDrawOutline then begin
      // create a clipping region (remove the frame drawn around the text by StrokePath in the sext section)
      if false then begin
        R := Rect(D.X, D.Y, S.cx, S.cy);
        InflateRect(R, -1, -1);
        IntersectClipRect(Handle, R.Left, R.Top, R.Right, R.Bottom);
      end;
      // draws outline around letters and the entire text (this last fall otside the clipping region if active)
      BeginPath(Handle);
      TCnvRec.CnvBrushPenSet(IvBmp.Canvas, clNone, bsClear, IvOutlinePenColor, IvOutlinePenStyle, IvOutlinePenWidth);
      TextOut(D.X, D.Y, IvText);
      EndPath(Handle);
      StrokePath(Handle);
    end;
  end;
end;

class procedure TBmpRec.BmpResourceDraw(IvBmp: TBitmap; IvPoint: TPoint; IvResource: string; IvCentered: boolean);
var
  k: string;
  b: TBitmap;
begin
  b := TBitmap.Create;
  b.Transparent := true;
  b.TransparentColor := clFuchsia;
  BmpFromRes(IvResource, b, k);
  BmpBmpDraw(IvBmp, IvPoint, b);
  b.Free;
end;

class procedure TBmpRec.BmpResourceDrawCentered(IvBmp: TBitmap; IvRect: TRect; IvResource: string);
var
  k: string;
  p: TPoint;
  b: TBitmap;
begin
  if FindResource(hInstance, PChar(UpperCase(IvResource) + '_ICON'), RT_BITMAP) = 0 then
    Exit;

  b := TBitmap.Create;
  b.Transparent := true;           // leftbottom pixel color is used to ser transparent color
  b.TransparentMode := tmAuto;
//b.TransparentColor := clFuchsia; // Canvas.Pixels[24,24] // set particular color or any pixel color
//b.TransparentMode := tmFixed;
  BmpFromRes(IvResource, b, k);
  p := IvRect.LTOfCentered(b.Width, b.Height);
  BmpBmpDraw(IvBmp, p, b);
  b.Free;
end;

class procedure TBmpRec.BmpExceptionDraw(IvBmp: TBitmap; IvE: Exception);
var
  s: TSize;
begin
  if not Assigned(IvBmp) then
    IvBmp.Create;
  s := IvBmp.Canvas.TextExtent(IvE.Message);
  IvBmp.SetSize(s.cx, s.cy);
  IvBmp.Canvas.TextOut(0, 0, IvE.Message);
end;

class procedure TBmpRec.BmpAlphaPremultiply(IvBmp: TBitmap);
var
  r, c: integer; // row, col
  p: PRGBQuad;
  a: array[byte, byte] of byte; // precalculated values of a*b div 255
begin
  // precalculate all possible values of a*b div 255
  for r := 0 to 255 do
    for c := r to 255 do begin
      a[r, c] := r * c div 255;
      if r <> c then
        a[c, r] := a[r, c]; // a*b = b*a
    end;
  // scann
  for r := 0 to IvBmp.Height-1 do begin
    c := IvBmp.Width;
    p := IvBmp.ScanLine[r];
    while (c > 0) do begin
      p.rgbBlue  := a[p.rgbReserved, p.rgbBlue ];
      p.rgbGreen := a[p.rgbReserved, p.rgbGreen];
      p.rgbRed   := a[p.rgbReserved, p.rgbRed  ];
      inc(p);
      dec(c);
    end;
  end;
end;

{$REGION 'Zzz'}
(*
procedure BmpTextDraw(IvCanvas: TCanvas; IvIj: TIj; IvText: TBoxCls);
var
  B: TBmpCls;
  I, J: integer;
begin
  if IvText.TextString <> '' then begin
    // gdibmp
    B := TBmpCls.Create(0, 0);
    try
      // build textbmp
      BmpTextDraw(B, IvText);
      // displace
      I := Round(IvIj.I + (B.Width div 2) * IvText.TextOffsetH) - B.Width div 2;
      J := Round(IvIj.J + (B.Height div 2) * IvText.TextOffsetV) - B.Height div 2;
      // smash
      IvCanvas.Draw(I, J, B);
    finally
      B.Free;
    end;
  end;
end;

procedure BmpTextDraw(IvCanvas: TCanvas
; IvIj: TIj
; IvDisplaceRec: TDisplaceRec
; IvText: string
; IvTextFont: string; IvTextSize: integer; IvTextColor: TColor; IvTextStyleSet: TFontStyles
; IvLabelBrushColor: TColor; IvLabelBrushStyle: TBrushStyle
; IvLabelPenColor: TColor; IvLabelPenStyle: TPenStyle; IvLabelPenWidth: integer; IvLabelGap: integer
; IvOutlinePenColor: TColor; IvOutlinePenStyle: TPenStyle; IvOutlinePenWidth: integer; IvDrawOutline: boolean
);
var
  B: TBitmap;
  I, J: integer;
begin
  // bmp
  B := TBitmap.Create;
  try
    BmpText(B
      , IvText
      , IvTextFont, IvTextSize, IvTextColor, IvTextStyleSet
      , IvLabelBrushColor, IvLabelBrushStyle
      , IvLabelPenColor, IvLabelPenStyle, IvLabelPenWidth, IvLabelGap
      , IvOutlinePenColor, IvOutlinePenStyle, IvOutlinePenWidth, IvDrawOutline
    );
    // rotate
    // ...
    // displace
    I := Round(IvIj.I - IvDisplaceRec.X * B.Width);
    J := Round(IvIj.J - IvDisplaceRec.Y * B.Height);
    // smash
    IvCanvas.Draw(I, J, B);
  finally
    B.Free;
  end;
end;
*)
{$ENDREGION}

  {$ENDREGION}

  {$REGION 'TBolRec'}
class function TBolRec.BolFromInt(IvInteger: integer): boolean;
begin
  Result := IvInteger <> 0;
end;

class function TBolRec.BolToInt(IvBool: boolean): integer;
begin
  if IvBool then
    Result := 1
  else
    Result := 0;
end;

class function TBolRec.BolFromStr(IvStr: string; IvDefault: boolean): boolean;
var
  s: string;
begin
//Result := StrToBoolDef(IvStr, IvDefault);

  s := UpperCase(IvStr);
       if (s ='-1') or (s = '1') or (s = 'TRUE' ) or (s = 'ON' ) or (s = 'YES') or (s = 'OK') or (s = 'OPEN')  or (s = 'ENABLED' ) or (s = 'SUCCESSFUL'  ) then Result := true
  else if (s = '0')              or (s = 'FALSE') or (s = 'OFF') or (s = 'NO' ) or (s = 'NO') or (s = 'CLOSE') or (s = 'DISABLED') or (s = 'UNSUCCESSFUL') then Result := false
  else                                                                                                                                                          Result := IvDefault;
end;

class function TBolRec.BolToStr(IvBool, IvLowerCase: boolean): string;
begin
//Result := BoolToStr(IvBoolean, true);

  if IvBool then
    Result := 'True'
  else
    Result := 'False';

  if IvLowerCase then
    Result := LowerCase(Result);
end;

class function TBolRec.BolVecToBinaryStr(IvBoolVec: TArray<boolean>): string;
var
  i: integer;
begin
  Result := '';
  for i := Low(IvBoolVec) to High(IvBoolVec) do
    if IvBoolVec[i] then
      Result := Result + '1'
    else
      Result := Result + '0';
end;

class function TBolRec.BolVecFromBinaryStr(IvBinaryStr: string): TArray<boolean>;
begin
  Result := [];
  raise Exception.Create(TStdRec.StdNotImplemented('BolVecFromBinaryStr'));
end;
  {$ENDREGION}

  {$REGION 'TBynRec'}
class function  TBynRec.ExeSpec: string;
begin
  Result := Paramstr(0);
end;

class function  TBynRec.DllSpec: string;
var
  p: pchar;
begin
  GetMem(p, 200);
  Winapi.Windows.GetModuleFileName(HInstance, p, 200);
  Result := string(p);
  FreeMem(p);
end;

class function  TBynRec.Kind(const IvBynarySpec: string): TBynKind;
var
  fna: string;              // filename
  HFile, HFileMap: THandle; // filehandle, filemaphandle
  PMapView: pointer;        // filemapviewpointer
  PIDH: PImageDosHeader;    // dos
  PINTH: PImageNtHeaders;   // nt
begin
  // default
  Result := pekUnknown;

  // filename
  fna := IvBynarySpec;
//if fna.IsEmpty then
  //fna := ExeSpec | DllSpec; ???

  // filehandle
  HFile := CreateFileW(PWideChar(fna), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if HFile = INVALID_HANDLE_VALUE then
    Exit;

  // filemaphandle
  HFileMap := CreateFileMapping(HFile, nil, PAGE_READONLY, 0, 0, nil);
  CloseHandle(HFile);
  if HFileMap = 0 then
    Exit;

  // filemapviewpointer
  PMapView := MapViewOfFile(HFileMap, FILE_MAP_READ, 0, 0, 0);
  CloseHandle(HFileMap);
  if PMapView = nil then
    Exit;

  // imagedosheader
  PIDH := PImageDosHeader(PMapView);
  if PIDH^.e_magic = IMAGE_DOS_SIGNATURE then begin
    // imagentheader
    PINTH := PImageNtHeaders(PAnsiChar(PMapView) + PIDH^._lfanew); // "logical file address" address of new exe header
    if PINTH^.Signature <> IMAGE_NT_SIGNATURE then
      Result := pekUnknown
    else
      case PINTH^.FileHeader.Characteristics of
        IMAGE_FILE_DLL:
          Result := pekDll;
        else
          Result := pekExe;
      end;
  end;
  UnmapViewOfFile(PMapView);
end;

class function  TBynRec.KindAsText(const IvBynarySpec: string): string;
const
  VALUES: array [0..2] of string = ('Unknown', 'IsExe', 'IsDll');
begin
  Result := VALUES[Ord(Kind(IvBynarySpec))];
end;

class function  TBynRec.Bitness(const IvBynarySpec: string): TBynBitness;
const
  IMAGE_NT_OPTIONAL_HDR32_MAGIC = $10b;
  IMAGE_NT_OPTIONAL_HDR64_MAGIC = $20b;
var
  fna: string;              // filename
  HFile, HFileMap: THandle; // filehandle, filemaphandle
  PMapView: pointer;        // filemapviewpointer
  PIDH: PImageDosHeader;    // dos
  PINTH: PImageNtHeaders;   // nt
begin
  // default
  Result := pebUnknown;

  // filename
  fna := IvBynarySpec;
  if fna.IsEmpty then
    fna := BinarySpec;

  // filehandle
  HFile := CreateFileW(PWideChar(fna), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if HFile = INVALID_HANDLE_VALUE then
    Exit;

  // filemaphandle
  HFileMap := CreateFileMapping(HFile, nil, PAGE_READONLY, 0, 0, nil);
  CloseHandle(HFile);
  if HFileMap = 0 then
    Exit;

  // filemapviewpointer
  PMapView := MapViewOfFile(HFileMap, FILE_MAP_READ, 0, 0, 0);
  CloseHandle(HFileMap);
  if PMapView = nil then
    Exit;

  // imagedosheader
  PIDH := PImageDosHeader(PMapView);
  if PIDH^.e_magic = IMAGE_DOS_SIGNATURE then begin
    // imagentheader
    PINTH := PImageNtHeaders(PAnsiChar(PMapView) + PIDH^._lfanew); // "logical file address" address of new exe header
    if PINTH^.Signature <> IMAGE_NT_SIGNATURE then
      Result := peb16
    else
      case PINTH^.OptionalHeader.Magic of
        IMAGE_NT_OPTIONAL_HDR32_MAGIC:
          Result := peb32;
        IMAGE_NT_OPTIONAL_HDR64_MAGIC:
          Result := peb64;
        else
          Result := pebUnknown;
      end;
  end;
  UnmapViewOfFile(PMapView);
end;

class function  TBynRec.BitnessAsText(const IvBynarySpec: string): string;
const
  VALUES: array [0..3] of string = ('??bit', '16bit', '32bit', '64bit');
begin
  Result := VALUES[Ord(Bitness(IvBynarySpec))];
end;

class function  TBynRec.BinarySpec: string;
const
  A = '\\?\';
var
//c: array[0..MAX_PATH] of widechar;
  c: string;
  m: cardinal;
begin
  // cache
  if not BinarySpecChache.IsEmpty then begin
    Result := BinarySpecChache;
    Exit;
  end;

  // i  - no! only gui exe apps
//Result := Application.ExeName;

  // ii - no!, only gui and console exe apps
//Result := ParamStr(0);

  // iii - wrong, for an isapi dll returns somthing like: "WksAppPool.config" -w "" -m 0 -t 20"
//Result := CmdLine; //

  // iiii - ok, gui, console exe or dll apps
//FillChar(c, SizeOf(c), #0);
//Winapi.Windows.GetModuleFileName(hInstance, c, MAX_PATH + 1);
//SetLength(Result, Length(PChar(c)));
//Result := c;

  // iiiii - ok, gui, console exe or dll apps
  SetLength(c, MAX_PATH + 1); // prepare buffer, add 1 for the terminating null #0 char
  m := Winapi.Windows.GetModuleFileName(hInstance, PChar(c), MAX_PATH + 1);
  SetLength(c, m);

  // fix
  if Pos(A, c) = 1 then
    Delete(c, 1, 4);

  // end
  Result := c;

  // cache
  BinarySpecChache := Result;

  // zzz
//if Kind = pekDll then
//  Result := DllSpec
//else
//  Result := ExeSpec;
end;

class function  TBynRec.BinaryDir: string;
begin
  Result := BinarySpec;
  Result := ExtractFileDir(Result);
end;

class function  TBynRec.BinaryNameExt: string;
begin
  Result := ExtractFileName(BinarySpec);
end;

class function  TBynRec.BinaryName: string;
begin
  Result := TPath.GetFileNameWithoutExtension(BinarySpec);
end;

class function  TBynRec.BinaryTag: string;
begin
  Result := TStrRec.StrLeftOf('Project', BinaryName);
end;

class function  TBynRec.IsClient: boolean;
begin
  Result := SameText(Role, 'Client');
end;

class function  TBynRec.IsDemon: boolean;
begin
  Result := TStrRec.StrHas('Service,Demon', Role);
end;

class function  TBynRec.IsEditor: boolean;
begin
  Result := SameText(Role, 'Editor');
end;

class function  TBynRec.IsServer: boolean;
begin
  Result := TStrRec.StrHas('Isapi,Soap,Rest,Datasnap,Server', Role);
end;

class function  TBynRec.Role: string;
var
  n: string;
begin
  n := BinaryName;
       if n.Contains('ClientProject'  ) then Result := 'Client'      // Client app
  else if n.Contains('IsapiProject'   ) then Result := 'Isapi'       // IsapiServer (isapiapp)
  else if n.Contains('SoapProject'    ) then Result := 'Soap'        // SoapServer (webapplicationserver)
  else if n.Contains('RestProject'    ) then Result := 'Rest'        // RestServer (datasnapserver)
//else if n.Contains('ServerProject'  ) then Result := 'Server'      // Server (tcpip generic server)
  else if n.Contains('DemonProject'   ) then Result := 'Demon'       // windowsservice
  else if n.Contains('ServiceProject' ) then Result := 'Demon'       // windowsservice
//else if n.Contains('AppProject'     ) then Result := 'Application' // standalone app
  else if n.Contains('EditorProject'  ) then Result := 'Editor'      // standalone Editor (on the fly specialized editors, like python editor)
  else if n.Contains('UtilProject'    ) then Result := 'Utility'     // standalone utility app
  else if n.Contains('UtilsProject'   ) then Result := 'Utility'     // standalone utility app
//else if n.Contains('DemoProject'    ) then Result := 'Demo'        // standalone demo app
  else if n.Contains('TestProject'    ) then Result := 'Test'        // standalone test app (dtest, ctrls, comps)
  else begin                                Result := 'Unknown';                                                                                                //, Rest, Datasnap, Server, Service
    raise Exception.CreateFmt('Unable to determine application [%s] Role, binary file name must be like WksXxxRoleProject.exe/dll where Role = Client, Isapi, Soap, Demon, Editor, Util, Demo, Test', [n]);
  end;
end;

class function  TBynRec.Obj: string;
var
  bna, rol: string;
begin
  bna := BinaryName;
  rol := Role;
  Result := TStrRec.StrBetween(TWksRec.ACRONYM, rol, bna, false);
end;

class function  TBynRec.Version(Instance: THandle; out iMajor, iMinor, iRelease, iBuild: integer): boolean;
var
  fin: PVSFIXEDFILEINFO; // fileinformation
  vln: Cardinal;         // verlen
  rst: TResourceStream;
  mst: TMemoryStream;
  res: HRSRC; // resource
begin
  // you said zero, but you mean "us"
  if Instance = 0 then
    Instance := HInstance;

  // default
  iMajor   := 0;
  iMinor   := 0;
  iRelease := 0;
  iBuild   := 0;

  // workaround bug in Delphi if resource doesn't exist
  res := FindResource(Instance, PChar(1), RT_VERSION);
  Result := res <> 0;
  if not Result then
   Exit;

  mst := TMemoryStream.Create;
  try
    rst := TResourceStream.CreateFromID(Instance, 1, RT_VERSION);
    try
      mst.CopyFrom(rst, rst.Size);
    finally
      rst.Free;
    end;

    mst.Position:=0;
    Result := VerQueryValue(mst.Memory, '\', (*var*)Pointer(fin), (*var*)vln);
    if Result then begin
      iMajor   := fin.dwFileVersionMS shr 16;
      iMinor   := fin.dwFileVersionMS and $FFFF;
      iRelease := fin.dwFileVersionLS shr 16;
      iBuild   := fin.dwFileVersionLS and $FFFF;
    end;
  finally
    mst.Free;
  end;
end;

class function  TBynRec.Name: string;
begin
  Result := Format('%s %s', [Obj.ToUpper, Role]);
end;

class function  TBynRec.Ver: string;
var
  maj, min, rel, bui: integer;
begin
  Version(0, maj, min, rel, bui);
  Result := Format('%d.%d.%d.%d', [maj, min, rel, bui]);
end;

class function  TBynRec.VerBit: string;
begin
  Result := Format('%s - %s', [Ver, BitnessAsText]);
end;

class function  TBynRec.Info: string;
begin
  Result := Format('%s %s %s - %s', [Obj.ToUpper, Role, Ver, BitnessAsText]);
end;

class function  TBynRec.ClientExists(IvClient: string; var IvFbk: string): boolean;
var
  cli, sql: string;
begin
  sql :=         'select FldClient'
  + sLineBreak + 'from   DbaClient.dbo.TblClient'
  + sLineBreak + 'where  FldClient = ' + TSqlRec.Val(IvClient);
  cli := TDbaRec.Scalar(sql, '');
  Result := not cli.IsEmpty;
  IvFbk := TFbkRec.ExistsStr('Client', IvClient, Result);
end;

class function  TBynRec.ClientExistsRio(var IvFbk: string): boolean;
begin
  Result := (grio.HttpRio as ISystemSoapMainService).SystemClientExistsSoap(BinaryTag, IvFbk);
end;

class function  TBynRec.ClientVersionIsOk(IvClient, IvVer: string; var IvFbk: string): boolean;
var
  vel, sql: string; // versionlast
begin
  sql :=         'select max(b.FldVersion) as FldVersionMax'
  + sLineBreak + 'from   DbaClient.dbo.TblClient a inner join'
  + sLineBreak + '       DbaClient.dbo.TblChange b on (b.FldClient = a.FldClient)'
  + sLineBreak + 'where  a.FldClient = ' + TSqlRec.Val(IvClient);
  vel := TDbaRec.Scalar(sql, '');
  Result := vel = IvVer;
  IvFbk := ifthen(Result, 'Client is Ok', Format('%s version %s is behind the latest one %s', [IvClient, IvVer, vel]));
end;

class function  TBynRec.ClientVersionIsOkRio(var IvFbk: string): boolean;
begin
  Result := (grio.HttpRio as ISystemSoapMainService).SystemClientVersionIsOkSoap(BinaryTag, Ver, IvFbk);
end;
  {$ENDREGION}

  {$REGION 'TChaRec'}
class function  TChaRec.CharIsAZ(const IvChar: char): boolean;
begin
  Result := CharInSet(IvChar, ['A'..'Z']) ;
end;

class function  TChaRec.CharSpecialRnd: char;
begin
  Result := CHARS_SPECIAL[Random(Length(CHARS_SPECIAL)-1)];
end;
  {$ENDREGION}

  {$REGION 'TChartRec'}
procedure TChartRec.Init(IvDs: TDataSet; IvChart, IvWidth, IvHeight, IvTitle, IvXCaption, IvYCaption, IvXLabelAngleDeg, IvYLabelAngleDeg: string; IvSerieRecVector: TChartSerieRecVector);
var
  i, j: integer;
begin
  // chart
  if IvChart  = '' then Chart  := TNamRec.CoNameRnd('Chart') else Chart := IvChart;
  if IvWidth  = '' then Width  := '800px'   else Width  := IvWidth;
  if IvHeight = '' then Height := '400px'   else Height := IvHeight;
  if IvTitle  = '' then Title  := 'Title'   else Title  := IvTitle;

  // axis
  if IvXCaption    <> '' then XAxisRec.TitleRec.Caption := IvXCaption;
  if IvYCaption    <> '' then YAxisRec.TitleRec.Caption := IvYCaption;
  XAxisRec.LabelRec.AngleDeg := IvXLabelAngleDeg;
  YAxisRec.LabelRec.AngleDeg := IvYLabelAngleDeg;

  // series
  SetLength(SerieRecVector, Length(IvSerieRecVector));
  for i := Low(IvSerieRecVector) to High(IvSerieRecVector) do begin

    // serie
    SerieRecVector[i].Serie         := Format('%s%s', [Chart, IvSerieRecVector[i].Serie]);
    SerieRecVector[i].Title         := Format('%s'  , [IvSerieRecVector[i].Title]);
    SerieRecVector[i].Kind          := IvSerieRecVector[i].Kind;
    SerieRecVector[i].Legend        := IvSerieRecVector[i].Legend; // Format('S%d', [i]);
    SerieRecVector[i].LegendOn      := IvSerieRecVector[i].LegendOn;
    SerieRecVector[i].ToolTip       := IvSerieRecVector[i].ToolTip;
    SerieRecVector[i].ToolTipShared := IvSerieRecVector[i].ToolTipShared;

    // dataset-points
    SetLength(SerieRecVector[i].PointRecVector, IvDs.RecordCount);
    IvDs.First;
    for j := 0 to IvDs.RecordCount - 1 do begin

      if IvSerieRecVector[i].XLabelField = '' then
        SerieRecVector[i].PointRecVector[j].XLabel  := ''
      else
        SerieRecVector[i].PointRecVector[j].XLabel  := IvDs.FieldByName(IvSerieRecVector[i].XLabelField).AsString;

      if IvSerieRecVector[i].XField = '' then
        SerieRecVector[i].PointRecVector[j].X       := Null
      else
        SerieRecVector[i].PointRecVector[j].X       := IvDs.FieldByName(IvSerieRecVector[i].XField).AsVariant;

      if IvSerieRecVector[i].YField = '' then
        SerieRecVector[i].PointRecVector[j].Y       := Null
      else
        SerieRecVector[i].PointRecVector[j].Y       := IvDs.FieldByName(IvSerieRecVector[i].YField).AsVariant;

      if IvSerieRecVector[i].ZField = '' then
        SerieRecVector[i].PointRecVector[j].Z       := Null
      else
        SerieRecVector[i].PointRecVector[j].Z       := IvDs.FieldByName(IvSerieRecVector[i].ZField).AsVariant;

      if IvSerieRecVector[i].ColorField = '' then
        SerieRecVector[i].PointRecVector[j].Color   := Null
      else
        SerieRecVector[i].PointRecVector[j].Color   := IvDs.FieldByName(IvSerieRecVector[i].ColorField).AsVariant;

      if IvSerieRecVector[i].ShapeField = '' then
        SerieRecVector[i].PointRecVector[j].Shape   := ''
      else
        SerieRecVector[i].PointRecVector[j].Shape   := IvDs.FieldByName(IvSerieRecVector[i].ShapeField).AsString;

      if IvSerieRecVector[i].SizeField = '' then
        SerieRecVector[i].PointRecVector[j].Size    := ''
      else
        SerieRecVector[i].PointRecVector[j].Size    := IvDs.FieldByName(IvSerieRecVector[i].SizeField).AsString;

      if IvSerieRecVector[i].ToolTipField = '' then
        SerieRecVector[i].PointRecVector[j].ToolTip := ''
      else
        SerieRecVector[i].PointRecVector[j].ToolTip := IvDs.FieldByName(IvSerieRecVector[i].ToolTipField).AsString;

      // next
      IvDs.Next;
    end;

  end;
end;

function  TChartRec.ToCanvasJs: string;
var
  i, j: integer; // serie, point
  n, w, h, s, p{, c, l, x, y, z}: string; // chart name, width, heigt, seriesstr, pointstr, color, legend, x, y, z
begin
  // zip
  n := Chart;
  w := Width;
  h := Height;

  // dataseries
  s := '';
  for i := Low(SerieRecVector) to High(SerieRecVector) do begin

    // points level (indexLabel: "C1CC", color: "blue", color: "rgba(105,15,105,.6)")
    p := '';
    for j := Low(SerieRecVector[i].PointRecVector) to High(SerieRecVector[i].PointRecVector) do
      // zip
      p := p + sLineBreak
      + '        ' + ifthen(j = 0, ' ', ',') + ' {'
      +                                                                    'label: "'         + SerieRecVector[i].PointRecVector[j].XLabel + '"'       // if present override the x
      + ifthen(VarIsNull(SerieRecVector[i].PointRecVector[j].X)      , '', ', x: "'           + VarToStr(SerieRecVector[i].PointRecVector[j].X) + '"')
      + ifthen(VarIsNull(SerieRecVector[i].PointRecVector[j].Y)      , '', ', y: '            + VarToStr(SerieRecVector[i].PointRecVector[j].Y))
      + ifthen(VarIsNull(SerieRecVector[i].PointRecVector[j].Z)      , '', ', z: '            + VarToStr(SerieRecVector[i].PointRecVector[j].Z))
      + ifthen(VarIsNull(SerieRecVector[i].PointRecVector[j].Color)  , '', ', markerColor: "' + SerieRecVector[i].PointRecVector[j].Color   + '"')
      + ifthen(VarIsNull(SerieRecVector[i].PointRecVector[j].Shape)  , '', ', markerType: "'  + SerieRecVector[i].PointRecVector[j].Shape   + '"')     // circle, triangle, square, cross, line, none
      + ifthen(VarIsNull(SerieRecVector[i].PointRecVector[j].Size)   , '', ', markerSize: "'  + SerieRecVector[i].PointRecVector[j].Size    + '"')
      + ifthen(VarIsNull(SerieRecVector[i].PointRecVector[j].ToolTip), '', ', toolTip: "'     + SerieRecVector[i].PointRecVector[j].ToolTip + '"')
    //+ ifthen(VarIsNull(SerieRecVector[i].PointRecVector[j].Title)  , '', ', legendText: "'  + VarToStr(SerieRecVector[i].PointRecVector[j].Title + '"'))
      + '}';
    Delete(p, 1, 2);

    // fix$
    p := StringReplace(p, 'x: $', 'x: ', [rfReplaceAll]);
    p := StringReplace(p, 'y: $', 'y: ', [rfReplaceAll]);
    p := StringReplace(p, 'z: $', 'z: ', [rfReplaceAll]);

    // series level
    s := s              + '    , { // dataseries-'    + IntToStr(i);
    s := s + sLineBreak + '        name: "'           + SerieRecVector[i].Serie + '"';
    s := s + sLineBreak + '      , type: "'           + TStrRec.StrCamelCaseFromVec([SerieRecVector[i].Kind]) + '"';
  //s := s + sLineBreak + '      , markerType: "'     + 'circle' + '"';
  //s := s + sLineBreak + '      , markerColor: "'    + ColorNameRnd + '"';
  //s := s + sLineBreak + '      , markerSize: "'     + '4' + '"';
    s := s + sLineBreak + '      , legendText: "'     + SerieRecVector[i].Legend + '"';
    s := s + sLineBreak + '      , showInLegend: '    + BoolToStr(SerieRecVector[i].LegendOn, true); // true, false;
    s := s + sLineBreak + '      , toolTipContent: "' + SerieRecVector[i].ToolTip + '"';
    s := s + sLineBreak + '      , dataPoints: [';
    s := s + sLineBreak +          p;
    s := s + sLineBreak + '        ]';
    s := s + sLineBreak + '      }';
  end;
  s[5] := ' ';

  // html chart level
  Result := ''
//+ sLineBreak + '<script src="/Include/canvasjs/1.8.0/canvasjs.min.js"></script>'
  + sLineBreak + '<div id="' + n + '" style="width:' + w + '; height:' + h + '; margin-left:auto; margin-right:auto;"></div>'
  + sLineBreak + '<script>'
  + sLineBreak + 'window.onload = function  () {'
  + sLineBreak + '  var chart = new CanvasJS.Chart("' + n + '", {'

//+ sLineBreak + '    // options'
//+ sLineBreak + '  , theme: "theme4"' // theme1, theme2, theme3, theme4
  + sLineBreak + '    exportEnabled: true'
  + sLineBreak + '  , exportFileName: "' + Chart + '"'
  + sLineBreak + '  , interactivityEnabled: true'
  + sLineBreak + '  , animationEnabled: true'
  + sLineBreak + '  , animationDuration: 1000'
  + sLineBreak + '  , zoomEnabled: true'
  + sLineBreak + '  , zoomType: "xy"'

//+ sLineBreak + '    // title'
  + sLineBreak + '  , title: {'
  + sLineBreak + '      text: "' + Title + '"'
  + sLineBreak + '    , fontFamily: "consolas"' // gthe.FontFamily
  + sLineBreak + '    , fontWeight: "normal"'   // gthe.FontWeight
  + sLineBreak + '    , fontSize: 18' // px
  + sLineBreak + '    }'

//+ sLineBreak + '    // subtitle'
//+ sLineBreak + '  , subtitle: [{'
//+ sLineBreak + '      text: "' + Description + '"'
//+ sLineBreak + '    , fontFamily: "consolas"' // gthe.FontFamily
//+ sLineBreak + '    , fontWeight: "normal"'   // gthe.FontWeight
//+ sLineBreak + '    , fontSize: 10' // px
//+ sLineBreak + '    }]'

//+ sLineBreak + '    // legend'
  + sLineBreak + '  , legend:{'
  + sLineBreak + '      fontSize: 12' // px
  + sLineBreak + '    , fontFamily: "tahoma"' // gthe.FontFamily
  + sLineBreak + '    , fontColor: "gray"'
  + sLineBreak + '    }'

//+ sLineBreak + '    // tooltip'
//+ sLineBreak + '  , toolTip: {';
//+ sLineBreak + '      content: "'      + SerieRecVector[i].ToolTip + '"';
//+ sLineBreak + '    , shared: '        + WksBoolUnit.BoolToStr(SerieRecVector[i].TooltipShared, true) + ''; // true, false
//+ sLineBreak + '    }';

//+ sLineBreak + '    // axisx'
  + sLineBreak + '  , axisX: {'
  + sLineBreak + '      titleFontSize: 16' // px
  + sLineBreak + '    , titleFontFamily: "tahoma"' // gthe.FontFamily
  + sLineBreak + '    , titleFontColor: "gray"'
  + sLineBreak + '    , labelFontSize: 12'
  + sLineBreak + '    , gridThickness: 1'
//  + sLineBreak + '    , includeZero: false'
  + sLineBreak + '    , title: "'          + XAxisRec.TitleRec.Caption  + '"'
  + sLineBreak + '    , prefix: "'         + XAxisRec.LabelRec.Prefix   + '"'
  + sLineBreak + '    , suffix: "'         + XAxisRec.LabelRec.Suffix   + '"'
  + sLineBreak + '    , labelAngle: '      + XAxisRec.LabelRec.AngleDeg + ''
  + sLineBreak + '    }'

//+ sLineBreak + '    // axisy'
  + sLineBreak + '  , axisY: {'
  + sLineBreak + '      titleFontSize: 16' // px
  + sLineBreak + '    , titleFontFamily: "tahoma"' // gthe.FontFamily
  + sLineBreak + '    , titleFontColor: "gray"'
  + sLineBreak + '    , labelFontSize: 12'
  + sLineBreak + '    , gridThickness: 1'
  + sLineBreak + '    , includeZero: false'
  + sLineBreak + '    , title: "'          + YAxisRec.TitleRec.Caption  + '"'
  + sLineBreak + '    , prefix: "'         + YAxisRec.LabelRec.Prefix   + '"'
  + sLineBreak + '    , suffix: "'         + YAxisRec.LabelRec.Suffix   + '"'
  + sLineBreak + '    , labelAngle: '      + YAxisRec.LabelRec.AngleDeg + ''
//+ sLineBreak + '    , minimum: '         + YAxisRec.LabelRec.AngleDeg + ''
//+ sLineBreak + '    , maximum: '         + YAxisRec.LabelRec.AngleDeg + ''
//+ sLineBreak + '    , interlacedColor: "#F0F8FF"'
  + sLineBreak + '    }'

//+ sLineBreak + '    // dataseries'
  + sLineBreak + '  , data: ['
  + sLineBreak +        s
  + sLineBreak + '    ]'
  + sLineBreak + '  });'

//+ sLineBreak + '  // rendering'
  + sLineBreak + '  chart.render();'
  + sLineBreak + '};'
  + sLineBreak + '</script>'
  ;
end;

function  TChartRec.ToPlotly: string;
begin
  Result := TStdRec.StdNotImplemented('TChartRec.ToPlotly');
end;
  {$ENDREGION}

  {$REGION 'TCnvRec'}
class function TCnvRec.CnvTextWidth(IvString: string; IvFont: TFont): integer;
var
  bmp: TBitmap;
begin
  bmp := TBitmap.Create;
  try
    bmp.Canvas.Font.Assign(IvFont);
    Result := bmp.Canvas.TextWidth(IvString {+ 'W'});
  finally
    bmp.Free;
  end;
end;

class procedure TCnvRec.CnvFontSet(IvCanvas: TCanvas; IvFontName: string; IvFontSize: integer; IvFontColor: TColor; IvFontStyleSet: TFontStyles);
begin
  with IvCanvas do begin
    Font.Name  := IvFontName;
    Font.Size  := IvFontSize;
    Font.Color := IvFontColor;
    Font.Style := IvFontStyleSet;
  end;
end;

class procedure TCnvRec.CnvBrushSet(IvCanvas: TCanvas; IvBrushColor: TColor; IvBrushStyle: TBrushStyle);
begin
  with IvCanvas do begin
    Brush.Color := IvBrushColor;
    Brush.Style := IvBrushStyle;
  end;
end;

class procedure TCnvRec.CnvPenSet(IvCanvas: TCanvas; IvPenColor: TColor; IvPenStyle: TPenStyle; IvPenWidth: integer);
begin
  with IvCanvas do begin
    Pen.Color := IvPenColor;
    Pen.Width := IvPenWidth;
    Pen.Style := IvPenStyle;
  end;
end;

class procedure TCnvRec.CnvBrushPenSet(IvCanvas: TCanvas; IvBrushColor: TColor; IvBrushStyle: TBrushStyle; IvPenColor: TColor; IvPenStyle: TPenStyle; IvPenWidth: integer);
begin
  CnvBrushSet(IvCanvas, IvBrushColor, IvBrushStyle);
  CnvPenSet(IvCanvas, IvPenColor, IvPenStyle, IvPenWidth);
end;

class procedure TCnvRec.CnvRectangle(IvCanvas: TCanvas; IvX, IvY, IvW, IvH: integer; IvBgBrushColor, IvPenColor: TColor; IvPenStyle: TPenStyle; IvPenWidth: integer);
begin
  IvCanvas.Brush.Color := IvBgBrushColor;
  IvCanvas.Pen.Color   := IvPenColor;
  IvCanvas.Pen.Style   := IvPenStyle;
  IvCanvas.Pen.Width   := IvPenWidth;
  IvCanvas.Rectangle(IvX, IvY, IvW, IvH);
end;
  {$ENDREGION}

  {$REGION 'TCodRec'}
class function  TCodRec.Vector: TCoiRecVec;
begin
  Result := [
    BAT   // 0
  , CSS   // 1
  , CSV   // 2
  , DWS   // 3
  , HTML  // 4
  , INI   // 5
  , JAVA  // 6
  , JS    // 7
  , JSL   // 8
  , JSON  // 9
  , MD    // 10
  , PAS   // 11
  , PY    // 12
  , R     // 13
  , SQL   // 14
  , TXT   // 15
  , XML   // 16
  , YAML  // 17
  ];
end;

class function  TCodRec.CodeKindEnumFromInt(IvCodeKindInt: integer): TCodKindEnum;
begin
  Result := TCodKindEnum(IvCodeKindInt);
end;

class function  TCodRec.CodeKindEnumFromStr(IvCodeKindStr: string): TCodKindEnum;
begin
  Result := TEnuRec.EnumFromStr<TCodKindEnum>('ck'+IvCodeKindStr, ckSql);
end;

class function  TCodRec.CommentStr(IvCodKindEnum: TCodKindEnum): string;
begin
  case IvCodKindEnum of
    ckBat : Result := Bat.Comm ; // 0
    ckCss : Result := CSS.Comm ; // 1
    ckCsv : Result := CSV.Comm ; // 2
    ckDws : Result := DWS.Comm ; // 3
    ckHtml: Result := HTML.Comm; // 4
    ckIni : Result := INI.Comm ; // 5
    ckJava: Result := JAVA.Comm; // 6
    ckJs  : Result := JS.Comm  ; // 7
    ckJsl : Result := JSL.Comm ; // 8
    ckJson: Result := JSON.Comm; // 9
    ckMd  : Result := MD.Comm  ; // 10
    ckPas : Result := PAS.Comm ; // 11
    ckPy  : Result := PY.Comm  ; // 12
    ckR   : Result := R.Comm   ; // 13
    ckSql : Result := SQL.Comm ; // 14
    ckTxt : Result := TXT.Comm ; // 15
    ckXml : Result := XML.Comm ; // 16
    ckYaml: Result := YAML.Comm; // 17
  else
            Result := SQL.Comm ;
  end;

end;

class function  TCodRec.CommentStr(IvCodKindStr: string): string;
begin
  Result := CommentStr(TCodRec.CodeKindEnumFromStr(IvCodKindStr));

{class function  TCodRec.CommentStr(IvKind: string): string;
begin
       if SameText(IvKind, BAT.Kind ) then Result := BAT.Comm  // 0
  else if SameText(IvKind, CSS.Kind ) then Result := CSS.Comm  // 1
  else if SameText(IvKind, CSV.Kind ) then Result := CSV.Comm  // 2
  else if SameText(IvKind, DWS.Kind ) then Result := DWS.Comm  // 3
  else if SameText(IvKind, HTML.Kind) then Result := HTML.Comm // 4
  else if SameText(IvKind, INI.Kind ) then Result := INI.Comm  // 5
  else if SameText(IvKind, JAVA.Kind) then Result := JAVA.Comm // 6
  else if SameText(IvKind, JS.Kind  ) then Result := JS.Comm   // 7
  else if SameText(IvKind, JSL.Kind ) then Result := JSL.Comm  // 8
  else if SameText(IvKind, JSON.Kind) then Result := JSON.Comm // 9
  else if SameText(IvKind, MD.Kind  ) then Result := MD.Comm   // 10
  else if SameText(IvKind, PAS.Kind ) then Result := PAS.Comm  // 11
  else if SameText(IvKind, PY.Kind  ) then Result := PY.Comm   // 12
  else if SameText(IvKind, R.Kind   ) then Result := R.Comm    // 13
  else if SameText(IvKind, SQL.Kind ) then Result := SQL.Comm  // 14
  else if SameText(IvKind, TXT.Kind ) then Result := TXT.Comm  // 15
  else if SameText(IvKind, XML.Kind ) then Result := XML.Comm  // 16
  else if SameText(IvKind, YAML.Kind) then Result := YAML.Comm // 17
                                      else Result := SQL.Comm
  ;
end;}
end;

class function  TCodRec.Comment1Str(IvCodKindEnum: TCodKindEnum): string;
begin
  case IvCodKindEnum of
    ckBat : Result := Bat.Comm1 ; // 0
    ckCss : Result := CSS.Comm1 ; // 1
    ckCsv : Result := CSV.Comm1 ; // 2
    ckDws : Result := DWS.Comm1 ; // 3
    ckHtml: Result := HTML.Comm1; // 4
    ckIni : Result := INI.Comm1 ; // 5
    ckJava: Result := JAVA.Comm1; // 6
    ckJs  : Result := JS.Comm1  ; // 7
    ckJsl : Result := JSL.Comm1 ; // 8
    ckJson: Result := JSON.Comm1; // 9
    ckMd  : Result := MD.Comm1  ; // 10
    ckPas : Result := PAS.Comm1 ; // 11
    ckPy  : Result := PY.Comm1  ; // 12
    ckR   : Result := R.Comm1   ; // 13
    ckSql : Result := SQL.Comm1 ; // 14
    ckTxt : Result := TXT.Comm1 ; // 15
    ckXml : Result := XML.Comm1 ; // 16
    ckYaml: Result := YAML.Comm1; // 17
  else
            Result := SQL.Comm1 ;
  end;
end;

class function  TCodRec.Comment1Str(IvCodKindStr: string): string;
begin
  Result := Comment1Str(TCodRec.CodeKindEnumFromStr(IvCodKindStr));
end;

class function  TCodRec.Comment2Str(IvCodKindEnum: TCodKindEnum): string;
begin
  case IvCodKindEnum of
    ckBat : Result := Bat.Comm2 ; // 0
    ckCss : Result := CSS.Comm2 ; // 1
    ckCsv : Result := CSV.Comm2 ; // 2
    ckDws : Result := DWS.Comm2 ; // 3
    ckHtml: Result := HTML.Comm2; // 4
    ckIni : Result := INI.Comm2 ; // 5
    ckJava: Result := JAVA.Comm2; // 6
    ckJs  : Result := JS.Comm2  ; // 7
    ckJsl : Result := JSL.Comm2 ; // 8
    ckJson: Result := JSON.Comm2; // 9
    ckMd  : Result := MD.Comm2  ; // 10
    ckPas : Result := PAS.Comm2 ; // 11
    ckPy  : Result := PY.Comm2  ; // 12
    ckR   : Result := R.Comm2   ; // 13
    ckSql : Result := SQL.Comm2 ; // 14
    ckTxt : Result := TXT.Comm2 ; // 15
    ckXml : Result := XML.Comm2 ; // 16
    ckYaml: Result := YAML.Comm2; // 17
  else
            Result := SQL.Comm2 ;
  end;
end;

class function  TCodRec.Comment2Str(IvCodKindStr: string): string;
begin
  Result := Comment2Str(TCodRec.CodeKindEnumFromStr(IvCodKindStr));
end;

procedure TCodRec.Reset(IvResetObjAlso: boolean);
begin
  // master
  if IvResetObjAlso then
    Obj.Reset;

  // detail
  ObjectId        := 0 ;
  ReturnAs        := '';
  ReturnMimeType  := '';
  OutputDirectory := '';
  OutputTo        := '';
  OutputFileName  := '';
  RunCommand      := '';

  // derived
  // ...
end;

function  TCodRec.InitDba(IvId: integer; var IvFbk: string): boolean;
var
  sql: string;
  dst: TDataset;
begin
  sql := Format('select top(1) * from DbaCode.dbo.TblCode where FldObjectId = %d', [IvId]);
  TDbaRec.DsFromSql(sql, dst);
  try
    // notdefined
    Result := not dst.IsEmpty;
    if not Result then begin
      Reset;
      IvFbk := Format('Unable to load CodRec, %d does not exist in database', [IvId]);

    // defined
    end else begin;
      // master
      Obj.InitDba('Code', dst.FieldByName('FldObjectId').AsInteger);

      // detail
      ObjectId        := dst.FieldByName('FldObjectId'       ).AsInteger;
      ReturnAs        := dst.FieldByName('FldReturnAs'       ).AsString;
      ReturnMimeType  := dst.FieldByName('FldReturnMimeType' ).AsString;
      OutputDirectory := dst.FieldByName('FldOutputDirectory').AsString;
      OutputTo        := dst.FieldByName('FldOutputTo'       ).AsString;
      OutputFileName  := dst.FieldByName('FldOutputFileName' ).AsString;
      RunCommand      := dst.FieldByName('FldRunCommand'     ).AsString;

      // derived
      // ...

      IvFbk := Format('CodRec loaded from database with %d %s data', [IvId, Obj.&Object]);
    end;
  finally
    dst.Free;
  end;
end;
{$ENDREGION}

  {$REGION 'THlsRec'}
class function THlsRec.Brighten(Color: TColor; Factor: integer): TColor;
begin
  Color := ColorToRGB(Color);
  if 0 < Factor then begin            // 0 = no changes
    if Factor > MaxFactor then
      Factor := MaxFactor;
    Result := (          (((255 - ((Color shr 16) and $FF)) * Factor) div MaxFactor)) shl 8;
    Result := (Result or (((255 - ((Color shr  8) and $FF)) * Factor) div MaxFactor)) shl 8;
    Result := (Result or (((255 - ( Color         and $FF)) * Factor) div MaxFactor));
    Result := Color + Result;
  end else
    Result := Color;
end;

class function THlsRec.Darken(Color: TColor; Factor: integer): TColor;
begin
  Color := ColorToRGB(Color);
  if 0 < Factor then begin            // 0 = no changes
    if Factor > MaxFactor then
      Factor := MaxFactor;
    Result := (          ((((Color shr 16) and $FF) * Factor) div MaxFactor)) shl 8;
    Result := (Result or ((((Color shr  8) and $FF) * Factor) div MaxFactor)) shl 8;
    Result := (Result or ((( Color         and $FF) * Factor) div MaxFactor));
    Result := Color - Result;
  end else
    Result := Color;
end;

class function THlsRec.BrightnessChange(Color: TColor; Factor: integer): TColor;
var
  DstValue: integer;
begin
  Color := ColorToRGB(Color);
  if Factor <> 0 then begin            // 0 = no changes
    if Factor > 0 then begin
      DstValue := 255;
    end else begin
      DstValue := 0;
      Factor := -Factor;
    end;
    if Factor > MaxFactor then
      Factor := MaxFactor;
    Result := (         (((DstValue - ((Color shr 16) and $FF)) * Factor) div MaxFactor)) shl 8;
    Result := (Result + (((DstValue - ((Color shr  8) and $FF)) * Factor) div MaxFactor)) shl 8;
    Result := (Result + (((DstValue - ( Color         and $FF)) * Factor) div MaxFactor));
    Result := Color + Result;
  end else
    Result := Color;
end;

class function THlsRec.SetLuminanceToRGBValue(Value, CurrentLum, NewLum: Integer): byte;
begin
  if (0 <= Value) and (Value <= 255) and (0 <= CurrentLum) and (CurrentLum <= 510) and (0 <= NewLum) and (NewLum <= 510) then begin
    case CurrentLum of
      1..255:
        begin
          if NewLum <= 255 then             // lower segment
            Result := (Value * NewLum) div CurrentLum
          else                              // lower -> upper segment
            Result := NewLum - 255 + (Value * (510 - NewLum)) div CurrentLum;
        end;
      256..509:
        begin
          Value := 255 - Value;
          CurrentLum := 510 - CurrentLum;
          if NewLum <= 255 then             // upper -> lower segment
            Result := NewLum - (Value * NewLum) div CurrentLum
          else                              // upper segment
            Result := 255 - (Value * (510 - NewLum)) div CurrentLum;
        end;
    else // black or white
      Result := NewLum div 2;
    end;
  end else // wrong value for Value, CurrentLum or NewLum
    Result := Value;
end;

class function THlsRec.SetLuminanceToRGBValues(Color: TColor; CurrentLum, NewLum: integer): TColor;
begin
  Result := SetLuminanceToRGBValue((Color shr 16) and $FF, CurrentLum, NewLum) shl 8;
  Result := (Result or SetLuminanceToRGBValue((Color shr 8) and $FF, CurrentLum, NewLum)) shl 8;
  Result := Result or SetLuminanceToRGBValue(Color and $FF, CurrentLum, NewLum);
end;

class function THlsRec.SetLuminanceToRGB(Color: TColor; NewLum: integer): TColor;
var
  R, G, B: integer;
  Max, Min: integer;
  CurrentLum: integer;
begin
  Color := ColorToRGB(Color);
  R := Color and $FF;
  Min := R;
  Max := R;
  Color := Color shr 8;
  G := Color and $FF;
  if Min > G then
    Min := G;
  if Max < G then
    Max := G;
  Color := Color shr 8;
  B := Color and $FF;
  if Min > B then
    Min := B;
  if Max < B then
    Max := B;
  CurrentLum := Min + Max;
  Result := SetLuminanceToRGBValue(B, CurrentLum, NewLum) shl 8;
  Result := (Result or SetLuminanceToRGBValue(G, CurrentLum, NewLum)) shl 8;
  Result := Result or SetLuminanceToRGBValue(R, CurrentLum, NewLum);
end;

class function THlsRec.TColLuminance(Color: TColor): integer;
var
  R, G, B: integer;
  Max, Min: integer;
begin
  Color := ColorToRGB(Color);
  R := Color and $FF;
  Min := R;
  Max := R;
  Color := Color shr 8;
  G := Color and $FF;
  if Min > G then
    Min := G;
  if Max < G then
    Max := G;
  Color := Color shr 8;
  B := Color and $FF;
  if Min > B then
    Min := B;
  if Max < B then
    Max := B;
  Result := Min + Max;
end;
  {$ENDREGION}

  {$REGION 'TColRec'}
class function  TColRec.TColToColorRef(IvColor: TColor): TColorRef;
begin
  if IvColor < 0 then
    Result := GetSysColor(IvColor and $000000FF)
  else
    Result := IvColor; // ColorToRGB()
end;

class function  TColRec.TColIsDark(IvColor: TColor): boolean;
var
  sum: integer;
  red, gre, blu: byte;
begin
  red := R(IvColor);
  gre := G(IvColor);
  blu := B(IvColor);

  // i
  //sum := red + gre + blu;
  //Result := sum < 3 * 128;

  // ii based on formula: brightness = sqrt( .241 * R^2 + .691 * G^2 + .068 * B^2 )
  sum := Round(Sqrt(red * red * 0.241 + gre * gre * 0.691 + blu * blu * 0.068));
  Result := sum < 128;
end;


class function  TColRec.TColLighten(IvColor: TColor; IvPercentage: integer): TColor;
var
//r: TColorRef;
  h, s, l: word;
begin
//r := TColToColorRef(IvColor);
//ColorRGBToHLS(r, h, l, s);
  TColToHsl(IvColor, h, l, s);
  l := (cardinal(l) * (100 + cardinal(IvPercentage))) div 100; //  unless percentage is negative
//Result := ColorHLSToRGB(h, l, s);
  Result := TColFromHsl(h, l, s);
end;

class function  TColRec.TColDarken(IvColor: TColor; IvPercentage: integer): TColor;
var
//r: TColorRef;
  h, s, l: word;
begin
//r := TColToColorRef(IvColor);
//ColorRGBToHLS(r, h, l, s);
  TColToHsl(IvColor, h, l, s);
  l := (cardinal(l) * (100 - cardinal(IvPercentage))) div 100; //  unless percentage is negative
//Result := ColorHLSToRGB(h, l, s);
  Result := TColFromHsl(h, l, s);
end;


class function  TColRec.TColAnti(IvColor: TColor): TColor;
var
  red, gre, blu: byte;
begin
  IvColor := ColorToRGB(IvColor);
  red := R(IvColor);
  gre := G(IvColor);
  blu := B(IvColor);

  // i - naive approach
  Result := TColor( Winapi.Windows.RGB(255 - red, 255 - gre, 255 - blu) );
end;

class function  TColRec.TColAntiBw(IvColor: TColor): TColor;
//var
  //i: integer;
  //r, g, b: byte;
begin
  IvColor := ColorToRGB(IvColor);
//r := GetRValue(IvColor);
//g := GetGValue(IvColor);
//b := GetBValue(IvColor);

  // i
//if (r + g + b) > 384 then
//  Result := clBlack
//else
//  Result := clWhite;

  // ii - davidheffernan
//Result := Winapi.Windows.RGB(
//  IfThen(r > $40, $00, $FF)
//, IfThen(g > $40, $00, $FF)
//, IfThen(b > $40, $00, $FF)
//);

  // iii
  if TColIsDark(IvColor) then
    Result := clWhite  // IvColor is rather "dark" ---> return white bg
  else
    Result := clBlack; // IvColor is rather "bright" --> return black bg
end;


class function  TColRec.TColToHtmlHexStr(IvColor: TColor): string;
//var
//  col: TColorRef;
begin
  // i
//  col := ColorToRGB(IvColor);
//  Result := Format('#%.2x%.2x%.2x', [GetRValue(col), GetGValue(col), GetBValue(col)]).ToLower;

  // ii
  Result := Vcl.GraphUtil.ColorToWebColorStr(IvColor);
end;

class function  TColRec.TColFromHtmlHexStr(IvHColor: string; IvDefault: TColor): TColor;
begin
  // i
//if IvHColor.IsEmpty then begin
//  Result := IvDefault;
//  Exit;
//end;
//if copy(IvHColor, 1, 1) <> '#' then
//  IvHColor := '#' + IvHColor;
//IvHColor := '$' + copy(IvHColor, 6, 2) + copy(IvHColor, 4, 2) + copy(IvHColor, 2, 2); // $bbggrr
//try
//  Result := StringToColor(IvHColor);
//except
//  Result := IvDefault;
//end;

  // ii
  Result := WebColorStrToColor(IvHColor);
end;


class function  TColRec.TColToHtmlNameStr(IvTColor: TColor; IvDefault: string): string;
begin
  Result := ColorToWebColorName(IvTColor);
end;

class function  TColRec.TColFromHtmlNameStr(IvHColor: string; IvDefault: TColor): TColor;
begin
  Result := WebColorNameToColor(IvHColor);
end;


class procedure TColRec.TColToHsl(const IvColor: TColor; out H, S, L: word; IvKind: integer);
var
  r: TColorRef;
begin
  r := TColToColorRef(IvColor);
  ColorRGBToHLS(r, H, L, S);
end;

class function  TColRec.TColFromHsl(const H, S, L: word): TColor;
var
  r: TColorRef;
begin
  r := ColorHLSToRGB(H, L, S);
  Result := r;
end;


class function  TColRec.R(IvColor: TColor): byte;
begin
  Result := GetRValue(IvColor); // IvColor and $FF;
end;

class function  TColRec.R(IvHColor: string): byte;
begin
  Result := GetRValue(TColFromHtmlHexStr(IvHColor));
end;

class function  TColRec.G(IvColor: TColor): byte;
begin
  Result := GetGValue(IvColor); // (IvColor shr 8) and $FF;
end;

class function  TColRec.G(IvHColor: string): byte;
begin
  Result := GetGValue(TColFromHtmlHexStr(IvHColor));
end;

class function  TColRec.B(IvColor: TColor): byte;
begin
  Result := GetBValue(IvColor); // (IvColor shr 16) and $FF;
end;

class function  TColRec.B(IvHColor: string): byte;
begin
  Result := GetBValue(TColFromHtmlHexStr(IvHColor));
end;

class function  TColRec.H(IvColor: TColor): double;
var
  h, s, l: word;
begin
  TColToHSL(IvColor, h, s, l);
  Result := h;
end;

class function  TColRec.S(IvColor: TColor): double;
var
  h, s, l: word;
begin
  TColToHSL(IvColor, h, s, l);
  Result := s;
end;

class function  TColRec.L(IvColor: TColor): double;
var
  h, s, l: word;
begin
  TColToHSL(IvColor, h, s, l);
  Result := l;
end;


class function  TColRec.HColW3(IvFbkMode: TFbkModeEnum): string;
begin
  case IvFbkMode of
    fmInfo   : Result := 'blue'  ;
    fmSuccess: Result := 'green' ;
    fmWarning: Result := 'orange';
    fmDanger : Result := 'red'   ;
    fmError  : Result := 'black' ;
  end;
end;


class function  TColRec.ToStr(IvColor: TColor): string;
begin
  Result := ColorToString(IvColor);
end;

class function  TColRec.FromStr(IvString: string): TColor;
begin
  Result := StringToColor('cl' + IvString);
end;

class function  TColRec.ToHexStr(IvColor: TColor): string;
begin
  Result := IntToHex( GetRValue( IvColor ), 2 )  // red value
          + IntToHex( GetGValue( IvColor ), 2 )  // green value
          + IntToHex( GetBValue( IvColor ), 2 ); // blue value
end;

class function  TColRec.FromHexStr(IvHexString, IvDefault: string): TColor;
var
  str: string;
begin
  str := IvHexString.Trim;
  if str = '' then
    str := IvDefault;
  if str.StartsWith('#') then
    str := str.Substring(1);
  if Length(str) < 6 then
    str := str + StringOfChar('0', 6 - Length(str));
  if Length(str) > 6 then
    str := LeftStr(str, 6);

  try
    Result := RGB(
      StrToInt('$' + Copy(str, 1, 2)) // red value
    , StrToInt('$' + Copy(str, 3, 2)) // green value
    , StrToInt('$' + Copy(str, 5, 2)) // blue value
    );
  except
    Result := FromHexStr(IvDefault); // if colorname is mispelled, like skyblu (should be skyblue), than 1) will not trigger and 2) will fail
  end;
end;


class function  TColRec.TColorRnd(IvStart: byte): TColor;
var
  rem: byte; // remaining
begin
  rem := 255 - IvStart;
  Result := Rgb(IvStart + Random(rem), IvStart + Random(rem), IvStart + Random(rem));
end;

class function  TColRec.TColorRnd2(const IvMix: TColor): TColor;
var
  r, g, b: integer;
begin
  r := Random(256);
  g := Random(256);
  b := Random(256);

  r := (r + GetRValue(ColorToRGB(IvMix))) div 2;
  g := (g + GetGValue(ColorToRGB(IvMix))) div 2;
  b := (b + GetBValue(ColorToRGB(IvMix))) div 2;

  Result := RGB(r, g, b);
end;

class function  TColRec.ColorAggRnd(IvStart: byte; IvAlpha: string): string;
begin
  Result := ToHexStr(TColorRnd(IvStart)) + IvAlpha;
end;

class function  TColRec.ColorHexRnd: string;
begin
  Result :=
    IntToHex(Random($ff), 2) // red
  + IntToHex(Random($ff), 2) // green
  + IntToHex(Random($ff), 2) // blue
end;

class function  TColRec.ColorHexaRnd: string;
begin
  Result := ColorHexRnd + IntToHex(Random($ff), 2) // alpha
end;


class function  TColRec.StrIsHtmlHexColor(const IvColorStr: string): boolean;
const
  PAT = '^#(?:[0-9a-fA-F]{3}){1,2}$'; // #RGB or #RRGGBB
begin
  Result := TRegEx.IsMatch(IvColorStr, PAT);
end;

class function  TColRec.StrIsHtmlRgbColor(const IvColorStr: string): boolean;
const
  PAT = '^rgb\(\s*\d{1,3}\s*,\s*\d{1,3}\s*,\s*\d{1,3}\s*\)$'; // rgb(n,n,n)
begin
  Result := TRegEx.IsMatch(IvColorStr, PAT);
end;

class function  TColRec.StrIsHtmlNameColor(const IvColorStr: string): boolean;
const
  VEC: array[0..146] of string = (
    'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black',
    'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse',
    'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan',
    'DarkGoldenRod', 'DarkGray', 'DarkGrey', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen',
    'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray',
    'DarkSlateGrey', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DimGrey',
    'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold',
    'GoldenRod', 'Gray', 'Grey', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed', 'Indigo',
    'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral',
    'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGrey', 'LightGreen', 'LightPink', 'LightSalmon',
    'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSlateGrey', 'LightSteelBlue', 'LightYellow',
    'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid',
    'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed',
    'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab',
    'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip',
    'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown',
    'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray',
    'SlateGrey', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet',
    'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'
  );
var
  i: integer;
begin
  for i := Low(VEC) to High(VEC) do begin
    Result := SameText(IvColorStr, VEC[i]);
    if Result then
      Exit;
  end;
end;
  {$ENDREGION}

  {$REGION 'TCryRec'}
class function  TCryRec.KeyIsValidAndSecure(const IvKey: string; var IvFbk: string): boolean;
begin
  Result := TStrRec.StrIs09(IvKey) and (Length(IvKey) >= CRYPTO_KEY_MIN_LEN);
  if Result then
    IvFbk := Format('CryptoKey %s is valid and secure', [IvKey])
  else
    IvFbk := Format('CryptoKey %s is not valid or secure, it have to be at least %d digits 0..9', [IvKey, CRYPTO_KEY_MIN_LEN]);
end;

class function  TCryRec.Cipher(const IvString: ansistring; IvStartKey, IvMultKey, IvAddKey: integer): string;
var
  i: word;
  b: byte;
  s: ansistring;
begin
  {$R-}
  {$Q-}
  // reverse
  s := ReverseString(IvString);
  Result := '';
  // standard cipher algorithm - copied from Borland
  for i := 1 to Length(s) do begin
    b := Byte(s[i]) xor (IvStartKey shr 8);
    IvStartKey := (IvStartKey + b) * IvMultKey + IvAddKey;
    Result := Result + IntToHex(b, 2);
  end;
  {$Q+}
  {$R+}
end;

class function  TCryRec.Decipher(const IvString: ansistring; IvStartKey, IvMultKey, IvAddKey: integer): string;
var
  i: word;
  a: byte;
  b: byte;
begin
  {$R-}
  {$Q-}
  a := 0;
  Result := '';
  // standard decipher algorithm - copied from Borland
  for i := 1 to Length(IvString) div 2 do begin
    try
      a := StrToInt('$' + Copy(string(IvString), 2*i-1, 2));
    except
      on EConvertError do
        a := 0;
    end;
    b := Byte(a) xor (IvStartKey shr 8);
    IvStartKey := (IvStartKey + a) * IvMultKey + IvAddKey;
    Result := Result + Char(b);
  end;
  // reverse
  Result := ReverseString(Result);
  {$Q+}
  {$R+}
end;

class function  TCryRec.CipherSha2(IvString: string): string;
begin
  Result := THashSHA2.GetHashString(IvString);
end;

class function  TCryRec.CipherSha2HMac(IvString, IvKey: string): string;
begin
  Result := THashSHA2.GetHMAC(IvString, IvKey);
end;

class function  TCryRec.DecipherSha2(IvString: string): string;
begin
  raise Exception.Create(TStdRec.StdNotImplemented('DecipherSha2'));
  Result := THashSHA2.GetHashString(IvString);
end;

class function  TCryRec.DecipherSha2HMac(IvString, IvKey: string): string;
begin
  raise Exception.Create(TStdRec.StdNotImplemented('DecipherSha2HMac'));
end;

class procedure TCryRec.FileCrypt(const IvFileSource, IvFileDestination, IvPassword: string; IvCrypt: boolean);
// use:  FileCrypt('c:\datafile.txt', 'd:\encrypted.dat', 'secret', true); // to encrypt file:
//       FileCrypt('d:\encrypted.dat', 'c:\datafile.txt', 'secret', false); // to decrypt file
//
// todo: change the code to accept the any streams (not only file streams)
var
  p: HCRYPTPROV; // prov
  h: HCRYPTHASH; // hash
  k: HCRYPTKEY;  // key
  e: boolean; // isendoffile
  b: PByte; // buffer
  l: dWord; // len
  fsIn, fsOut: TFileStream; // filestream in, out
begin
  // get context for crypt default provider
  CryptAcquireContext(@p, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT);

  // create hash-object (SHA algorithm)
  CryptCreateHash(p, CALG_SHA, 0, 0, @h);

  // get hash from password
  CryptHashData(h, @IvPassword[1], Length(IvPassword), 0);

  // create key k from hash h by RC4 algorithm
  CryptDeriveKey(p, CALG_RC4, h, 0, @k);

  // destroy hash-object
  CryptDestroyHash(h);

  // open source+destination files
  fsIn  := TFileStream.Create(IvFileSource, fmOpenRead or fmShareDenyWrite);
  fsOut := TFileStream.Create(IvFileDestination, fmCreate);
  try
    // allocate buffer to read content from source file
    GetMem(b, 512);

    repeat
      // exit
      e := (fsIn.Position >= fsIn.Size);
      if e then
        break;

      // read content from source file
      l := fsIn.Read(b^, 512);

      // crypt buffer
      if IvCrypt then
        CryptEncrypt(k, 0, e, 0, b, @l, l)

      // decrypt buffer
      else
        CryptDecrypt(k, 0, e, 0, b, @l);

      // write changed buffer to destination file
      fsOut.Write(b^, l)
    until e;

    // release memory allocated for buffer
    FreeMem(b, 512);
  finally
    fsIn.Free;
    fsOut.Free;
  end;

  // release the context for crypt default provider
  CryptReleaseContext(p, 0);
end;
  {$ENDREGION}

  {$REGION 'TCsvRec'}
class function TCsvRec.CsvRowField(IvCsvRow: string; IvFieldId: integer): string;
begin
  Result := SplitString(IvCsvRow, ',')[IvFieldId];
end;

class function TCsvRec.CsvRowFieldAppend(var IvCsvRow: string; IvField: string): string;
begin
  if IvCsvRow.IsEmpty then
    IvCsvRow := IvField
  else
    IvCsvRow := IvCsvRow + ',' + IvField;
end;
  {$ENDREGION}

  {$REGION 'TCtxRec'}
function  TCtxRec.HostName: string;
var
  s: DWord; // size
  b: array[0..255] of {ansi}char; // buffer
begin
  s := 256;
  if Winapi.Windows.GetComputerName(b, s) then
    Result := LowerCase(b)
  else
    Result := '';
end;

function  TCtxRec.UserLogged: string;
var
  z: dword; // size
begin
  z := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(Result, z);
  if GetUserName(PChar(Result), z) then begin
    z := Pos(#0, Result);
    SetLength(Result, z-1);
  end else
    Result := '';
end;

function  TCtxRec.WksModule: string;
var
  v: TArray<string>;
begin
  v := gvec.VecFromStrCamel(TBynRec.BinaryName); // *** MOVE TO TWksRec ***
  Result := v[1];
end;
  {$ENDREGION}

  {$REGION 'TDatRec'}
class function  TDatRec.DatIsZero(IvDateTime: TDateTime): boolean;
begin
  Result := IvDateTime = 0; // ZERO_STR
end;

class function  TDatRec.DatYear(IvDateTime: TDateTime; IvInc: integer): integer;
begin
  Result := YearOf(IncYear(IvDateTime, IvInc));
end;

class function  TDatRec.DatQuarter(IvDateTime: TDateTime; IvInc: integer): integer;
var
  m, q: integer;
begin
  m := MonthOf(IvDateTime);
       if (m >=  4) and (m <=  6) then q := 1
  else if (m >=  7) and (m <=  9) then q := 2
  else if (m >= 10) and (m <= 12) then q := 3
  else                                 q := 4;
  Result := q + IvInc mod 4;
end;

class function  TDatRec.DatMonth(IvDateTime: TDateTime; IvInc: integer): integer;
begin
  Result := MonthOf(IvDateTime) + IvInc mod 12;
end;

class function  TDatRec.DatMonthStr(IvDateTime: TDateTime; IvInc, IvLength: integer): string;
begin
  Result := FormatSettings.LongMonthNames[DatMonth(IvDateTime, IvInc)];
  if (IvLength > 0) and (IvLength <= 3) then
    Result := LeftStr(Result, IvLength);
end;

class function  TDatRec.DatWeekDayId(IvDateTime: TDateTime; IvInc: integer): integer;
begin
  Result := DayOfTheWeek(IvDateTime) + IvInc mod 7; // 1=monday ... 7=sunday (iso 8601 compliant, note that DayOfWeek is not compliant)
end;

class function  TDatRec.DatWeekDayStr(IvDateTime: TDateTime; IvInc, IvLength: integer): string;
begin
//Result := FormatSettings.LongDayNames[DatWeekDayId(IvDateTime, IvInc)]; // 1=sunday ... 7=saturday *** WRONG ***
  Result := DAT_LongDayNames_ISO8601[DatWeekDayId(IvDateTime, IvInc)];
  if (IvLength > 0) and (IvLength <= 3) then
    Result := LeftStr(Result, IvLength);
end;

class function  TDatRec.DatWeekIso(IvDateTime: TDateTime; IvInc: integer): integer;
begin
  Result := WeekOf(IvDateTime) + IvInc mod 52{53};
end;

class function  TDatRec.DatWeekWork(IvDateTime, IvWeekWorkOneStartDateTime: TDateTime): integer;
begin
  Result := Trunc(IvDateTime - IvWeekWorkOneStartDateTime) div 7 + 1;
end;

class function  TDatRec.DatDay(IvDateTime: TDateTime; IvInc: integer): integer;
begin
  Result := DayOf(IncDay(IvDateTime, IvInc));
end;

class function  TDatRec.DatHour(IvDateTime: TDateTime; IvInc: integer): integer;
begin
  Result := HourOf(IncHour(IvDateTime, IvInc));
end;

class function  TDatRec.DatMinute(IvDateTime: TDateTime; IvInc: integer): integer;
begin
  Result := MinuteOf(IncMinute(IvDateTime, IvInc));
end;

class function  TDatRec.DatSecond(IvDateTime: TDateTime; IvInc: integer): integer;
begin
  Result := SecondOf(IncSecond(IvDateTime, IvInc));
end;

class function  TDatRec.DatToIso(IvDateTime: TDateTime; IvInputIsUTC: boolean): string;
begin
  Result := DateToISO8601(IvDateTime, IvInputIsUTC);
end;

class function  TDatRec.DatFromIso(IvDateTimeIso: string; IvDefault: TDateTime; IvInputIsUTC: boolean): TDateTime;
begin
  if IvDateTimeIso.IsEmpty then
    Result := IvDefault
  else
    Result := ISO8601ToDate(IvDateTimeIso, IvInputIsUTC);
// converts an ISO8601 date/time string to TDateTime
// the result is in local time, if IvInputIsUTC is false
// example
// in:  "2013-10-18T20:36:22.966Z", false
// out: 20:36 if your timezone is ZULU (UTC+0 ZeroMeridian)
// out: 22:36 if your timezone is MEST (UTC+2)
end;

class function  TDatRec.DatToSql(IvDateTime: TDateTime): string;
begin
  Result := FormatDateTime(MSSQLFORMAT, IvDateTime);
end;

class function  TDatRec.DatFromSql(IvDateTimeStr: string): TDateTime; // 'yyyymmdd hh:nn:ss.zzz'
var
  y, m, d, h, i, s, l: word;
begin
  y := Copy(IvDateTimeStr,  1, 4).ToInteger;
  m := Copy(IvDateTimeStr,  5, 2).ToInteger;
  d := Copy(IvDateTimeStr,  7, 2).ToInteger;

  h := Copy(IvDateTimeStr, 10, 2).ToInteger;
  i := Copy(IvDateTimeStr, 13, 2).ToInteger;
  s := Copy(IvDateTimeStr, 16, 2).ToInteger;

  l := Copy(IvDateTimeStr, 19, 3).ToInteger;
  Result := EncodeDateTime(y, m, d, h, i, s, l);
end;

class function  TDatRec.DateFromCode(IvYyyyMmDdHhMmSs: string): TDate;
var
  y, m, d: integer;
begin
  if Length(IvYyyyMmDdHhMmSs) <> 14 then
    Result := 0
  else begin
    y := StrToInt(Copy(IvYyyyMmDdHhMmSs,  1, 4));
    m := StrToInt(Copy(IvYyyyMmDdHhMmSs,  5, 2));
    d := StrToInt(Copy(IvYyyyMmDdHhMmSs,  7, 2));
    Result := EncodeTime(y, m, d, 0);
  end;
end;

class function  TDatRec.DateToCode(IvDateTime: TDateTime): string;
begin
  Result := Format('%4d%2d%2d', [DatYear(IvDateTime), DatMonth(IvDateTime), DatDay(IvDateTime)]);
  Result := StringReplace(Result, ' ', '0', [rfReplaceAll]);
end;

class function  TDatRec.TimeFromCode(IvYyyyMmDdHhMmSs: string): TTime;
var
  h, n, s: integer;
begin
  if Length(IvYyyyMmDdHhMmSs) <> 14 then
    Result := 0
  else begin
    h := StrToInt(Copy(IvYyyyMmDdHhMmSs,  9, 2));
    n := StrToInt(Copy(IvYyyyMmDdHhMmSs, 11, 2));
    s := StrToInt(Copy(IvYyyyMmDdHhMmSs, 13, 2));
    Result := EncodeTime(h, n, s, 0);
  end;
end;

class function  TDatRec.TimeToCode(IvDateTime: TDateTime): string;
begin
  Result := Format('%2d%2d%2d', [DatHour(IvDateTime), DatMinute(IvDateTime), DatSecond(IvDateTime)]);
  Result := StringReplace(Result, ' ', '0', [rfReplaceAll]);
end;

class function  TDatRec.DtFromCode(IvYyyyMmDdHhMmSs: string): TDateTime;
var
  y, m, d, h, n, s: integer; // 19600719110000
begin
  if Length(IvYyyyMmDdHhMmSs) <> 14 then
    Result := 0
  else begin
    y := StrToInt(Copy(IvYyyyMmDdHhMmSs,  1, 4));
    m := StrToInt(Copy(IvYyyyMmDdHhMmSs,  5, 2));
    d := StrToInt(Copy(IvYyyyMmDdHhMmSs,  7, 2));
    h := StrToInt(Copy(IvYyyyMmDdHhMmSs,  9, 2));
    n := StrToInt(Copy(IvYyyyMmDdHhMmSs, 11, 2));
    s := StrToInt(Copy(IvYyyyMmDdHhMmSs, 13, 2));
    Result := EncodeDate(y, m, d) + EncodeTime(h, n, s, 0);
  end;
end;

class function  TDatRec.DtToCode(IvDateTime: TDateTime): string;
begin
  Result := DateToCode(IvDateTime) + TimeToCode(IvDateTime);
end;

class function  TDatRec.DatNowStr: string;
begin
  Result := DateTimeToStr(Now);
end;

class function  TDatRec.DatNowDateStr: string;
begin
  Result := DateToStr(Date);
end;

class function  TDatRec.DatNowTimeStr: string;
begin
  Result := TimeToStr(Time);
end;

class function  TDatRec.DatNowYear: integer;
begin
  Result := CurrentYear;
end;

class function  TDatRec.DatNowQuarter: integer;
begin
  Result := -1;
end;

class function  TDatRec.DatNowMonth: integer;
begin
  Result := MonthOf(Now());
end;

class function  TDatRec.DatNowWeek{Iso}: integer;
begin
  Result := WeekOf(Now()); // ISO 8601
end;

class function  TDatRec.DatNowDay: integer;
begin
  Result := DayOf(Now());
end;

class function  TDatRec.DatNowHour: integer;
begin
  Result := HourOf(Now());
end;

class function  TDatRec.DatNowMinute: integer;
begin
  Result := MinuteOf(Now());
end;

class function  TDatRec.DatNowSecond: integer;
begin
  Result := SecondOf(Now());
end;

class function  TDatRec.DatNowAmPm: string;
begin
  Result := ifthen(HourOf(Now()) >= 12, 'PM', 'AM');
end;

class function  TDatRec.DatNowCode: string;
begin
  Result := DtToCode(Now);
end;

class function  TDatRec.DatNowMs: cardinal;
var
  t: TDateTime;
  h, m, s, ms: word;
begin
  t := Time;
  DecodeTime(t, h, m, s, ms);
  Result := h * 3600000 + m * 60000 + s * 1000 + ms;
end;

class procedure TDatRec.DateDiff(IvDateStart, IvDateEnd: TDateTime; out IvYears, IvMonths, IvDays, IvHours: integer);
var
  ye1, mo1, da1, ho1, mi1, se1, ms1: word;
  ye2, mo2, da2, ho2, mi2, se2, ms2: word;
begin
  // decode the start and end dates
  DecodeDateTime(IvDateStart, ye1, mo1, da1, ho1, mi1, se1, ms1);
  DecodeDateTime(IvDateEnd  , ye2, mo2, da2, ho2, mi2, se2, ms2);

  // difference in years
  IvYears := ye2 - ye1;
  if (mo2 < mo1) or ((mo2 = mo1) and (da2 < da1)) then
    Dec(IvYears);

  // difference in months
  IvMonths := MonthsBetween(IvDateStart, IvDateEnd) mod 12;
  if da2 < da1 then
    Dec(IvMonths);

  // difference in days
  if da2 >= da1 then
    IvDays := da2 - da1
  else
    IvDays := DaysInAMonth(ye2, mo2) + da2 - da1;

  // difference in hours
  IvHours := HoursBetween(IvDateEnd, IvDateStart + IvDays);
  if ho2 < ho1 then
    IvHours := 24 + ho2 - ho1
  else
    IvHours := ho2 - ho1;
end;
  {$ENDREGION}

  {$REGION 'TDbaCls'}
constructor TDbaCls.Create;
begin
  FAdoConn := TADOConnection.Create(nil);
  FAdoConn.ConnectionString := DBA_CONN_STR;
end;

destructor TDbaCls.Destroy;
begin
  FAdoConn.Free;
end;
  {$ENDREGION}

  {$REGION 'TDbaRec'}

    {$REGION 'general'}
class function  TDbaRec.DsFromSql(const IvSql: string; out IvDs: TDataset; var IvAffected: integer; var IvFbk: string; IvFalseIfDsIsEmpty: boolean): boolean;
var
  sql: string;
  qry: TADOQuery;
begin
  sql := grva.Rva(IvSql);                                                       // *** CENTRALIZE ONLY HERE ***
  qry := TADOQuery.Create(nil);
//try
    qry.ConnectionString := DBA_CONN_STR;
    qry.SQL.Text := sql;
    try
      qry.Active := true;
      IvDs := qry;                                                              // *** IMPORTANT *** do not create IvDs outside
      IvAffected := IvDs.RecordCount;
      if IvDs.IsEmpty {IvAffected <= 0} then begin
        IvFbk := 'Dataset is empty';
        Result := not IvFalseIfDsIsEmpty;
      end else begin
        IvFbk := Format('Affected %d', [IvAffected]);
        Result := true;
      end;
    except
      on e: Exception do begin
        glog.Log(e{, sql});
        IvAffected := 0;
        IvFbk := e.Message;
        Result := false;
      end;
    end;
//finally
//  qry.Free;                                                                   // *** IMPORTANT *** free IvDs in the calling code
//end;
end;

class function  TDbaRec.DsFromSql(const IvSql: string; out IvDs: TDataset; var IvFbk: string; IvFalseIfDsIsEmpty: boolean): boolean;
var
  aff: integer;
begin
  Result := DsFromSql(IvSql, IvDs, aff, IvFbk, IvFalseIfDsIsEmpty);
end;

class function  TDbaRec.DsFromSql(const IvSql: string; out IvDs: TDataset; IvFalseIfDsIsEmpty: boolean): boolean;
var
  {sql,} fbk: string;
//  qry: TADOQuery;
  aff: integer;
begin
(*
  sql := grva.Rva(IvSql);
  qry := TADOQuery.Create(nil);
//try
    qry.ConnectionString := DBA_CONN_STR;
    qry.SQL.Text := sql;
    try
      qry.Active := true;
      IvDs := qry;
      if IvDs.IsEmpty {IvAffected <= 0} then
        Result := not IvFalseIfDsIsEmpty
      else
        Result := true;
    except
      on e: Exception do begin
        glog.Log(e{, sql});
        Result := false;
      end;
    end;
//finally
//  qry.Free;
//end;
*)
  Result := DsFromSql(IvSql, IvDs, aff, fbk, IvFalseIfDsIsEmpty);
end;

class function  TDbaRec.CmdExec(const IvSql: string; var IvAffected: integer; var IvFbk: string; IvTimeoutSec: integer): boolean;
var
  sql: string;
  con: TADOConnection;
begin
  sql := grva.Rva(IvSql);
  con := TADOConnection.Create(nil);
  con.ConnectionString := DBA_CONN_STR;
  con.LoginPrompt := false;
  try
    try
      con.CommandTimeout := IvTimeOutSec;
      con.Execute(sql, IvAffected);
      IvFbk  := Format('Sql executed succesful, %d affected records', [IvAffected]);
      Result := true;
    except
      on e: Exception do begin
        glog.Log(e{, sql});
        IvAffected := {0}-1;
        IvFbk  := Format('Unable to execute sql, %s', [e.Message]);
        Result := false;
      end;
    end;
  finally
    con.Free;
  end;
end;

class function  TDbaRec.Scalar(const IvSql: string; const IvDefault: variant): variant;
var
  sql: string;
  con: TADOConnection;
  res:_Recordset;
begin
  sql := grva.Rva(IvSql);
  con := TADOConnection.Create(nil);
  con.ConnectionString := DBA_CONN_STR;
  con.LoginPrompt := false;
  try
    try
      res := con.Execute(sql);
      if res.RecordCount > 0 then
        Result := res.Fields[0].Value
      else
        Result := IvDefault;
      if TVntRec.VntIsWhite(Result) then // *** WAS COMMENTED BUT DONT KNOW WAY ! ***
        Result := IvDefault;
    except
      on e: Exception do begin
        glog.Log(e{, sql});
        Result := IvDefault;
      end;
    end;
  finally
    con.Free;
  end;
end;

class function  TDbaRec.CsvFromSql(IvSql: string; IvHeaderOn: boolean): string;
var
  i: integer;
  dst: TDataset;
  val, row: string;
begin
  Result := '';
  DsFromSql(IvSql, dst);
  try
    if IvHeaderOn then begin
      for i := 0 to dst.FieldCount-1 do begin
        val := dst.FieldDefs[i].Name;
        val := TStrRec.StrDel(val, ' ');
        Result := Result + ',' + val;
      end;
      Delete(Result, 1, 1);
    end;
    while not dst.Eof do begin
      row := '';
      for i := 0 to dst.FieldCount-1 do begin
        val := dst.Fields[i].AsString;
        val := TStrRec.StrDel(val, ' ');
        row := row + ',' + val;
      end;
      Delete(row, 1, 1);
      if not Result.IsEmpty then
        Result := Result + sLineBreak;
      Result := Result +  row;
      dst.Next;
    end;
  finally
    dst.Free;
  end;
end;
    {$ENDREGION}

    {$REGION 'table'}
class function  TDbaRec.TblExists(const IvDbaSchTbl: string): boolean;
var
  sql: string;
begin
  sql := Format('select case when object_id(''%s'', ''U'') is null then 0 else 1 end as FldResult', [IvDbaSchTbl]);
  Result := Scalar(sql, 0) = 1;
end;

class function  TDbaRec.TblIdAvailable(const IvTbl: string; IvWhere: string): integer;
var
  sql: string;
begin
  if giis.Nx(IvWhere) then
    sql := Format( 'if (not exists(select 1 from %s))'
    + sLineBreak + '  select 1 as FldIdAvailable'
    + sLineBreak + 'else'
    + sLineBreak + '  select isnull(l.FldId, 0) + 1 as FldIdAvailable'
    + sLineBreak + '  from'
    + sLineBreak + '    %s as l left outer join'
    + sLineBreak + '    %s as r on (l.FldId + 1 = r.FldId)'
    + sLineBreak + '  where'
    + sLineBreak + '     r.FldId is null'
    , [IvTbl, IvTbl, IvTbl])
  else
    sql := Format( 'with cte(FldId) as (select FldId from %s %s)'
    + sLineBreak + 'if (not exists(select 1 from cte))'
    + sLineBreak + '  select 1 as FldIdAvailable'
    + sLineBreak + 'else'
    + sLineBreak + '  select isnull(l.FldId, 0) + 1 as FldIdAvailable'
    + sLineBreak + '  from'
    + sLineBreak + '    cte as l left outer join'
    + sLineBreak + '    cte as r on (l.FldId + 1 = r.FldId)'
    + sLineBreak + '  where'
    + sLineBreak + '     r.FldId is null'
    , [IvTbl, TSqlRec.WhereEnsure(IvWhere)]);
  Result := Scalar(sql, 0);
end;

class function  TDbaRec.TblIdMax(const IvTbl: string; IvWhere: string): integer;
var
  sql: string;
begin
  if giis.Nx(IvWhere) then
    sql := Format('select max(FldId) as FldIdMax from %s', [IvTbl])
  else;
    sql := Format('select max(FldId) as FldIdMax from %s %s', [IvTbl, TSqlRec.WhereEnsure(IvWhere)]);
  Result := Scalar(sql, 0);
end;

class function  TDbaRec.TblIdNext(const IvTbl: string; IvUseIdAvailable: boolean): integer;
begin
  if IvUseIdAvailable then
    Result := TblIdAvailable(IvTbl) // using 1st number of missed blocks
  else
    Result := TblIdMax(IvTbl) + 1;
end;
    {$ENDREGION}

    {$REGION 'object'}
class function  TDbaRec.ObjIdFromIdOrPath(const IvObj, IvIdOrPath: string): integer;
var
  iop, tbl, fld: string;
  vec: {$IF COMPILERVERSION < 32.0} TStringDynArray {$ELSE} TArray<string> {$ENDIF};
  itm, sql: string;
begin
  iop := IvIdOrPath;

  // int
  if TStrRec.StrIsInteger(iop) then begin
    Result := StrToInt(iop);

  // path
  end else begin
    // fix
    iop := iop.Replace('\', '/');
    if iop.StartsWith('/') then
      Delete(iop, 1, 1);

    // split (dot [.] is not usable in cases like: Root/Organization/W/W3/W3.js)
  //vec := SplitString(iop, '/');
    vec := iop.Split(['/']);
    
    // tableandfieldforpath
    tbl := TSqlRec.TblMasterFromObj(IvObj);
  //fld := TSqlRec.FldMainFromTbl(IvTbl);
    fld := 'FldObject';

    // find
    Result := 0;
    for itm in vec do begin
      sql := Format('select FldId from %s where %s = %s and FldPId = %d', [tbl, fld, itm.QuotedString, Result]);
      Result := Scalar(sql, {0}-1);
      if Result < 0 then // notfound
        Exit;
    end;
  end;
end;

class function  TDbaRec.ObjExists(const IvObj, IvIdOrPath: string): boolean;
begin
  Result := ObjFieldGet(IvObj, 'FldId', IvIdOrPath, false);
end;

class function  TDbaRec.ObjFieldGet(const IvObj, IvField, IvIdOrPath: string; IvDefault: variant): variant;
var
  idi: integer;
  tba, tbb, sql: string;
begin
  idi := ObjIdFromIdOrPath(IvObj, IvIdOrPath);
  tba := TSqlRec.TblMasterFromObj(IvObj);
  tbb := TSqlRec.TblDetailFromObj(IvObj);
  sql := Format('select %s from %s a left join %s b on (b.FldObjectId = a.FldId) where FldId = %d', [IvField, tba, tbb, idi]);
  Result := Scalar(sql, IvDefault);
end;

class function  TDbaRec.ObjFieldSet(const IvObj, IvField, IvIdOrPath: string; IvValue: variant; var IvFbk: string): boolean;
var
  idi, aff: integer;
  tba, sql, val: string;
begin
  idi := ObjIdFromIdOrPath(IvObj, IvIdOrPath);
  val := TSqlRec.Val(IvValue);
  tba := TSqlRec.TblMasterFromObj(IvObj);
  sql := Format('update %s set %s = %s where FldId = %d', [tba, IvField, val, idi]);
  Result := CmdExec(sql, aff, IvFbk); // *** WARNING might delete comments and Rv[Xxx()] in FldContents due to previous Rv ***
end;

class function  TDbaRec.ObjDetailFieldSet(const IvObj, IvField, IvIdOrPath: string; IvValue: variant; var IvFbk: string): boolean;
var
  idi, aff: integer;
  tbb, sql, val: string;
begin
  idi := ObjIdFromIdOrPath(IvObj, IvIdOrPath);
  val := TSqlRec.Val(IvValue);
  tbb := TSqlRec.TblDetailFromObj(IvObj);
  sql := Format('update %s set %s = %s where FldObjectId = %d', [tbb, IvField, val, idi]);
  Result := CmdExec(sql, aff, IvFbk); // *** WARNING might delete comments and Rv[Xxx()] in FldContents due to previous Rv ***
end;

class function  TDbaRec.ObjTreeContentDba(const IvObj, IvIdOrPath: string; IvWithChild: boolean; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean;
var
  i: integer;
  tik: TTicRec;
  sbu: TSbuRec;
  dst: TDataSet;
  oid, pid, ord: integer;
  tbl, sta, cki, con, ona, com, co1, co2, csr, oty, a, b: string; // table, state, contentkind, content, objname, comment, comnt1, comnt2, comntseprow, outputtype
begin
  // start
  tik.Init;

  // table
  tbl := TSqlRec.TblMasterFromObj(IvObj); // DbaCode.dbo.TblObject

  // id
  oid := ObjIdFromIdOrPath(IvObj, IvIdOrPath);

  // ds
  Result := HTreeDs(tbl, 'FldObject, FldContent', oid , dst, IvFbk, 'FldState=''Active''');
  try
    // exit
    if not Result then begin
      IvFbk := Format('Unable to return object tree-Content for Id = %d, %s', [oid, IvFbk]);
      Exit;
    end;

    // blocks
    IvAffected := dst.RecordCount;

    // outputtype
         if IvAffected <= 0 then oty := 'EMPTY'
    else if IvAffected  = 1 then oty := 'ITEM'  // single
    else                         oty := 'TREE'; // library

    // items
    for i := 0 to IvAffected - 1 do begin
      // item
      oid := dst.FieldByName('FldId'            ).AsInteger; // FldId
      pid := dst.FieldByName('FldPId'           ).AsInteger; // FldPId
                                                             // FldId8
      ord := dst.FieldByName('FldOrder'         ).AsInteger; // FldOrder
                                                             // FldRev
                                                             // FldCreated
                                                             // FldUpdated
                                                             // FldFromOrganization
                                                             // FldFromDepartment
                                                             // FldFromArea
                                                             // FldFromTeam
                                                             // FldFromMember
                                                             // FldToOrganization
                                                             // FldToDepartment
                                                             // FldToArea
                                                             // FldToTeam
                                                             // FldToMember
                                                             // FldJobGradeMin
                                                             // FldRoute
                                                             // FldObjectKind
      cki := dst.FieldByName('FldContentKind'   ).AsString ; // FldContentKind
                                                             // FldDataKind
      sta := dst.FieldByName('FldState'         ).AsString ; // FldState
                                                             // FldTitle
                                                             // FldSubtitle
                                                             // FldDescription
                                                             // FldSpare
                                                             // FldEncrypted
                                                             // FldPersist
                                                             // FldImage
                                                             // FldContentPrev
      con := dst.FieldByName('FldContent'       ).AsString ; // FldContent
                                                             // FldData
                                                             // FldNote
      ona := dst.FieldByName('FldObject'        ).AsString ; // FldObject

      // commentcharsandrow
      com := TCodRec.CommentStr(cki);
      co1 := TCodRec.Comment1Str(cki);
      co2 := TCodRec.Comment2Str(cki);
      if Sametext('Html', cki) then
        csr := co1 + StringOfChar(com.Chars[0], 73) + co2   // <!------------->
      else
        csr := StringOfChar(com.Chars[0], 80);              // ////////////////

      // head
      a := Format('%s', [ona]);
      b := Format('(oid:%d, pid:%d, ord:%d)', [oid, pid, ord]);
      sbu.Add(csr, true, ifthen(i = 0, 0, 2));
      if Sametext('Html', cki) then
        sbu.Add('%s %-34s%37s %s', [co1, a, b, co2])
      else
        sbu.Add('%s %-40s%37s', [com, a, b]);
      sbu.Add(csr);

      // add
      con := grva.Rva(con, false, false, true);
      sbu.Add(con, true, 2);

      // next
      if IvWithChild then
        dst.Next
      else
        break;
    end;

    // tail
    a := Format('END', []);
    b := Format('(generated by wks @ %s in %d ms)', [DateTimeToStr(Now), tik.ElapsedMs]);
    sbu.Add(csr, true, 2);
    if Sametext('Html', cki) then
      sbu.Add('%s %-14s%57s %s', [co1, a, b, co2])
    else
      sbu.Add('%s %-20s%57s', [com, a, b]);
    sbu.Add(csr);

    // return
    IvObjName      := ona;
    IvHTreeContent := sbu.Text;
    IvFbk          := Format('Returning object tree-Content (%s) for Id = %d', [oty, oid]);
  finally
    FreeAndNil(dst);
  end;
end;

class function  TDbaRec.ObjTreeContentRio(const IvObj, IvIdOrPath: string; IvWithChild: boolean; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean;
begin
  Result := (grio.HttpRio as ISystemSoapMainService).SystemObjectTreeContent(IvObj, IvIdOrPath, IvWithChild, IvAffected, IvObjName, IvHTreeContent, IvFbk);
end;

class function  TDbaRec.ObjTreeContentRioSave(const IvObj, IvIdOrPath: string; IvWithChild: boolean; IvFileSpec: string; var IvAffected: integer; var IvObjName, IvHTreeContent, IvFbk: string): boolean;
begin
  Result := (grio.HttpRio as ISystemSoapMainService).SystemObjectTreeContentSave(IvObj, IvIdOrPath, IvWithChild, IvFileSpec, IvAffected, IvObjName, IvHTreeContent, IvFbk);
end;

class function  TDbaRec.HPath(const IvTbl, IvField: string; const IvId: integer; IvDivider: string; IvStopAtOrganization: boolean): string;
var
  d: TDataSet;
begin
  d := TDataSet.Create(nil);
  try
    HParentsDs(IvTbl, IvField, IvId, d, '', '1');
    Result := '';
    while not d.Eof do begin
      Result := Result + IvDivider + d.FieldByName(IvField).AsString;
      d.Next;
    end;
    Delete(Result, 1, Length(IvDivider)); // /Root/Organization/W/Wks/Aaa/Bbb --> Root/Organization/W/Wks/Aaa/Bbb
  finally
    d.Free;
  end;
  if IvStopAtOrganization then
    Delete(Result, 1, 4+12+1+3*Length(IvDivider)); // Root/Organization/W/Wks/Aaa/Bbb --> Wks/Aaa/Bbb
end;

class function  TDbaRec.HLevel(const IvTbl: string; const IvId: integer): integer;
var
  sql: string;
begin
  sql :=         'declare @l int'
  + sLineBreak + 'set @l = 0'
  + sLineBreak + 'declare @p int'
  + sLineBreak + 'select @p = FldPId from ' + IvTbl + ' where FldId = ' + IntToStr(IvId)
  + sLineBreak + 'while (not @p = 0) begin'
  + sLineBreak + '    select @p = FldPId from ' + IvTbl + ' where FldId = @p'
  + sLineBreak + '    set @l = @l + 1'
  + sLineBreak + 'end'
  + sLineBreak + 'select @l' // + 0
  ;
  Result := Scalar(sql, {0}-1);
end;

class procedure TDbaRec.HParentsDs(const IvTbl, IvFldCsv: string; const IvId: integer; var IvDs: TDataSet; IvWhere, IvOrderBy: string; InIncludeObj: boolean);
var
  fls, fl2, fl3, sql, wer, oby: string; // fieldlist, 2, 3, sql, where, orderby
begin

  {$REGION 'help'}
  {
  FldId, FldPId, FldLevel, FldState, FldObjectKind, FldContentKind, FldPath (+ IvFldCsv optional)
  }
  {$ENDREGION}

  {$REGION 'zip'}
  // fields
  fls := IvFldCsv.Trim;
  if fls.IsEmpty then
    fls := TSqlRec.FldMainFromTbl(IvTbl);
  fl2 := ', ' + fls;
  fl3 := fl2.Replace(', Fld', ', ng.Fld');

  // where
  if IvWhere.IsEmpty then
    if not InIncludeObj then
      IvWhere := 'FldLevel <> 0';
  wer := TSqlRec.WhereEnsure(IvWhere);

  // orderby
  if IvOrderBy.IsEmpty then
    IvOrderBy := fls;
  oby := TSqlRec.OrderByEnsure(IvOrderBy);
  {$ENDREGION}

  {$REGION 'query'}
  sql :=         {recursive cte}
                 'with parents (FldId, FldPId, FldLevel, FldState, FldObjectKind, FldContentKind, FldPath' + fl2 + ') as ('
//+ sLineBreak + '    -- fixed part, anchor, 1st generation or level'
  + sLineBreak + '    select FldId, FldPId, 0 as FldLevel, FldState, FldObjectKind, FldContentKind, ''\'' + convert(varchar(max), FldId) as FldPath' + fl2
  + sLineBreak + '    from ' + IvTbl + ' as fg'        // firstgeneration
  + sLineBreak + '    where FldId = ' + IntToStr(IvId) // root
  + sLineBreak + '  union all'
//+ sLineBreak + '    -- recursive part, next generation'
  + sLineBreak + '    select ng.FldId, ng.FldPId, pa.FldLevel+1 as FldLevel, ng.FldState, ng.FldObjectKind, ng.FldContentKind, pa.FldPath + ''\'' + convert(varchar(max), ng.FldId) as FldPath' + fl3
  + sLineBreak + '    from ' + IvTbl + ' as ng'        // nextgeneration
  + sLineBreak + '    inner join parents as pa'        // references the whole cte as parent
  + sLineBreak + '    on (ng.FldId = pa.FldPId)'
  + sLineBreak + ')'
//+ sLineBreak + '-- statement that call the cte'
  + sLineBreak + 'select *'
  + sLineBreak + 'from parents'
  + sLineBreak + wer
  + sLineBreak + oby
  + sLineBreak + 'option(maxrecursion 32767)' // in calling the cte, by default it is 100
  ;
  {$ENDREGION}

  {Result :=} DsFromSql(sql, IvDs);
end;

class procedure TDbaRec.HChildsDs(const IvTbl, IvFldCsv: string; const IvId: integer; var IvDs: TDataSet; IvWhere, IvOrderBy: string; InIncludeObj: boolean);
var
  fls, fl2, fl3, sql, wer, oby: string; // fieldlist, 2, 3, sql, where, orderby
begin

  {$REGION 'help'}
  {
  FldId, FldPId, FldLevel, FldState, FldObjectKind, FldContentKind, FldPath (+ IvFldCsv optional)
  }
  {$ENDREGION}

  {$REGION 'zip'}
  // fields
  fls := IvFldCsv.Trim;
  if fls.IsEmpty then
    fls := TSqlRec.FldMainFromTbl(IvTbl);
  fl2 := ', ' + fls;
  fl3 := fl2.Replace(', Fld', ', ng.Fld');

  // where
  if IvWhere.IsEmpty then
    if not InIncludeObj then
      IvWhere := 'FldLevel <> 0';
  wer := TSqlRec.WhereEnsure(IvWhere);

  // orderby
  if IvOrderBy.IsEmpty then
    IvOrderBy := fls;
  oby := TSqlRec.OrderByEnsure(IvOrderBy);
  {$ENDREGION}

  {$REGION 'query'}
  sql :=         {recursive cte}
                 'with childs (FldId, FldPId, FldLevel, FldState, FldObjectKind, FldContentKind, FldPath' + fl2 + ') as ('
//+ sLineBreak + '    -- fixed part, anchor, 1st generation or level'
  + sLineBreak + '    select FldId, FldPId, 0 as FldLevel, FldState, FldObjectKind, FldContentKind, ''\'' + convert(varchar(max), FldId) as FldPath' + fl2
  + sLineBreak + '    from ' + IvTbl + ' as fg'        // firstgeneration
  + sLineBreak + '    where FldId = ' + IntToStr(IvId) // root
  + sLineBreak + '  union all'
//+ sLineBreak + '    -- recursive part, next generation'
  + sLineBreak + '    select ng.FldId, ng.FldPId, pa.FldLevel-1 as FldLevel, ng.FldState, ng.FldObjectKind, ng.FldContentKind, pa.FldPath + ''\'' + convert(varchar(max), ng.FldId) as FldPath' + fl3
  + sLineBreak + '    from ' + IvTbl + ' as ng'        // nextgeneration
  + sLineBreak + '    inner join childs  as pa'        // references the whole cte as parent
  + sLineBreak + '    on (ng.FldPId = pa.FldId)'
  + sLineBreak + ')'
//+ sLineBreak + '-- statement that call the cte'
  + sLineBreak + 'select *'
  + sLineBreak + 'from childs'
  + sLineBreak + wer
  + sLineBreak + oby
  + sLineBreak + 'option(maxrecursion 32767)' // in calling the cte, by default it is 100
  ;
  {$ENDREGION}

  {Result :=} DsFromSql(sql, IvDs);
end;

class function  TDbaRec.HTreeDs(const IvTbl, IvFldCsv: string; const IvId: integer; var IvDs: TDataSet; var IvFbk: string; IvWhere, IvOrderBy: string): boolean;
var
  aff: integer;
  fls, fl2, fl3, fld, wer, oby, sql: string; // fieldlist, field, where, orderby
begin

  {$REGION 'help'}
{                                                            default fields                                                                         IvFldCsv[0] (mainfield)   IvFldCsv[...] (otherfields)
<------------------------------------------------------------------------------------------------------------------------------------------------> <-----------------------> <-------------------------->
FldId  FldPId  FldNumber  FldLevel  FldIndex  FldPath    FldText                     FldIsLeaf  FldState  FldOrder  FldObjectKind, FldContentKind | FldObject               | FldContent, ...
78     3       12         0         1         \78        WkJs                        0          Active    NULL      Page           Js             | WkJs                    | ...
81     78      1          1         1.1       \78\81       WksStatisticsJs           0          Active    1         Page           Js             | WksStatisticsJs         | ...
82     81      1          2         1.1.1     \78\81\82      WksStatisticsDistribJs  1          Active    NULL      Page           Js             | WksStatisticsDistribJs  | ...
80     78      2          1         1.2       \78\80       WksSpcJs                  1          Active    2         Page           Js             | WksSpcJs                | ...
79     78      3          1         1.3       \78\79       WksWaferJs                1          Active    3         Page           Js             | WksWaferJs              | ...
83     78      4          1         1.4       \78\83       WksHeatMapJs              1          Active    4         Page           Js             | WksHeatMapJs            | ...

add: FldChilds
}
  {$ENDREGION}

  {$REGION 'zip'}
  // fields
  fls := IvFldCsv.Trim;
  if fls.IsEmpty then
    fls := TSqlRec.FldMainFromTbl(IvTbl);
  fld := TCsvRec.CsvRowField(fls, 0);
  fl2 := ', ' + fls; // fls
  fl3 := fl2.Replace(', Fld', ', ng.Fld'); // fl2

  // where
  wer := TSqlRec.WhereEnsure(IvWhere);

  // orderby
  if IvOrderBy.IsEmpty then
    IvOrderBy := fls;
  oby := TSqlRec.OrderByEnsure(IvOrderBy);
  {$ENDREGION}

  sql :=
    sLineBreak + 'with'
//+ sLineBreak + '  -- same level siblings numbering'
  + sLineBreak + '  numbered (FldId, FldPId, FldNumber, FldState, FldOrder, FldObjectKind, FldContentKind' + fl2 + ') as ('
  + sLineBreak + '    select FldId, FldPId, format(row_number() over (partition by FldPId order by FldOrder, ' + fld + '), ''0000'') as FldNumber, FldState, FldOrder, FldObjectKind, FldContentKind' + fl2
  + sLineBreak + '    from ' + IvTbl
  + sLineBreak + '  )'
//+ sLineBreak + '  -- recursive cte'
  + sLineBreak + ', childs (FldId, FldPId, FldNumber, FldLevel, FldIndex, FldPath, FldState, FldOrder, FldObjectKind, FldContentKind' + fl2 + ') as ('
//+ sLineBreak + '  -- fixed part, anchor, 1st generation or level'
  + sLineBreak + '    select FldId, FldPId, FldNumber, 0, cast(FldNumber as varchar(max)), ''\'' + convert(varchar(max), FldId), FldState, FldOrder, FldObjectKind, FldContentKind' + fl2
  + sLineBreak + '    from numbered as fg'             // firstgeneration
  + sLineBreak + '    where FldId = ' + IntToStr(IvId) // root
  + sLineBreak + '    union all'
//+ sLineBreak + '  -- recursive part, next childs or levels'
  + sLineBreak + '    select ng.FldId, ng.FldPId, ng.FldNumber, pa.FldLevel+1' + ', cast(case when pa.FldIndex = '''' then(cast(ng.FldNumber as varchar(max))) else (pa.FldIndex + ''.'' + cast(ng.FldNumber as varchar(max))) end as varchar(max)), pa.FldPath + ''\'' + convert(varchar(max), ng.FldId)' + ', ng.FldState, ng.FldOrder, ng.FldObjectKind, ng.FldContentKind' + fl3
  + sLineBreak + '    from numbered as ng'             // nextgeneration
  + sLineBreak + '    inner join childs as pa'         // references the whole cte as parent
  + sLineBreak + '    on (ng.FldPId = pa.FldId)'
  + sLineBreak + '  )'
  + sLineBreak + ''
//+ sLineBreak + '-- statement that call the cte'
  + sLineBreak + 'select FldId, FldPId, FldNumber, FldLevel, FldIndex, FldPath, space((FldLevel)*4) + ' + fld + ' as FldText, 0 as FldIsLeaf, FldState, FldOrder, FldObjectKind, FldContentKind' + fl2
  + sLineBreak + 'from childs'
  + sLineBreak + wer
//+ sLineBreak + oby
  + sLineBreak + 'order by FldIndex'
  + sLineBreak + 'option(maxrecursion 32767)' // in calling the cte, by default it is 100
  ;
  Result := DsFromSql(sql, IvDs, aff, IvFbk);
end;

class function  TDbaRec.HIsDescendant(const IvTbl: string; const IvId, IvPId: integer): boolean;
var
  sql: string;
  iid, pid: integer;
begin
  Result := IvId = IvPId;
  if Result then
    Exit;

  iid := IvId;
  repeat
    sql := Format('select FldPId from %s where FldId = %d', [IvTbl, iid]);
    pid := TDbaRec.Scalar(sql, 0);
    Result := pid = IvPId;
    if Result then
      Exit
    else
      iid := pid;;
  until (iid = 0); // Root
end;

class function  TDbaRec.ObjTblHasField(const IvObj, IvFld: string): boolean;
var
  sql, fld: string;
begin
  if IvFld.StartsWith('Fld') then
    fld := IvFld
  else
    fld := 'Fld' + IvFld;
  sql := Format('select 1 as FldResult from Dba%s.INFORMATION_SCHEMA.COLUMNS where TABLE_CATALOG = ''Dba%s'' and TABLE_NAME = ''Tbl%s'' and COLUMN_NAME = ''%s''', [IvObj, IvObj, IvObj, fld]);
  Result := Scalar(sql, 0) = 1;
end;
    {$ENDREGION}

    {$REGION 'other'}
class function  TDbaRec.SelectVec<T>(const IvSql: string{; var IvFbk: string}): TArray<T>; // https://en.delphipraxis.net/topic/3549-records-generics-and-rtti-meets-firedac
var
//swt: TStopWatch;
  sql: string;
  con: TADOConnection;     // *** IMPLEMENT LIKE CsvFromSql so usign centralized with Rv in DsFromSql ***
  qyr: TADOQuery;          // query
  ret: boolean;            // retry
  rtm: string;             // retrymsg
  rty: TRTTIType;          // rtype
  rfl: TArray<TRTTIField>; // recordfields
  fna: string;             // fieldname
  fty: TRttiType;          // fieldtype
  dfl: TArray<TField>;     // dbfields
  flx, rwx, rwz: integer;  // fieldidx, rowidx, rowcount
begin
  ret := false;
  sql := grva.Rva(IvSql);

  repeat
    try
    //swt := TStopWatch.StartNew;
      rty := TRTTIContext.Create.GetType(TypeInfo(T));

      if ret then
        rtm := '#retry '
      else
        rtm := '';
    //IvFbk := IvFbk + rtm + 'SelectArray<' + rty.QualifiedName + '>("' + sql+ '") ';

      con := TADOConnection.Create(nil);
      con.ConnectionString := DBA_CONNECTION_STR;
      con.LoginPrompt := false;
      qyr := TADOQuery.Create(nil);
      qyr.Connection := con;
    //qyr.ResourceOptions.ParamCreate := false;
    //qyr.FetchOptions.Mode := fmAll;
    //qyr.CursorType.Unidirectional := Unidirectional;
      qyr.SQL.Text := sql;
      try
        qyr.Open;
        rwz := qyr.RecordCount;
        if (qyr.FieldCount >= 1) and (rwz > 0) then begin
          // fetch field list from record type
          rfl := rty.GetFields;

          try
            // lookup record fields in database result set. will raise exception if field not found
            for flx := Low(rfl) to High(rfl) do begin
              fty := rfl[flx].FieldType;
              if not (fty.TypeKind in [tkInteger, tkChar, tkFloat, tkString, tkUString]) then
                continue;
              fna := 'Fld' + rfl[flx].Name; // fieldname from recorditemname
              SetLength(dfl, Length(dfl)+1);
              dfl[Length(dfl)-1] := qyr.FieldByName(fna);
            end;
          except
            on e: Exception do begin
            //IvFbk := IvFbk + ' - Field ' + rty.QualifiedName + '.' + fna + ' was not found in result set';
              glog.Log(e{, sql});
              raise;
            end;
          end;

          // for each row in the result set
          SetLength(Result, rwz);
          for rwx := 0 to rwz - 1 do begin
            // for each field in the record, transfer row-field to record-field
            for flx := Low(dfl) to High(dfl) do begin
              if rfl[flx].FieldType.TypeKind  = tkEnumeration then
                rfl[flx].SetValue(@Result[rwx], TValue.FromOrdinal(rfl[flx].FieldType.Handle, dfl[flx].AsInteger))
              else
                rfl[flx].SetValue(@Result[rwx], TValue.FromVariant(dfl[flx].Value));
            end;
            qyr.Next;
          end;

        //IvFbk := IvFbk + ' returned ' + rwz.ToString + ' rows in ' + swt.Elapsed.ToString;

        end else
          SetLength(Result, 0);

      finally
        qyr.Free;
        con.Close;
        con.Free;
      end;
      ret := false;
    except
      on e: Exception do begin
      //IvFbk := IvFbk + e.Message;
        glog.Log(e{, sql});
        raise;
      end;
    end;
  until not ret;
end;
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'TDicRec'}
class function TDicRec.DicStrStrFromKeyValueCsv(IvKeyValueCsv: string; IvSeparator: string): TDictionary<string, string>;
var
  kvs: TArray<string>; // keyvaluepairs
  kvp: string;         // keyvaluepair
  key, val: string;    // key, value
begin
  Result := TDictionary<string, string>.Create;
  kvs := IvKeyValueCsv.Split([IvSeparator]);
  for kvp in kvs do begin
    key := kvp.Split(['='])[0];
    val := kvp.Split(['='])[1];
    Result.Add(key, val);
  end;
end;

class function TDicRec.DicValueFromKeyFromKeyValueCsv(IvKey, IvKeyValueCsv, IvDefault, IvSeparator: string): string;
var
  dic: TDictionary<string, string>;
begin
  dic := TDicRec.DicStrStrFromKeyValueCsv(IvKeyValueCsv, ';');
  try
    if not dic.TryGetValue(IvKey, Result) then
      Result := IvDefault;
  finally
    dic.Free;
  end;
end;
  {$ENDREGION}

  {$REGION 'TDocRec'}
class function TDocRec.DocKindVector: TArray<string>;
begin
  Result := [
    'Document'
  , 'Procedure'
  ];
end;
  {$ENDREGION}

  {$REGION 'TDosRec'}
class function TDosRec.DosIsValid(IvDosCommands: string; var IvFbk: string): boolean;
begin
//IvFbk := 'DOS batch script is not valid';
  IvFbk := 'DOS batch script is valid (' + NOT_IMPLEMENTED_STR + ')';
  Result := true;
end;

class function TDosRec.DosExec(IvCommandLine: string; var IvOutput: string; IvWorkDir: string): boolean;
var
  wdi: string;                    // workdir
  byz: cardinal;                  // bytesread
  acb: array[0..255] of AnsiChar; // buffer
  okk: boolean;
  sat: TSecurityAttributes;
  sti: TStartupInfo;
  pri: TProcessInformation;
  sor, sow: THandle;              // stdoutpiperead, stdoutpipewrite
begin
  // init
  IvOutput := '';
  wdi := IvWorkDir;

  // security
  with sat do begin
    nLength := SizeOf(sat);
    bInheritHandle := true;
    lpSecurityDescriptor := nil;
  end;

  // iopipes
  CreatePipe(sor, sow, @sat, 0);
  try
    // startupinfo
    with sti do begin
      FillChar(sti, SizeOf(sti), 0);
      cb          := SizeOf(sti);
      dwFlags     := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput   := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdin
      hStdOutput  := sow;
      hStdError   := sow;
    end;

    // processinfo
    Result := CreateProcess(nil, PChar('cmd.exe /C ' + IvCommandLine), nil, nil, true, 0, nil, PChar(wdi), sti, pri); // *** use win.WinNewProcess ***
    if Result then
      try
        repeat
          okk := ReadFile(sor, acb, 255, byz, nil);
          if byz > 0 then begin
            acb[byz] := #0;
            IvOutput := IvOutput + string(acb);
          end;
        until not okk or (byz = 0);
        WaitForSingleObject(pri.hProcess, INFINITE);
      finally
        CloseHandle(pri.hThread);
        CloseHandle(pri.hProcess);
      end;
  finally
    CloseHandle(sow);
    CloseHandle(sor);
  end;
end;
  {$ENDREGION}

  {$REGION 'TDstRec'}

    {$REGION 'filter'}
class procedure TDstRec.DsFilterList(IvDs: TDataSet; IvStrToSearch, IvFieldToSearchCsv, IvFieldToShowInList: string; IvStringList: TStrings);
var
  oid: integer;
  etr: string; // entry
  bkm: TBookmark;
begin
  // exit
  if IvStrToSearch = '' then
    Exit;

  // listload
  bkm := IvDs.GetBookmark;
  IvDs.DisableControls;
  try
    IvDs.FilterOptions := [foCaseInsensitive, foNoPartialCompare];
    IvDs.Filter := TSqlRec.SqlFilter(IvStrToSearch, IvFieldToSearchCsv);
    IvDs.Filtered := true;
    try
      IvStringList.Clear;
      if IvDs.IsEmpty then
        IvStringList.Add('No results')
      else begin
        IvDs.First;
        while not IvDs.Eof do begin
          oid := IvDs.FieldByName('FldId').AsInteger;
          etr := Format('%4d - %s', [oid, IvDs.FieldByName(IvFieldToShowInList).AsString]);
        //IvStringList.Add(etr);                     // addthestring
          IvStringList.AddObject(etr, TObject(oid)); // addthestringandtheid
          IvDs.Next;
        end;
      end;
    finally
      IvDs.Filtered := false;
      IvDs.Filter := '';
    end;
  finally
    IvDs.GotoBookmark(bkm);
    IvDs.EnableControls;
  end;
end;
    {$ENDREGION}

    {$REGION 'vector'}
class procedure TDstRec.DsRecordToFldAndValueVectors(IvDs: TDataSet; var IvFldVec: TStringVector; var IvValueVec: TVariantVector; IvNoFld: boolean);
var
 {z, i,} len: integer;
  fld: TField;
  fly: TFieldType;
begin
//  z := IvDs.FieldCount;
//  SetLength(IvFldVec, z);
//  SetLength(IvValueVec, z);
//  for i := 0 to z - 1 do begin
//    IvFldVec[i]   := IvDs.Fields[i].FieldName;
//    IvValueVec[i] := IvDs.Fields[i].Value;
//    if IvNoFld then
//      Delete(IvFldVec[i], 1, 3);
//  end;

  SetLength(IvFldVec, 0);
  SetLength(IvValueVec, 0);
  for fld in IvDs.Fields do begin
    fly := fld.DataType;
    if fly in [
  //  ftUnknown
      ftString
  //, ftSmallint
    , ftInteger
  //, ftWord
    , ftBoolean
  //, ftFloat
  //, ftCurrency
  //, ftBCD
    , ftDate
    , ftTime
    , ftDateTime
  //, ftBytes
  //, ftVarBytes
  //, ftAutoInc
  //, ftBlob
  //, ftMemo
  //, ftGraphic
  //, ftFmtMemo
  //, ftParadoxOle
  //, ftDBaseOle
  //, ftTypedBinary
  //, ftCursor
  //, ftFixedChar
  //, ftWideString
  //, ftLargeint
  //, ftADT
  //, ftArray
  //, ftReference
  //, ftDataSet
  //, ftOraBlob
  //, ftOraClob
  //, ftVariant
  //, ftInterface
  //, ftIDispatch
  //, ftGuid
  //, ftTimeStamp
  //, ftFMTBcd
  //, ftFixedWideChar
  //, ftWideMemo
  //, ftOraTimeStamp
  //, ftOraInterval
  //, ftLongWord
  //, ftShortint
  //, ftByte
  //, ftExtended
  //, ftConnection
  //, ftParams
  //, ftStream
  //, ftTimeStampOffset
  //, ftObject
  //, ftSingle
  ] then begin
      len := Length(IvFldVec);
      SetLength(IvFldVec, len+1);
      SetLength(IvValueVec, len+1);
      IvFldVec[len]   := fld.FieldName;
      IvValueVec[len] := fld.Value;
      if IvNoFld then
        Delete(IvFldVec[len], 1, 3);
    end;
  end;
end;
    {$ENDREGION}

    {$REGION 'field'}
class function TDstRec.FieldValueToJsonValue(IvField: TField): string;
var
  {fld,} val, esc, quo: string; // fieldname, fieldvalue, escaped, escapedandquoted
begin
  if IvField.IsNull then
    Result := 'null'

  else begin
    val := IvField.AsString;
    esc := TJsoRec.Escape(val); // esc := StringReplace(e, '\""', '\"', [rfReplaceAll]); // fix \"" --> \"
    quo := '"' + esc + '"';

    case IvField.DataType of
      // bool
      data.DB.ftBoolean         : Result := val;

      // oid
    //data.DB.ft???             : Result := '{"$oid":"5C0C5A6DA86A3024580003F1"} // --> "_id":{"$oid":"5C0C5A6DA86A3024580003F1"}

      // guid
      data.DB.ftGuid            : Result := AnsiQuotedStr(val, '"');

      // integer
      data.DB.ftByte
    , data.DB.ftWord
    , data.DB.ftLongWord
    , data.DB.ftBCD
    , data.DB.ftFMTBcd
    , data.DB.ftInteger
    , data.DB.ftAutoInc
    , data.DB.ftSmallint
    , data.DB.ftShortint
    , data.DB.ftLargeint        : Result := IvField.Value;

    // float
      data.DB.ftFloat
    , data.DB.ftSingle
    , data.DB.ftCurrency
    , data.DB.ftExtended        : Result := IvField.Value;

      // ansistring
      data.DB.ftFixedChar
    , data.DB.ftString
    , data.DB.ftMemo            : Result := quo;

      // string
      data.DB.ftFixedWideChar
    , data.DB.ftWideString
    , data.DB.ftWideMemo        : Result := quo;

      // datetime
      data.DB.ftDate
    , data.DB.ftTime
    , data.DB.ftDateTime
    , data.DB.ftTimeStamp
    , data.DB.ftTimeStampOffset : Result := '{"$date":'           + AnsiQuotedStr(DateToISO8601(IvField.AsDateTime, false), '"') + '}';

      // bytes
      data.DB.ftStream          : Result := AnsiQuotedStr('FTSTREAM'      + IvField.Value, '"');
      data.DB.ftBlob            : Result := AnsiQuotedStr('FTBLOB'        + IvField.Value, '"');
      data.DB.ftBytes           : Result := AnsiQuotedStr('FTBYTES'       + IvField.Value, '"');
      data.DB.ftVarBytes        : SetString(Result, PChar(@IvField.AsBytes[0]), Length(IvField.AsBytes)); // try: ByteArrToStr or ByteArrToAscii
      data.DB.ftGraphic         : Result := AnsiQuotedStr('FTGRAPHIC'     + IvField.Value, '"');
      data.DB.ftTypedBinary     : Result := AnsiQuotedStr('FTTYPEDBINARY' + IvField.Value, '"');

      // variant
      data.DB.ftVariant         : Result := AnsiQuotedStr('FTVARIANT'     + IvField.Value, '"');

      // unknown
      data.DB.ftUnknown
    , data.DB.ftADT
    , data.DB.ftArray
    , data.DB.ftConnection
    , data.DB.ftCursor
    , data.DB.ftDataSet
    , data.DB.ftDBaseOle
    , data.DB.ftFmtMemo
    , data.DB.ftIDispatch
    , data.DB.ftInterface
    , data.DB.ftObject
    , data.DB.ftOraBlob
    , data.DB.ftOraClob
    , data.DB.ftOraInterval
    , data.DB.ftOraTimeStamp
    , data.DB.ftParadoxOle
    , data.DB.ftParams
    , data.DB.ftReference       : Result := AnsiQuotedStr('FTUNKNOWN'     + IvField.Value, '"');
    else
                                  Result := quo
    end;
  end;
end;

class function  TDstRec.FieldToJson(IvField: TField; IvNoFld: boolean): string;
var
  fld, val: string; // jsonvalue, fieldname
begin
  // fieldname
  fld := IvField.FieldName;
  if {fld.StartWith('Fld') and }IvNoFld then
    Delete(fld, 1, 3);

  // jsonvalue
  val := FieldValueToJsonValue(IvField);

  // end
  Result := '"' + fld + '":' + val;
end;
    {$ENDREGION}

    {$REGION 'record'}
class function  TDstRec.RecordToJson(IvDst: TDataSet; IvNoFld, IvRowNoAdd: boolean): string;
var
  i: integer;
  ron: string; // rownumber
begin
  // record
  Result := '';
  for i := 0 to IvDst.FieldCount-1 do
    Result := Result + ',' + FieldToJson(IvDst.Fields[i], IvNoFld);
  Delete(Result, 1, 1);

  // rowno
  if IvRowNoAdd then
    ron := ifthen(IvNoFld, '"No":', '"FldNo":') + IntToStr(IvDst.RecNo) + ','
  else
    ron := '';

  // finalrow
  Result := '{' + ron + Result + '}';
end;
    {$ENDREGION}

    {$REGION 'json'}
class procedure TDstRec.DstToJsonKeyValue(IvDst: TDataSet; var IvJson: string; IvNoFld: boolean);
var
  ofo: boolean; // onefieldonly
  key, val: string;
begin
  // init
  IvJson := '';
  ofo := IvDst.FieldCount < 2;

  // exit
//if ofo then
  //Exit;

  // first
  if not IvDst.Bof then
    IvDst.First;

  // rows
  while not IvDst.Eof do begin
    key := IvDst.Fields[0].AsString;
    if ofo then
      val := key
    else
      val := IvDst.Fields[1].AsString;
    val := REST.Json.TJson.JsonEncode(val);
    IvJson := IvJson + ',' + Format('"%s": "%s"', [key, val]);
    IvDst.Next;
  end;
  IvDst.First;

  // strip1stcomma
  if Length(IvJson) > 0 then
    Delete(IvJson, 1, 1);

  // keyvalue
  IvJson := '{' + IvJson + '}'; // may returns {}
end;

class function  TDstRec.DstToJson(IvDst: TDataSet; var IvJson: string; IvNoFld, IvRowNoAdd: boolean): integer;
begin
  // init
  Result := 0;
  IvJson := '';

  // first
  if not IvDst.Bof then
    IvDst.First;

  // rows
  while not IvDst.Eof do begin
    IvJson := IvJson + ',' + RecordToJson(IvDst, IvNoFld, IvRowNoAdd);
    IvDst.Next;
    Inc(Result);
  end;
  IvDst.First;
  if Length(IvJson) = 0 then
    Exit;

  //strip1stcomma
  Delete(IvJson, 1, 1);
end;
    {$ENDREGION}

    {$REGION 'xml'}
class function TDstRec.DstToXml(IvDst: TDataSet; var IvXml: string; IvNoFld, IvRowNoAdd: boolean): integer;
begin
  // init
  Result := 0;
  IvXml := NOT_IMPLEMENTED_STR;
end;
    {$ENDREGION}

    {$REGION 'txt'}
class procedure TDstRec.DstToTxt(IvDst: TDataSet; var IvTxt: string; IvNoFld, IvRowNoAdd, IvHeaderAdd: boolean);
begin
  DstToCsv(IvDst, IvTxt, IvNoFld, IvRowNoAdd, IvHeaderAdd);
end;

class procedure TDstRec.DstToCsv(IvDst: TDataSet; var IvCsv: string; IvNoFld, IvRowNoAdd, IvHeaderAdd: boolean);
var
  row, col: integer;
  lin: string;
begin
  // init
  IvCsv := '';
  if IvDst.IsEmpty or (not Assigned(IvDst.Fields)) then
    Exit;

  // header (field names as columns)
  if IvHeaderAdd then begin
    lin := '';
    for col := 0 to IvDst.FieldCount - 1 do
      lin := lin + ',' + IvDst.Fields[col].FieldName; // str.QuoteDbl(IvDs.Fields[c].FieldName)

    if IvRowNoAdd then
      lin := 'FldNo' + lin
    else
      Delete(lin, 1, 1);

    if IvNoFld then
      IvCsv := StringReplace(lin, 'Fld', '', [rfReplaceAll]) // Delete(l, 1, 3)
    else
      IvCsv := lin;
  end;

  // body
  row := 0;
  IvDst.First;
  while not IvDst.Eof do begin
    Inc(row);
    lin := '';
    for col := 0 to IvDst.FieldCount - 1 do
      lin := lin + ',' + IvDst.Fields[col].AsString; // str.QuoteDbl(IvDs.Fields[c].FieldName)

    if IvRowNoAdd then
      lin := IntToStr(row) + lin // lin := lin + ', ' + str.DQuote(Format('%.*d', [Length(IntTostr(IvDs.RecordCount)), row]));
    else
      Delete(lin, 1, 1);

    IvCsv := IvCsv + sLineBreak + lin;

    IvDst.Next;
  end;

  // remove 1st newline
  if not IvHeaderAdd then
    Delete(IvCsv, 1, 2);

  // end
  IvDst.First;
end;

class procedure TDstRec.DstToHtml(IvDst: TDataSet; var IvHtml: string; IvNoFld, IvRowNoAdd, IvHeaderAdd: boolean);
var
  row, col: integer;
  lin: string;
begin
  // exit
  if not Assigned(IvDst.Fields) then begin
    IvHtml := 'No Data (dataset not assigned)';
    Exit;
  end;
  if IvDst.IsEmpty or (not Assigned(IvDst.Fields)) then begin
    IvHtml := 'No Data (dataset is empty)';
    Exit;
  end;

  // header
  if IvHeaderAdd then begin
    lin := '';
    for col := 0 to IvDst.FieldCount - 1 do
      lin := lin + '<th style="text-align: left;">' + IvDst.Fields[col].FieldName + '</th>';

    if IvRowNoAdd then
      lin := '<th>FldNo</th>' + lin;

    if IvNoFld then
      IvHtml := StringReplace(lin, 'Fld', '', [rfReplaceAll]);

    IvHtml := '<tr>' + lin + '</tr>';
  end;

  // body
  row := 0;
  IvDst.First;
  while not IvDst.Eof do begin
    Inc(row);
    lin := '';
    for col := 0 to IvDst.FieldCount - 1 do
      lin := lin + '<td>' + IvDst.Fields[col].AsString + '</td>';

    if IvRowNoAdd then
      lin := '<td>' + IntToStr(row) + '</td>' + lin;

    IvHtml := IvHtml + sLineBreak + '<tr>' + lin + '</tr>';

    IvDst.Next;
  end;

  // finish
  IvHtml := '<table>' + sLineBreak + IvHtml + sLineBreak + '</table>';

  // end
  IvDst.First;
end;
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'TEnuRec'}
// str := GetEnumName(TypeInfo(TMyType), Ord(value));

class function TEnuRec.EnumToInt<T>(const IvEnumValue: T): integer;
begin
  Result := 0;
  Move(IvEnumValue, Result, sizeOf(IvEnumValue));
end;

class function TEnuRec.EnumToStr<T>(IvEnumValue: T; IvRootRemove: boolean): string;
begin
  Result := GetEnumName(TypeInfo(T), EnumToInt(IvEnumValue));
  if IvRootRemove then
    repeat
      Delete(Result, 1, 1);
    until Result[1].IsUpper;
end;

class function TEnuRec.EnumFromInt<T>(IvEnumInt: integer; IvDefault: T): T;
begin
//try
  //Result := T(IvEnumInt);
//except
    Result := IvDefault;
//end;
end;

class function TEnuRec.EnumFromStr<T>(IvEnumStr: string; IvDefault: T): T;
var
  typ: PTypeInfo; // type
  int: integer;   // tmp
  ptr: pointer;   // tmp
begin
  typ := TypeInfo(T);
  int := GetEnumValue(typ, IvEnumStr);
  if int < 0 then
    Result := IvDefault
  else begin
    ptr := @int;
    Result := T(ptr^);
  end;
end;
  {$ENDREGION}

  {$REGION 'TEnvRec'}
class function TEnvRec.EnvIsDev: boolean;
begin
  Result := SameText(ENV_DEV_HOST, TNetRec.Host);
end;

class function TEnvRec.EnvIsTest: boolean;
begin
  Result := SameText(ENV_TEST_HOST, TBynRec.BinaryName);
end;

class function TEnvRec.EnvIsProd: boolean;
begin
  Result := SameText(ENV_PROD_HOST, TBynRec.BinaryName);
end;
{$ENDREGION}

  {$REGION 'TEscRec'}
class function TEscRec.CharEscape(IvTxt: string): string;
const
  ESC: array[0..1] of TKvaRec = (
    (K: '\['; V: '&#91;')
  , (K: '\]'; V: '&#93;')
  );
var
  i: integer;
begin
  Result := IvTxt;
  for i := 0 to High(ESC) do
    Result := StringReplace(Result, ESC[i].K, ESC[i].V, [rfReplaceAll]);
end;

class function TEscRec.CharUnEscape(IvTxt: string): string;
const
  UNESC: array[0..3] of TKvaRec = (
    (K: '&#91;'; V: '['), (K: '&amp;#91;'; V: '[')
  , (K: '&#93;'; V: ']'), (K: '&amp;#93;'; V: ']')
  );
var
  i: integer;
begin
  Result := IvTxt;
  for i := 0 to High(UNESC) do
    Result := StringReplace(Result, UNESC[i].K, UNESC[i].V, [rfReplaceAll]);
end;
  {$ENDREGION}

  {$REGION 'TFbkRec'}
procedure TFbkRec.Init(IvMsg, IvDesc: string; IvFbkModeEnum: TFbkModeEnum);
begin
  Msg         := IvMsg;
  Description := IvDesc;
  Mode        := IvFbkModeEnum;
end;

{
procedure TFbkRec.InfoSet(IvMsg: string);
begin
  Msg   := IvMsg;
  Mode  := TFbkModeEnum.fmInfo;
end;

procedure TFbkRec.SuccessSet(IvMsg: string);
begin
  Msg   := IvMsg;
  Mode  := TFbkModeEnum.fmSuccess;
end;

procedure TFbkRec.WarningSet(IvMsg: string);
begin
  Msg   := IvMsg;
  Mode  := TFbkModeEnum.fmWarning;
end;

procedure TFbkRec.DangerSet(IvMsg: string);
begin
  Msg   := IvMsg;
  Mode  := TFbkModeEnum.fmDanger;
end;
}

class function TFbkRec.W(IvWarning: string): string;
begin
  Result := Format('%s: %s', [WARNING_STR, IvWarning]);
end;

class function TFbkRec.WFmt(IvFormatString: string; IvVarRecVector: array of TVarRec): string;
begin
  Result := W(Format(IvFormatString, IvVarRecVector));
end;

class function  TFbkRec.ExistsStr(IvSubj, IvObj: string; IvBoolean: boolean): string;
begin
  if IvBoolean then
    Result := Format('%s %s exists', [IvSubj, IvObj])
  else
    Result := Format('%s %s does not exists', [IvSubj, IvObj]);
end;
  {$ENDREGION}

  {$REGION 'TFsyRec'}

    {$REGION 'dir'}
class function TFsyRec.DirExists(IvDir: string; var IvFbk: string): boolean;
begin
  Result := System.SysUtils.DirectoryExists(IvDir);
  if Result then
    IvFbk := 'Directory exists'
  else
    IvFbk := 'Directory does not exists';
end;

class function TFsyRec.DirForce(IvDir: string; var IvFbk: string): boolean;
begin
  Result := System.SysUtils.ForceDirectories(IvDir);
  if Result then
    IvFbk := 'Directory(ies) created'
  else
    IvFbk := 'Unable to create directory(ies)';
end;
    {$ENDREGION}

    {$REGION 'file'}
class function TFsyRec.FileExists(IvFile: string; var IvFbk: string): boolean;
//var
//  f: file;
begin
//{$I-}
//AssignFile(f, IvFile);
//FileMode := 0; // set file access to read only
//Reset(f);
//CloseFile(f);
//{$I+}
//Result := (IOResult = 0) and (IvFile <> '');

  Result := System.SysUtils.FileExists(IvFile);
  IvFbk := TFbkRec.ExistsStr('File', IvFile, Result);
end;

class function TFsyRec.FileCreate(IvFile, IvText: string): boolean;
var
  sli: TStringList;
begin
  sli := TStringList.create;
  try
    sli.Text := IvText;
    try
      sli.SaveToFile(IvFile);
      Result := true;
    except
      on e: Exception do begin
        glog.Log(e);
        Result := false;
      //raise;
      end;
    end;
  finally
    sli.Free
  end;
end;

class function TFsyRec.FileDeleteByWildcards(IvDir, IvPattern: string; var IvFbk: string; IvDeleteReadOnlyFiles: boolean): boolean;
var
  // i
//pat: string; // path
//ser: TSearchRec;
  // ii
  fsp, fbk: string; // file
begin
  // i
//pat := IncludeTrailingPathDelimiter(IvDir);
//if FindFirst(pat + IvPattern, faAnyFile, s) = 0 then
//  try
//    repeat
//      System.SysUtils.DeleteFile(pat + s.Name);
//    until System.SysUtils.FindNext(ser) <> 0;
//  finally
//    System.SysUtils.FindClose(ser);  // free resources on successful find
//  end;

  // ii
  for fsp in TDirectory.GetFiles(IvDir, IvPattern) do begin
    if IvDeleteReadOnlyFiles then
      FileAttrReadOnlyUnset(fsp, fbk);
    TFile.Delete(fsp);
  end;

  IvFbk := 'Ok';
  Result := true;
end;

class function TFsyRec.FileOpenAsText(const IvFile: string; var IvFbk: string): boolean;
var
  sxi: TShellExecuteInfo;
begin
  ZeroMemory(@sxi, SizeOf(sxi));
  sxi.cbSize := SizeOf(sxi);
  sxi.fMask := SEE_MASK_CLASSNAME;
  sxi.lpFile := PChar(IvFile);
  sxi.lpClass := '.txt';
  sxi.nShow := SW_SHOWNORMAL;
  Result := FileExists(IvFile, IvFbk);
  if Result then begin
    Result := ShellExecuteEx(@sxi);
    IvFbk := 'File opened as text file using the default text editor';
  end;
end;

class function TFsyRec.FileNameClean(const IvFileName: string; const IvReplaceWith: Char): string;
var
  i: integer;
begin
  Result := IvFileName;
  for i := Low(Result) to High(Result) do begin
    if not TPath.IsValidFileNameChar(Result[i]) then
      Result[i] := IvReplaceWith;
  end;
end;
    {$ENDREGION}

    {$REGION 'fileattr'}
class function TFsyRec.FileAttrSet(const IvFile: string; const IvAttr: dword; const IvSet: boolean): boolean;
var
  fla, fln: dword; // flags, newflags
begin
  fla := GetFileAttributes(PChar(IvFile));
  Result := not (fla = INVALID_FILE_ATTRIBUTES);

  if not Result then
    Exit;

  // setunset
  if IvSet then begin
    fln := fla or IvAttr
  end else begin
    fln := fla and not IvAttr;
  end;
  Result := (fln = fla) or SetFileAttributes(PChar(IvFile), fln);
end;

class function TFsyRec.FileAttrReset(const IvPath, IvMask: string; IvRecursive: boolean): boolean;
var
  res: integer; // result
  ser: TSearchRec;
begin
  Result := true;

  // find1stbutonlyfiles
  res := FindFirst(IvPath + IvMask, faAnyFile, ser); // find only files
  while res = 0 do begin                             // if res=0 find was successful
    FileSetAttr(IvPath + ser.Name, 0);               // reset all flags
    res := FindNext(ser);                            // findnextfileindir
  end;
  System.SysUtils.FindClose(ser);

  // continueinsidedirs?
  if not IvRecursive then
    Exit;

  // find1stdir
  res := FindFirst(IvPath + '*.*', faDirectory, ser);       // find only directores
  while res = 0 do begin
    if (ser.Name <> '.') and (ser.Name <> '..') then
      FileAttrReset(IvPath + ser.Name + '\', IvMask, true); // RECURSIVE
    res := FindNext(ser);                                   // findnextfileindir
  end;
  System.SysUtils.FindClose(ser);
end;

class function TFsyRec.FileAttrReadOnlySet(IvFile: string; var IvFbk: string): boolean;
begin
  {.$WARN SYMBOL_PLATFORM OFF}
//Result := FileSetAttr(IvFile, FileGetAttr(IvFile) or System.SysUtils.faReadOnly) = 0;
  {.$WARN SYMBOL_PLATFORM ON}

  Result := FileAttrSet(IvFile, FILE_ATTRIBUTE_READONLY, true);

  if Result then
    IvFbk := Format('File %s set to read only', [IvFile])
  else
    IvFbk := Format('Unable to set file %s to read only', [IvFile]);
end;

class function TFsyRec.FileAttrReadOnlyUnset(IvFile: string; var IvFbk: string): boolean;
begin
  Result := FileAttrSet(IvFile, FILE_ATTRIBUTE_READONLY, false);

  if Result then
    IvFbk := Format('File %s set to normal read/write', [IvFile])
  else
    IvFbk := Format('Unable to set file %s to normal read/write', [IvFile]);
end;
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'TFrmRec'}
class procedure TFrmRec.FormStayOnTop(IvFormHandle: HWND; IvOn: boolean);
begin
  if IvOn then
    SetWindowPos(IvFormHandle, HWND_TOPMOST  , 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE)
  else
    SetWindowPos(IvFormHandle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
end;

class procedure TFrmRec.FormInit(IvForm: TForm);
var
  cap: string;
begin
  // system+binaryinfo+osuserinfo
  cap := Format('%s %s - %s', [TWksRec.ACRONYM, TBynRec.Info, TNetRec.Info]); // WKS Python Editor - osusername@ospcname.osdomain

  // +useratorgainfo
  if not gusr.Info.IsEmpty then
    cap := cap + Format(' - %s', [gusr.Info]);                                // WKS Python Editor - osusername@ospcname.osdomain - giarussi@WKS

  // +appserverinfo
  if not gaps.Info.IsEmpty then
    cap := cap + Format(' - %s', [gaps.Info]);                                // WKS Python Editor - osusername@ospcname.osdomain - giarussi@WKS - server www.wks.cloud

  // +sessioninfo
  if not gwse.Info.IsEmpty then
    cap := cap + Format(' - %s', [gwse.Info]);                                // WKS Python Editor - osusername@ospcname.osdomain - giarussi@WKS - server www.wks.cloud - winsession 123456

  // form
  IvForm.Caption := cap;
  IvForm.Position := poScreenCenter;
  IvForm.WindowState := TWindowState.wsMaximized;
end;
  {$ENDREGION}

  {$REGION 'TGraRec'}
class function  TGraRec.ClassFromExt(IvExt: String): TGraphicClass;
begin
       if (IvExt = '.ico')                      then Result := TIcon
  else if (IvExt = '.bmp')                      then Result := TBitmap
  else if (IvExt = '.jpg') or (IvExt = '.jpeg') then Result := TJpegImage
  else if (IvExt = '.png')                      then Result := TPngImage
  else if (IvExt = '.gif')                      then Result := TGifImage
  else if (IvExt = '.tif') or (IvExt = '.tiff') then Result := TWICImage
  else if (IvExt = '.wmf') or (IvExt = '.emf')  then Result := TMetafile
  else                                               Result := nil;
end;

class function  TGraRec.ClassFromStream(const IvStream: TStream): TGraphicClass;
const
  BMP_HEADER = 'BM';
  GIF_HEADER = 'GIF';
  JPG_HEADER = #$FF#$D8;
  PNG_HEADER = #137'PNG'#13#10#26#10;
var
  sts: TStringStream; // firstbytes
  spo: int64; // startposition
begin
  // remember
  spo := IvStream.Position;

  // streampos
  if IvStream.Size > 0 Then
    IvStream.Position := 0
  else
    raise Exception.Create('stream is empty');

  // stringstream
  sts := TStringStream.Create('');
  try
    sts.CopyFrom(IvStream, 512); // 8 chars should be enough
         if Pos(BMP_HEADER, sts.DataString) > 0 then Result := TBitmap
    else if Pos(GIF_HEADER, sts.DataString) > 0 then Result := TGIFImage
    else if Pos(JPG_HEADER, sts.DataString) > 0 then Result := TJPEGImage
    else if Pos(PNG_HEADER, sts.DataString) > 0 then Result := TPngImage
    else                                             Result := TGraphic;
  finally
    FreeAndNil(sts);
    // restore
    IvStream.Position := spo;
  end;
end;

class procedure TGraRec.ToBlobField(IvGraphic: TGraphic; var IvBlobField: TBlobField);
var
  mes: TMemoryStream;
begin
  mes := TMemoryStream.Create;
  try
    IvGraphic.SaveToStream(mes);
    IvBlobField.LoadFromStream(mes);
  finally
    FreeAndNil(mes);
  end;
end;

class procedure TGraRec.FromBlobField(var IvGraphic: TGraphic; IvBlobField: TBlobField);
var
  mes: TMemoryStream;
  gcl: TGraphicClass;
begin
  mes := TMemoryStream.Create;
  try
    // stream
    IvBlobField.SaveToStream(mes);

    // exit
    if mes.Size = 0 then begin
      IvGraphic := nil;
    //raise Exception.Create('Unable to load Graphic, stream loaded is empty');
      Exit;
    end;

    // graphicclass
    mes.Position := 0;
    gcl := ClassFromStream(mes);
    if not Assigned(gcl) then begin
      IvGraphic := nil;
    //raise Exception.Create('Unable to load Graphic, unable to determine image class');
      Exit;
    end;

    // graphic
    IvGraphic := gcl.Create;
    IvGraphic.LoadFromStream(mes);
  finally
    FreeAndNil(mes);
  end;
end;

class procedure TGraRec.FromByteArray(var IvGraphic: TGraphic; IvByteArray: TByteDynArray);
var
  mes: TMemoryStream;
  gcl: TGraphicClass;
begin
  // exit
  if Length(IvByteArray) = 0 then begin
    IvGraphic := nil;
  //raise Exception.Create('Unable to load graphic, bytearray is empty');
    Exit;
  end;

  // do
  mes := TMemoryStream.Create;
  try
    // stream
    TStmRec.FromByteArray(IvByteArray, mes);
    mes.Position := 0;

    // graphicclass
    gcl := ClassFromStream(mes);
    if not Assigned(gcl) then begin
      IvGraphic := nil;
    //raise Exception.Create('Unable to load graphic, unable to determine image class');
      Exit;
    end;

    // graphic
    IvGraphic := gcl.Create;
    IvGraphic.LoadFromStream(mes);
  finally
    FreeAndNil(mes);
  end;
end;

class function  TGraRec.PictureDlgLoad(var IvGraphic: TGraphic; var IvFbk: string): boolean;
var
  dlg: TOpenPictureDialog;
  fna: string;
  mes: TMemoryStream;
  gcl: TGraphicClass;
begin
  dlg := TOpenPictureDialog.Create(nil);
  try
    dlg.Filter := 'All (*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.ico;*.tif;*.tiff)|*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.ico;*.tif;*.tiff'
                + '|GIF Image (*.gif)|*.gif'
                + '|JPEG Image File (*.jpg)|*.jpg'
                + '|JPEG Image File (*.jpeg)|*.jpeg'
                + '|Portable Network Graphics (*.png)|*.png'
                + '|Bitmaps (*.bmp)|*.bmp'
                + '|Icons (*.ico)|*.ico'
                + '|TIFF Images (*.tif)|*.tif'
                + '|TIFF Images (*.tiff)|*.tiff';
    dlg.DefaultExt := '.png';
    Result := dlg.Execute;
    if not Result then begin
       IvFbk := 'Image not loaded';
       Exit;
    end;

    fna := dlg.FileName;
    mes := TMemoryStream.Create;
    try
      // stream
      mes.LoadFromFile(fna);

      // exit
      Result := mes.Size > 0;
      if not Result then begin
      //IvGraphic := nil;
        IvFbk := 'Unable to load Graphic, stream loaded is empty';
      //raise Exception.Create(IvFbk);
        Exit;
      end;

      // graphicclass
      mes.Position := 0;
      gcl := ClassFromStream(mes);
      if not Assigned(gcl) then begin
      //IvGraphic := nil;
        IvFbk := 'Unable to load Graphic, unable to determine image class';
      //raise Exception.Create(IvFbk);
        Exit;
      end;

      // graphic
      IvGraphic := gcl.Create;
      IvGraphic.LoadFromStream(mes);
      IvFbk := 'Image loaded';
    finally
      FreeAndNil(mes);
    end;
  finally
    dlg.Free;
  end;
end;

class function  TGraRec.PictureDlgSave(IvGraphic: TGraphic; IvFileName, IvExt: string; var IvFbk: string): boolean;
var
  dlg: TSavePictureDialog;
  fna: string;
begin
  dlg := TSavePictureDialog.Create(nil);
  try
    dlg.Filter := 'All (*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.ico;*.tif;*.tiff)|*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.ico;*.tif;*.tiff'
                + '|GIF Image (*.gif)|*.gif'
                + '|JPEG Image File (*.jpg)|*.jpg'
                + '|JPEG Image File (*.jpeg)|*.jpeg'
                + '|Portable Network Graphics (*.png)|*.png'
                + '|Bitmaps (*.bmp)|*.bmp'
                + '|Icons (*.ico)|*.ico'
                + '|TIFF Images (*.tif)|*.tif'
                + '|TIFF Images (*.tiff)|*.tiff';
    dlg.DefaultExt := IvExt;
    dlg.FileName := IvFileName + dlg.DefaultExt;
    Result := dlg.Execute;
    if Result then begin
      fna := dlg.FileName;
      IvGraphic.SaveToFile(fna);
    end;
  finally
    dlg.Free;
  end;
end;
  {$ENDREGION}

  {$REGION 'TGriRec'}
class procedure TGriRec.GriColumnsWidthSet(IvDbGrid: TDBGrid; IvWidthVector: TIntegerDynArray);
var
  i: integer;
begin
  for i := 0 to IvDbGrid.Columns.Count - 1 do begin
    IvDbGrid.Columns.Items[i].Width := {Round(}IvWidthVector[i]{[j].Width)};
  end;
end;

class procedure TGriRec.GriColumnsWidthFit(IvDbGrid: TDBGrid);
var
  i, v, w: integer;
begin
  // adjust width of each visible column based on col title or content text width
  IvDbGrid.DataSource.DataSet.DisableControls;
  try
    for i := 0 to IvDbGrid.Columns.Count - 1 do begin
      IvDbGrid.Columns.Items[i].Title.Caption.Remove(1, 3);
      v := IvDbGrid.Canvas.TextWidth(IvDbGrid.Columns[i].Title.Caption);
      w := IvDbGrid.Canvas.TextWidth(IvDbGrid.Columns[i].Field.DisplayText);
      if v < w then
        IvDbGrid.Columns[i].Width := w + 20
      else
        IvDbGrid.Columns[i].Width := v + 20;
    end;
  finally
    IvDbGrid.DataSource.DataSet.EnableControls;
  end;
end;

class procedure TGriRec.GriColumnsMemoHide(IvDbGrid: TDBGrid);
var
  i: integer;
begin
  IvDbGrid.DataSource.DataSet.DisableControls;
  try
    for i := 0 to IvDbGrid.Columns.Count-1  do
      if IvDbGrid.Columns[i].Field.IsBlob then
        IvDbGrid.Columns[i].Visible := false;
  finally
    IvDbGrid.DataSource.DataSet.EnableControls;
  end;
end;

class procedure TGriRec.GriTitleFix(IvDbGrid: TDBGrid);
var
  i: integer;
begin
  IvDbGrid.DataSource.DataSet.DisableControls;
  try
    for i := 0 to IvDbGrid.Columns.Count - 1 do
      if IvDbGrid.Columns.Items[i].Title.Caption.StartsWith('Fld') then
        IvDbGrid.Columns.Items[i].Title.Caption := IvDbGrid.Columns.Items[i].Title.Caption.Remove(0, 3);
  finally
    IvDbGrid.DataSource.DataSet.EnableControls;
  end;
end;

class procedure TGriRec.GriFix(IvDbGrid: TDBGrid);
begin
  // exit
  if not Assigned(IvDbGrid.DataSource) then
    Exit;
  if not Assigned(IvDbGrid.DataSource.DataSet) then
    Exit;
  if IvDbGrid.DataSource.DataSet.IsEmpty then
    Exit;
  if not IvDbGrid.DataSource.DataSet.Active then
    Exit;

  // nomemocold
  //GriColumnsMemoHide(IvDbGrid); // using TJvUltimDBGrid

  // fldremove
  GriTitleFix(IvDbGrid);

  // colsfit
  GriColumnsWidthFit(IvDbGrid);
end;

class function TGriRec.GriFocused: TDBGrid;
begin
  Result := nil;
  if Screen.ActiveControl is TCustomDBGrid then
    Result := Screen.ActiveControl as TDBGrid;
end;
  {$ENDREGION}

  {$REGION 'THtmRec'}
class function  THtmRec.Attr(IvAttr, IvValue: string; IvIfTrue: boolean): string;

  {$REGION 'help'}
  {
   name="Co..."
   it is used for form controls (such as <input>, <select>, <checkbox>, <radio>)
   as that's the identifier used in the POST or GET call that happens on form submission

   id="Co..."
   it is used to differentiate several element with the same name attr (several radio buttons with same name but different id)
   id attribute is used also to address a particular HTML element with CSS or JavaScript
   }
  {$ENDREGION}

var
  atr, val: string;
begin
  // exit
  if not IvIfTrue then begin
    Result := '';
    Exit;
  end;

  // attr
  atr := LowerCase(IvAttr.Trim);
  if atr.IsEmpty then begin
    Result := '';
    Exit;
  end;

  // val
  val := IvValue;
  if val.IsEmpty then begin
    Result := '';
    Exit;
  end;

  // attr="value"
       if atr = 'action'      then Result := Format(' action="%s"'      , [val     ]) // Iif(IsNa(IvAction), Request.ScriptName, IvAction)
  else if atr = 'align'       then Result := Format(' align="%s"'       , [val     ])
  else if atr = 'alt'         then Result := Format(' alt="%s"'         , [val     ])
  else if atr = 'border'      then Result := Format(' border="%s"'      , [val     ])
  else if atr = 'cellpadding' then Result := Format(' cellpadding="%s"' , [val     ])
  else if atr = 'cellspacing' then Result := Format(' cellspacing="%s"' , [val     ])
  else if atr = 'class'       then Result := Format(' class="%s"'       , [val     ])
  else if atr = 'enctype'     then Result := Format(' enctype="%s"'     , [val     ]) // Iif(IsNa(IvValue), 'application/x-www-form-urlencoded', 'multipart/form-data')
  else if atr = 'height'      then Result := Format(' height="%s"'      , [val     ])
  else if atr = 'href'        then Result := Format(' href="%s"'        , [val     ])
  else if atr = 'method'      then Result := Format(' method="%s"'      , [val     ]) // Iif(IsNa(IvMethod), 'post', IvMethod)
  else if atr = 'name'        then Result := Format(' name="%s"'        , [val     ])
  else if atr = 'id'          then Result := Format(' id="%s"'          , [val     ])
  else if atr = 'nameid'      then Result := Format(' name="%s" id="%s"', [val, val])
  else if atr = 'placeholder' then Result := Format(' placeholder="%s"' , [val     ])
  else if atr = 'script'      then Result := ' '                        +  val
  else if atr = 'selected'    then Result := System.StrUtils.ifthen(IvValue.IsEmpty, ' selected', '')
  else if atr = 'size'        then Result := Format(' size="%s"'        , [val     ])
  else if atr = 'src'         then Result := Format(' src="%s"'         , [val     ])
  else if atr = 'style'       then Result := Format(' style="%s"'       , [val     ])
  else if atr = 'target'      then Result := Format(' target="%s"'      , [val     ])
  else if atr = 'title'       then Result := Format(' title="%s"'       , [val     ])
  else if atr = 'type'        then Result := Format(' type="%s"'        , [val     ])
  else if atr = 'valign'      then Result := Format(' valign="%s"'      , [val     ])
  else if atr = 'value'       then Result := Format(' value="%s"'       , [val     ])
  else if atr = 'width'       then Result := Format(' width="%s"'       , [val     ])
  else                             Result := '';
end;

class function  THtmRec.AttrFromVec(IvAttr: string; IvValueVec: TStringVector): string;
var
  i: integer;
  x, s: string;
begin
  Result := '';
  if TVecRec.VecNx(IvValueVec) then
    Exit;
  for i := Low(IvValueVec) to High(IvValueVec) do begin
    x := IvValueVec[i].Trim;
    if x.IsEmpty then
      continue;
    s := s + ' ' + x;
  end;
  s := s.Trim;
  if not s.IsEmpty then
    Result := Format('%s="%s"', [IvAttr.ToLower, s]);
end;

class function  THtmRec.AttrClassFromVec(IvClassVec: TStringVector): string;
begin
  Result := AttrFromVec('class', IvClassVec);
end;

class function  THtmRec.AttrStyleFromVec(IvStyleVec: TStringVector): string;
begin
  Result := AttrFromVec('style', IvStyleVec);
end;

class procedure THtmRec.ValAdd(var IvValuesCurr: string; IvValuesToAdd: string; IvSep: string; IvIfTrue: boolean);
begin
  if IvIfTrue and not TStrRec.StrHas(IvValuesCurr, IvValuesToAdd) then
    IvValuesCurr := IvValuesCurr + IvSep + IvValuesToAdd;
end;

class function  THtmRec.IdName(IvCoName: string): string;
begin
  Result := Attr('nameid', TNamRec.Co(IvCoName));
end;

class function  THtmRec.A(IvHref, IvCaption, IvTitle, IvTarget, IvClass, IvStyle: string): string;
var
  cap, tgt: string;
begin
  if not IvCaption.IsEmpty then cap := IvCaption else cap := IvHref; // 'Link';
  if IvTarget.IsEmpty      then tgt := 'target="_blank"';            // =samewindow, _blank=newwindow, _parent=parentframe, _top=fullbodywindow

  Result := Format('<a href="%s" class="%s" style="%s" title="%s" %s>%s</a>', [IvHref, IvClass, IvStyle, IvTitle, tgt, cap]);
end;

class function  THtmRec.H(IvLevel: integer; IvTitle, IvClass, IvStyle: string): string;
begin
  Result := Format('<h%d class="%s w3-opacity" style="%s">%s</h%d>', [IvLevel, IvClass, IvStyle, IvTitle, IvLevel]);
end;

class function  THtmRec.P(IvContent: string; IvDimmed: boolean = false; IvItalic: boolean = false): string;
var
  cla, sty: string;
begin
  cla := ''; // w3-wide, w3-left-align, w3-right-align
  sty := '';
  Result := Format('<p class="%s w3-opacity" style="%s">%s</p>', [cla, sty, IvContent]);
end;

class function  THtmRec.Br(IvCount: integer): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to IvCount do
    Result := Result + '<br>';
end;

class function  THtmRec.Hr(IvWidthPerc: integer; IvColor: string): string;
begin
  Result := Format('<hr style="width: %d%%;margin-left: auto;margin-right: auto;border: 1px solid %s">', [IvWidthPerc, IvColor]);
end;

class function  THtmRec.Space(IvPx: integer; IvKind: string): string;
//var
//  i: integer;
begin
  if IvKind.ToUpper.StartsWith('H') then begin
//         if IvSpacesOrPx = 1 then Result := ' '
//    else if IvSpacesOrPx = 2 then Result := ' &nbsp;'
//    else for i := 0 to IvSpacesOrPx-3 do begin Result := Result + '&nbsp;'; Result := ' ' + Result + ' '; end;
    Result := Format('<span style="display: inline-block;width: %dpx"></span>', [IvPx]);

  end else
    Result := Format('<div style="height:%dpx"></div>', [IvPx]);
end;

class function  THtmRec.Img(IvSrc, IvAlt: string; IvW, IvH: integer; IvIsCard: boolean; IvTorn: TImgTormEnum{, IvClass, IvStyle: string}): string;
var
  a, w, h, c: string;
begin
  if not IvAlt.IsEmpty then a := Format(' alt="%s"'     , [IvAlt]);
  if IvW > 0           then w := Format(' width="%dpx"' , [IvW  ]);
  if IvH > 0           then h := Format(' height="%dpx"', [IvH  ]);
  if IvIsCard          then c := ' w3-card-4';

  Result := Format('<img class="w3-image%s" onclick="wksImageModalViewerShow(this);" src="%s"%s%s%s>', [c, IvSrc, a, w, h]);

       if IvTorn = itBottom    then Result := Format('<div class="w3-shadow"><div class="w3-torn-bot">%s</div></div>'    , [Result])
  else if IvTorn = itTopBottom then Result := Format('<div class="w3-shadow"><div class="w3-torn-top-bot">%s</div></div>', [Result])
  else if IvTorn = itTop       then Result := Format('<div class="w3-shadow"><div class="w3-torn-top">%s</div></div>'    , [Result])
end;

class function  THtmRec.Code(IvCode, IvLanguage: string): string;
begin
  Result := Format('<pre><code class="%s">%s</code></pre>', [IvLanguage, HTMLEscape(IvCode)]);
end;

class function  THtmRec.Panel(IvFbk: TFbkRec; IvDismisible: boolean): string; // *** MERGE WITH THtmRec.Collapse ***
var
  fmo, cls: string;
  sbu: TSbuRec;
begin
  fmo := TEnuRec.EnumToStr<TFbkModeEnum>(IvFbk.Mode, true);
  cls := 'w3-' + TColRec.HColW3(IvFbk.Mode);

  sbu.Add('<!-- paneldismisible%s -->'                                                                         , [fmo]);
  sbu.Add('<div class="w3-panel w3-display-container %s">'                                                     , [cls]);
  sbu.Add(  '<span class="w3-button w3-display-topright" onclick="this.parentElement.style.display=''none''">X</span>');
  sbu.Add(  '<p>%s</p>'                                                                                  , [IvFbk.Msg]);
  sbu.Add('</div>'                                                                                                    );

  Result := sbu.Text;
end;

class function  THtmRec.Collapse(IvTitle, IvSubtitle, IvBody: string; IvHhLevel: integer; IvCoName: string; IvTitlesCenter, IvPanelOn, IvPanelClosed: boolean): string;
var
  sbu: TSbuRec;
  con, cls: string; // coname, class
  hlv: integer; // headerlevel
begin
  con := giif.NxD(IvCoName, TNamRec.CoNameRnd('Collapse'));
  cls := giif.Str(IvTitlesCenter, 'class="w3-center"', '');
  hlv := IvHhLevel;

  sbu.Add('<!-- panel%s -->'                                                                                                        , [con]);
  sbu.Add('<h%d %s style="cursor:pointer;" onclick="w3.toggleShow(''#%s'')">%s</h%d>'                       , [hlv, cls, con, IvTitle, hlv]);
  sbu.Add('<div class="w3-cursive w3-text-gray w3-small">%s</div><br>', [IvSubtitle]                               , not IvSubtitle.IsEmpty);
  sbu.Add('<div id="%s" %s %s>', [con, giif.BTR(IvPanelOn, 'class="w3-card w3-padding"'), giif.BTR(IvPanelClosed, 'style="display:none;"')]);
  sbu.Add(IvBody);
  sbu.Add('</div>');

  Result := sbu.Text;
end;

class function  THtmRec.Alert(IvTitle, IvText, IvClass, IvStyle: string): string;
begin
  Result := sLineBreak + Format('<div %s %s>', [AttrClassFromVec(['w3-panel', 'w3-display-container', IvClass]), AttrStyleFromVec([IvStyle])])
          + sLineBreak + '<span onclick="this.parentElement.style.display=''none''" class="w3-button w3-xlarge w3-display-topright">&times;</span>'
          + sLineBreak + giif.ExFmt(IvTitle, '<h3>%s</h3>')
          + sLineBreak + giif.ExFmt(IvText, '<p>%s</p>')
          + sLineBreak + '</div>';
end;

class function  THtmRec.AlertI(IvTitle, IvText: string): string;
begin
  if IvTitle.IsEmpty then
    IvTitle := 'Info';
  Result := Alert(IvTitle, IvText, 'w3-blue');
end;

class function  THtmRec.AlertS(IvTitle, IvText: string): string;
begin
  if IvTitle.IsEmpty then
    IvTitle := 'Success';
  Result := Alert(IvTitle, IvText, 'w3-green');
end;

class function  THtmRec.AlertW(IvTitle, IvText: string): string;
begin
  if IvTitle.IsEmpty then
    IvTitle := 'Warning';
  Result := Alert(IvTitle, IvText, 'w3-orange');
end;

class function  THtmRec.AlertD(IvTitle, IvText: string): string;
begin
  if IvTitle.IsEmpty then
    IvTitle := 'Danger';
  Result := Alert(IvTitle, IvText, 'w3-red');
end;

class function  THtmRec.AlertE(IvTitle, IvText: string): string;
begin
  if IvTitle.IsEmpty then
    IvTitle := 'Error';
  Result := Alert(IvTitle, IvText, 'w3-gray');
end;

class function  THtmRec.Modal(IvShow: boolean; IvCoName, IvBody, IvHeader, IvFooter: string; IvFbkMode: TFbkModeEnum; IvCopyButtonOn: boolean): string;
  // buttons to open/close the modal
  // '<button class="w3-button" onclick="document.getElementById(''' + IvCoName + ''').style.display=''block''">Open Modal</button>'
  // '<button class="w3-button" onclick="document.getElementById(''' + IvCoName + ''').style.display=''none''">Close Modal</button>'
var
  cla: string;
  sbu: TSbuRec;
begin
  // class
  if IvFbkMode = fmNone then
    cla := 'w3-center'
  else
    cla := Format('w3-%s', [TColRec.HColW3(IvFbkMode)]);

  // html
  sbu.Add('<!-- modal%s -->', [TNamRec.CoRemove(IvCoName)]);
  sbu.Add('<div %s class="w3-modal" style="display:%s;padding-top:0px;">', [IdName(IvCoName), ifthen(IvShow, 'block', 'none')]);
  sbu.Add(  '<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:800px;margin-top:36px;margin-bottom:36px;">');

  // header
  if not IvHeader.IsEmpty then begin
  sbu.Add(    '<div class="w3-container %s">', [cla]);
//sbu.Add(    '<br>');
  sbu.Add(       BtnX(IvCoName, {gwrq.ScriptNameUrl}'', IvFbkMode));
  sbu.Add(      '<div style="margin-right: 28px;">');
  sbu.Add(         IvHeader);
  sbu.Add(      '</div>');
  sbu.Add(    '</div>');
  end;

  // body
  if not IvBody.IsEmpty then begin  // '<button class="w3-btn" onclick="copyToClipboard(''%sBody'');">Copy</button>'
    if IvCopyButtonOn then begin
  sbu.Add(    '<div class="w3-center" style="margin-top: 16px;border: 1 px solid red;">', [IvCoName]);
  sbu.Add(      Btn('Copy', 'Copy the text to the clipboard', '', '', Format('copyToClipboard(''%sBody'');', [IvCoName])));
  sbu.Add(    '</div>');
    end;
  sbu.Add(    '<div id="%sBody" class="w3-container">', [IvCoName]);
  sbu.Add(       IvBody);
  sbu.Add(    '</div>');
  end;

  // footer
  if IvFooter.IsEmpty then
    IvFooter := BtnStd('Home') {+ Space(16)} + BtnStd('Back') {+ Space(16)} + BtnOk(IvCoName);
//if not IvFooter.IsEmpty then begin
  sbu.Add(    '<div class="w3-bar w3-border-top w3-theme-l2" style="padding: 8px;">');
  sbu.Add(       IvFooter);
  sbu.Add(    '</div>');
//end;

  // close
  sbu.Add(  '</div>');
  sbu.Add('</div>');

  // end
  Result := sbu.Text;
end;

class function  THtmRec.ModalBtn(IvBtnCaption, IvCoName, IvBody, IvHeader, IvFooter: string; IvFbkMode: TFbkModeEnum; IvCopyButtonOn: boolean): string;
begin
  Result := Modal(false, IvCoName, IvBody, IvHeader, IvFooter, IvFbkMode, IvCopyButtonOn)
          + '<button class="w3-button" onclick="document.getElementById(''' + IvCoName + ''').style.display=''block''">' + IvBtnCaption + '</button> ';
end;

class function  THtmRec.GridRow(IvValueVec, IvClassVec, IvStyleVec: TArray<string>; IvBorderDgOn: boolean): string;
var
  i: integer;
  sbu: TSbuRec;
  rdg, cdb: string;
begin
  // debug
  if IvBorderDgOn then begin
    rdg := 'style="border:1px solid green;"';
    cdb := 'border:1px solid red;';
  end;

  // row
  sbu.Add('<div class="w3-row" %s>', [rdg]);
  for i := Low(IvValueVec) to High(IvValueVec) do
    sbu.Add('<div class="%s" style="%s%s">%s</div>', [IvClassVec[i], IvStyleVec[i], cdb, IvValueVec[i]]);
  sbu.Add('</div>');
  Result := sbu.Text;
end;

class function  THtmRec.Elem(IvTag, IvKind, IvCoName, IvTitle, IvValue, IvClass, IvStyle, IvTail: string; IvDisabled, IvReadOnly: boolean): string;
const
  ELEMENTS_WITHOUT_VALUE_ATTR = 'textarea';
var
  tag: string;
begin
  // zip
  tag := IvTag.Trim.ToLower;

  // open
  Result := '<'
          + tag
          + Attr('type'  , IvKind)   // if tag=input
          + Attr('nameid', IvCoName)
          + Attr('title' , IvTitle)
          + Attr('value' , IvValue, not TStrRec.StrHas(ELEMENTS_WITHOUT_VALUE_ATTR, IvTag) )
          + Attr('class' , IvClass)
          + Attr('style' , IvStyle)
        //+ disabled ?
        //+ readonly ?
          + giif.ExP(IvTail, ' ')    // something like 'attr1="value1" attr2="value2" required onclick="" ...'
          + '>';

  // close
  if not TStrRec.StrHas(','+HTM_TAG_SINGLE_CSV+',', ','+tag+',') then
    Result := Result + IvValue + '</' + tag + '>';
end;

class function  THtmRec.Choice(     IvKind, IvCoName, IvTitle: string; IvOptCaptionVec, IvOptValueVec: TArray<string>; IvClass, IvStyle, IvTail: string; IvValueVec, IvDisabledVec: TArray<string>; IvReadOnly: boolean): string;
begin
  // select
  if SameText(IvKind, 'select') then
    Result := Select  (IvCoName, IvTitle, IvOptCaptionVec, IvOptValueVec, IvClass, IvStyle, IvTail, IvValueVec, IvDisabledVec)

  // checkbox
  else if SameText(IvKind, 'checkbox') then
    Result := Checkbox(IvCoName, IvTitle, IvOptCaptionVec, IvOptValueVec, IvClass, IvStyle, IvTail, IvValueVec, IvDisabledVec)

  // radio
  else if SameText(IvKind, 'radio') then
    Result := Radio   (IvCoName, IvTitle, IvOptCaptionVec, IvOptValueVec, IvClass, IvStyle, IvTail, IvValueVec, IvDisabledVec)
  ;
end;

class function  THtmRec.Select(             IvCoName, IvTitle: string; IvOptCaptionVec, IvOptValueVec: TArray<string>; IvClass, IvStyle, IvTail: string; IvValueVec, IvDisabledVec: TArray<string>; IvReadOnly: boolean): string;
var
  i: integer;
  sbu: TSbuRec;
  cna, ona, oid, oik, oca, ova, sek, dis: string; // ctrlname, optname, optid, optidkv, optcaption, optvalue, selected|checked, disabled
begin
  // zip
  cna := IdName(IvCoName);

  // items
  for i := Low(IvOptCaptionVec) to High(IvOptCaptionVec) do begin
    // zip
    ona := Format('name="%s"', [IvCoName]);
    oid := Format('%s%d'     , [IvCoName, i]);
    oik := Format('id="%s"'  , [oid]);
    oca := IvOptCaptionVec[i];
    ova := IvOptValueVec[i];
    dis := giif.Str(TArray.Contains<string>(IvDisabledVec, ova), 'disabled', '');
    sek := giif.Str(TArray.Contains<string>(IvValueVec   , ova), 'selected', '');

    // build <option id="CoAaa0" class="w3-input" value="Ie" selected disabled>Internet Explorer</option>
    sbu.Add('<option class="w3-input" %s %s value="%s" %s %s>%s</option>', [ona, oik, ova, sek, dis, oca]);
  end;

  // pack
  Result := Format('<select %s title="%s" class="w3-select %s" style="%s" %s>', [cna, IvTitle, IvClass, IvStyle, IvTail])
    + sLineBreak + sbu.Text
    + sLineBreak + '</select>';
end;

class function  THtmRec.Checkbox(           IvCoName, IvTitle: string; IvOptCaptionVec, IvOptValueVec: TArray<string>; IvClass, IvStyle, IvTail: string; IvValueVec, IvDisabledVec: TArray<string>; IvReadOnly: boolean): string;
var
  i: integer;
  sbu: TSbuRec;
  cna, ona, oid, oik, oca, ova, sek, dis: string;
begin
  // zip
  cna := IdName(IvCoName);

  // items
  for i := Low(IvOptCaptionVec) to High(IvOptCaptionVec) do begin
    // zip
    ona := Format('name="%s"', [IvCoName]);
    oid := Format('%s%d'     , [IvCoName, i]);
    oik := Format('id="%s"'  , [oid]);
    oca := IvOptCaptionVec[i];
    ova := IvOptValueVec[i];
    dis := giif.Str(TArray.Contains<string>(IvDisabledVec, ova), 'disabled'         , '');
    sek := giif.Str(TArray.Contains<string>(IvValueVec   , ova), 'checked="checked"', '');

    // build <input type="checkbox" class="w3-check" name="CoAaa" id="CoAaa0" value="Aaa" checked="checked" disabled><label for="CoAaa0">Aaa</label>
    sbu.Add('<input type="checkbox" class="w3-check" %s %s value="%s" %s %s>&nbsp;<label for="%s">%s</label>&nbsp;&nbsp;', [ona, oik, ova, sek, dis, oid, oca]);
  end;

  // pack
  Result := Format('<p %s title="%s" class="%s" style="%s" %s>', [cna, IvTitle, IvClass, IvStyle, IvTail])
    + sLineBreak + sbu.Text
    + sLineBreak + '</p>';
end;

class function  THtmRec.Radio(              IvCoName, IvTitle: string; IvOptCaptionVec, IvOptValueVec: TArray<string>; IvClass, IvStyle, IvTail: string; IvValueVec, IvDisabledVec: TArray<string>; IvReadOnly: boolean): string;
var
  i: integer;
  sbu: TSbuRec;
  cna, ona, oid, oik, oca, ova, sek, dis: string;
begin
  // zip
  cna := IdName(IvCoName);

  // items
  for i := Low(IvOptCaptionVec) to High(IvOptCaptionVec) do begin
    // zip
    ona := Format('name="%s"', [IvCoName]);
    oid := Format('%s%d'     , [IvCoName, i]);
    oik := Format('id="%s"'  , [oid]);
    oca := IvOptCaptionVec[i];
    ova := IvOptValueVec[i];
    dis := giif.Str(TArray.Contains<string>(IvDisabledVec, ova), 'disabled'         , '');
    sek := giif.Str(TArray.Contains<string>(IvValueVec   , ova), 'checked="checked"', '');

    // build <input type="radio" class="w3-radio" name="CoAaa" id="CoAaa0" value="Aaa" checked="checked" disabled>
    sbu.Add('<input type="radio" class="w3-radio" %s %s value="%s" %s %s>&nbsp;<label for="%s">%s</label>&nbsp;&nbsp;', [ona, oik, ova, sek, dis, oid, oca]);
  end;

  // pack
  Result := Format('<p %s title="%s" class="%s" style="%s" %s>', [cna, IvTitle, IvClass, IvStyle, IvTail])
    + sLineBreak + sbu.Text
    + sLineBreak + '</p>';
end;

class function  THtmRec.Btn(IvCaption, IvTitle, IvClass, IvStyle, IvOnClick: string): string;
begin
  Result := Format('<button type="button" class="w3-button %s" style="%s" title="%s" onclick="%s">%s</button>', [IvClass, IvStyle, IvTitle, IvOnClick, IvCaption]);
end;

class function  THtmRec.BtnOk(IvCoModalName: string): string;
var
  {rid, }ock, tit, cla, sty: string; // redirectid, onclick, title, class, style
begin
  ock := {'document.getElementById(''' + IvCoModalName + ''').style.display=''none'';'} 'window.history.go(-1);';
  tit := 'Dismiss the dialog panel';
  cla := 'w3-theme-d5 w3-round-xxlarge w3-right';
  sty := 'margin: 8px;';
  Result := Btn('Ok', tit, cla, sty, ock);
end;

class function  THtmRec.BtnStd(IvKind: string; IvRedirectToPageId: integer; IvData: string): string; // *** magari gli standard li mettiamo rounded ***
var
  rid, ock, tit, cla, sty: string; // redirectid, onclick, title, class, style
begin
  if IvRedirectToPageId > 0 then
    rid := Format('?CoRedirectToPageId=%d', [IvRedirectToPageId])
  else
    rid := '';

       if SameText(IvKind, 'Close')          then begin ock := 'document.getElementById('''+IvData+''').style.display=''none'''         ; tit := 'Close modal panel'       ; cla := 'w3-theme-d5 w3-round-xxlarge' end
  else if SameText(IvKind, 'Back')           then begin ock := 'window.history.go(-1)'                                                  ; tit := 'Go to previous page'     ; cla := 'w3-theme-d5 w3-round-xxlarge' end
  else if SameText(IvKind, 'Home')           then begin ock := 'window.location.href=''' + gwrq.ScriptNameUrl + ''''                    ; tit := 'Go to home page'         ; cla := 'w3-theme-d5 w3-round-xxlarge' end
  else if SameText(IvKind, 'Login')          then begin ock := 'window.location.href=''/WksPageIsapiProject.dll/Login'+rid+''''         ; tit := 'Go to login page'        ; cla := '' end
  else if SameText(IvKind, 'LoginTry')       then begin ock := 'window.location.href=''/WksPageIsapiProject.dll/LoginTry'+rid+''''      ; tit := 'Try to login'            ; cla := '' end
  else if SameText(IvKind, 'AccountCreate')  then begin ock := 'window.location.href=''/WksPageIsapiProject.dll/AccountCreate'+rid+'''' ; tit := 'Create your new account' ; cla := 'w3-theme-l5 w3-right' end
  else if SameText(IvKind, 'AccountRecover') then begin ock := 'window.location.href=''/WksPageIsapiProject.dll/AccountRecover'+rid+''''; tit := 'Recover your account'    ; cla := 'w3-theme-l5 w3-right' end
  else                                            begin ock := 'alert(''Unknown standard button'');'                                    ; tit := 'Unknow standard button'  ; cla := '' end;

  sty := 'margin: 8px;';

  Result := Btn(TStrRec.StrExpand(IvKind), tit, cla, sty, ock);
end;

class function  THtmRec.BtnX(IvCoName: string; IvFollowLink: string; IvFbkMode: TFbkModeEnum): string;
var
  ock: string;
  cla: string;
begin
  // class
  if IvFbkMode = fmNone then
    cla := 'w3-theme-l2'
  else
    cla := Format('w3-%s', [TColRec.HColW3(IvFbkMode)]);

  // js
  ock := 'document.getElementById(''' + IvCoName + ''').style.display=''none'''; // remove also w3-show ?
  if IvFollowLink.IsEmpty then
    ock := ock + ';window.history.go(-1)'
  else
    ock := ock + ';window.location.href=''' + IvFollowLink + '''';

  // end
  Result := Format('<span class="w3-button w3-large w3-display-topright %s" title="Close Modal" onclick="%s">&times;</span>', [cla, ock]);
end;

class function  THtmRec.FormLine( IvKind, IvCoName, IvTitle: string; IvOptCaptionVec, IvOptValueVec: TArray<string>; IvClass, IvStyle, IvTail: string; IvValueVec, IvDisabledVec: TArray<string>; IvReadOnly: boolean; IvLabel, IvHelp: string; IvLabelWidth, IvHelpWidth: integer): string;

  {$REGION 'help'}
{
  form elements
  -------------
  <form>     defines an html form for user input
  <label>    defines a label for an <input> element
  <fieldset> groups related elements in a form
  <legend>   defines a caption for a <fieldset> element
  <output>   defines the result of a calculation

  form controls
  -------------
  <button>   defines a clickable button
  <input>    defines an input control
  <datalist> specifies a list of pre-defined options for input controls
  <select>   defines a drop-down list
  <option>   defines an option in a drop-down list
  <optgroup> defines a group of related options in a drop-down list
  <textarea> defines a multiline input control (text area)

  HTM_INPUT_MONO_CSV
  ------------------
  <input type="color">
  <input type="date">
  <input type="datetime-local">
  <input type="email">
  <input type="file">
  <input type="hidden">
  <input type="image">
  <input type="month">
  <input type="number">
  <input type="password">
  <input type="range">
  <input type="search">
  <input type="tel">
  <input type="text">
  <textarea>
  <input type="time">
  <input type="url">
  <input type="week">

  HTM_INPUT_MULTI_CSV
  -------------------
  <input type="checkbox">
  <input type="radio">
  <select>
  <datalist>

  HTM_INPUT_BUTTON_CSV
  --------------------
  <input type="button">
  <input type="reset">
  <input type="search">
  <input type="submit">

  wksstyle (full width)
   ---------------------------------------------------------------------------------------------------------------------
  |                       |   ----------------------------------------------------------------   |                      |
  | Label /LabelWidth     |  | inputctrl: Kind / CoName / Title / Value / Class / Style, Tail |  | Help(*) / HelpWidth  |  (*) or additional controls
  |                       |   ----------------------------------------------------------------   |                      |
   ---------------------------------------------------------------------------------------------------------------------

  ymsstyle (full width)
   ---------------------------------------------------------------------------------------------------------------------
  |                       |   ---------------------------------------------------------------------------------------   |
  | Label /LabelWidth     |  | inputctrl: Kind / CoName / Title / Value / Class / Style, Tail                        |  |
  |                       |   ---------------------------------------------------------------------------------------   |
   ---------------------------------------------------------------------------------------------------------------------

  googlestyle (width/centered)
                           ----------------------------------------------------------------------
                          |   ----------------------------------------------------------------   |
                          |  | inputctrl: Kind / CoName / Title / Value / Class / Style, Tail |  |
                          |   ----------------------------------------------------------------   |
                           ----------------------------------------------------------------------
}
  {$ENDREGION}

var
  lab{, val}, ctr, hlp: string; // label, value, htmlcontrol, helpstr/htmlcontrol2
begin
  // default
  if IvKind.Trim.IsEmpty then
    IvKind := 'text';
  if Length(IvValueVec) = 0 then begin
    SetLength(IvValueVec, 1);
    IvValueVec[0] := '';
  end;

  {$REGION 'username'}
           if SameText(IvKind, 'username') then begin
    lab := {IvLabel}'Username';
    ctr := Elem('input'   , 'text', IvCoName, IvTitle, IvValueVec[0], IvClass+' w3-input', IvStyle+' text-transform: lowercase', IvTail + ' oninput="this.value=this.value.strSpaceRemove()"');
    hlp := Btn('Generate', 'Generate your username', 'w3-padding-small', 'overflow:visible', 'var n = prompt(''What is your name?'');var s = prompt(''What is your surnamer?'');document.getElementById(''' + IvCoName + ''').value=(n.charAt(0)+s).toLowerCase();');
  //hlp := {IvHelp}'&nbsp;';
  {$ENDREGION}

  {$REGION 'password'}
  end else if SameText(IvKind, 'password') then begin
    lab := {IvLabel}'Password';
    ctr := Elem('input'   , 'password', IvCoName, IvTitle, IvValueVec[0], IvClass+' w3-input', IvStyle, IvTail);
    hlp :=         '<div style="display: flex;">'
    + sLineBreak + Btn('Generate', 'Generate a password', 'w3-padding-small', 'overflow:visible', 'document.getElementById(''' + IvCoName + ''').value=rndStr(6, ''AN'', '''')')
    + sLineBreak + Btn('Show'    , 'Show password'      , 'w3-padding-small', 'overflow:visible', 'wksInputPasswordShow(''' + IvCoName + ''')'                                 )
    + sLineBreak + '</div>';
  //hlp := {IvHelp}'&nbsp;';
  {$ENDREGION}

  {$REGION 'organization'}
  end else if SameText(IvKind, 'organization') then begin
    lab := {IvLabel}'Organization';
    ctr := Elem('input'   , 'text', IvCoName, IvTitle, IvValueVec[0], IvClass+' w3-input', IvStyle+' text-transform: lowercase', IvTail + ' oninput="this.value=this.value.strSpaceRemove()"');
    hlp := {IvHelp}'&nbsp;';
  {$ENDREGION}

  {$REGION 'else'}
  end else begin
    lab := giif.NxD(IvLabel, TNamRec.CoRemove(IvCoName));

         if TStrRec.StrHas(HTM_INPUT_MONO_CSV, IvKind) then
      ctr := Elem('input'   , IvKind, IvCoName, IvTitle, IvValueVec[0], IvClass+' w3-input', IvStyle, IvTail, {IvDisabledVec[0].ToBoolean}false, IvReadOnly)

    else if TStrRec.StrHas(HTM_INPUT_MULTI_CSV, IvKind) then
      ctr := Choice(IvKind, IvCoName, IvTitle, IvOptCaptionVec, IvOptValueVec, IvClass, IvStyle, IvTail, IvValueVec, IvDisabledVec, IvReadOnly)

  //else if TStrRec.StrHas(HTM_INPUT_BUTTON_CSV, IvKind) then
    //ctr := Button(IvKind, IvCoName, IvTitle, IvValue, IvClass, IvStyle, IvTail, IvReadOnly, IvDisabled);
    ;

    hlp := IvHelp;
  end;
  {$ENDREGION}

  {$REGION 'layout'}
  // wksstyle
  if false then
    Result := GridRow([lab                                                  , ctr                                 , hlp                                         ] // valvec
                    , ['w3-col'                                             , 'w3-col'                            , 'w3-text-italic w3-theme-text-dark w3-small'] // classvec
                    , [Format('width:%dpx; margin-top:8px;', [IvLabelWidth]), Format('width:%dpx;', [IvHelpWidth]), 'w3-rest; margin-left:8px; margin-top:10px;'] // stylevec
    )

  // ymsstyle
  else if true then
    Result := GridRow([lab              , ctr                            ] // valvec
                    , ['w3-col m4 l3'   , 'w3-col m8 l9 w3-animate-input'] // classvec
                    , ['margin-top:8px;', ''                             ] // stylevec
    )

  // googlestyle
//else if false then
//  Result := GridRow(
//
//  )
  ;
  {$ENDREGION}

end;

class function  THtmRec.Form(IvCoName, IvAction, IvMethod, IvBody, IvClass, IvStyle, IvEnctype, IvValidatorCsv: string): string;
begin
  Result := sLineBreak + Format('<form %s %s %s action="%s" method="%s" %s %s>', [IdName(IvCoName), AttrClassFromVec([IvClass]), AttrStyleFromVec([IvStyle]), IvAction, IvMethod, IvEnctype, IvValidatorCsv])
          + sLineBreak +           IvBody
          + sLineBreak +        '</form>';

  if false then
    Result := sLineBreak + '<div class="w3-section">'
            + sLineBreak +   Result
            + sLineBreak + '</div>';
end;

class function  THtmRec.Form(IvCoName, IvAction, IvMethod, IvSubmitCaption: string; IvLabelWidth, IvHelpWidth: integer; IvTitleVec, IvKindVec, IvCoNameVec, IvValueVec, IvPlaceholderVec, IvClassVec, IvStyleVec, IvTailVec: TArray<string>; IvRequiredVec: TArray<boolean>; IvClass, IvStyle, IvEnctype, IvValidatorCsv: string): string;
var
  i: integer;  // idxtabindex
  sbu: TSbuRec;
  ctr: string; // control
begin

  {$REGION 'lines'}
  for i := Low(IvTitleVec) to High(IvTitleVec) do
    sbu.Add( FormLine(IvKindVec[i], IvCoNameVec[i], IvTitleVec[i], [IvValueVec[i]], [IvValueVec[i]], IvClassVec[i], IvStyleVec[i], IvTailVec[i], []         , []         , false   , IvTitleVec[i], IvTitleVec[i], IvLabelWidth, IvHelpWidth) );
  i := 0;          // kind        , coname        , title        , captionvec     , valuevec       , class        , style        , tail        , selectedvec, disabledvec, readonly, label        , help         , labelwidth  , helpwidth
  {$ENDREGION}

  {$REGION 'submit'}
  ctr := Format('<button class="w3-button w3-round-xxlarge w3-theme-a-l" type="submit" title="%s submit" tabindex="%d">%s</button>', [IvSubmitCaption, i, IvSubmitCaption]);
  sbu.Add( GridRow([ctr], ['w3-col w3-center'], ['padding-top:32px']) );
  {$ENDREGION}

  {$REGION 'form'}
  Result := Form(IvCoName, IvAction, IvMethod, sbu.Text, IvClass, IvStyle, IvEnctype, IvValidatorCsv);
  {$ENDREGION}

end;

class function  THtmRec.FormModal(IvTitle, IvFaIcon: string; IvCtrlButtonVec: TArray<string>; IvCoName, IvAction, IvMethod, IvSubmitCaption: string; IvLabelWidth, IvHelpWidth: integer; IvTitleVec, IvKindVec, IvCoNameVec, IvValueVec, IvPlaceholderVec, IvClassVec, IvStyleVec, IvTailVec: TArray<string>; IvRequiredVec: TArray<boolean>; IvClass, IvStyle, IvEnctype, IvValidatorCsv: string): string;
var
  hea, foo, bod: string; // deader, footer, body
  i: integer;
begin
  // head
  if SameText(IvFaIcon, '[RvOrganizationLogo]') then hea := Format('<img src="%s" alt="%s" title="%s" style="margin-top:32px; width:200px">'        , [gorg.LogoUrl, IvTitle, IvTitle{gorg.Motto}])
  else                                               hea := Format('<i class="fa %s w3-jumbo w3-text-green" style="margin-top:32px" title="%s"></i>', [IvFaIcon    , IvTitle                    ]);
  hea := hea + H(1, IvTitle);

  // body
  bod := Form(IvCoName, IvAction, 'post', IvSubmitCaption, IvLabelWidth, IvHelpWidth, IvTitleVec, IvKindVec, IvCoNameVec, IvValueVec, IvPlaceholderVec, IvClassVec, IvStyleVec, IvTailVec, IvRequiredVec, IvClass, IvStyle, IvEnctype, IvValidatorCsv);

  // footer
  foo := BtnStd('Home') {+ Space(16)} + BtnStd('Back');
  for i := Low(IvCtrlButtonVec) to High(IvCtrlButtonVec) do
     foo := foo {+ Space(16)} + BtnStd(IvCtrlButtonVec[i]);

  // end
  Result := Modal(true, IvCoName+'Modal', bod, hea, foo);
end;

class function  THtmRec.List(IvItemVec: TArray<string>; IvMode: TListModeEnum): string;
var
  sbu: TSbuRec;
  itm: string;
begin

  {$REGION 'help'}
  {
  disc
  circle
  square
  decimal
  decimal-leading-zero
  lower-roman
  upper-roman
  lower-greek
  lower-latin
  upper-latin
  armenian
  georgian
  lower-alpha
  upper-alpha
  none
  }
  {$ENDREGION}

  sbu.Aif('<ul class="w3-ul">', '<ol class="w3-ol">', IvMode = lmUnordered);
  for itm in IvItemVec do
  sbu.Add(  '<li>%s</li>', [itm]);
  sbu.Aif('</ul>', '</ol>', IvMode = lmUnordered);
  Result := sbu.Text;
end;

class function  THtmRec.TableFromDs(IvDs: TDataset; IvDefault, IvClass, IvStyle: string; IvEditable: boolean; IvEditJson: string; IvDir: THvDirEnum; IvDsHeaderOff, IvDsRecordCountOff: boolean): string;

  {$REGION 'var'}
const
  USE_LOCAL_SNACKBAR = false;

var
//okc: boolean;     // oktocontinue
  nam: string;      // name
  tna: string;      // tablename
  fna: string;      // fbkname
  ena: string;      // editorname
  xna: string;      // textareaname
  kna: string;      // okbtnname
  cna: string;      // cancelbtnname
  tbl: string;      // tabletoedit
  fld: TField;      // field
  fkv: TJSONArray ; // fieldkeyvector (a list with just ONE value for now ["FldAaa"])
  fln: string;      // fieldname
  flv: string;      // fieldvalue
  sbu: TSbuRec;     // txtbuilder
  jso: TJSONObject; // editjsoninfo
  jva: TJSonValue;  // ajsonval
  fke: string;      // fieldkey (just ONE for now)
  {$ENDREGION}

  {$REGION 'macro'}
  function field_name_process(ivfldname: string): string; // *** FAST OK ***
  begin
    Result := ivfldname;
    if Result.StartsWith('Fld') then
      Result := TStrRec.strRemoveFirst(Result, 3);
    if Result.EndsWith('Md') then
      Result := TStrRec.StrRemoveLast(Result, 2);
  end;

(*function field_value_td_process(ivfld: TField): string; // *** VERY SLOW ***
  begin
    Result := ivfld.AsString;
    
    if ivfld.IsNull then
      Result := '<td><span class="w3-theme-text-muted">null</span></td>'

    else if ivfld.FieldName = 'FldState' then
      Result := Format('<td style="padding:6px 8px"><span class="w3-tag w3-round-xxlarge w3-%s" style="padding-top: 1.0px;padding-bottom: 1.5px">%s</span></td>', [TStaRec.ColorW3FromState(Result), Result]{, not Result.IsEmpty})

    else if fld.FieldName.EndsWith('Md') then
      Result := Format('<td>%s</td>', [TMkdRec.Process(Result)]);
  end;

  procedure field_value_td_process; // *** ACCEPTABLE ***
  begin
    if fld.IsNull then
      sbu.Add('<td><span class="w3-theme-text-muted">null</span></td>')

    else if fld.FieldName = 'FldState' then
      sbu.Add('<td style="padding:6px 8px"><span class="w3-tag w3-round-xxlarge w3-%s" style="padding-top: 1.0px;padding-bottom: 1.5px">%s</span></td>', [TStaRec.ColorW3FromState(fld.AsString), fld.AsString]{, not fld.AsString.IsEmpty})

    end else if fld.FieldName.EndsWith('Md') then
      sbu.Add('<td>%s</td>', [TMkdRec.Process(fld.AsString)])

    else
      sbu.Add('<td>%s</td>', [fld.AsString])
    ;
  end;*)
  {$ENDREGION}

begin

  {$REGION 'exit'}
  if IvDs.IsEmpty then begin
    Result := giif.NxD(IvDefault, Format('<p>%s</p>', [NO_DATA_STR]));
    Exit;
  end;

  if not (IvDir in [hvHorizontal, hvVertical]) then begin
    Result := '<div class="w3-margin">Please set the table Mode as Horiz or Vert</div>';
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'names'}
  nam := TNamRec.Co; // conamernd
  tna := nam + 'Table';
  fna := nam + 'Feedback';
  ena := nam + 'Editor';
  xna := nam + 'Textarea';
  kna := nam + 'Ok';
  cna := nam + 'Cancel';
  {$ENDREGION}

  {$REGION 'horizontal'}
if IvDir = hvHorizontal then begin
  // begin
  sbu.Add('<!-- tablehorizontal -->', true, 0);             // class = w3-table w3--striped w3-hoverable w3--border w3-bordered w3--card-4 w3--small w3-margin-bottom
  sbu.Add('<div class="w3-section">');                      // style = width:auto;margin-left:auto;margin-right:auto;
  sbu.Add('<span class="w3-small">%d row(s)</span>', [IvDs.RecordCount], not IvDsRecordCountOff);
  sbu.Add('<div class="w3-responsive">');
  sbu.Add('<table class="%s" style="%s" %s>', [IvClass, IvStyle, THtmRec.IdName(tna)]);

  // header
  gpro.TimerByName['TableFromDs.Horizontal.Header'].Start;
//if not IvDsHeaderOff then begin
//sbu.Add('<thead>');
//sbu.Add('<tr class="w3-%s">', [gthe.Accent10Color]);
  sbu.Aif('<tr style="visibility: hidden">', '<tr>', IvDsHeaderOff);
  for fld in IvDs.Fields do begin
    fln := field_name_process(fld.FieldName);
    sbu.Add('<th>%s</th>', [fln]);
  end;
  sbu.Add('</tr>');
//sbu.Add('</thead>');
//end;
  gpro.TimerByName['TableFromDs.Horizontal.Header'].Stop;

  // body
  gpro.TimerByName['TableFromDs.Horizontal.Body'].Start;
//sbu.Add('<tbody>');
  IvDs.First;
  while not IvDs.Eof do begin
    sbu.Add('<tr>');
    for fld in IvDs.Fields do begin
    //fln := field_name_process(fld.FieldName);
    //flv := field_value_td_process(fld);
    //field_value_td_process;

      if fld.IsNull then
        sbu.Add('<td><span class="w3-theme-text-muted">null</span></td>')

      else if fld.FieldName = 'FldState' then begin
        flv := fld.AsString;
        sbu.Add('<td style="padding:6px 8px"><span class="w3-tag w3-round-xxlarge w3-%s" style="padding-top: 1.0px;padding-bottom: 1.5px">%s</span></td>', [TStaRec.ColorW3FromState(flv), flv]{, not flv.IsEmpty})

      end else if fld.FieldName.EndsWith('Md') then
        sbu.Add('<td>%s</td>', [TMkdRec.Process(fld.AsString)])

      else
        sbu.Add('<td>%s</td>', [fld.AsString])
      ;

    end;
    sbu.Add('</tr>');
    IvDs.Next;
  end;
//sbu.Add('</tbody>');
  gpro.TimerByName['TableFromDs.Horizontal.Body'].Stop;

  // end
  sbu.Add('</table>');
  sbu.Add('</div>');
  sbu.Add('</div>');
  {$ENDREGION}

  {$REGION 'vertical'}
end else if IvDir = hvVertical then begin
  IvDs.First;
  while not IvDs.Eof do begin
    sbu.Add('<!-- tablevertical%d -->', [IvDs.RecNo], true, 0);
    sbu.Add('<div class="w3-section">');
    sbu.Add('<div class="w3-responsive">');
    sbu.Add('<table class="%s" style="%s" %s>', [IvClass, IvStyle, THtmRec.IdName(Format('%s%d', [tna, IvDs.RecNo]))]);
    for fld in IvDs.Fields do begin
      fln := field_name_process(fld.FieldName);
    //flv := field_value_td_process(fld);
      flv := fld.AsString;

      if fld.IsNull then
        flv := '<span class="w3-theme-text-muted">null</span></td>'

      else if fld.FieldName = 'FldState' then
        flv := Format('<span class="w3-tag w3-round-xxlarge w3-%s" style="padding-top: 1.0px;padding-bottom: 1.5px">%s</span>', [TStaRec.ColorW3FromState(flv), flv]{, not flv.IsEmpty})

      else if fld.FieldName.EndsWith('Md') then
        flv := TMkdRec.Process(fld.AsString)
      ;

      sbu.Add('<tr>');
    //sbu.Add('<th class="w3-left-align w3-%s" style="width: 0%%;%s">%s</th>', [gthe.Primary60BgColor, ifthen(IvDsHeaderOff, 'visibility: hidden', ''), fln]);
      sbu.Add('<th class="w3-left-align w3-blue-gray w3-padding-medium" style="width: 0%%">%s</th>', [fln], not IvDsHeaderOff);
      sbu.Add('<td>%s</td>', [flv]);
      sbu.Add('</tr>');
    end;
    sbu.Add('</table>');
    sbu.Add('</div>');
    sbu.Add('</div>');
    IvDs.Next;
  end;
end;
  {$ENDREGION}

  {$REGION 'json'}
if IvEditable then begin
  // editjson
  jso := TJSONObject.Create;
  try
    try
      // i
      jso.Parse(BytesOf(IvEditJson), 0);
      tbl := jso.GetValue<string>('EditData.EditTable');
      fkv := jso.GetValue<TJSONArray>('EditData.EditKeyFieldList');

      // ii
      //jva := jso.ParseJSONValue(IvEditJson);
      //tbl := jva.GetValue<string>('EditData.EditTable');
      //fkv := jva.GetValue<TJSONArray>('EditData.EditKeyFieldList');

      for jva in fkv do begin
        fke := jva.GetValue<string>; // *** justone? ***
      end;
    except
      on e: Exception do begin
  sbu.Add('<script>wks.fbkFail("Table not editable: %s");</script>', [e.Message]);
        IvEditable := false; // override
      end;
    end;
  finally
    jso.Free;
  end;
end;
  {$ENDREGION}

  {$REGION 'htmljs'}
if IvEditable then begin
  // localsnackbar
  if USE_LOCAL_SNACKBAR then begin
  sbu.Add('<!-- tablefeedbacksnackbar -->'                                                                                                                                       );
  sbu.Add('<div class="w3-panel w3-padding-16 w3-card-4 w3-center w3-blue" style="display:none" %s></div>'                                                , [THtmRec.IdName(fna)]);
  end;

  // editor
  sbu.Add('<!-- memoeditor -->' {*** duplicated ***}                                                                                                                             );
  sbu.Add('<div class="w3-modal w3-animate-opacity" %s>'                                                                                                  , [THtmRec.IdName(ena)]);
  sbu.Add(  '<div class="w3-modal-content w3-card-4">' {w3-animate-zoom}                                                                                                         );
//sbu.Add(    '<header class="w3-container w3-%s">'                                                                                                               , [the.BgColor]);
  sbu.Add(    '<header class="w3-container">'                                                                                                                                    );
//sbu.Add(      '<span class="w3-button w3-%s w3-xlarge w3-display-topright" onclick="document.getElementById(''%s'').style.display=''none''">&times;</span>', [the.BgColor, ena]);
  sbu.Add(      '<span class="w3-button w3-xlarge w3-display-topright" onclick="document.getElementById(''%s'').style.display=''none''">&times;</span>'                   , [ena]);
  sbu.Add(      '<h2>Field Editor</h2>'                                                                                                                                                );
  sbu.Add(    '</header>'                                                                                                                                                        );
  sbu.Add(    '<div class="w3-container">'                                                                                                                                       );
//sbu.Add(      '<h1>Editing field</h1>'                                                                                                                                         );
  sbu.Add(      '<textarea class="w3-input w3-border w3-margin-bottom" style="resize:none" rows="12" %s autofocus></textarea>'                            , [THtmRec.IdName(xna)]);
  sbu.Add(    '</div>'                                                                                                                                                           );
  sbu.Add(    '<div class="w3-container w3-light-grey w3-padding">'                                                                                                              );
  sbu.Add(      '<button class="w3-button w3-left w3-blue w3-border" onclick="document.getElementById(''%s'').value=''''">Clear</button>'                                 , [xna]);
  sbu.Add(      '<button class="w3-button w3-right w3-green w3-border" %s>Ok</button>'                                                                    , [THtmRec.IdName(kna)]);
  sbu.Add(      '<button class="w3-button w3-right w3-white w3-border w3-margin-right" %s>Cancel</button>'                                                , [THtmRec.IdName(cna)]);
  sbu.Add(    '</div>'                                                                                                                                                           );
  sbu.Add(  '</div>'                                                                                                                                                             );
  sbu.Add('</div>'                                                                                                                                                               );

  // script
  sbu.Add('<!-- tablememoeditorscript -->'                                                                           );
  sbu.Add('<script>'                                                                                                 );
  sbu.Add('var $tb /*, $th*/, $td, $tr;'                                                                             ); // globalvar tableobj, thobj, trobj
  sbu.Add('var ci, cn/*, rj*/, id, ov, nv;'                                                                          ); // globalvar coli, colname, rowj, fldid, oldvalue, newvalue

  sbu.Add('$("#%s tr td").dblclick(function(tgt) {'                                                           , [tna]); // tblclick
//sbu.Add('    if (!window.event.ctrlKey) {'                                                                         ); // ctrl was not held down during the click in the tbl
//sbu.Add('        return;'                                                                                          ); // exit
//sbu.Add('    };'                                                                                                   );
  if USE_LOCAL_SNACKBAR then begin
  sbu.Add('    $("#%s").html("");'                                                                            , [fna]); // fbksnackbarreset
  sbu.Add('    $("#%s").hide();'                                                                              , [fna]); // fbksnackbarhide
  end;
  sbu.Add('    $tb=$(tgt.target).closest("table");'                                                                  ); // TABLE
//sbu.Add('    $th=$(tgt.target).closest("th");'                                                                     ); // HEADER *** not working ***
  sbu.Add('    $td=$(tgt.target).closest("td");'                                                                     ); // CELL
  sbu.Add('    $tr=$td.closest("tr");'                                                                               ); // ROW
  sbu.Add('    ci=$td.index();'                                                                                      ); // COL[i]               0, 1, ...
  sbu.Add('    cn=$tb[0].rows[0].cells[ci].innerText;'                                                               ); // COL[i]NAME           (Fld)Xxx
//sbu.Add('    rj=$tr.index();'                                                                                      ); // ROW[j]               0, 1, ... *** not needed ***
  sbu.Add('    id=$tr[0].cells[0].textContent;'                                                                      ); // ROWFLDID             1234
  sbu.Add('    ov=$td[0].innerText;'                                                                                 ); // CELLTEXT             celloldvalue *** innerHTML text() html() ***
  sbu.Add('    $("#%s").val((ov == "null") ? "" : ov);'                                                       , [xna]); // textareasetwitholdvalue
  sbu.Add('    $("#%s").show();'                                                                              , [ena]); // modaleditorshow
//sbu.Add('    $("#%s").focus();'                                                                             , [ena]); // modaleditorfocus *** not working ***
  sbu.Add('});'                                                                                                      );

  sbu.Add('$("#%s").click(function() {'                                                                       , [cna]); // cancelbtn
  if USE_LOCAL_SNACKBAR then begin
  sbu.Add('    $("#%s").show();'                                                                              , [fna]); // fbksnackbarshow
  sbu.Add('    $("#%s").text("nothing has been changed");'                                                    , [fna]); // fbksnackbarset
  end else
  sbu.Add('    wks.fbkInfo("nothing has been changed");'                                                             );
  sbu.Add('    $("#%s").hide();'                                                                              , [ena]); // modaleditorhide
  sbu.Add('});'                                                                                                      );

  sbu.Add('$("#%s").click(function() {'                                                                       , [kna]); // okbtn
  sbu.Add('    nv = $("#%s").val().trim();'                                                                          , [xna]); // newvalue
  sbu.Add('    if (nv == ov) {'                                                                                      ); // sametooldvalue
  if USE_LOCAL_SNACKBAR then begin
  sbu.Add('        $("#%s").show();'                                                                          , [fna]); // fbksnackbarshow
  sbu.Add('        $("#%s").text("nothing has been changed");'                                                , [fna]); // fbksnackbarset
  end else
  sbu.Add('        wks.fbkInfo("nothing changed");'                                                                  );
  sbu.Add('    } else {'                                                                                             );
  sbu.Add('        var pl = {'                                                                                       ); // payloadprepare
  sbu.Add('            dbaTable: "%s"'                                                                        , [tbl]); // tbl   DbaAaa.dbo.TblTest
  sbu.Add('          , fldToSet: "Fld{0}".format(cn)'                                                                ); // fld
  sbu.Add('          , fldValueNew: nv'                                                                              ); // newvalue
  sbu.Add('          , where: "%s = ''{0}''".format(id)'                                                      , [fke]); // whereconditions
  sbu.Add('        };'                                                                                               );
  sbu.Add('        $.ajax({'                                                                                         ); // ajaxpost
  sbu.Add('            type: "POST"'                                                                                 ); // mode
  sbu.Add('          , url: "/wksDbaIsapiProject.dll/Update"'                                                        ); // urlrest
//sbu.Add('          , data: pl'                                                                                     ); // setpayload i
  sbu.Add('          , data: JSON.stringify(pl)'                                                                     ); // setpayload ii
  sbu.Add('          , contentType: "application/json; charset=utf-8"'                                               ); // ct
  sbu.Add('          , dataType: "json"'                                                                             ); // dt
  sbu.Add('          , success: function(data) {'                                                                    ); // SUCCESS
//sbu.Add('              console.log(data);'                                                                         ); // dbg
//sbu.Add('              console.log(data.message);'                                                                 ); // logmore
//sbu.Add('              console.log(data.feedback);'                                                                ); // logmore
  sbu.Add('              if (data.ok) {'                                                                             );
  sbu.Add('                $td.text((nv == "") ? "null" : nv);'                                                      ); // tablecellset
  sbu.Add('                fbk = "{0}: <b>{1}</b> changed to: <b>{2}</b> in {3} ms";'                                ); // fbkprepare
  sbu.Add('                fbk = fbk.format(data.state.toUpperCase(), ov, (nv == "") ? "null" : nv, data.elapsedMs);'); // fbkcompile
  sbu.Add('              } else {'                                                                                   );
  sbu.Add('                fbk = "{0}: <b>{1}</b>";'                                                                 ); // fbkprepare
  sbu.Add('                fbk = fbk.format(data.state.toUpperCase(), data.message);'                                ); // fbkcompile
  sbu.Add('              }'                                                                                          );
  if USE_LOCAL_SNACKBAR then begin
  sbu.Add('              $("#%s").show();'                                                                    , [fna]); // fbksnackbarshow
  sbu.Add('              $("#%s").html(fbk);'                                                                 , [fna]); // fbksnackbarset
  end else
  sbu.Add('              wks.fbkOkWarn(fbk, data.ok);'                                                               );
  sbu.Add('            }'                                                                                            );
  sbu.Add('          , error: function(err, ajaxOptions, thrownError) {'                                             ); // FAIL
//sbu.Add('              console.log(err);'                                                                          ); // dbg
//sbu.Add('              console.log(err.responseText);'                                                             ); // dbg *** BAD REQUEST ***
  sbu.Add('              fbk = "<b>{0}</b>";'                                                                        ); // fbkprepare
  sbu.Add('              fbk = fbk.format(err.responseText);'                                                        ); // fbkcompile
  if USE_LOCAL_SNACKBAR then begin
  sbu.Add('              $("#%s").show();'                                                                    , [fna]); // fbksnackbarshow
  sbu.Add('              $("#%s").html(fbk);'                                                                 , [fna]); // snackbarset
  end else
  sbu.Add('              wks.fbkFail(fbk);'                                                                          );
  sbu.Add('            }'                                                                                            );
  sbu.Add('        });'                                                                                              );
  sbu.Add('    };'                                                                                                   );
  sbu.Add('    $("#%s").hide();'                                                                              , [ena]); // modaleditorhide
  sbu.Add('});'                                                                                                      );
  sbu.Add('</script>'                                                                                                );
end;
  {$ENDREGION}

  {$REGION 'end'}
  Result := sbu.Text;
  {$ENDREGION}

end;

class function  THtmRec.TableFromSql(IvSql, IvDefault, IvClass, IvStyle: string; IvEditable: boolean; IvEditJson: string; IvDir: THvDirEnum; IvDsHeaderOff, IvDsRecordCountOff: boolean): string;
var
  ok: boolean;
  dst: TDataset;
  fbk: string;
begin
  gpro.TimerByName['TableFromSql.DsFromSql'].Start;
  ok := TDbaRec.DsFromSql(IvSql, dst, fbk, false);
  gpro.TimerByName['TableFromSql.DsFromSql'].Stop;
  if not ok then
    Result := Modal(true, 'CoTableFromSqlFeedback', Code(IvSql, 'sql')
                   , H(2, 'Unable to create html table from sql')
                   + P(fbk, true, true)
                   , ''
                   , fmWarning)
  else try
  //gpro.TimerByName['TableFromSql.TableFromDs'].Start;
    Result := TableFromDs(dst, IvDefault, IvClass, IvStyle, IvEditable, IvEditJson, IvDir, IvDsHeaderOff, IvDsRecordCountOff);
  //gpro.TimerByName['TableFromSql.TableFromDs'].Stop;
  finally
    dst.Free;
  end;
end;

class function  THtmRec.RepeatFromDs(IvDs: TDataSet; IvHtmlBody, IvHtmlHeader, IvHtmlFooter, IvHtmlDefault: string): string;
var
  i, rid, rto: integer;  // rowid, rowtotal
  fld, itm, val: string; // field, bodyitem

  function  LocalReplace(txt: string): string;
  begin
    Result := StringReplace(txt   , '$RowId$'   , rid.ToString, [rfReplaceAll]);
    Result := StringReplace(Result, '$RowTotal$', rto.ToString, [rfReplaceAll]);
  end;
begin
  if IvDs.IsEmpty then begin
    Result := giif.NxD(IvHtmlDefault, NO_DATA_STR);
    Exit;
  end;

  Result := '';
  rid := 0;
  rto := IvDs.RecordCount;
  while not IvDs.Eof do begin
    Inc(rid);
    itm := IvHtmlBody;
    for i := 0 to IvDs.FieldCount-1 do begin
      fld := IvDs.Fields[i].FieldName;
      val := IvDs.Fields[i].AsString;
      val := TMkdRec.Process(val);
      itm := StringReplace(itm, '$' + fld + '$', val, [rfReplaceAll]);
    end;
    Result := Result + LocalReplace(itm);
    IvDs.Next;
  end;

  if not IvHtmlHeader.IsEmpty then
    Result := IvHtmlHeader + sLineBreak + Result;
  if not IvHtmlFooter.IsEmpty then
    Result := Result + sLineBreak + IvHtmlFooter;

  Result := LocalReplace(Result);
end;

class function  THtmRec.RepeatFromSql(IvSql, IvHtmlBody, IvHtmlHeader, IvHtmlFooter, IvHtmlDefault: string): string;
var
  ok: boolean;
  dst: TDataset;
begin
  ok := TDbaRec.DsFromSql(IvSql, dst, false);
  if not ok then
    Result := Modal(true, 'CoRepeatFromSqlModal', Code(IvSql, 'sql'), H(2, 'Unable to creater a repeater from sql'))
  else try
    Result := RepeatFromDs(dst, IvHtmlBody, IvHtmlHeader, IvHtmlFooter, IvHtmlDefault);
  finally
    dst.Free;
  end;
end;

class function  THtmRec.Report(IvId: integer; IvDefaultIfAnyDsIsEmpty: string): string;

  {$REGION 'help'}
(*
                                        n       key
  -------------------------------------------------------------------------------
  TReportRec                            1       ReportId
    |
    |_TParamRecVector                   n       ReportId, Param
    |
    |_TDataSetRecVector                 n       ReportId, Dataset
        |
        |_TChartRecVector               n       ReportId, Dataset, Chart
            |
            |_TChartSerieRecVector      n       ReportId, Dataset, Chart, Serie
                |
                |_TChartPointRecVector  n       no-key, builded via sql or json


   ----------------------------------------------------------------------------
  |                                 topnavbar                                  |
  |----------------------------------------------------------------------------|
  |                                                                            |
  |  Report Title (123) [h1]                                            ^      | ReportTitleOn, ReportPanelOn, ReportPanelClosed
  |  ----------------------------------------------------------------------    |
  |    Params (--> Filters) [h2]                                        ^      | ParamsTitleOn, ParamsPanelOn, ParamsPanelClosed
  |    --------------------------------------------------------------------    |
  |                    _________                                               |
  |     DateTimeStart [_________] [...]                                        |
  |     DateTimeEnd   [_________] [...]                                        |
  |     Top           [10_______] [...]                                        |
  |     OrderBy       [1_desc___] [...]                                        |
  |     Export        [Csv______] [...]                                        |
  |                                                                            |
  |                                  _________                                 |
  |                                 [ Refresh ]                                |
  |                                  ¯¯¯¯¯¯¯¯¯                                 |
  |    Dataset.1 [h2]                                                   ^      | DatasetTitleOn, DatasetPanelOn, DatasetPanelClosed
  |    --------------------------------------------------------------------    |
  |      Charts [h3]                                                    ^      | ChartTitleOn, ChartPanelOn, ChartPanelClosed
  |      ------------------------------------------------------------------    |
  |       ································································     | <-- the chart grid is 12x12 max [0..b]x[0..b] to match the BS grid system
  |       · Y|                      C0(00)·                        C1(01)·     |
  |       ·  |        * * *               ·                              ·     |
  |       ·  |      *      * * *          ·                              ·     |
  |       ·  |    *  .--.       * * S0    ·                              ·     | <-- row 0 has two cols, cols in a row are indipendent, BS allows that
  |       ·  |  ----'    \_________ S1    ·                              ·     |
  |       ·  |__________________________  ·                              ·     |
  |       ·                            X  ·                              ·     |
  |       ································································     |
  |       ·              C3(10)·              C2(11)·              C4(12)·     | <-- each chart has a row-col index that target the right cell
  |       ·                    ·                    ·                    ·     |
  |       ·                    ·                    ·                    ·     |
  |       ·                    ·                    ·                    ·     | <-- row 1 has three cols
  |       ·                    ·                    ·                    ·     |
  |       ·                    ·                    ·                    ·     |
  |       ·                    ·                    ·                    ·     |
  |       ································································     |
  |       Recordset.1.1 [h3]                                           ^       |
  |      ------------------------------------------------------------------    |
  |        --------------------------------------------------------------      |
  |       |  Aaaa  |     Bbbb     | Cc |   Dddd  |   Eee   |    Fffff    |     |
  |       |--------------------------------------------------------------|     |
  |       |  111   | aaaa         | aa | ddddddd | eeee    | fffff       |     |
  |       |--------------------------------------------------------------|     |
  |       |  222   | aaaa         | aa | ddddddd | eeee    | fffff       |     |
  |       |--------------------------------------------------------------|     |
  |       |  333   | aaaa         | aa | ddddddd | eeee    | fffff       |     |
  |        --------------------------------------------------------------      |
  |                                                                            |
  |       Recordset.1.2 [h3]                                           ^       |
  |      ------------------------------------------------------------------    |
  |        --------------------------------------------------------------      |
  |       |  Gggg  |     Hhhh     | Ii |   Jjjj  |   Lll   |    Mmmmm    |     |
  |       |--------------------------------------------------------------|     |
  |       |  111   | hhhh         | ii | jjjjjjj | llll    | mmmmm       |     |
  |       |--------------------------------------------------------------|     |
  |       |  222   | hhhh         | ii | jjjjjjj | llll    | mmmmm       |     |
  |        --------------------------------------------------------------      |
  |                                                                            |
  |    Dataset.2  [h2]                                                  ^      |
  |    --------------------------------------------------------------------    |
  |       Charts  [h3]                                                  v      |
  |      ------------------------------------------------------------------    |
  |       Recordset.2.1  [h3]                                           v      |
  |      ------------------------------------------------------------------    |
  |                                                                            |
   ----------------------------------------------------------------------------
*)
  {$ENDREGION}

  {$REGION 'var'}
var
  // common
//okk: boolean;
  con, ctr, sql, fbk: string;   // coname

  // report
  rid: integer;                 // id
  rsb: TSbuRec;                 // strbuilder
  rer: TReportRec;              // record
  rti: string;                  // title
//rsh: string;                  // singlehtml
  rah: string;                  // allhtml

  // params
  i  : integer;                 // idx
//psb: TSbuRec;                 // strbuilder
  psh: string;                  // singlehtml
  pah: string;                  // allhtml
  pof: boolean;                 // paramshtmlblockoff
  pve: TReportParamRecVector;   // vec
//por: integer;                 // order
  pst: string;                  // state
  pna: string;                  // paramname
  pde: string;                  // default
  pca: string;                  // caption       phe: string;                  // label
  pph: string;                  // placeholder
  pdt: string;                  // descriptiontitle
  phe: string;                  // help          pap: string;                  // help
  pki: string;                  // kind          pkk: string;                  // kind
//phi: boolean;                 // hidden
//prq: boolean;                 // required
//pds: boolean;                 // disabled
  p12: string;                  // linegrid12
  poc: string;                  // optioncsv
  poj: string;                  // optionjson
  poq: string;                  // optionquery
  pcs: string;                  // connstr
  plb: string;                  // connlib
  pcl: string;                  // &class
  psy: string;                  // style
//pfm: string;                  // format
//pro: boolean;                 // readonly
//pav: string;                  // ajaxvalidate
  pva: string;                  // value

  // options (select,checkbox,radio)
  ocv: TArray<string>;          // csv ->vec
  ojv: TArray<string>;          // json->vec
  oqv: TArray<string>;          // sql ->vec
  ove: TArray<string>;          // total

  // datasets
  j  : integer;                 // idx
  dsb: TSbuRec;                 // strbuilder
  dve: TReportDataSetRecVector; // vec
  dsh: string;                  // singlehtml
  dah: string;                  // allhtml
  ddi: THvDirEnum;              // mode

  // charts
  k  : integer;                 // idx
  csb: TSbuRec;                 // strbuilder
  cve: TChartRecVector;         // vec
  csh: string;                  // singlehtml
  cah: string;                  // allhtml
  {$ENDREGION}

  {$REGION 'macro'}
  function params_replace(ivstr: string; ivpav: TReportParamRecVector): string;
  var
    i: integer;
    pna, pva: string;
  begin
    Result := ivstr;
    for i := Low(ivpav) to High(ivpav) do begin
      pna := ivpav[i].Param;
      pva := StringReplace(ivpav[i].Value, '*', '%', [rfReplaceAll]);
      Result := StringReplace(Result, '$'+pna+'$', pva, [rfReplaceAll]);
    end;
  end;
  {$ENDREGION}

begin

  {$REGION 'exit'}
  if IvId < 100 then begin
    Result :=  Alert('Report', 'Wrong report Id');
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'querystringoverrides'}
  pof := gwrq.FieldGet('CoParamsOff', false);
  {$ENDREGION}

  {$REGION 'report'}
  gpro.TimerByName['Report.Select'].Start;

  rid := IvId;
  rer.Obj.Id := rid;
  if not rer.DbaSelect(fbk) then begin
    Result := AlertW('Report', fbk);
    Exit;
  end;

  // exit
  if not TStrRec.StrHas('Developing,Active,Validating,Validated', rer.Obj.State) then begin
    Result := AlertW('Report', 'The requested report is not in a visible state');
    Exit;
  end;

  gpro.TimerByName['Report.Select'].Stop;
  {$ENDREGION}

  {$REGION 'params'}
  gpro.TimerByName['Report.Params'].Start;

  pve := rer.ParamRecVector;   // *** should use directly a form ***
  if Length(pve) <= 0 then
    pah := '' //Format('<p>%s</p>', ['No Params'])
  else begin
    // params
    for i := Low(pve) to High(pve) do begin
                      // zip
   {  ReportId      }
   {  Order         }//por := pve[i].Order       ;
   {  State         }  pst := pve[i].State       ;
   {  Param         }  pna := pve[i].Param       ; con := TNamRec.Co(pna);
   {  Default       }  pde := pve[i].Default     ;
   {  Caption       }  pca := giif.NxD(pve[i].Caption, pve[i].Param);
   {  Placeholder   }  pph := pve[i].Placeholder ;
   {  Description   }  pdt := pve[i].Description ;
   {  Help          }  phe := pve[i].Help        ;
   {  Kind          }  pki := pve[i].Kind        ;
   {  Hidden        }//phi := pve[i].Hidden      ;
   {  Required      }//prq := pve[i].Required    ;
   {  Disabled      }//pds := pve[i].Disabled    ;
   {  LineGrid12    }  p12 := pve[i].LineGrid12  ;
   {  OptionCsv     }  poc := pve[i].OptionCsv   ; ocv := TVecRec.VecFromStr(poc);
   {  OptionJson    }  poj := pve[i].OptionJson  ; ojv := [];
   {  OptionQuery   }  poq := pve[i].OptionQuery ; oqv := []; ove := ocv + ojv + oqv;
   {  ConnStr       }  pcs := pve[i].ConnStr     ;
   {  ConnLib       }  plb := pve[i].ConnLib     ;
   {  Classs        }  pcl := pve[i].&Class      ;
   {  Style         }  psy := pve[i].Style       ;
   {//Format        }//pfm := pve[i].Format      ;
   {//ReadOnly      }//pro := pve[i].ReadOnly    ;
   {//AjaxValidate  }//pav := pve[i].AjaxValidate;
   {//Switch        }
   {//ToOrganization}
   {//ToDepartment  }
   {//ToArea        }
   {//ToActivity    }
   {//ToTeam        }
   {//ToMember      }
   {  Value         }

      // value
      pva := gwrq.FieldGet(con, pve[i].Default);

      // transform(limitcontrol)
      if SameText(con, 'CoTop') then begin
        if StrToIntDef(pva, 10) > DATASET_MAXRECORDS then
          pva := IntToStr(DATASET_MAXRECORDS);
      end else if not pve[i].Value{Inspector}.IsEmpty then begin
        // Inspector should contain script to evaluate the incoming paramvalue
        // inspectorcompile (replace $Param$ with paramvalue)
        // inspectorrun and get result (detectscriptinglang py/js)
        // replace pva with result
      end;

      // rv
    //pva := grva.Rva(pva);

      // vec
      pve[i].Value := pva;

      // hidden
      if pve[i].Hidden then
        continue;

      // html         kind, coname, title, captionvec, valuevec, class, style, tail, valuevec, disabledvec, readonly, label, help, labelwidth, helpwidth
      psh := FormLine(pki , con   , pna  , ove       , ove     , pcl  , psy  , ''  , [pva]   , []         , false   , pna  , phe , 200       , 300      );

      // params
      pah := pah
           + sLineBreak + psh;
    end;

    // submit
    ctr := Format('<button class="w3-button w3-round-xxlarge w3-theme-a-l" type="submit" %s title="%s submit">%s</button>', [IdName('CoParamSubmit'), 'Refresh', 'Refresh']);
    pah := pah
         + sLineBreak + GridRow([ctr], ['w3-col w3-center'], ['padding-top:32px']);

             // coname     , action, method, submitcaption, labelwidth, helpwidth, labelvec, kindvec, conamevec, valuevec, placeholdervec, classvec, stylevec, tailvec, requiredvec, class, style, enctype, validatorcsv
  //pah := Form('ParamForm', ''    , 'post', 'Refresh'      , 200     , 200      , []      , []     , []       , []      , []            , []      , []      , []     , []         , ''   , ''   , ''     , ''          );

    // paramshtml (form)
    pah := Form('CoParamForm', '', 'post', pah);
  end;

  // collapse
  if rer.ParamsTitleOn then
    pah := Collapse('Params', 'Use the following parameters to filter the results', pah, 3, '', false, rer.ParamsPanelOn, rer.ParamsPanelClosed);

  // reportparamshtmlblockadd(hidden)
  if pof then
     pah := Format('<div style="display:none">' + sLineBreak + '%s' + sLineBreak + '</div>', [pah]);
  rsb.Add(pah);

  gpro.TimerByName['Report.Params'].Stop;
  {$ENDREGION}

  {$REGION 'datasets'}
  dve := rer.DatasetRecVector;
  if Length(dve) <= 0 then
    dah := Format('<p>%s</p>', ['No Datasets'])
  else begin
    // datasets
    dsb.Clr;
  //j := 0;
    for j := Low(dve) to High(dve) do begin

      {$REGION 'dataset'}
      gpro.TimerByName['Report.Dataset'+dve[j].Dataset].Start;

      // mode
      ddi :=  TEnuRec.EnumFromStr<THvDirEnum>('hv'+dve[j].Mode, hvHorizontal); // Horiz, Vert

      // sql
      sql := params_replace(dve[j].Select, pve);

      // table
      dsh := TableFromSql(sql, dve[j].FeedbackIfEmpty, dve[j].Classs, dve[j].Style, dve[j].Editable, dve[j].Json, ddi, rer.DsHeaderOff, rer.DsRecordCountOff);

      // sqlfbkifadmin
      if {gwse.IsValid(fbk) and} gmbr.IsAdmin and (not rer.DsRecordCountOff) then begin
      con := TNamRec.Co('Sql%dModal', [j]);
      dsh := dsh
      + sLineBreak + ModalBtn('Sql', con, Code(sql, 'sql'), H(2, Format('Sql %d', [j])), BtnStd('Close', 0, con), fmInfo);
      end;

      // collapse
      if dve[j].TitleOn then
        dsh := Collapse(giif.NxD(dve[j].Title, dve[j].Dataset), dve[j].Description, dsh, 3, '', false, dve[j].PanelOn, dve[j].PanelClosed);

      dsb.Add(dsh);

      gpro.TimerByName['Report.Dataset'+dve[j].Dataset].Stop;
      {$ENDREGION}

      {$REGION 'charts'}
      gpro.TimerByName['Report.Chart'+dve[j].Dataset].Start;

      cve := dve[j].ChartRecVector;
      csb.Clr;
      if Length(cve) <= 0 then
        cah := Format('<p>%s</p>', ['No Charts'])
      else begin
        for k := Low(cve) to High(cve) do begin
          // chart
          csh := Format('<div style="width:100% height:100px border:1ps solid red">Chart %d%d</div>', [j, k]);

          // collapse
          if cve[j].TitleOn then
            csh := Collapse(giif.NxD(cve[j].Title, cve[j].Dataset), cve[j].Description, csh, 3, '', false, cve[j].PanelOn, cve[j].PanelClosed);

          csb.Add(csh);
        end;
        cah := csb.Text;
      end;

      csb.Add(cah);

      gpro.TimerByName['Report.Chart'+dve[j].Dataset].Stop;
      {$ENDREGION}

    end;

    // datasetshtml
    dah := dsb.Text;
  end;

  // reporthtmlblockadd
  rsb.Add(dah);
  {$ENDREGION}

  {$REGION 'profilerdata'}
  if {gwse.IsValid(fbk) and} gmbr.IsAdmin and (not rer.DsRecordCountOff) then begin
  con := TNamRec.Co('ProfilerModal');
  dsh := sLineBreak + ModalBtn('Profiler', con, Code(gpro.OutputTextTimers(tiAll)), H(2, 'Profiler results'), BtnStd('Close', 0, con), fmInfo);
  rsb.Add(dsh);
  end;
  {$ENDREGION}

  {$REGION 'end'}
  // reporthtml
  rah := rsb.Text;

  // collapse
  if rer.ReportTitleOn then begin
    rti := giif.NxD(rer.Obj.Title, TStrRec.StrExpand(rer.Obj.&Object));
    if {rer.ReportNumberOn}false then
      rti := Format('%s (%d)', [rti, rid]);

    rah := Collapse(rti, rer.Obj.Subtitle, rah, 2, '', false, rer.ReportPanelOn, rer.ReportPanelClosed);
  end;

  // result
  Result := rah;
  {$ENDREGION}

end;

class function  THtmRec.SlidesFromDs(IvDs: TDataSet; IvHtmlSlideBody, IvHtmlHeader, IvHtmlFooter, IvHtmlDefault: string; IvSlideId: integer): string;
var
  i, sid, rid, rto: integer;  // slideiddefault, rowid, rowtotal
  fld, itm, val: string; // field, bodyitem
  rnd, ssn, ssc, ssj, tmp: string; // rnd, slideshowname, slideshowclass, slideshowjsname, sbutemp
  sbu: TSbuRec;

  function  LocalReplace(txt: string): string;
  begin
    Result := StringReplace(txt   , '$RowId$'   , rid.ToString, [rfReplaceAll]);
    Result := StringReplace(Result, '$RowTotal$', rto.ToString, [rfReplaceAll]);
  end;
begin
  // exit
  if IvDs.IsEmpty then begin
    Result := giif.NxD(IvHtmlDefault, Modal(true, 'CoSlideshowModal', Code(NO_DATA_STR), H(2, 'Slideshow')));
    Exit;
  end;

  // default
  sid := IvSlideId;

  // names
  rnd := TRndRec.RndName;
  ssn := Format('Co%sSlideshow' , [rnd]);
  ssc := Format('cls%sSlideshow', [rnd]);
  ssj := Format('wks%sSlideshow', [rnd]);

  // walk
  rid := 0;
  rto := IvDs.RecordCount;
  while not IvDs.Eof do begin
    Inc(rid);
    itm := IvHtmlSlideBody;
    for i := 0 to IvDs.FieldCount-1 do begin
      fld := IvDs.Fields[i].FieldName;
      val := IvDs.Fields[i].AsString;
      val := TMkdRec.Process(val);
      itm := StringReplace(itm, '$' + fld + '$', val, [rfReplaceAll]);
    end;

    sbu.Add('<!-- %s (slide %d/%d) -->'                                                      , [ssn, rid, rto]);
    sbu.Add(  '<div class="%s w3-padding w3-card" style="margin:20px;position:relative;">'             , [ssc]);
    sbu.Add(    LocalReplace(itm)                                                                             );
    sbu.Add(  '</div>'                                                                                        );

    IvDs.Next;
  end;
  tmp := sbu.Text;
  sbu.Clr;

  // template
  sbu.Add('<!-- %s -->'                                                                                , [ssn]);
  sbu.Top(IvHtmlHeader);
  sbu.Add('<div name="%s" style="max-width:1980px;margin:auto;">'                                      , [ssn]);
  sbu.Add(  tmp                                                                                               );
  sbu.Add(  '<button class="w3-button w3-pale-yellow w3-theme-a-t w3-display-left" onclick="%sNext(-1)">&#10094;</button>' , [ssj], rto > 1);
  sbu.Add(  '<button class="w3-button w3-pale-yellow w3-theme-a-t w3-display-right" onclick="%sNext(1)">&#10095;</button>' , [ssj], rto > 1);
  sbu.Add('</div>'                                                                                            );
  sbu.Add(IvHtmlFooter);
  sbu.Add('<!-- %s script -->'                                                                         , [ssn]);
  sbu.Add('<script>'                                                                                          );
  sbu.Add(  'var %sIdx = %d;'                                                                     , [ssj, sid]);
  sbu.Add(  '%sShow(%sIdx);'                                                                      , [ssj, ssj]);
  sbu.Add(  'function %sNext(n) {'                                                                     , [ssj]);
  sbu.Add(    '%sShow(%sIdx += n);'                                                               , [ssj, ssj]);
  sbu.Add(  '}'                                                                                               );
  sbu.Add(  'function %sShow(n) {'                                                                     , [ssj]);
  sbu.Add(    'var i;'                                                                                        );
  sbu.Add(    'var x = document.getElementsByClassName("%s");'                                         , [ssc]);
  sbu.Add(    'if (n > x.length) {%sIdx = 1}'                                                          , [ssj]);
  sbu.Add(    'if (n < 1) {%sIdx = x.length}'                                                          , [ssj]);
  sbu.Add(    'for (i = 0; i < x.length; i++) {'                                                              );
  sbu.Add(      'x[i].style.display = "none";'                                                                );
  sbu.Add(    '}'                                                                                             );
  sbu.Add(    'x[%sIdx-1].style.display = "block";'                                                    , [ssj]);
  sbu.Add(  '}'                                                                                               );
  sbu.Add('</script>'                                                                                         );

  // end
  Result := LocalReplace(sbu.Text);
end;

class function  THtmRec.SlidesFromSql(IvSql, IvHtmlSlideBody, IvHtmlHeader, IvHtmlFooter, IvHtmlDefault: string; IvSlideId: integer): string;
var
  ok: boolean;
  dst: TDataset;
begin
  ok := TDbaRec.DsFromSql(IvSql, dst, false);
  if not ok then
    Result := Modal(true, 'CoSlidesFromSqlModal', Code(IvSql, 'sql'), H(2, 'Unable to creater a slide show from sql'))
  else try
    Result := SlidesFromDs(dst, IvHtmlSlideBody, IvHtmlHeader, IvHtmlFooter, IvHtmlDefault, IvSlideId);
  finally
    dst.Free;
  end;
end;

class function  THtmRec.TopNav(IvId, IvPId: integer): string;

  {$REGION 'var'}
const
  SQL1         = 'select (select count(*) from DbaPage.dbo.TblObject where FldPId = a.FldId and FldState = ''Active'' and FldObject not in (''Zzz'', ''Available'')) as FldChildCount, *'
  + sLineBreak + 'from DbaPage.dbo.TblObject a'
  + sLineBreak + 'where FldState = ''Active'' and FldObject not in (''Zzz'', ''Available'') and FldPId = %s'
  + sLineBreak + 'order by FldOrder, FldObject';
var
  ish, brk, bgd: boolean; // ishome, break, backgroundcolorisdark
  idi, chz: integer; // idint, childcount
  sbu: TSbuRec;
  {pur, pph,}lgo, url, ur2, ur3, cap, sql, buf, fbk: string; // logourl, parenturl, parentpath
  dst, ds1, ds2, ds3: TDataset;
  {$ENDREGION}

  {$REGION 'macro'}
  function  LogoSizePx: string;
  begin                                                          // font-size (px)
         if gthe.SizeClass = 'w3-tiny'     then Result := '31'   // 10 *** DA RIVEDERE ***
    else if gthe.SizeClass = 'w3-small'    then Result := '30'   // 12     ok
    else if gthe.SizeClass = 'w3-medium'   then Result := '38.5' // 15 *** DA RIVEDERE ***
    else if gthe.SizeClass = 'w3-large'    then Result := '43'   // 18 *** DA RIVEDERE ***
    else if gthe.SizeClass = 'w3-xlarge'   then Result := '52'   // 24 *** DA RIVEDERE ***
    else if gthe.SizeClass = 'w3-xxlarge'  then Result := '70'   // 36 *** DA RIVEDERE ***
    else if gthe.SizeClass = 'w3-xxxlarge' then Result := '88'   // 48 *** DA RIVEDERE ***
    else if gthe.SizeClass = 'w3-jumbo'    then Result := '112'  // 64 *** DA RIVEDERE ***
    else                                        Result := '35';  // 12     ok plain nav-bar, with empty gthe.SizeClass
  end;

  function  ItemAdd(IvKind{Link|Button|(Caption)}, IvHref, IvCaption, IvTitle: string; IvClass: string = 'w3-bar-item'; IvStyle: string = ''; IvImg: string = ''): string;
  begin
    if not IvImg.IsEmpty then
      //IvCaption := Format('<img src="%s" alt="%s" style="height:%spx;padding:0px; %s">', [IvImg, IvCaption, LogoSizePx, IvStyle]);
      IvCaption := Img(IvImg, IvCaption, LogoSizePx.ToInteger, LogoSizePx.ToInteger);

    // link
    if IvKind[1].ToUpper = 'L' then begin
      if not IvHref.StartsWith('/') then
        IvHref := Format('javascript:%s', [IvHref]);

      Result := Format('<a href="%s" class="w3-button %s" style="%s" title="%s">'
        + sLineBreak +   IvCaption
        + sLineBreak + '</a>', [IvHref, IvClass, IvStyle, IvTitle, IvCaption])

    // button
    end else if IvKind[1].ToUpper = 'B' then begin
      if IvHref.StartsWith('/') then
        IvHref := Format('window.location.href=''%s'';', [IvHref]);

      Result := Format('<button type="button" class="w3-button %s" style="%s" title="%s" onclick="%s">'
        + sLineBreak +   IvCaption
        + sLineBreak + '</button>', [IvClass, IvStyle, IvTitle, IvHref, IvCaption]);

    // span/caption
    end else
      Result := Format('<span class="w3-bar-item %s" style="%s" title="%s">'
        + sLineBreak +   IvCaption
        + sLineBreak + '</span>', [IvClass, IvStyle, IvTitle, IvCaption]);
  end;

  procedure ItemsAdd(IvHideOnSmallScreen: boolean);
  var
    hss, bit, fle, sel, cap, tit: string; // hideonsmallornot, baritem, floatleft, selected, caption
    cnt, cn2: integer;
  begin
    hss := giif.Str(IvHideOnSmallScreen, ' w3-hide-small', '');
    bit := giif.Str(IvHideOnSmallScreen, '', ' w3-bar-item');
    fle := giif.Str(IvHideOnSmallScreen, 'float:left;', '');

    dst.First;
    while not dst.Eof do begin
      // zip
      cnt := dst.FieldByName('FldChildCount').AsInteger;
      url := Format('/%s?CoId=%d', [TBynRec.BinaryNameExt, dst.FieldByName('FldId').AsInteger]); // /Page
      sel := giif.Str(dst.FieldByName('FldId').AsInteger = IvId, ' w3-white'{+the.SelectedColor}, '');
      cap := dst.FieldByName('FldTitle').AsString;
      if cap.IsEmpty then
        cap := TStrRec.StrExpand(dst.FieldByName('FldObject').AsString);
      tit := dst.FieldByName('FldTitle').AsString;

      // nodrop
      if cnt = 0 then begin
  sbu.Add(  ItemAdd('B', url, cap, tit, hss+sel+bit+' '+gthe.PaddingClass, fle)); // adjustbuttonpadding

      // drop
      end else begin
        sql := Format(SQL1, [dst.FieldByName('FldId').AsString]);
        TDbaRec.DsFromSql(sql, ds2);
        try
  sbu.Add(  '<div class="w3-dropdown-hover %s">', [hss]);
  sbu.Add(    ItemAdd('B', url, cap+' <i class="fa fa-caret-down"></i>', tit, hss+sel+bit+' '+gthe.PaddingClass{, 'float:left;'}));
  sbu.Add(    '<div class="w3-dropdown-content w3-bar-block w3-card-4">');
          while not ds2.Eof do begin
            cn2 := ds2.FieldByName('FldChildCount').AsInteger;
            ur2 := Format('/%s?CoId=%d', [TBynRec.BinaryNameExt, ds2.FieldByName('FldId').AsInteger]); // /Page
            cap := ds2.FieldByName('FldTitle').AsString; if cap.IsEmpty then cap := TStrRec.StrExpand(ds2.FieldByName('FldObject').AsString);

            // nochilds
            if cn2 = 0 then begin
  sbu.Add(      ItemAdd('B', ur2, cap, tit, hss+sel+' w3-bar-item'));

            // withchilds
            end else begin
              sql := Format('select top(1) * from DbaPage.dbo.TblObject a where FldState = ''Active'' and FldObject != ''Available'' and FldPId = %d order by FldOrder, FldObject', [ds2.FieldByName('FldId').AsInteger]);
              TDbaRec.DsFromSql(sql, ds3);
              ur3 := Format('/%s?CoId=%d', [TBynRec.BinaryNameExt, ds3.FieldByName('FldId').AsInteger]);
              try
  sbu.Add(      '<div style="display:flex; flex-flow:row nowrap; justify-content: space-between;">');
  sbu.Add(        ItemAdd('B', ur2, cap, tit, bit+' w3-left-align w3-block'));
  sbu.Add(        ItemAdd('B', ur3, '<i class="fa fa-bars"></i>', Format('%d childs', [cn2]), '???', 'width: 48px;'));
  sbu.Add(      '</div>');
              finally
                ds3.Free;
              end;
            end;

            ds2.Next;
          end;
  sbu.Add(    '</div>');
  sbu.Add(  '</div>');
        finally
          ds2.Free;
        end;
      end;

      dst.Next;
    end;
  end;

  function  ItemChildAdd(IvObj, IvIdOrPath: string): string; // only as button *** DA FINIRE ***
  var              
    tbl, fld, fls, hre, cap, tit: string;
    idi: integer;
    dst: TDataset;
  begin
    tbl := TSqlRec.TblMasterFromObj(IvObj);
    fld := 'FldObject';
    fls := fld + ', FldTitle, FldSubtitle';
    idi := TDbaRec.ObjIdFromIdOrPath(IvObj, IvIdOrPath);
    TDbaRec.HChildsDs(tbl, fls, idi, dst); // FldId, FldPId, FldLevel, FldState, FldObjectKind, FldContentKind, FldPath, FldObject, ...
    while not dst.Eof do begin      
      hre := Format('/WksPageIsapiProject.dll?CoId=%s', [dst.FieldByName('FldId').AsString]);
      cap := dst.FieldByName(fld).AsString;
      tit := dst.FieldByName('FldTitle').AsString;
      Result := Result + ItemAdd('B', hre, cap, tit);
      dst.Next;
    end;
  end;

  function  ItemTreeAdd(IvObj, IvIdOrPath: string): string;
  begin
  end;
  {$ENDREGION}

begin

  {$REGION 'zip'}
  ish := IvId = gorg.HomePageId;
  idi := giif.Int(ish, IvId, IvPId);
  bgd := TColRec.TColIsDark(TColRec.FromHexStr(TW3fRec.W3ColorFromTheme(gthe.Theme))); // TColRec.FromHexStr(gthe.Theme)
  lgo := gorg.LogoUrl(true, bgd);
  {$ENDREGION}

  {$REGION 'topnav'}
  sql := Format(SQL1, [idi.ToString]);
  TDbaRec.DsFromSql(sql, dst);
  chz := dst.RecordCount;
  try

    {$REGION 'navbar'}
  sbu.Add('<div class="w3-bar %s %s %s">'                                                         , [{gthe.FgColor,} gthe.Grade, gthe.BorderedClass, gthe.SizeClass], true, 0);

    {$REGION 'itemsonlargeandsmallscreen'}

      {$REGION 'back'}
//sbu.Add(   ItemAdd('B', 'window.history.back();', '<i class="fa fa-chevron-left"></i>', 'Back')                                                                               );
      {$ENDREGION}

      {$REGION 'navicon'}
  if chz > 0 then
  sbu.Add(   ItemAdd('B', 'w3.toggleClass(''#CoTopnavOnSmallScreen'', ''w3-show'')', '<i class="fa fa-navicon"></i>', 'More...', 'w3-right w3-hide-large w3-hide-medium')       );
      {$ENDREGION}

      {$REGION 'organization'}
  sbu.Add(  '<!-- itemsonlargeandsmallscreen -->');
  sbu.Add(  '<div class="w3-dropdown-hover"></div>'                                                                                                                             ); // dummy1stchild(diversebg)
  sbu.Add(  '<div class="w3-dropdown-hover">'                                                                                                                                   ); // orga
//sbu.Add(    ItemAdd('B', 'wks.fbkNotImpl()', gorg.Obj.&Object, gorg.Obj.&Object, 'w3-padding-xsmall', '', lgo)                                                                ); // logo -> presentation, contacts, etc
  sbu.Add(    ItemAdd('B', ''                , gorg.Obj.&Object, gorg.Obj.&Object, 'w3-padding-xsmall', '', lgo)                                                                ); // logo -> presentation, contacts, etc
if gorg.Obj.&Object.Equals('Wks') and gwse.IsValid(fbk) then begin
  sbu.Add(    '<div class="w3-dropdown-content w3-bar-block w3-card-4">'                                                                                                        );
//sbu.Add(      ItemAdd('B', '/WksPageIsapiProject.dll/Info'                , 'Info'    , 'Info'                 )                                                              ); // info
//sbu.Add(      ItemAdd('B', '/WksPageIsapiProject.dll/OrganizationContacts', 'Contacts', 'Organization Contacts')                                                              ); // contacts
  sbu.Add(      ItemChildAdd('Page', '\Root\Help')                                                                                                                              ); // help (global)
  sbu.Add(      ItemAdd('B', '/WksPageIsapiProject.dll/Theme'               , 'Theme'   , 'Theme'                )                                                              ); // theme
  sbu.Add(      ItemAdd('B', '/WksPageIsapiProject.dll/Init'                , 'Init'    , 'Init'                 )                                                              ); // init
  sbu.Add(      ItemAdd('B', '/WksPageIsapiProject.dll/Test'                , 'Test'    , 'Test'                 )                                                              ); // test
  sbu.Add(    '</div>');
end;
  sbu.Add(  '</div>');
  sbu.Add(  ItemAdd('S', '', gorg.Obj.&Object, gorg.Obj.&Object, 'w3-hide-large w3-hide-medium')                                                                              ); // text
      {$ENDREGION}

      {$REGION 'home'}
//sbu.Add(  ItemAdd('B', '/WksPageIsapiProject.dll', '<i class="fa fa-home"></i>', 'Home', 'w3-left') {w3-right}                                                       , not ish);
      {$ENDREGION}

      {$REGION 'user/member'}
    if not {IsLoggedIn}gwse.IsValid(fbk) then
  sbu.Add(  ItemAdd('B', '/WksPageIsapiProject.dll/Login', '<i class="fa fa-user"></i>', 'Login', 'w3-right')                                                                   )
    else begin
  sbu.Add(  '<div class="w3-dropdown-hover w3-right">'                                                                                                                          ); // user/member
  sbu.Add(    ItemAdd('B', 'wks.fbkNotImpl()', gusr.Username, gusr.Username, 'w3-padding-xsmall', '', gusr.AvatarUrl)                                                           );
  sbu.Add(    '<div class="w3-dropdown-content w3-bar-block w3-card-4" style="right:0px">'                                                                                      );
  sbu.Add(      ItemAdd('B', '/WksPageIsapiProject.dll/Logout'      , 'Logout'  , 'Logout'  )                                                                                   );
  sbu.Add(      ItemAdd('B', '/WksPageIsapiProject.dll/UserContacts', 'Contacts', 'Contacts')                                                                                   );
  sbu.Add(      ItemAdd('B', '/WksPageIsapiProject.dll/UserCv'      , 'Cv'      , 'Cv'      )                                                                                   ); // init
  sbu.Add(    '</div>');
  sbu.Add(  '</div>');
    end;
      {$ENDREGION}

      {$REGION 'uptohome'}
  if not ish {and (chz > 0)} then begin
//pur := Format('/%s?CoId=%d', [gctx.BinaryName, IvPId]); // /Page
//pph := TDbaRec.HPath('DbaPage.dbo.TblObject', 'FldObject', IvPId, ' > ', true);
  TDbaRec.HParentsDs('DbaPage.dbo.TblObject', 'FldObject, FldTitle', IvId, ds1, '', 'FldLevel asc');
  try
  sbu.Add(  '<div class="w3-dropdown-hover">'); // drophover
//sbu.Add(    ItemAdd('B', pur, '<i class="fa fa-chevron-up"></i>', 'one level up to '+pph));
  sbu.Add(    ItemAdd('B', '/WksPageIsapiProject.dll', '<i class="fa fa-home"></i>', 'Home', ''));
  sbu.Add(    '<div class="w3-dropdown-content w3-bar-block w3-card-4">');
  brk := IvPId = TWksRec.HELP_PAGE_HOME_ID; // for items under /Root/Help, avoid to add the full parents buttons otherwise all under /Root will be exposed!
  while not ds1.Eof do begin
    if brk then
      Break;
    if ds1.FieldByName('FldId').AsInteger <> IvId then begin
      url := Format('/%s?CoId=%d', [TBynRec.BinaryNameExt, ds1.FieldByName('FldId').AsInteger]);
      if ds1.FieldByName('FldObject').AsString = gorg.Obj.&Object then
      //cap := 'Home'
      else begin
        cap := ds1.FieldByName('FldTitle').AsString;
        if cap.IsEmpty then cap := TStrRec.StrExpand(ds1.FieldByName('FldObject').AsString);
      buf := ItemAdd('B', url, cap, cap, ' w3-bar-item')
           + sLineBreak + buf;
      end;
    end;
    brk := ds1.FieldByName('FldId').AsInteger = gorg.HomePageId;
    ds1.Next;
  end;
  sbu.Add(buf);
  finally
    ds1.Free;
  end;
  sbu.Add(    '</div>');
  sbu.Add(  '</div>');
  end;
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'itemsonlargescreen'}
  sbu.Add(  '<!-- itemsonlargescreen -->');
  ItemsAdd(true);
    {$ENDREGION}

  sbu.Add('</div>');

    {$REGION 'itemsonsmallscreen'}
  sbu.Add(  '<!-- itemsonsmallscreen -->');
  sbu.Add(  '<div id="CoTopnavOnSmallScreen" class="w3-bar-block w3-hide w3-hide-large w3-hide-medium w3-card-4">');
  ItemsAdd(false);
  sbu.Add(  '</div>');
    {$ENDREGION}

    {$ENDREGION}

  Result := sbu.Text;
  finally
    dst.Free;
  end;
  {$ENDREGION}

  {$REGION 'zzz'}
//sbu.Add(  '<a href="#" class="w3-bar-item w3-button w3-hide-small %s w3-%s">Link 1</a>'                              , [the.PaddingClass, the.SelectedColor]); // link1 selected
//sbu.Add(  '<a href="#" class="w3-bar-item w3-button w3-hide-small %s">Link 2</a>'                                                       , [the.PaddingClass]); // link2
//sbu.Add(  '<a href="#" class="w3-bar-item w3-button w3-hide-small %s">Link 3</a>'                                                       , [the.PaddingClass]); // link3

//sbu.Add(  '<div class="w3-dropdown-hover w3-hide-small">'                                                                                                   ); // drophover
//sbu.Add(  '  <button class="w3-button">DropHover</button>'                                                                                                  );
//sbu.Add(  '  <div class="w3-dropdown-content w3-bar-block w3-card-4">'                                                                                      );
//sbu.Add(  '    <a href="#" class="w3-bar-item w3-button">Link A</a>'                                                                                        );
//sbu.Add(  '    <a href="#" class="w3-bar-item w3-button">Link B</a>'                                                                                        );
//sbu.Add(  '    <a href="#" class="w3-bar-item w3-button">Link C</a>'                                                                                        );
//sbu.Add(  '  </div>'                                                                                                                                        );
//sbu.Add(  '</div>'                                                                                                                                          );

//sbu.Add(  '<div class="w3-dropdown-click w3-hide-small">'                                                                                                   ); // dropclick
//sbu.Add(  '  <button class="w3-button" onclick="w3.toggleClass(''#CoDropClick1L'', ''w3-show'')">Dropdown <i class="fa fa-caret-down"></i></button>'        );
//sbu.Add(  '  <div id="CoDropClick1L" class="w3-dropdown-content w3-bar-block w3-card">'                                                                     );
//sbu.Add(  '    <a href="#" class="w3-bar-item w3-button">Link D</a>'                                                                                        );
//sbu.Add(  '    <a href="#" class="w3-bar-item w3-button">Link E</a>'                                                                                        );
//sbu.Add(  '    <a href="#" class="w3-bar-item w3-button">Link F</a>'                                                                                        );
//sbu.Add(  '  </div>'                                                                                                                                        );
//sbu.Add(  '</div>'                                                                                                                                          );

//sbu.Add(  '<input type="text" class="w3-bar-item w3-input w3-hide-small %s" placeholder="Search...">'                                   , [the.PaddingClass]); // search
//sbu.Add(  '<a href="#" class="w3-bar-item w3-button w3-hide-small %s"><i class="fa fa-search"></i></a>'                                 , [the.PaddingClass]); // go


//sbu.Add(  '<a href="#" class="w3-bar-item w3-button %s w3-%s">Link 1</a>'                                            , [the.PaddingClass, the.SelectedColor]); // link1 selected
//sbu.Add(  '<a href="#" class="w3-bar-item w3-button %s">Link 2</a>'                                                                     , [the.PaddingClass]); // link2
//sbu.Add(  '<a href="#" class="w3-bar-item w3-button %s">Link 3</a>'                                                                     , [the.PaddingClass]); // link3

//sbu.Add(  '<div class="w3-dropdown-hover">'                                                                                                                 ); // drophover
//sbu.Add(  '  <button class="w3-button">DropHover</button>'                                                                                                  );
//sbu.Add(  '  <div class="w3-dropdown-content w3-bar-block w3-card-4">'                                                                                      );
//sbu.Add(  '    <a href="#" class="w3-bar-item w3-button">Link A</a>'                                                                                        );
//sbu.Add(  '    <a href="#" class="w3-bar-item w3-button">Link B</a>'                                                                                        );
//sbu.Add(  '    <a href="#" class="w3-bar-item w3-button">Link C</a>'                                                                                        );
//sbu.Add(  '  </div>'                                                                                                                                        );
//sbu.Add(  '</div>'                                                                                                                                          );

//sbu.Add(  '<div class="w3-dropdown-click">'                                                                                                                 ); // dropclick
//sbu.Add(  '  <button class="w3-button" onclick="w3.toggleClass(''#CoDropClick1S'', ''w3-show'')">Dropdown <i class="fa fa-caret-down"></i></button>'        );
//sbu.Add(  '  <div id="CoDropClick1S" class="w3-dropdown-content w3-bar-block w3-card">'                                                                     );
//sbu.Add(  '    <a href="#" class="w3-bar-item w3-button">Link D</a>'                                                                                        );
//sbu.Add(  '    <a href="#" class="w3-bar-item w3-button">Link E</a>'                                                                                        );
//sbu.Add(  '    <a href="#" class="w3-bar-item w3-button">Link F</a>'                                                                                        );
//sbu.Add(  '  </div>'                                                                                                                                        );
//sbu.Add(  '</div>'                                                                                                                                          );

//sbu.Add(  '<input type="text" class="w3-bar-item w3-input %s %s" placeholder="Search...">'                                         , [hss, the.PaddingClass]); // search
//sbu.Add(  '<a href="#" class="w3-bar-item w3-button %s %s" title="Search"><i class="fa fa-search"></i></a>'                        , [hss, the.PaddingClass]); // go
//sbu.Add(  '<button type="button" class="w3-button %s %s" title="Search" onclick="window.location.href=''%s'';"><i class="fa fa-search"></i></button>', [hss, the.PaddingClass]);
  {$ENDREGION}

end;

class function  THtmRec.Page(IvPage: TPagRec{; IvTopNavOff, IvSystemInfoOff: boolean}): string;

  {$REGION 'var'}
var
  sbu: TSbuRec;
  dst: TDataset;
//mkd: TMarkdownProcessor; // not used
  poi: integer; // pageobjectid
  pat, pok, pot, por, tit, cls, sty, sql: string; // pagetitle, pageobjkind, pageobjtitle, pageobjrev, title, class, style
  {$ENDREGION}

begin

  {$REGION 'help'}
  (*
                       ---------------------------------------------------------------------------
                      |                                                                         X |
                      |                                                                           |
                      |                                topoffcanvas                               |
                       ---------------------------------------------------------------------------

    ---------------    ---------------------------------------------------------------------------    ----------------
   |             X |  |                                   topnav                                  |  |              X |
   |               |  |---------------------------------------------------------------------------|  |                |
   |               |  |                                   header                                  |  |                |  
   |               |  | . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . |  |                |
   |               |  |                                                                           |  |                |
   |               |  |                                                                           |  |                |
   |               |  |                                                                           |  |                |
   |               |  |                                                                           |  |                |
   |               |  |                                                                           |  |                |
   |               |  |                                  content                                  |  |                |
   |               |  |                                                                           |  |                |
   |               |  |                                                                           |  |                |
   |               |  |                                                                           |  |                |
   |               |  |                                                                           |  |                |
   |               |  |                                                                           |  |                | 
   |               |  | . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . |  |                |
   |               |  |                                   footer                                  |  |                | 
   |               |  | . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . |  |                |
   | leftoffcanvas |  |                                  sysinfo                                  |  | rightoffcanvas |
    ---------------    ---------------------------------------------------------------------------    ----------------

                       ---------------------------------------------------------------------------
                      |                                                                         X |
                      |                                                                           |
                      |                               bottomoffcanvas                             |
                       ---------------------------------------------------------------------------

                      . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
                      .                                ghostwidgets                               .
                      . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
  *)
  {$ENDREGION}

  {$REGION 'eventualpagecontainedobject'}
  // init
  pat := TStrRec.StrCoalesce([IvPage.Obj.Title, IvPage.Page, IvPage.Obj.&Object]);
  pok := '';

  // trydocument
  poi := gwrq.FieldQueryGet('CoDocumentId', 0);
  if poi > 0 then
    pok := 'Document'
  else begin
    // trytask
    poi := gwrq.FieldQueryGet('CoTaskId', 0);
    if poi > 0 then
      pok := 'Task'
//  else begin
//    // tryobject
//    poi := gwrq.FieldQueryGet('CoObjectId', 0);
//    if poi > 0 then
//      pok := 'Object'
//  end
    ;
  end;

  // thereiscontainedobject, like a document
  if poi > 0 then begin
    sql := Format('select coalesce(nullif(FldTitle, ''''), FldObject) as FldTitle, FldRev from Dba%s.dbo.TblObject where FldId = %d', [pok, poi]);
    TDbaRec.DsFromSql(sql, dst);
    pot := dst.FieldByName('FldTitle').AsString;
    por := giif.ExP(dst.FieldByName('FldRev').AsString, ' - Rev');
    tit := Format('%s%s - %s', [pot, por, pok.ToUpper]);

  // thereisnt
  end else
    tit := Format('%s - %s', [gorg.Obj.&Object.ToUpper, pat]);
  {$ENDREGION}

  {$REGION 'html'}
  sbu.Add('<!DOCTYPE html>', true, 0);
  sbu.Add('<html lang="en-US">'                                                                                              ); // lang

  {$REGION 'head'}
  sbu.Add('<head>');

  sbu.Add('<title>%s</title>'                                                                                         , [tit]); // title

  sbu.Add('<!-- metas -->'                                                                                                   ); // metas
//sbu.Add('<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-8">'                                          ); // HTML 2.0..4.01 ISO-8859-1 is the default charset
  sbu.Add('<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">'                                               ); // HTML 4.01 also support utf-8
//sbu.Add('<meta charset="ISO-8859-1">'                                                                                      ); // HTML5 alternative
  sbu.Add('<meta charset="utf-8">'                                                                                           ); // HTML5 encouraged
  sbu.Add('<meta name="author" content="puppadrillo">'                                                                       ); // author
  sbu.Add('<meta name="description" content="working knowledge sysytem">'                                                    ); // description
  sbu.Add('<meta name="viewport" content="width=device-width, initial-scale=1">'                                             ); // viewport
  sbu.Add('<meta http-equiv="Cache-control" content="no-cache no-store">'                                                    ); // cache

  sbu.Add('<!-- css -->'                                                                                                     ); // css
  sbu.Add('<link rel="shortcut icon" href="%s" />'                                                           , [gorg.IconUrl]); // icon
  sbu.Add('<link rel="stylesheet" href="/Include/font-awesome/4.7.0/css/font-awesome.css">'                                  ); // fonts fa
  sbu.Add('<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=%s">'                     , [gthe.FontFamily]); // fonts google
  sbu.Add('<link rel="stylesheet" href="/Include/highlight.js/11.7.0/styles/%s.min.css">'                , [gthe.HighlightJs]); // highlightjs theme

  sbu.Add('<!-- js -->'                                                                                                      ); // js
  sbu.Add('<script src="/Include/jquery/3.7.0/jquery-3.7.0.js"></script>'                                                    ); // jquery
  sbu.Add('<script src="/Include/canvasjs/1.9.6/canvasjs.min.js"></script>'                                                  ); // graph (nowatermark)
  sbu.Add('<script src="/Include/highlight.js/11.7.0/highlight.min.js"></script>'                                            ); // highlight
  sbu.Add('<script>hljs.highlightAll();</script>'                                                                            ); // highlight

//case gthe.Framework of                                                                                                        // frameworks
//wfW3 : begin
  sbu.Add('<!-- w3 -->'                                                                                                      ); // w3
  sbu.Add('<link rel="stylesheet" href="/Include/w3/w3.css">'                                                                ); // w3css (https://www.w3schools.com/w3css/4/w3.css write cookies!)
  sbu.Add('<link rel="stylesheet" href="/Include/w3/w3-theme-%s.css">'                                         , [gthe.Theme]); // w3csstheme
  sbu.Add('<script src="/Include/w3/w3.js"></script>'                                                                        ); // w3js
  sbu.Add('<script src="/Include/w3/w3color.js"></script>'                                                                   ); // w3colorjs
//end;
//wfBs : begin
//sbu.Add('<!-- bootstrap -->'                                                                                               ); // bootstrap
//sbu.Add('<link rel="stylesheet" href="/Include/bootstrap/5.3.0/css/bootstrap.css">'                                        ); // bscss
//sbu.Add('<script src="/Include/bootstrap/5.3.0/js/bootstrap.js"></script>'                                                 ); // bsjs
//end;
//end;
  sbu.Add('<!-- wks -->'                                                                                                     ); // wks
//sbu.Add('<link rel="stylesheet" href="/Include/wks/wks.css">'                                                              ); // wkscss *** prefer to use extensions in w3-theme*.css ***
  sbu.Add('<script src="/Include/wks/wks.js"></script>'                                                                      ); // wksjs

  // pluginsbefore
  sbu.Add('<!--[RvPluginsBefore]-->'); // this tag will be replaced at the very end (webmodule.afterdispatch) with all plugins scripts needed by the builded page

if not IvPage.Head.Trim.IsEmpty then begin
  sbu.Add('<!-- headcustom -->'                                                                                                ); // pagehead
  sbu.Add(IvPage.Head.Trim                                                                                                   );
end;

  sbu.Add('<!-- css -->'                                                                                                 ); // pagecss default
  sbu.Add('<style>'                                                                                                          );
  sbu.Add('html, body {'                                                                                                     );
  sbu.Add('  font-family: %s, sans-serif !important}'                                                     , [gthe.FontFamily]);
  sbu.Add('}'                                                                                                                );
  sbu.Add('h1,h2,h3,h4,h5,h6 {'                                                                                              );
//sbu.Add('  font-family: %s, sans-serif;'                                                                , [gthe.FontFamily]);
  sbu.Add('  font-weight: %s;'                                                                            , [gthe.FontWeight]);
  sbu.Add('  margin: 10px 0;'                                                                                                );
  sbu.Add('}'                                                                                                                );
  sbu.Add('</style>'                                                                                                         );

if not IvPage.Css.Trim.IsEmpty then begin
  sbu.Add('<!-- csscustom -->'                                                                                                 ); // pagecss custom
  sbu.Add('<style>'                                                                                                          );
  sbu.Add(IvPage.Css.Trim                                                                                                    );
  sbu.Add('</style>'                                                                                                         );
end;

if not IvPage.Js.Trim.IsEmpty then begin
  sbu.Add('<!-- jscustom(before) -->'                                                                                        ); // pagejsbefore
  sbu.Add('<script>'                                                                                                         );
  sbu.Add(IvPage.Js.Trim                                                                                                     );
  sbu.Add('</script>'                                                                                                        );
end;
  sbu.Add('</head>'                                                                                                          );
  {$ENDREGION}

  {$REGION 'snackbar'}
  sbu.Add('<!-- snackbar -->'                                                                                                ); // snackbar
  sbu.Add('<div class="w3-card-4" id="CoSnackbar">Snackbar</div>'                                                            );
  {$ENDREGION}

  {$REGION 'body'}
  sbu.Add('<body tabindex="0">'                                                                                              );

    {$REGION 'offcanvas'}
//if not true then begin                                                                                                        // offcanvas
//  sbu.Add('<!-- topoffcanvas -->'                                                                                          ); // top
//  sbu.Add('<!-- leftoffcanvas -->'                                                                                         ); // left
//  sbu.Add('<!-- rightoffcanvas -->'                                                                                        ); // right
//  sbu.Add('<!-- bottomoffcanvas -->'                                                                                       ); // bottom
//end;
    {$ENDREGION}

    {$REGION 'topnav'}
if not IvPage.TopNavOff then begin
  sbu.Add('<!-- topnav -->'                                                                                                  ); // topnav
  sbu.Add(TopNav(IvPage.Obj.Id, IvPage.Obj.PId)                                                                              );
end;
    {$ENDREGION}

    {$REGION 'logsidebar'}
//if true then begin
//  sbu.Add('<!-- rightsidebar (toolbar) -->');
//  sbu.Add('<div class="w3-sidebar w3-bar-block w3-lightgray" style="width:44px;right:0;">');
//  sbu.Add(  '<button onclick="logToggle()" class="w3-bar-item w3-button"><i class="fa fa-bars"></i></button>');
//  sbu.Add('</div>');
//
//  sbu.Add('<!-- logsidebar -->');
//  sbu.Add('<div class="w3-sidebar w3-bar-block w3-card w3-padding-small" style="width:300px;right:44px; display:none;" id="CoLogRightBar">');
////sbu.Add(  '<button onclick="logClose()" class="w3-bar-item w3-button w3-large">Log <span class="w3-right">&times;</span></button>');
//  sbu.Add(  '<h5 class="w3-bar-item">Log</h5>');
//  sbu.Add(  '<div style="height:calc(100% - 114px)">');
//  sbu.Add(    '<textarea class="w3-input w3-border w3-round" style="width:100%;height:100%;">ready...</textarea>');
//  sbu.Add(  '</div>');
//  sbu.Add('</div>');
//end;
    {$ENDREGION}

//sbu.Add('<div id="CoMain">'); // div for all

    {$REGION 'container'}
if IvPage.ContainerOn then begin                                                                                                        // containerbegin
  // class
  cls := 'w3-container';
  if IvPage.ContentFixed then
    ValAdd(cls, 'w3-content', ' ');

  // style
  if IvPage.ContentFixed then
    sty := ''
  else
    sty := 'width:fit-content;';
  if IvPage.Centered then
    ValAdd(sty, 'margin-left:auto; margin-right:auto;', ';')
  else begin                                                                                                                            // margins
    ValAdd(sty, Format('margin-left:%dpx'  , [16 * IvPage.LeftSpace  ]), ';', IvPage.LeftSpace   > 0);
    ValAdd(sty, Format('margin-right:%dpx' , [16 * IvPage.RightSpace ]), ';', IvPage.RightSpace  > 0);
  end;
    ValAdd(sty, Format('margin-top:%dpx'   , [16 * IvPage.TopSpace   ]), ';', IvPage.TopSpace    > 0);
    ValAdd(sty, Format('margin-bottom:%dpx', [16 * IvPage.BottomSpace]), ';', IvPage.BottomSpace > 0);

  // html
  sbu.Add('<!-- container -->'                                                                                                       );
  sbu.Add('<div class="%s" style="%s">'                                                                                  , [cls, sty]);
end;

    {$REGION 'header'}
if not IvPage.Header.IsEmpty then begin
  sbu.Add('<!-- header -->'                                                                                                          ); // header
  sbu.Add(IvPage.Header                                                                                                              );
end;
    {$ENDREGION}

    {$REGION 'titles'}
if IvPage.TitleShow then begin
  sbu.Add('<!-- titles -->'                                                                                                          ); // titles
  sbu.Add('<div>'                                                                                                                    );
  sbu.Add('<h1>%s</h1>'                                                                                         , [pat], giis.Ex(pat));
  sbu.Add('<h6 class="w3-theme-text-dark">%s</h6>'      , [IvPage.Obj.Subtitle], IvPage.SubtitleShow and giis.Ex(IvPage.Obj.Subtitle));
  sbu.Add('<p class="w3-theme-text-dark w3-text-italic w3-small">%s</p>'  , [IvPage.Obj.Description], giis.Ex(IvPage.Obj.Description));
  sbu.Add('<hr>'                                                                                                                     );
  sbu.Add('</div>'                                                                                                                   );
end;
    {$ENDREGION}

    {$REGION 'content'}
  sbu.Add('<!-- content -->'                                                                                                         ); // content
if IvPage.Obj.Content.Trim.IsEmpty then
  sbu.Add('<div class="w3-panel w3-center w3-padding-64"><p class="w3-xxlarge w3-theme-text-light">Empty Page</p></div>'             )  // empty
else begin
  if IvPage.Obj.ContentKindIsMarkdown then begin                                                                                        // mkd
//  if false then begin
//    if true then
//      mkd := TMarkdownProcessor.CreateDialect(mdCommonMark) // unsafe=true not allowed
//    else begin
//      mkd := TMarkdownProcessor.CreateDialect(mdDaringFireball);
//      mkd.AllowUnsafe := true;
//    end;
//    try
//      IvPage.Content := mkd.Process(IvPage.Content);
//    finally
//      mkd.Free;
//    end;
//  end else begin
      sbu.Add(TMkdRec.Process(IvPage.Obj.Content)                                                                                    ); // notempty
//  end;
  end else
    sbu.Add(IvPage.Obj.Content                                                                                                       ); // notempty
end;
    {$ENDREGION}

    {$REGION 'footer'}
if not IvPage.Footer.IsEmpty then begin
  sbu.Add('<!-- footer -->'                                                                                                          ); // footer
  sbu.Add(IvPage.Footer                                                                                                              );
end;
    {$ENDREGION}

  sbu.Add('</div>', IvPage.ContainerOn                                                                                               ); // containerend
    {$ENDREGION}

    {$REGION 'systeminfo'}
if not IvPage.SystemInfoOff then begin
  sbu.Add('<!-- systeminfo -->'                                                                                                      );
  sbu.Add('<hr>'                                                                                                                     );
  sbu.Add('<footer class="w3-container w3-center">'                                                                                  );
  sbu.Add(  '<p class="w3-small w3-text-gray">'                                                                                      ); // sysinfo
  sbu.Add(  'Wks %s application server (%s) - %s', [gctx.WksModule.ToUpper, TAaaRec.ProcessKindAsText, DateTimetoStr(Now())], true, 0);
  sbu.Add(  ' - orga %d - client %d - session %d - request %d', [gorg.ObjectId, gwrq.FingerprintId, gwrq.SessionId{gwse.SessionId}, gwrq.RequestId], true, 0);
  sbu.Add(  ' - elapsed time $RvElapsedMs$ ms'                                                                                       );
  sbu.Add(  '</p>'                                                                                                                   );
  sbu.Add(  '<p class="w3-small w3-text-gray">'                                                                                      ); // poweredby
  sbu.Add(  'Powered by <a href="%s" target="_blank"><img src="%s" class="w3-image" style="height:18px" title="%s"></a>', [TWksRec.HOME_URL, TWksRec.ICON_URL, TWksRec.NAME]);
  sbu.Add(  '</p>'                                                                                                                   );
  sbu.Add('</footer>'                                                                                                                );
end;
    {$ENDREGION}

    {$REGION 'utilswidgets'}

      {$REGION 'gototop'}
  sbu.Add('<!-- gototop -->'                                                                                                                                 ); // gototop
//sbu.Add('<input class="w3-button w3-circle w3-theme-d1 w3-card-4" id="CoGoToTopButton" type="button" value="Go To Top" onclick="wksGoToTopFunction();">'   );
  sbu.Add('<button type="button" class="w3-button w3-circle w3-theme-a w3-card-4" id="CoGoToTopButton" title="Go to the top" onclick="wksGoToTopFunction();"');
  sbu.Add(' style="display:none;padding:0px;position:fixed;width:40px;height:40px;bottom:20px;right:20px;"><i class="fa fa-chevron-up"></i>'        , true, 0);
  sbu.Add('</button>'                                                                                                                                        );
  sbu.Add('<script>'                                                                                                                                         );
  sbu.Add('function  wksGoToTopFunction() {'                                                                                                                 );
  sbu.Add('  document.body.scrollTop = 0;'                                                                                                                   );
  sbu.Add('  document.documentElement.scrollTop = 0;'                                                                                                        );
  sbu.Add('}'                                                                                                                                                );
  sbu.Add('function  w3ScrollFunction() {'                                  {when the user scrolls down 200px from the top of the document, show the button} );
  sbu.Add('  if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {'                                                               );
  sbu.Add('    document.getElementById("CoGoToTopButton").style.display = "block";'                                                                          );
  sbu.Add('  } else {'                                                                                                                                       );
  sbu.Add('    document.getElementById("CoGoToTopButton").style.display = "none";'                                                                           );
  sbu.Add('  }'                                                                                                                                              );
  sbu.Add('}'                                                                                                                                                );
  sbu.Add('</script>'                                                                                                                                        );
      {$ENDREGION}

      {$REGION 'modalmemoeditor'}
  sbu.Add('<!-- modalmemoeditor -->' {*** DUPLICATED ***}                                                                                                    ); // modalmemoeditor
  sbu.Add('<div class="w3-modal w3-animate-opacity" id="CoModalMemoEditor">'                                                                                 );
  sbu.Add(  '<div class="w3-modal-content w3-card-4 w3-animate-opacity">' {w3-animate-zoom}                                                                  );
  sbu.Add(    '<header class="w3-container w3-theme-l3">'                                                                                                    );
  sbu.Add(      '<span class="w3-button w3-large w3-display-topright" onclick="document.getElementById(''CoModalMemoEditor'').style.display=''none''">&times;</span>');
  sbu.Add(      '<h4>Memo Editor</h4>'                                                                                                                       );
  sbu.Add(    '</header>'                                                                                                                                    );
  sbu.Add(    '<div class="w3-container">'                                                                                                                   );
  sbu.Add(      '<h1 id="CoModalMemoEditorTitle">Title</h1>'                                                                                                 );
  sbu.Add(      '<textarea class="w3-input w3-border w3-margin-bottom" style="resize:none" rows="12" id="CoModalMemoEditorTextarea"></textarea>'             );
  sbu.Add(    '</div>'                                                                                                                                       );
  sbu.Add(    '<div class="w3-container w3-light-grey w3-padding">'                                                                                          );
  sbu.Add(      '<button class="w3-button w3-right w3-green w3-border" onclick="wksMemoEditorExec()">Ok</button>'                                            ); // id="CoModalMemoEditorOk"
  sbu.Add(      '<button class="w3-button w3-right w3-white w3-border w3-margin-right" onclick="wksMemoEditorClose()">Cancel</button>'                       ); // id="CoModalMemoEditorCancel"
  sbu.Add(    '</div>'                                                                                                                                       );
  sbu.Add(  '</div>'                                                                                                                                         );
  sbu.Add('</div>'                                                                                                                                           );
      {$ENDREGION}

      {$REGION 'modalimagesviewer'}
  sbu.Add('<!-- modalimagesviewer -->'                                                                                                                       ); // modalimagesviewer
//sbu.Add('<img src="/Image/T/blonde.jpg" class="w3-hover-opacity" title="test image" onclick="wksImageModalViewerShow(this);">'                             ); // test
  sbu.Add('<div id="CoModalImageViewer" class="w3-modal w3-animate-opacity" onclick="this.style.display=''none''">'                                          );
  sbu.Add('  <span class="w3-button w3-xxlarge w3-black w3-padding-large w3-display-topright" title="Close Modal Image">&times;</span>'                      );
  sbu.Add('  <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">'                                                          );
  sbu.Add('    <img id="CoModalImage" class="w3-image" title="Modal image">'                                                                                 );
  sbu.Add('    <p id="caption" class="w3-opacity w3-large"></p>'                                                                                             );
  sbu.Add('  </div>'                                                                                                                                         );
  sbu.Add('</div>'                                                                                                                                           );
  sbu.Add('<script>'                                                                                                                                         );
  sbu.Add('function  wksImageModalViewerShow(element) {'                                                                                                     );
  sbu.Add('  document.getElementById("CoModalImage").src = element.src;'                                                                                     );
  sbu.Add('  document.getElementById("CoModalImageViewer").style.display = "block";'                                                                         );
  sbu.Add('  var captionText = document.getElementById("caption");'                                                                                          );
  sbu.Add('  captionText.innerHTML = element.alt;'                                                                                                           );
  sbu.Add('}'                                                                                                                                                );
  sbu.Add('</script>'                                                                                                                                        );
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'runtime'}
  sbu.Add('<!-- runtime -->'                                                                                                 ); // runtime
  sbu.Add('<script>'                                                                                                         );
  sbu.Add('  window.onscroll = function() {w3ScrollFunction()};'                                                             ); // windowseventsbinding
  sbu.Add('</script>'                                                                                                        );
    {$ENDREGION}

//sbu.Add('</div>'); // end div for all, also for the logosidebar

  sbu.Add('</body>');
  {$ENDREGION}

  {$REGION 'jsafter'}
if not IvPage.JsAfter.IsEmpty then begin
  sbu.Add('<!-- jsafter(after) -->'                                                                                          ); // jsafterafter
  sbu.Add('<script>'                                                                                                         );
  sbu.Add(IvPage.JsAfter                                                                                                     );
  sbu.Add('</script>'                                                                                                        );
end;
  {$ENDREGION}
                          
  {$REGION 'plugins'}
  sbu.Add('<!--[RvPluginsAfter]-->'); // this tag will be replaced at the very end (webmodule.afterdispatch) with all pugins scripts needed by the builded page
  {$ENDREGION}

  sbu.Add('</html>');
  {$ENDREGION}

  Result := sbu.Text;
end;

class function  THtmRec.Page(IvId: integer; IvTopNavOff, IvSystemInfoOff: boolean): string;
var
  ish, isw, pas: boolean; // ishelp, iswebsite, pass
  pag: TPagRec;
  pai, fbk: string; // page with or without id
begin
  // page
  pag.InitDba(IvId);
  pai := 'page'; // Format('page %d', [IvId]);

  // zip
  ish := TDbaRec.HIsDescendant('DbaPage.dbo.TblObject', IvId, TWksRec.HELP_PAGE_HOME_ID);
  isw := TDbaRec.HIsDescendant('DbaPage.dbo.TblObject', IvId, gorg.HomePageId);
  pas := ish or isw;

  // notexists
  if not TDbaRec.ObjExists('Page', IvId.ToString) then
    Result := PageInfo('Wrong Id', Format('The requested %s does not exists', [pai, gorg.Www]))

  // notbelongstowebsite nor belongstoroothelp
  else if not pas then
    Result := PageInfo('Wrong Id', Format('The requested %s does not belongs to %s or is not an Help page', [pai, gorg.Www]))
               
  // notactive
  else if not (pag.Obj.State.Equals('Active') or pag.Obj.State.Equals('Hidden')) then
    Result := PageInfo('Not Active', Format('The requested %s is not active', [pai]))

  // notloggedin (notauthenticateduser, notvalidsession)
  else if pag.AuthenticationNeeded and not gwse.IsValid(fbk) then            // a valid session with
    Result := PageInfo('Login required.', Format('The requested %s require a logged-in user.<p>Please <a href="/WksPageIsapiProject.dll/Login" title="Login">Login</a><p>Or create a <a href="/WksPageIsapiProject.dll/AccountCreate" title="New Account">New Account</a>', [pai]))

  // notmemberjobgrademin
  else if pag.Obj.{ToMember}JobGradeMin > gmbr.JobGrade then
    Result := PageInfo('Insufficient MemberJobGrade.', Format('The requested %s require a member with Job Grade "%d".<p>Your actual Job Grade is "%d"', [pai, pag.Obj.{ToMember}JobGradeMin, gmbr.JobGrade]))

  // notmemberjobtitle
//else if (pag.MemberJobTitleNeeded <> '') and not (gmbr.JobTitle >= pag.MemberJobTitleNeeded) then
//  Result := PageInfo('Insufficient privileges.', Format('The requested %s require a member with Job Title "%s".<p>Your actual Job Title is "%s"', [pai, pag.MemberJobTitleNeeded, gmbr.JobTitle]))

  // serve
  else begin
    // override
    if IvTopNavOff     then pag.TopNavOff     := IvTopNavOff    ;
    if IvSystemInfoOff then pag.SystemInfoOff := IvSystemInfoOff;

    Result := Page(pag{, IvTopNavOff, IvSystemInfoOff});
  end;
end;

class function  THtmRec.Page(IvTitle, IvContent: string; IvTopNavOff, IvSystemInfoOff: boolean): string;
var
  pag: TPagRec;
begin
  pag.Reset(true);
  pag.Obj.Title     := IvTitle;
  pag.Obj.Content   := IvContent;
  pag.TopNavOff     := IvTopNavOff;
  pag.SystemInfoOff := IvSystemInfoOff;
  Result := Page(pag);
end;

class function  THtmRec.PageSimple: string;
begin
  Result :=
    '<html>'
  + '<head><title>Wks Rest Server</title></head>'
  + '<body>'
  + '<p>Wks Rest Server (' + TBynRec.BitnessAsText + ') - ' + DateTimetoStr(Now()) + '</p>'
  + '</body>'
  + '</html>'
  ;
end;

class function  THtmRec.PageDefault: string;
var
  sbu: TSbuRec;
begin
  sbu.Add('<!-- default -->');
  sbu.Add('<b><p class="w3-big">Wks %s Application Server</p></b>', [gctx.WksModule.ToUpper]);

  Result := Page('Default', sbu.Text);
end;

class function  THtmRec.PageFeedback(IvFbk: TFbkRec): string;
var
  fmo{, cla}: string;
  sbu: TSbuRec;
  con, bdy, hed, fot: string;
begin
  // common
  fmo := TEnuRec.EnumToStr<TFbkModeEnum>(IvFbk.Mode, true);
  sbu.Add('<!-- pageFeedback%s -->'                      , [fmo]);

  // i
  if false then begin
  { cla := 'w3-' + TColRec.HColW3(IvFbk.Mode);
  //sbu.Add('<div class="w3-container w3-content">'           );
    sbu.Add(  '<div class="w3-card-4 w3-section">'            );
    sbu.Add(    '<header class="w3-container %s">'     , [cla]);
    sbu.Add(    '  <h2>%s</h2>'                , [fmo.ToUpper]);
    sbu.Add(    '</header>'                                   );
    sbu.Add(    '<div class="w3-container">'                  );
    sbu.Add(    '  <p>%s</p>'                    , [IvFbk.Msg]);
    sbu.Add(    '  <p>%s</p>'             , [IvFbk.Description], not IvFbk.Description.IsEmpty);
    sbu.Add(    '</div>'                                      );
    sbu.Add(    '<footer class="w3-container %s">'     , [cla]);
    sbu.Add(    '  <h5>&nbsp;</h5>'                           );
    sbu.Add(    '</footer>'                                   );
    sbu.Add(  '</div>'                                        );
  //sbu.Add('</div>'                                          ); }

  // ii
  end else begin
    con := 'CoFeedback';
    bdy := Format('<p>%s</p><p>%s</p>', [IvFbk.Msg, IvFbk.Description]);
    hed := fmo.ToUpper;
    fot := '';
    sbu.Add(Modal(true, con, bdy, H(2, hed), fot, IvFbk.Mode));
  end;

  // end
  Result := Page(fmo, sbu.Text);
end;

class function  THtmRec.PageInfo(IvMsg, IvDesc: string): string;
var
  fbk: TFbkRec;
begin
  fbk.Init(IvMsg, IvDesc, TFbkModeEnum.fmInfo);
  Result := PageFeedback(fbk);
end;

class function  THtmRec.PageSuccess(IvMsg, IvDesc: string): string;
var
  fbk: TFbkRec;
begin
  fbk.Init(IvMsg, IvDesc, TFbkModeEnum.fmSuccess);
  Result := PageFeedback(fbk);
end;

class function  THtmRec.PageWarning(IvMsg, IvDesc: string): string;
var
  fbk: TFbkRec;
begin
  fbk.Init(IvMsg, IvDesc, TFbkModeEnum.fmWarning);
  Result := PageFeedback(fbk);
end;

class function  THtmRec.PageDanger(IvMsg, IvDesc: string): string;
var
  fbk: TFbkRec;
begin
  fbk.Init(IvMsg, IvDesc, TFbkModeEnum.fmDanger);
  Result := PageFeedback(fbk);
end;

class function  THtmRec.PageException(IvE: Exception; IvDesc: string): string;
var
  fbk: TFbkRec;
begin
  fbk.Init(IvE.Message, IvE.ClassName, TFbkModeEnum.fmError);
  Result := PageFeedback(fbk);
end;
  {$ENDREGION}

  {$REGION 'THttRec'}
class function THttRec.Get(IvUrl: string; var IvContent, IvFbk: string; IvDefault: string): boolean;
var
//c: TStringList; // content
//h: THTTPSend;   // httprequest, synapse
  h: TIdHTTP;     // httprequest, indy
begin
  { // synapse
  h := THTTPSend.Create;
  c := TStringList.Create;
  try
    try
      h.HTTPMethod('GET', ansistring(IvUrl));
      g.LoadFromStream(s.Document);
      IvContent := c.Text;
      IvFbk     := TRstRec.RST_OK;
      Result    := true;
    except
      on e: Exception do begin
        IvContent := IvDefault;
        IvFbk := 'Unable to get Internet http content. ' + e.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(c);
    FreeAndNil(h);
  end;
  }
  // indy
  h := TIdHTTP.Create;
  try
    try
      h.Name := 'IdHTTP';
      h.AllowCookies := true;
      h.HandleRedirects := true;
      h.HTTPOptions := [hoForceEncodeParams];
      IvContent   := h.Get(IvUrl);
      IvFbk     := TRstRec.RST_OK;
      Result    := true;
    except
      on e: Exception do begin
        IvContent := IvDefault;
        IvFbk := 'Unable to get Internet http content. ' + e.Message;
        Result := false;
      end;
    end;
  finally
    FreeAndNil(h);
  end;
end;
  {$ENDREGION}

  {$REGION 'TId8Rec'}
class function TId8Rec.Generate: string;
const
//S = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'; // 72% of letters and 28% of numbers
  S = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'            // 50% of letters and 50% of numbers
    + '01234567890123456789012345'
    + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    + '67890123456789012345678901'
    + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    + '23456789012345678901234567'
    + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    + '89012345678901234567890123'
    + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    + '45678901234567890123456789'
    + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    + '01234567890123456789012345'
    + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    + '67890123456789012345678901'
    + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    + '23456789012345678901234567'
    + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    + '89012345678901234567890123'
    + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    + '45678901234567890123456789';
var
  i: integer;
begin
  Result := '';
  for i := 0 to 7 do
    Result := Result + S[1+Random(260)]; // 1 + 0..259
end;
  {$ENDREGION}

  {$REGION 'TIifRec'}
function  TIifRec.NxN(IvVar: variant): variant;
var
  str: string;
begin
  str := VarToStr(IvVar);
  if str.Trim.IsEmpty then
    Result := null
  else
    Result := IvVar;
end;

function  TIifRec.NxD(IvStr, IvDefault: string): string;
begin
  if IvStr.Trim.IsEmpty then
    Result := IvDefault
  else
    Result := IvStr;
end;

function  TIifRec.NxR(IvStr: string; IvSize: integer): string;
begin
  Result := NxD(IvStr, TRndRec.RndStr(IvSize));
end;

function  TIifRec.ExR(IvStr, IvElse: string): string;
begin
  if giis.Ex(IvStr) then
    Result := IvStr
  else
    Result := IvElse;
end;

function  TIifRec.ExA(IvStr, IvAppend: string): string;
begin
  if IvStr.Trim.IsEmpty then
    Result := ''
  else
    Result := IvStr + IvAppend;
end;

function  TIifRec.ExFmt(IvStr, IvFormat: string; IvVec: array of TVarRec): string;
begin
  if IvStr.Trim.IsEmpty then
    Result := ''
  else
    Result := Format(IvFormat, IvVec);
end;

function  TIifRec.ExFmt(IvStr, IvFormat: string): string;
begin
  Result := ExFmt(IvStr, IvFormat, [IvStr]);
end;

function  TIifRec.ExP(IvStr, IvPrepend: string): string;
begin
  if IvStr.Trim.IsEmpty then
    Result := ''
  else
    Result := IvPrepend + IvStr;
end;

function  TIifRec.Str(IvTest: boolean; IvValueTrue, IvValueFalse: string): string;
begin
  if IvTest then
    Result := IvValueTrue
  else
    Result := IvValueFalse;
end;

function  TIifRec.Int(IvTest: boolean; IvValueTrue, IvValueFalse: integer): integer;
begin
  if IvTest then
    Result := IvValueTrue
  else
    Result := IvValueFalse;
end;

function  TIifRec.BfR(IvTest: boolean; IvReturn: string): string;
begin
  if not IvTest then
    Result := IvReturn
  else
    Result := '';
end;

function  TIifRec.BtR(IvTest: boolean; IvReturn: string): string;
begin
  if IvTest then
    Result := IvReturn
  else
    Result := '';
end;
{$ENDREGION}

  {$REGION 'TIisRec'}
function TIisRec.Nx(IvStr: string): boolean;
begin
  Result := IvStr.Trim.IsEmpty or IvStr.Trim.StartsWith('--');
end;

function TIisRec.Ex(IvStr: string): boolean;
begin
  Result := not Nx(IvStr);
end;

function TIisRec.Same(IvStrVec: TArray<string>; IvStr: string): boolean;
var
  str: string;
begin
  Result := false;
  for str in IvStrVec do begin
    Result := SameText(str, IvStr);
    if Result then
      Break;
  end;
end;
  {$ENDREGION}

  {$REGION 'TIniCls'}
constructor TIniCls.Create;
const
  INI_SPEC_FMT       = '%sWksIni_%s.ini'
  ;
  INI_CLIENT_DEFAULT = '[Login]'
        + sLineBreak + 'Organization='
        + sLineBreak + 'Username='
        + sLineBreak + 'Password='
        + sLineBreak
        + sLineBreak + '[Server]'
        + sLineBreak + 'WwwProd=www.wks.cloud'
        + sLineBreak + 'WwwTest=www.wks.cloud:8080'
        + sLineBreak + 'WwwDev=localhost'
        + sLineBreak + 'Environment=Prod'
        + sLineBreak + 'Protocol=http'
        + sLineBreak
        + sLineBreak + '[Proxy]'
        + sLineBreak + 'Use=0'
        + sLineBreak + 'Address='
        + sLineBreak + 'Port='
        + sLineBreak + 'Username='
        + sLineBreak + 'Password='
        + sLineBreak
        + sLineBreak + '[Log]'
        + sLineBreak + 'Wrap=0'
        + sLineBreak + 'ClearAuto=0'
        + sLineBreak + 'OptionOutputLinesMax=10000'
        + sLineBreak + 'OptionOutputLineWidthMax=1024'
        + sLineBreak + 'OptionSoapShow=0'
        + sLineBreak
        + sLineBreak + '[Common]'
        + sLineBreak + 'OptionCryptoKey='
        + sLineBreak + 'OptionPersistRootFolder=C:\$\Persist'
        + sLineBreak + 'OptionTempFolder=C:\$Tmp'
        + sLineBreak + 'OptionWeekWorkOneStart=44924.7916666667'
        ;
  INI_SERVER_DEFAULT = '[Database]'
        + sLineBreak + 'Db0CsADO=Provider=SQLNCLI11.1;Data Source=LOCALHOST;Initial Catalog=DbaAaa;User ID=sa;Password=secret;Persist Security Info=True;MARS Connection=True'
        + sLineBreak + 'Db0CsFD=DriverID=Mssql;Server=LOCALHOST;Database=DbaAaa;User_Name=sa;Password=secret'
        + sLineBreak
        + sLineBreak + '[WebRequest]'
        + sLineBreak + 'OtpIsActive=0'
        + sLineBreak + 'AuditIsActive=0'
        ;
  INI_DEMON_DEFAULT  = '[Database]'
        + sLineBreak + 'Db0CsADO=Provider=SQLNCLI11.1;Data Source=LOCALHOST;Initial Catalog=DbaAaa;User ID=sa;Password=secret;Persist Security Info=True;MARS Connection=True'
        + sLineBreak + 'Db0CsFD=DriverID=Mssql;Server=LOCALHOST;Database=DbaAaa;User_Name=sa;Password=secret'
        ;
var
  hos, exe, pat, fil: string; // host, exe, path, file
begin
  try
    // host
    hos := TNetRec.Host.ToUpper;                     // ZBOOK

    // exe
    exe := TBynRec.ExeSpec;                          // x:\$\X\Win32\Debug\WksXxxSoapProject.exe

    // i) try exe same folder
    pat := ExtractFilePath(exe);                     // x:\$\X\Win32\Debug\
    fil := Format(INI_SPEC_FMT, [pat, hos]);         // x:\$\X\Win32\Debug\WksIni_ZBOOK.ini
    if not FileExists(fil) then begin

      // ii) try exe 1 levelup
      pat := ExtractFilePath(ExtractFileDir(pat));   // x:\$\X\Win32\
      fil := Format(INI_SPEC_FMT, [pat, hos]);       // x:\$\X\Win32\WksIni_ZBOOK.ini
      if not FileExists(fil) then begin

        // iii) try exe 2 levelup
        pat := ExtractFilePath(ExtractFileDir(pat)); // x:\$\X\
        fil := Format(INI_SPEC_FMT, [pat, hos]);     // x:\$\X\WksIni_ZBOOK.ini
        if not FileExists(fil) then begin
          // createit
               if TBynRec.IsServer then
            TFsyRec.FileCreate(fil, INI_SERVER_DEFAULT)
          else if TBynRec.IsDemon then
            TFsyRec.FileCreate(fil, INI_DEMON_DEFAULT)
          else
            TFsyRec.FileCreate(fil, INI_CLIENT_DEFAULT);
        end;
      end;
    end;

    // create
    FIniFile := TIniFile.Create(fil);
  except
    on e: Exception do begin
      glog.Log(e);
    //raise; // re-raises the current exception for handling at a higher level
    end;
  end;
end;

destructor TIniCls.Destroy;
begin
  FreeAndNil(FIniFile);

  inherited;
end;

function  TIniCls.BooGet(const IvPath: string; IvDefault: boolean): boolean;
var
  s, i: string;
begin
  SectionIdent(IvPath, s, i);
  Result := FIniFile.ReadBool(s, i, IvDefault);
end;

procedure TIniCls.BooSet(const IvPath: string; IvValue: boolean);
var
  s, i: string;
begin
  SectionIdent(IvPath, s, i);
  FIniFile.WriteBool(s, i, IvValue);
  FIniFile.UpdateFile;
end;

function  TIniCls.CryGet(const IvPath: string; IvDefault: string; IvForceDefaultIfKeyIsEmpty: boolean): string;
var
  x: string;
begin
  x := StrGet(IvPath, IvDefault, IvForceDefaultIfKeyIsEmpty);
  Result := TCryRec.Decipher(ansistring(x));
end;

procedure TIniCls.CrySet(const IvPath, IvValue: string);
var
  x: string;
begin
  x := TCryRec.Cipher(ansistring(IvValue));
  StrSet(IvPath, x);
end;

function  TIniCls.FloGet(const IvPath: string; IvDefault: double): double;
var
  s, i: string;
begin
  SectionIdent(IvPath, s, i);
  Result := StrToFloatDef(FIniFile.ReadString(s, i, FloatToStr(IvDefault)), IvDefault);
end;

procedure TIniCls.FloSet(const IvPath: string; IvValue: double);
var
  x: string;
begin
  x := FloatToStr(IvValue);
  StrSet(IvPath, x);
end;

function  TIniCls.IntGet(const IvPath: string; IvDefault: integer): integer;
var
  s, i: string;
begin
  SectionIdent(IvPath, s, i);
  Result := FIniFile.ReadInteger(s, i, IvDefault);
end;

procedure TIniCls.IntSet(const IvPath: string; IvValue: integer);
var
  s, i: string;
begin
  SectionIdent(IvPath, s, i);
  FIniFile.WriteInteger(s, i, IvValue);
  FIniFile.UpdateFile;
end;

function  TIniCls.StrGet(const IvPath: string; IvDefault: string; IvForceDefaultIfKeyIsEmpty: boolean): string;
var
  s, i: string;
begin
  SectionIdent(IvPath, s, i);
  Result := FIniFile.ReadString(s, i, IvDefault);
  if IvForceDefaultIfKeyIsEmpty and Result.IsEmpty then
    Result := IvDefault;
end;

procedure TIniCls.StrSet(const IvPath, IvValue: string);
var
  s, i: string;
begin
  SectionIdent(IvPath, s, i);
  FIniFile.WriteString(s, i, IvValue);
  FIniFile.UpdateFile;
end;

procedure TIniCls.SliGet(const IvPath: string; IvStrings: TStrings; IvDefaultCsv: string; IvForceDefaultIfKeyIsEmpty: boolean);
var
  x, s: string;
  v: {$IF COMPILERVERSION < 32.0} TStringDynArray {$ELSE} TArray<string> {$ENDIF};
begin
  x := StrGet(IvPath, IvDefaultCsv, IvForceDefaultIfKeyIsEmpty);
  v := TArray<string>(SplitString(x, ',')); // 10.1
//v := TStrRec.StrSplit(x);                 // 11.0
  for s in v do
    IvStrings.Add(s);
end;

procedure TIniCls.SliSet(const IvPath: string; IvStrings: TStrings);
var
  x: string;
begin
  x := IvStrings.CommaText;
  StrSet(IvPath, x);
end;

function  TIniCls.TxtGet(const IvPath: string; IvDefaultBr: string; IvForceDefaultIfKeyIsEmpty: boolean): string;
var
  x: string;
begin
  x := StrGet(IvPath, IvDefaultBr, IvForceDefaultIfKeyIsEmpty);
  Result := StringReplace(x, '<br>', sLineBreak, [rfReplaceAll]);
end;

procedure TIniCls.TxtSet(const IvPath, IvValue: string);
var
  x: string;
begin
  x := StringReplace(IvValue, sLineBreak, '<br>', [rfReplaceAll]);
  StrSet(IvPath, x);
end;

procedure TIniCls.SectionIdent(const IvPath: string; var IvSection, IvIdent: string);
var
  v: TStringDynArray;
begin
//v := TStrRec.StrSplit(IvPath, '/');   // 11.0
  v := TVecRec.VecFromStr(IvPath, '/'); // 10.1
  IvSection := v[0];
  IvIdent   := v[1];
end;

function  TIniCls.HksGet(const IvPath: string; IvDefault: string; IvForceDefaultIfKeyIsEmpty: boolean): TShortCut;
var
  x: string;
begin
  x := StrGet(IvPath, IvDefault, IvForceDefaultIfKeyIsEmpty);
  Result := TextToShortCut(x);
end;

procedure TIniCls.HksSet(const IvPath: string; IvValue: TShortCut);
var
  x: string;
begin
  x := ShortCutToText(IvValue);
  StrSet(IvPath, x);
end;
  {$ENDREGION}

  {$REGION 'TJinRec'}
class procedure TJinRec.Load<T>(var IvObject: T);
var
  s: string;
begin
  s := TFile.ReadAllText(ParamStr(0) + 'json', TEncoding.UTF8);
  IvObject := TJson.JsonToObject<T>(s);
end;

class procedure TJinRec.Save<T>(var IvObject: T);
const
  X = '  ';
  Y = ', ';
var
  s: string;
  j: {TJSONValue}TJSONObject;
  b: TStringBuilder;
  i: integer;
begin
  s := TJson.ObjectToJsonString(IvObject{, [joIndentCasePreserve]});
  j := TJSONObject.ParseJSONValue(s)  as TJSONObject;

  b := TStringBuilder.Create(256);
  try
    b.Append('{').Append(sLineBreak);
    for i := 0 to j.Count-1 do begin
      if i = 0 then
        b.Append(X)
      else
        b.Append(Y);
        {$IF COMPILERVERSION < 32.0}  {$ELSE} j.Pairs[i].JsonString.ToChars(b, []) {$ENDIF};
      b.Append(': ');
        {$IF COMPILERVERSION < 32.0}  {$ELSE} j.Pairs[i].JsonValue.ToChars(b, []) {$ENDIF};
      b.Append(sLineBreak);
    end;
    b.Append('}');
    s := {$IF COMPILERVERSION < 32.0} b.ToString {$ELSE} b.ToString(true) {$ENDIF};
  finally
    b.Free;
  end;

  TFile.WriteAllText(ParamStr(0) + 'json', s, TEncoding.UTF8);
  j.Free;
end;
  {$ENDREGION}

  {$REGION 'TJsoRec'}
class function  TJsoRec.Escape(IvJsonStr: string): string;
//const
//  ESCAPE          = '\';
//  QUOTATION_MARK  = '"'; //  double quote is replaced with \"
//  SOLIDUS         = '/';
//  REVERSE_SOLIDUS = '\'; //  backslash is replaced with \\
//  BACKSPACE       = #8 ; //  backspace is replaced with \b
//  FORM_FEED       = #12; //  form feed is replaced with \f
//  NEW_LINE        = #10; //  newline is replaced with \n
//  CARRIAGE_RETURN = #13; //  carriage return is replaced with \r
//  HORIZONTAL_TAB  = #9 ; //  tab is replaced with \t
var
  i, ix: integer;
  c: char;

  procedure AddChars(const AChars: string; var Dest: string; var AIndex: integer); inline;
  begin
    System.Insert(AChars, Dest, AIndex);
    System.Delete(Dest, AIndex + 2, 1);
    Inc(AIndex, 2);
  end;

  procedure AddUnicodeChars(const AChars: string; var Dest: string; var AIndex: integer); inline;
  begin
    System.Insert(AChars, Dest, AIndex);
    System.Delete(Dest, AIndex + 6, 1);
    Inc(AIndex, 6);
  end;
begin
  // i
//  Result := '';
//  for c in IvString do begin
//    case c of
//      // !! double quote (") is handled by TJSONString
//    //QUOTATION_MARK : Result := Result + ESCAPE + QUOTATION_MARK;
//      REVERSE_SOLIDUS: Result := Result + ESCAPE + REVERSE_SOLIDUS;
//      SOLIDUS        : Result := Result + ESCAPE + SOLIDUS;
//      BACKSPACE      : Result := Result + ESCAPE + 'b';
//      FORM_FEED      : Result := Result + ESCAPE + 'f';
//      NEW_LINE       : Result := Result + ESCAPE + 'n';
//      CARRIAGE_RETURN: Result := Result + ESCAPE + 'r';
//      HORIZONTAL_TAB : Result := Result + ESCAPE + 't';
//      else begin
//        if (integer(c) < 32) or (integer(c) > 126) then
//          Result := Result + ESCAPE + 'u' + IntToHex(integer(c), 4)
//        else
//          Result := Result + c;
//      end;
//    end;
//  end;

  // ii
  Result := IvJsonStr;
  ix := 1;
  for i := 1 to System.Length(IvJsonStr) do begin
    c :=  IvJsonStr[i];
    case c of
      '/', '\', '"':
      begin
        System.Insert('\', Result, ix);
        Inc(ix, 2);
      end;
      #8:  // backspace
      begin
        AddChars('\b', Result, ix);
      end;
      #9: // tab
      begin
        AddChars('\t', Result, ix);
      end;
      #10: // newline
      begin
        AddChars('\n', Result, ix);
      end;
      #12: // formfeed
      begin
        AddChars('\f', Result, ix);
      end;
      #13: // carriagereturn
      begin
        AddChars('\r', Result, ix);
      end;
      #0 .. #7, #11, #14 .. #31:
      begin
        AddUnicodeChars('\u' + IntToHex(Word(c), 4), Result, ix);
      end else begin
        if Word(c) > 127 then begin
          AddUnicodeChars('\u' + IntToHex(Word(c), 4), Result, ix);
        end else begin
          Inc(ix);
        end;
      end;
    end;
  end;
end;

class function  TJsoRec.Compiled(IvJsonStr: string): string;
begin
  // rv
  Result := grva.Rva(IvJsonStr, true, true, true);
end;

class function  TJsoRec.Pretty(IvJsonStr: string): string;
var
//jva: TJSONValue;
  jso: superobject.ISuperObject;
//djs: TJSONObject; // delphijsonobject
begin
  // i jsonvalue slow and big
//jva := TJSONObject.ParseJSONValue(IvJsonStr);
//Result := TJson.Format(jva);
//FreeAndNil(jva);

  // ii system.json *** memory leakage ***
//try
//  try
//    djs := TJSONObject.ParseJSONValue(IvJsonStr) as TJSONObject;
//    Result := djs.Format(2);
//  except
//    on E:Exception do
//      MessageDlg('Error in JSON syntax', mtError, [mbOK], 0);
//  end;
//finally
//  djs.Free;
//end;

  // iii mormot super fast
  //Result := SynCommons.JSONReformat(IvJsonStr);

  // iiii superobject fast
  jso := superobject.TSuperObject.ParseString(PWideChar(IvJsonStr), true);
  if not Assigned(jso) then
    Result := ''
  else
    Result := jso.AsJson(true, false); // here comes your result: pretty-print JSON
end;

class function  TJsoRec.IsValid(IvJsonStr: string; var IvFbk: string): boolean;
var
  jco: string; // jsoncompiled
  jva: TJSONValue;
begin
  // compiled
  jco := Compiled(IvJsonStr);

  // exit
  Result := not jco.IsEmpty;
  if not Result then begin
    IvFbk := 'Json is empty, please enter some Json string';
    Exit;
  end;

  // validate
  jva := TJSONObject.ParseJSONValue(jco);
  try
    Result := Assigned(jva);
    IvFbk := ifthen(Result, 'JSON text is valid', 'Unable to parse text as a JSON value');
  finally
    jva.Free;
  end;
end;
  {$ENDREGION}

  {$REGION 'TJteRec'}
class function TJteRec.ServerInfo(IvDescription, IvTechnology: string; IvPathInfoVec: TArray<string>): string;
var             
  i: integer;
  u{, v}: string;
  sbu: TSbuRec;
begin
  u := Format('http://localhost/%s', [TBynRec.BinaryNameExt]);
//v := Format('http://localhost/%s/datasnap/rest/TServerMethods1/%22ReverseString%22/Ping', [gctx.BinaryName]);
  
  sbu.Add('{');  
  sbu.Add('  "name": "Wks %s Server"', [gctx.WksModule.ToUpper   ]);
  sbu.Add(', "description": "%s"'    , [IvDescription            ]);
  sbu.Add(', "technology": "%s"'     , [IvTechnology             ]);
  sbu.Add(', "host": "%s"'           , [gctx.HostName            ]);
  sbu.Add(', "user": "%s"'           , [gctx.UserLogged          ]);
  sbu.Add(', "bynary": "%s"'         , [TBynRec.BinaryNameExt    ]);
  sbu.Add(', "version": "%s"'        , [TAaaRec.FileVer          ]);
  sbu.Add(', "bitness": "%s"'        , [TAaaRec.ProcessKindAsText]);
  sbu.Add(', "time": "%s"'           , [DateTimeToStr(Now)       ]);
for i := 0 to High(IvPathInfoVec) do
  sbu.Add(', "webAction%d": "%s%s"'  , [i, u, IvPathInfoVec[i]   ]);
//sbu.Add(', "webAction%d": "%s%s"'  , [i, v, IvPathInfoVec[i]   ]);
  sbu.Add('}');

  Result := sbu.Text;                     
end;
  {$ENDREGION}

  {$REGION 'TKvaRec'}
class function TKvaRec.Build(IvK, IvV: string): TKvaRec;
begin
  Result.K := IvK;
  Result.V := IvV;
end;
  {$ENDREGION}

  {$REGION 'TLogRec'}
procedure TLogRec.Log(IvStr: string);
var
  ide, str, sql, fbk: string; aff: integer;
begin
  // identity
  ide := '[wks] : ' + TBynRec.BinaryNameExt + ' : ';

  // entry
  str := IvStr.Replace('''', '`');

  // anyway
  OutputDebugString(PWideChar(ide + str));

  // jachlog
  if Assigned(gjlog) then
    gjlog.LogInfo(LOG_TOPIC_GENERAL, ide + str); // see initialization block to see where it is written (should be on disk and via udp)

  // dba
  if true then begin
    sql := Format('insert into DbaSystem.dbo.TblLog values (''%s'', ''%s'', ''%s'', ''%s'')', [DateTimeToStr(Now), gctx.HostName.ToUpper, TBynRec.BinaryName, str]);
    TDbaRec.CmdExec(sql, aff, fbk);
  end;
end;

procedure TLogRec.Log(IvFormat: string; const IvArgs: array of const);
begin
  Log(Format(IvFormat, IvArgs));
end;

procedure TLogRec.Log(IvException: Exception; IvMore: string);
begin
  Log(TStdRec.StdException(IvException));
  if not IvMore.IsEmpty then
    Log(TStdRec.StdException(IvMore));
end;

procedure TLogRec.LogToFile(IvStr, IvFileName: string);
var
  stl: TStrings;
  fna: string; // filename
begin
  stl := TStringList.Create;
  try
    stl.Text := IvStr;
    fna := TWksRec.HOME_PATH + '/' + IvFileName;
    stl.SaveToFile(fna);
  finally
    stl.Free;
  end;
end;

    {$REGION 'Zzz'}
{
// threaded log by: https://delphi.cjcsoft.net/viewthread.php?tid=45763
TThreadQueue = class // thread safe pointer queue
private
  FFinalized: Boolean;
  FIOQueue: THandle;
public
  constructor Create;
  destructor Destroy; override;
  procedure Finalize;
  procedure Push(Data: Pointer);
  function Pop(var Data: Pointer): Boolean;
  property Finalized: Boolean read FFinalized;
end;
}
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'TLorRec'}
class function  TLorRec.Word: string;
begin
  Result := WORD_VECTOR[Random(503)];
end;

class function  TLorRec.Words(IvMin, IvMax, IvCapitalize: integer; IvAddPeriod: boolean): string;
var
  i, z: integer; // count, words
  w: string;
begin
  Result := '';
  z := RandomRange(IvMin, IvMax);
  for i := 0 to z do begin
    w := Word;
    if IvCapitalize > 1 then
      w[1] := UpCase(w[1]);
    Result := Result + ' ' + w;
  end;
  if IvAddPeriod then
    Result := Result + '.';
end;

class function  TLorRec.Title(IvMin, IvMax, IvCapitalize: integer; IvAddPeriod: boolean): string;
begin
  Result := Words(IvMin, IvMax, IvCapitalize, IvAddPeriod);
end;

class function  TLorRec.Paragraphs(IvPMin, IvPMax, IvWMin, IvWMax: integer): string;
var
  i, z: integer; // count, paragraphs
begin
  Result := '';
  z := RandomRange(IvPMin, IvPMax);
  for i := 0 to z do
    Result := Result + Words(IvWMin, IvWMax, 1, true) + ifthen(i < z, sLineBreak, '');
end;

class function  TLorRec.HTitle(IvMin, IvMax, IvH, IvCapitalize: integer; IvAddPeriod: boolean): string;
var
  h, h2: string;
begin
  if (IvH >= 1) and (IvH <=6) then begin
    h  := Format('<h%d>', [IvH]);
    h2 := Format('</h%d>', [IvH]);
  end;
  Result := h + Title(IvMin, IvMax, IvCapitalize, IvAddPeriod) + h2;
end;

class function  TLorRec.HParagraphs(IvPMin, IvPMax, IvWMin, IvWMax: integer): string;
begin
  Result := Paragraphs(IvPMin, IvPMax, IvWMin, IvWMax);
  Result := '<p>' + StringReplace(Result, sLineBreak, '</p><p>', [rfReplaceAll]) + '</p>'
end;
  {$ENDREGION}

  {$REGION 'TLstRec'}
function  TLstRec.LstAppend(IvLst, IvStr: string; IvSpaceAdd: boolean): string;
var
  i: integer;
  d: string;
  v: TArray<string>;
begin
  Result := IvLst;

  // exit
  if giis.Nx(Result) then
    Exit;

  // vector
  v := Result.Split([',']);

  // join
  Result := '';
  d := ifthen(IvSpaceAdd, ', ', ',');
  for i := Low(v) to High(v) do
    Result := Result + d + v[i].Trim + IvStr;

  // end
  Delete(Result, 1, Length(d));
end;

function  TLstRec.LstPrepend(IvLst, IvStr: string; IvSpaceAdd: boolean): string;
var
  i: integer;
  d: string;
  v: TArray<string>;
begin
  Result := IvLst;

  // exit
  if giis.Nx(Result) then
    Exit;

  // vector
  v := Result.Split([',']);

  // join
  Result := '';
  d := ifthen(IvSpaceAdd, ', ', ',');
  for i := Low(v) to High(v) do
    Result := Result + d + IvStr + v[i].Trim;

  // end
  Delete(Result, 1, Length(d));
end;
  {$ENDREGION}

  {$REGION 'TMbrRec'}
function  TMbrRec.Info: string;
begin
  Result := JobTitle;
  Result := TStrRec.StrWordAppend(Result, JobRole);
  Result := TStrRec.StrWordAppend(Result, JobLevel);
end;

procedure TMbrRec.Free;
begin
  Obj.Free;
  if Assigned(BadgeGraphic) then
    BadgeGraphic.Free;
end;

procedure TMbrRec.Reset(IvResetObjAlso: boolean);
begin
  // master
  if IvResetObjAlso then
    Obj.Reset;

  // detail
  ObjectId     := 0;
  Id           := 0;
  PId          := 0;
  Organization := '';
  Department   := '';
  Area         := '';
  Team         := '';
  Site         := '';
  Member       := '';
  Email        := '';
  State        := '';
  JobTitle     := '';
  JobRole      := '';
  JobLevel     := '';
  BadgeGraphic := nil;

  // derived
  JobGrade     := 0;
end;

function  TMbrRec.InitDba(IvOrganization, IvUsername: string; var IvFbk: string): boolean;
var
  sql: string;
  dst: TDataset;
begin
  sql := Format('select top(1) * from DbaMember.dbo.TblMember where FldOrganization = ''%s'' and FldMember = ''%s''', [IvOrganization, IvUsername]);
  TDbaRec.DsFromSql(sql, dst);
  try
    // notdefined
    Result := not dst.IsEmpty;
    if not Result then begin
      Reset;
      IvFbk := Format('Unable to load MbrRec, %s and/or %s does not exist in database', [IvOrganization, IvUsername]);

    // defined
    end else begin
      // master
      Obj.InitDba('Member', dst.FieldByName('FldObjectId').AsInteger);

      // detail
      ObjectId     := dst.FieldByName('FldObjectId').AsInteger;
      Id           := dst.FieldByName('FldId').AsInteger;
      PId          := dst.FieldByName('FldPId').AsInteger;
      Organization := dst.FieldByName('FldOrganization').AsString;
      Department   := dst.FieldByName('FldDepartment').AsString;
      Area         := dst.FieldByName('FldArea').AsString;
      Team         := dst.FieldByName('FldTeam').AsString;
      Site         := dst.FieldByName('FldSite').AsString;
      Member       := dst.FieldByName('FldMember').AsString;
      Email        := dst.FieldByName('FldEmail').AsString;
      State        := dst.FieldByName('FldState').AsString;
      JobTitle     := dst.FieldByName('FldJobTitle').AsString;
      JobRole      := dst.FieldByName('FldJobRole').AsString;
      JobLevel     := dst.FieldByName('FldJobLevel').AsString;
      TGraRec.FromBlobField(BadgeGraphic, TBlobField(dst.FieldByName('FldBadge')));

      IvFbk := Format('MbrRec loaded from database with %s and %s data', [IvOrganization, IvUsername]);
    end;

    // derived
    JobGrade       := TMjgRec.Grade({JobTitle, }JobRole, JobLevel);
  finally
    dst.Free;
  end;
end;

function  TMbrRec.InitRio(IvOrganization, IvUsername: string; var IvFbk: string): boolean;
var
  rem: TMbrRem;
begin
  Reset;

  rem := TMbrRem.Create;
  try
    Result := (grio.HttpRio as ISystemSoapMainService).SystemMemberInitSoap(IvOrganization, IvUsername, rem, IvFbk);
    if Result then begin
      // master
      Obj.RecFromRem(rem.ObjRem);

      // detail
      ObjectId    := rem.ObjectId    ;
      Id          := rem.Id          ;
      PId         := rem.PId         ;
      Organization:= rem.Organization;
      Department  := rem.Department  ;
      Area        := rem.Area        ;
      Team        := rem.Team        ;
      Site        := rem.Site        ;
      Member      := rem.Member      ;
      Email       := rem.Email       ;
      State       := rem.State       ;
      JobTitle    := rem.JobTitle    ;
      JobRole     := rem.JobRole     ;
      JobLevel    := rem.JobLevel    ;
      TGraRec.FromByteArray(BadgeGraphic, rem.BadgeBytes);
    end;
  finally
  {$IF COMPILERVERSION < 32.0}
    rem.ObjRem.Free;
  {$ELSE}
    FreeAndNil(rem.ObjRem);
  {$ENDIF}
    FreeAndNil(rem);
  end;
end;

function  TMbrRec.IsAdmin: boolean;
begin
  Result := JobGrade >= TMjgRec.GRADE_ADMINISTRATOR;
end;

function  TMbrRec.HomePath: string;
begin
  Result := gorg.HomePath;                                                          // C:\$Org\Wks\Member\F\FCBIarussi
end;

function  TMbrRec.BadgeFile: string;
begin
  Result := HomePath + Format('/%s%sBadge.png', [Member, Organization]);            // C:\$Org\Wks\Member\F\FCBIarussi\FCBIarussiWksBadge.png
end;

function  TMbrRec.HomeUrl(IvRelative: boolean): string;
begin
  Result := gorg.HomeUrl(IvRelative);                                               // /Organization/W/Wks/Member/F/FCBIarussi
end;

function  TMbrRec.BadgeUrl(IvRelative: boolean): string;
begin
  Result := HomeUrl(IvRelative) + Format('/%s%sBadge.png', [Member, Organization]); // /Organization/W/Wks/Member/F/FCBIarussi/FCBIarussiWksBadge.png
end;

procedure TMbrRec.BadgeGenerate(var IvBadge: TBitmap; IvOrganization, IvSite, IvUsername: string);

  {$REGION 'var'}
{                                  54mm --> 127                    5   bra
                      ---------------------------------------  ------- +h2
                    |     /           ______            \     |   10   mar
                    |    |           (      )            |    |   10   hoh      //  GATE_ACCESS_LEVEL ?
                    |    |            ¯¯¯¯¯¯             |    |   10   spa
                    |    |  ---------------------------  |    |
                    |    | |            Logo           | |    |   25   loh
                    |    | |            Long           | |    |
                    |    |  ---------------------------  |    |
                    |    |  ---------------------------  |    |    5   sps
                    |    | | flag site                 | |    |   12   fsh
                    |    |  ---------------------------  |    |
                    |    |         _____________         |    |   10   spa
                    |    |        |             |        |    |
       85mm --> 200 |    |        |             |        |    |
                    |    |        |             |        |    |
                    |    |        |   Picture   |        |    |   84   ???
                    |    |        |             |        |    |
                    |    |        |             |        |    |
                    |    |        |_____________|        |    |
                    |    |                               |    |   10   spa
                    |    |            N A M E            |    |   12   nah
                    |    |                               |    |    5   sps
                    |    |            SURNAME            |    |   10   suh
                    |     \                             /     |   10   mar
                      ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯  ------- -h2
                                        200  }
const
  SIZ =200;           // size
  BWM = 54; BHM = 85; // badgewidthmm, badgeheightmm
  BAR =  5;           // badgeround
  MAR = 10;           // margins
  HOW = 34; HOH = 10; // holewxh
  SPS =  5;           // spacesmall
  LOH = 30;           // logolongheight
  FSH = 12;           // flagsiteheight
  SPA = 10;           // space
  NAH = 14;           // nameheight
  SUH = 12;           // surnameheight
var
  w, h: integer;                      // width, height
  w2, h2, sca, baw, bah, piz: double; // scale, badgew, badgeh, picturesize
  fbk: string;
  agg: TAgg2D;
  org: TOrgRec;
  per: TPerRec;
  {$ENDREGION}

begin
  // geometry
  w := siz;
  h := siz;
  w2 := w / 2;
  h2 := h / 2;
  sca := h / bhm; // scale = 200/85 = 2.352941176
  baw := BWM * sca;
  bah := BHM * sca;
  piz := h - (MAR + HOH + SPA + LOH + SPS + FSH + SPA) - (SPA + NAH + SPS + SUH + MAR);

  // bmp
  if not Assigned(IvBadge) then begin
    {$IF CompilerVersion < 32.0}
    IvBadge := TBitmap.Create
    {$ELSE}
    IvBadge := TBitmap.Create(w, h)
    {$ENDIF}
  end;
  IvBadge.SetSize(w, h);

  // agg
  agg := TAgg2D.Create;
  try
    TAggRec.Attach(agg, IvBadge, true);
    agg.ClearAll($ff, $ff, $ff, $ff);
  //agg.Line(0, 0, 100, 100);

    // origin
    agg.Translate(w2, h2);

    // badge
    TAggRec.DrawSetup(agg);
    TAggRec.Box(agg, 0, 0, baw, bah, BAR);
    TAggRec.Box(agg, 0, h2-MAR-HOH/2, HOW, HOH, HOH/2);

    // organizationlogo
    org.InitRio(IvOrganization, fbk);
    try
      // smas
      if not Assigned(org.LogoLongGraphic) then
        raise Exception.Create('Organization "Logo long" is empty, please define it');
      TAggRec.GraphicSmashCentered(agg, org.LogoLongGraphic, 0, h2-MAR-HOH-SPA-LOH/2, LOH);

      // flagsite
      TAggRec.Text(agg, 0, h2-MAR-HOH-SPA-LOH-SPS-FSH/2, UpperCase(IvSite), FSH, '000000', 'cc', false, true);

      // personpicture
      per.InitRio(IvUsername, fbk);
      try
        // smas
        if not Assigned(per.PictureGraphic) then
          raise Exception.Create('Person "Picture" is empty, please define it');
        TAggRec.GraphicSmashCentered(agg, per.PictureGraphic, 0, -h2+MAR+SUH+SPS+NAH+SPA+piz/2, piz);

        // personinfo
        TAggRec.Text(agg, 0, -h2+MAR+SUH+SPS+NAH/2, UpperCase(per.NameCompact), NAH, '000000', 'cc', false, true); // name
        TAggRec.Text(agg, 0, -h2+MAR+SUH/2        , UpperCase(per.Surname    ), SUH, '000000', 'cc', false, true); // surname
      finally
        per.Free;
      end;
    finally
      org.Free;
    end;
  finally
    agg.Free;
  end;
end;
  {$ENDREGION}

  {$REGION 'TMesRec'}
class procedure TMesRec.MsgShow(IvMessage, IvTitle, IvKind: string);
//const
//  i: array[boolean] of TTaskDialogIcon = (tiInformation, tiError);
var
  i: integer;
//  d: SynTaskDialog.TTaskDialog;
begin
  // zzz
//Application.MessageBox

  // icon
       if IvKind.StartsWith('E', true) then i := tdiError       //= 2;
  else if IvKind.StartsWith('W', true) then i := tdiWarning     //= 1;
  else                                      i := tdiInformation //= 3;
                                              // tdiShield      //= 4;
                                              // tdiNone        //= 0; // no icon is presented
                                              // tdiQuestion           // there is not this option !!!
  ;

  // title
  if IvTitle.IsEmpty then
    IvTitle := Format('%s %s %s', [TWksRec.ACRONYM, TBynRec.Obj.ToUpper, TBynRec.Role]);

  // client
  if TBynRec.IsClient then begin
    // i
  //ShowMessage(IvMessage) // IvTitle and IvKind are ignored

    // ii
    with Vcl.Dialogs.TTaskDialog.Create(nil) do
      try
        Caption        := IvTitle;
        Title          := {IvTitle}'';
        Text           := IvMessage;
        CommonButtons  := [tcbClose];
        MainIcon       := i;
      //Flags          := [tfUseHiconMain];
        Execute;
      finally
        Free;
      end;

    // iii
   {d.Title     := IvTitle;   // form caption
    d.Inst      := IvTitle;   // body title
    d.Content   := IvMessage; // body text
  //d.Footer  := 'Footer';    // footer text
    d.Execute(
      [cbOk]                  // common buttons         : TCommonButtons = []
    , 0                       // default button         : integer = 0
    , []                      // flags                  : TTaskDialogFlags = []
  //, tiInformation           // dialog icon            : TTaskDialogIcon = tiInformation
  //, tfiWarning              // footer icon            : TTaskDialogFooterIcon = tfiWarning
  //, 0                       // default radio          : integer = 0
  //, 0                       // width                  : TWH = 0
  //, 0                       // parent window (owner?) : HWND = 0
  //, false                   // non native             : boolean = false
  //, false                   // emulate classic style  : boolean = false
  //, nil                     // onbuttonclicked        : TTaskDialogButtonClickedEvent = nil
    );}

  // nonclient
  end else begin
         if IvKind.StartsWith('E', true) then
      MessageDlg(IvMessage, TMsgDlgType.mtError       , [mbOK], 0)
    else if IvKind.StartsWith('W', true) then
      MessageDlg(IvMessage, TMsgDlgType.mtWarning     , [mbOK], 0)
    else if IvKind.StartsWith('C', true) then
      MessageDlg(IvMessage, TMsgDlgType.mtConfirmation, [mbOK], 0)
    else                     {'I'}
      MessageDlg(IvMessage, TMsgDlgType.mtInformation , [mbOK], 0);
  end;
end;

class procedure TMesRec.I(IvMessage: string; IvTitle: string);
begin
  MsgShow(IvMessage, IvTitle);
end;

class procedure TMesRec.I(IvMessageFormatStr: string; IvVarRecVector: array of TVarRec; IvTitle: string);
begin
  I(Format(IvMessageFormatStr, IvVarRecVector), IvTitle);
end;

class procedure TMesRec.IW(IvMessage: string; IvSuccess: boolean; IvTitle: string);
begin
  if IvSuccess then
    I(IvMessage, IvTitle)
  else
    W(IvMessage, IvTitle);
end;

class procedure TMesRec.IW(IvMessageFormatStr: string; IvVarRecVector: array of TVarRec; IvSuccess: boolean; IvTitle: string);
begin
  if IvSuccess then
    I(IvMessageFormatStr, IvVarRecVector, IvTitle)
  else
    W(IvMessageFormatStr, IvVarRecVector, IvTitle);
end;

class procedure TMesRec.W(IvMessage: string; IvTitle: string);
begin
  MsgShow(WARNING_STR + sLineBreak + sLineBreak + IvMessage, IvTitle, 'W');
end;

class procedure TMesRec.W(IvMessageFormatStr: string; IvVarRecVector: array of TVarRec; IvTitle: string);
begin
  W(Format(IvMessageFormatStr, IvVarRecVector), IvTitle);
end;

class procedure TMesRec.E(IvMessage: string; IvTitle: string);
begin
  MsgShow(EXCEPTION_STR + sLineBreak + sLineBreak + IvMessage, IvTitle, 'E');
end;

class procedure TMesRec.E(IvMessageFormatStr: string; IvVarRecVector: array of TVarRec; IvTitle: string);
begin
  E(Format(IvMessageFormatStr, IvVarRecVector), IvTitle);
end;

class procedure TMesRec.NA;
begin
  I(NOT_AVAILABLE_STR);
end;

class procedure TMesRec.NI;
begin
  I(NOT_IMPLEMENTED_STR);
end;

class procedure TMesRec.CANCELLED;
begin
  I(TUsrRec.USER_CANCELLED_ACTION);
end;

procedure TMesRec.About;
begin
//if (Win32MajorVersion >= 6) and ThemeServices.ThemesEnabled then
  with Vcl.Dialogs.TTaskDialog.Create(nil) do
    try
      Caption            := 'About';                                 // IvCaption;
      Title              := TWksRec.ACRONYM  + ' ' + TBynRec.Info;   // IvTitle;
      Text               := Format('Version: %s', [TAaaRec.FileVer])
      + sLineBreak        + TWksRec.Copyright                        // Format(IvCopyright, [CurrentYear])
     {+ sLineBreak}       + THtmRec.A(TWksRec.Www, TWksRec.Www);     // IvWww
      CommonButtons      := [tcbClose];
      Flags              := [tfUseHiconMain{, tfAllowDialogCancellation}, tfEnableHyperlinks];
      CustomMainIcon     := Application.Icon;                        // IvIcon;
      OnHyperlinkClicked := AboutHyperlinkClicked;
      Execute;
    finally
      Free;
    end
end;

procedure TMesRec.AboutHyperlinkClicked(Sender: TObject);
begin
  if (Sender is Vcl.Dialogs.TTaskDialog) then
    with Sender as Vcl.Dialogs.TTaskDialog do
      TUrlRec.Go(TWksRec.WWW);
end;

class procedure TMesRec.AutoClose(const IvCaption, IvPrompt: string; IvDurationMs: integer);
var
  f: TForm;
  p: TLabel; // prompt
  o: TPoint; // dialogunits
  i, j: integer; // chars, lines

  function  CharSizeAvg(Canvas: TCanvas): TPoint;
  var
    i: integer;
    b: array[0..51] of Char; // buffer
  begin
    for i := 0 to 25 do b[i]      := Chr(i + Ord('A'));
    for i := 0 to 25 do b[i + 26] := Chr(i + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, b, 52, TSize(Result));
    Result.X := Result.X div 52;
  end;
begin
  j := 0;
  for i := 1 to Length(IvPrompt) do
    if IvPrompt[i] = sLineBreak then Inc(j);

  f := TForm.Create(Application);
  try
    o := CharSizeAvg(f.Canvas);
  //f.Font.Name    := 'Arial';
  //f.Font.Size    := 10;
  //f.Font.Style   := [fsBold];
  //f.Canvas.Font  := Font;
    f.BorderStyle  := bsToolWindow; // bsDialog
    f.FormStyle    := fsStayOnTop;
    f.BorderIcons  := [];
    f.Caption      := IvCaption;
    f.ClientWidth  := MulDiv(Screen.Width div 4, o.X, 4);
    f.ClientHeight := MulDiv(23 + (j * 10), o.Y, 8);
    f.Position     := poScreenCenter;
    p              := TLabel.Create(f);
    p.Parent       := f;
    p.AutoSize     := true;
    p.Left         := MulDiv(8, o.X, 4);
    p.Top          := MulDiv(8, o.Y, 8);
    p.Caption      := IvPrompt;
    f.Width := p.Width + p.Left + 50;
    f.Show;
    Application.ProcessMessages;
  finally
    Sleep(IvDurationMs);
    FreeAndNil(f);
  end;
end;

class procedure TMesRec.AutoCloseFmt(const IvCaption, IvPrompt: string; IvVarRecVector: array of TVarRec; IvDurationMs: integer);
begin
  AutoClose(IvCaption, Format(IvPrompt, IvVarRecVector), IvDurationMs);
end;
  {$ENDREGION}

  {$REGION 'TMjgRec'}
class function TMjgRec.Grade(IvJobRole, IvJobLevel: string): integer;

  // schema???

begin
  // system
       if (IvJobRole = TMjrRec.ROLE_SYSTEM)                                                then Result := GRADE_SYSTEM

  // architect
  else if (IvJobRole = TMjrRec.ROLE_ARCHITECT)                                             then Result := GRADE_ARCHITECT

  // administrator
  else if (IvJobRole = TMjrRec.ROLE_ADMINISTRATOR)                                         then Result := GRADE_ADMINISTRATOR

  // executive
  else if (IvJobRole = TMjrRec.ROLE_EXECUTIVE)                                             then Result := GRADE_EXECUTIVE

  // head
  else if (IvJobRole = TMjrRec.ROLE_HEAD)                                                  then Result := GRADE_HEAD

  // director
  else if (IvJobRole = TMjrRec.ROLE_DIRECTOR)                                              then Result := GRADE_DIRECTOR

  // manager
  else if (IvJobRole = TMjrRec.ROLE_MANAGER)    and (IvJobLevel = TMjlRec.LEVEL_PRINCIPAL) then Result := GRADE_MANAGER_PRINCIPAL
  else if (IvJobRole = TMjrRec.ROLE_MANAGER)    and (IvJobLevel = TMjlRec.LEVEL_STAFF    ) then Result := GRADE_MANAGER_STAFF
  else if (IvJobRole = TMjrRec.ROLE_MANAGER)    and (IvJobLevel = TMjlRec.LEVEL_SENIOR   ) then Result := GRADE_MANAGER_SENIOR
  else if (IvJobRole = TMjrRec.ROLE_MANAGER)    and (IvJobLevel = TMjlRec.LEVEL_JUNIOR   ) then Result := GRADE_MANAGER_JUNIOR

  // supervisor
  else if (IvJobRole = TMjrRec.ROLE_SUPERVISOR) and (IvJobLevel = TMjlRec.LEVEL_PRINCIPAL) then Result := GRADE_SUPERVISOR_PRINCIPAL
  else if (IvJobRole = TMjrRec.ROLE_SUPERVISOR) and (IvJobLevel = TMjlRec.LEVEL_STAFF    ) then Result := GRADE_SUPERVISOR_STAFF
  else if (IvJobRole = TMjrRec.ROLE_SUPERVISOR) and (IvJobLevel = TMjlRec.LEVEL_SENIOR   ) then Result := GRADE_SUPERVISOR_SENIOR
  else if (IvJobRole = TMjrRec.ROLE_SUPERVISOR) and (IvJobLevel = TMjlRec.LEVEL_JUNIOR   ) then Result := GRADE_SUPERVISOR_JUNIOR

  // member
  else if (IvJobRole = TMjrRec.ROLE_MEMBER)     and (IvJobLevel = TMjlRec.LEVEL_PRINCIPAL) then Result := GRADE_MEMBER_PRINCIPAL
  else if (IvJobRole = TMjrRec.ROLE_MEMBER)     and (IvJobLevel = TMjlRec.LEVEL_STAFF    ) then Result := GRADE_MEMBER_STAFF
  else if (IvJobRole = TMjrRec.ROLE_MEMBER)     and (IvJobLevel = TMjlRec.LEVEL_SENIOR   ) then Result := GRADE_MEMBER_SENIOR
  else if (IvJobRole = TMjrRec.ROLE_MEMBER)     and (IvJobLevel = TMjlRec.LEVEL_JUNIOR   ) then Result := GRADE_MEMBER_JUNIOR

  // user
  else                                                                                          Result := GRADE_USER_GUEST;
end;
  {$ENDREGION}

  {$REGION 'TMkdRec'}
class function TMkdRec.Process(IvContent: string): string;

  {$REGION 'var'}
type
  TMatRec = record
  //gr0: string;
    gr1: string;
    gr2: string;
  end;

var
  itm: TMkdItemRec;
  alf, ome: char; // alfa, omega
  new, fno: string;
  chz: integer;   // charscount
  tre: TRegEx;
  mat: TMatch;
  mar: TMatRec;
  {cob}mav, grbmav: TArray<TMatRec>; // codeblock, graphblock
  {$ENDREGION}

  {$REGION 'macro'}
  function  BloksEscape(txt: string): string;
  const
    REV: array[0..4] of string = (
      '^`{3}[ \t]*(\w*)\r?\n([\s\S]*?)\r?\n`{3}$'  // codeblock     ``` aaa
    , '^%{3}[ \t]*(\w*)\r?\n([\s\S]*?)\r?\n%{3}$'  // hiddenblock   %%% aaa
    ,           '^\.{3}\r?\n([\s\S]*?)\r?\n\.{3}$' // dimmedblock   ...
    ,            '^>{3}\r?\n([\s\S]*?)\r?\n>{3}$'  // indentedblock >>>
    , '^={3}[ \t]*(\w*)\r?\n([\s\S]*?)\r?\n={3}$'  // texttograph   === mermaid
    );
  var
    i, j: integer;
    tre: TRegEx;
    mat: TMatch;
  begin
    Result := txt;

    // bloksescape
    for j := 0 to High(REV) do begin
      // match
      tre := TRegEx.Create(REV[j], [roMultiLine, roSingleLine]);
      mat := tre.Match(Result);

      // codebloks->escape
      if j = 0 then begin
        i := -1;
        while mat.Success do begin
          Inc(i);
        //mar.gr0 := mat.Groups[0].Value;
          mar.gr1 := mat.Groups[1].Value;
          mar.gr2 := HTMLEscape(mat.Groups[2].Value);
          TArray.Add<TMatRec>(mav, mar);
          Result := tre.Replace(Result, Format('[RvCodeBlok%d]', [i]), 1);
          mat := mat.NextMatch;
        end;

      // hiddenbloks->remove
      end else if j = 1 then begin
        while mat.Success do begin
          Result := tre.Replace(Result, '', 1);
          mat := mat.NextMatch;
        end;

      // dimmedblock->dimmed
      end else if j = 2 then begin
        while mat.Success do begin
          Result := tre.Replace(Result, '<div class="w3-text-gray">' + mat.Groups[1].Value + '</div>', 1);
          mat := mat.NextMatch;
        end;

      // indentedblock->indent
      end else if j = 3 then begin
        while mat.Success do begin    // <span style="display:inline-block;width:40px;"></span>                     *** one single row ***
          Result := tre.Replace(Result, '<div style="padding-left:40px;">' + mat.Groups[1].Value + '</div>', 1); // *** multiple row ***
          mat := mat.NextMatch;
        end;

      // graphblock->escape
      end else if j = 4 then begin
        i := -1;
        while mat.Success do begin
          Inc(i);
        //mar.gr0 := mat.Groups[0].Value;
          mar.gr1 := mat.Groups[1].Value;
          mar.gr2 := mat.Groups[2].Value;
          TArray.Add<TMatRec>(grbmav, mar);
          Result := tre.Replace(Result, Format('[RvGraphBlok%d]', [i]), 1);
          mat := mat.NextMatch;
        end;
      end;
    end;
  end;

  function  BloksUnEscape(txt: string): string;
  var
    i: integer;
    s: string;
  begin
    Result := txt;

    // codebloksunescape
    for i := Low(mav) to High(mav) do
      Result := StringReplace(Result, Format('[RvCodeBlok%d]', [i]), Format('<pre><code class="%s">%s</code></pre>', [giif.NxD(mav[i].gr1, 'plaintext'), mav[i].gr2]), []);

    // graphbloksunescape
    for i := Low(grbmav) to High(grbmav) do begin
      if grbmav[i].gr1 = 'mermaid' then // https://mermaid.js.org
        s := Format('<div class="mermaid" style="text-align:center;">%s</div>', [grbmav[i].gr2])
      else
        s := Format('{WARNING: unable to render graph code, unknown text-to-graph "%s" library}', [grbmav[i].gr1]);
      Result := StringReplace(Result, Format('[RvGraphBlok%d]', [i]), s, []);
    end;

    // trailingspaces
    Result := TRegEx.Replace(Result, '[ \t]+$', '<br>', [roMultiLine]);
  end;

  function  BlockquoteProcess(txt: string): string;
  var
    i, z: integer;
    sli: TStrings;
    row: string;
  begin
    sli := TStringList.Create;
    sli.Text := txt;
    try
      for i := 0 to sli.Count-1 do begin
        row := sli[i];

        if row = '>' then  
          Delete(row, 1, 1)
        else if row.StartsWith('<br>>') then
          Delete(row, 1, 5)
        else if row.StartsWith('<br>') then
          Delete(row, 1, 4)
        else if row.StartsWith('> ') then
          Delete(row, 1, 2);

        z := Length(row);
        row := row.Trim;
        row := row + THtmRec.Br(z - Length(row));

        sli[i] := row.Trim;
      end;         

      sli.Text := sli.Text.Trim;
      Result := sli.Text;
    finally
      sli.Free;
    end;
  end;

  function  ListProcess(txt: string): string;
  var
    i: integer;
    sli: TStrings;
    row: string;
  begin
    sli := TStringList.Create;
    sli.Text := txt;
    try
      for i := 0 to sli.Count-1 do begin
        row := sli[i].Trim;

        if row.StartsWith('* ') then
          row := StringReplace(row, '* ', '<li>', []) + '</li>'
        else if row.StartsWith('- ') then
          row := StringReplace(row, '- ', '<li>', []) + '</li>'
        else if row.StartsWith('• ') then
          row := StringReplace(row, '• ', '<li>', []) + '</li>';

        sli[i] := row.Trim;
      end;

      Result := sli.Text;
    finally
      sli.Free;
    end;
  end;

  function  ListDefinitionProcess(var txt: string): string;
  begin
    {
    Coffee
    :  Black hot drink
    Milk
    :  White cold drink

    to:
    
    <dl>
      <dt>Coffee</dt>
      <dd>Black hot drink</dd>
      <dt>Milk</dt>
      <dd>White cold drink</dd>
    </dl>
    }   
  end;

  procedure FootnoteProcess(var txt, fno: string);
  const
    REX_A = '\[\^(\d+)\](\s)';          // match [^1]_
    REX_B = '(\[\^%s\]): (.*?)(\r?\n)'; // match [^1]: text ... ^$    ( *\r?\n)
  var
    tre, tre2: TRegEx;
    mat, mat2: TMatch;
    pat, tag, gr0, gr1, gr2, gr3{, gr4}, noe: string; // the number or string [^1 [^tag
  begin
    fno := '';

    // match A
    tre := TRegEx.Create(REX_A, [roSingleLine]);
    mat := tre.Match(Result);
    while mat.Success do begin
      tag := mat.Groups[1].Value;
      gr2 := mat.Groups[2].Value;
      Result := tre.Replace(Result, Format('<sup><b><a href="#CoFootnote%s" id="CoNote%s">%s</a></b></sup>%s', [tag, tag, tag, gr2]), 1);

      // match B
      pat := Format(REX_B, [tag]);
      tre2 := TRegEx.Create(pat, []); //  roSingleLine
      mat2 := tre2.Match(Result);
      if mat2.Success then begin
        gr0 := mat2.Groups[0].Value;
        gr1 := mat2.Groups[1].Value;
        noe := mat2.Groups[2].Value;   
        gr3 := mat2.Groups[3].Value;    
      //gr4 := mat2.Groups[4].Value;
        Result := tre2.Replace(Result, '', 1);
      end else
        noe := Format('{warning: please add footnote [^%s]: ...}', [tag]);

      // footnotes
      fno := fno + Format('<li id="CoFootnote%s"><p style="margin-top:0;">%s <a href="#CoNote%s" title="Back to content note %s"><b>&#8617;</b></a></p></li>', [tag, noe, tag, tag]);

      mat := mat.NextMatch;
    end;
  end;

  procedure VarLocProcess(var txt: string);
  const
    REX_A = '{(.*?)= *(\w+)}'; // match {bla bla bla = Aaa}
    REX_B = '{%s}';            // match {Aaa}
  var
    tre, tre2: TRegEx;
    mat, mat2: TMatch;
    val, lva, pat, tbr: string; // value, locvar, pattern, tobereplaced
  begin
    // match A
    tre := TRegEx.Create(REX_A, [roSingleLine]);
    mat := tre.Match(Result);
    while mat.Success do begin
      val := mat.Groups[1].Value; // 'bla bla bla '
      lva := mat.Groups[2].Value; // 'Aaa'
      Result := tre.Replace(Result, val{, 1});

      // match B
      pat := Format(REX_B, [lva]);
      tre2 := TRegEx.Create(pat, [roSingleLine]);
      mat2 := tre2.Match(Result);
      if mat2.Success then begin
        tbr := mat2.Groups[0].Value; // '{Aaa}'
        Result := tre2.Replace(Result, val{, 1});
      end;
      mat := mat.NextMatch;
    end;
  end;

  function  MatchProcess(IvMkdItem: TMkdItemRec; IvMatch: TMatch): string;
  var
    mva, val, tmp: string; // matchval
    grp: TGroup;           // rexgroup
  //grv: TArray<TGroup>; // rexgroupvec
    gvv: TArray<string>;   // rexgroupvaluevec
    arv: TArray<string>;   // argsvec
    grz: integer;          // gvvlen
    isc: boolean;          // iscard
    tor: TImgTormEnum;     // imagetorn
  begin
    mva := IvMatch.Value.Trim;

    for grp in IvMatch.Groups do begin
    //TArray.Add<TGroup>(grv, grp);
      TArray.Add<string>(gvv, grp.Value);
    end;
    grz := Length(gvv);

    if IvMkdItem.Itm = 'List (unordered)' then begin

      {$REGION 'groups of similar matches (like many blocks of unordered lines)'}
    for val in gvv do begin
               if val.StartsWith('* ') then begin                                             // list-dot
        tmp := ListProcess(val);
        Result := Format('<ul style="margin:0px;">%s</ul>', [tmp]);

      end else if val.StartsWith('- ') then begin                                             // list-dash
        tmp := ListProcess(val);
        Result := Format('<ul style="margin:0px; list-style-type: ''&ndash; '';">%s</ul>', [tmp]);
      end;
    end;
      {$ENDREGION}

    end else begin

      {$REGION 'groups of one match'}
      if      TStrRec.StrIsChars(gvv[0], ' ', chz) {and SameText(IvMkdItem.Itm, 'Linebreaks')} then // Linebreaks        -->   n<br>
        Result := THtmRec.Br(chz)

      else if SameText(IvMkdItem.Itm, 'Spaces') then                                                // spaces            -->   &nbsp;
        Result := {itm.New}TStrRec.StrReplicate('&nbsp;', Length(gvv[1]))

      else if SameText(IvMkdItem.Itm, 'Horizontal rule') then                                       // asteriscks/dashes -->   <hr>
        Result := THtmRec.Hr

      else if IvMkdItem.Itm.StartsWith('Header') then                                               // headers           -->   <h1>...</h1>
        Result := Format(itm.New, [gvv[2].TrimRight])

      else if SameText(IvMkdItem.Itm, 'Center') then                                                // center            -->   <center>...</center>
        Result := Format(itm.New, [gvv[1]])

      else if SameText(IvMkdItem.Itm, 'Left') then                                                  // left              -->   <div>...</div>
        Result := Format(itm.New, [gvv[1]])

      else if SameText(IvMkdItem.Itm, 'Right') then                                                 // right             -->   <div>...</div>
        Result := Format(itm.New, [gvv[1]])

      else if SameText(IvMkdItem.Itm, 'Url') then                                                   // url               -->   <a>...</a>
        Result := Format(itm.New, [gvv[1], gvv[2], gvv[2], gvv[4]])

      else if SameText(IvMkdItem.Itm, 'Email') then                                                 // email             -->   <a href="mailto:...">...</a>
        Result := Format(itm.New, [gvv[1], gvv[2], gvv[2], gvv[3]])

      else if gvv[0].StartsWith('>') or gvv[0].StartsWith('<br>>') then begin                       // blockquote        -->   <blockquote>...</blockquote>
        tmp := BlockquoteProcess(gvv[0]);
        tmp := Process(tmp);
        tmp := StringReplace(tmp, sLineBreak, '<br>', [rfReplaceAll]);
        Result := Format(itm.New, [tmp]);

      end else if TStrRec.StrIsShelledWith(gvv[0], '..') and (grz = 5) then begin                   // abbrwithdescr     -->   <abbr title="...">...</abbr>
        Result := Format(itm.New, [gvv[3], gvv[2]]);

      end else if TStrRec.StrShellThick(gvv[0]) = 1 then begin                                      // shelled 1         -->   <sup>...</sup> <sub>...</sub>
        Result := Format(itm.New, [gvv[2]])

      end else if TStrRec.StrShellThick(gvv[0]) = 2 then begin                                      // shelled 2         -->   <b>...</b>, <kbd>...</kbd>, <abbr>...</abbr>, <i class="fa fa-%s"></i>
        if SameText(IvMkdItem.Itm, 'Progress bar') then
          Result := Format(itm.New, [gvv[2], gvv[2]])
        else if SameText(IvMkdItem.Itm, 'Meter bar') then
          Result := Format(itm.New, [StrToInt(gvv[2]) / 100.0, gvv[2]])
        else
          Result := Format(itm.New, [gvv[2]])

    //else if TStrRec.StrShellThick(gvv[0]) = 3 then begin                                          // shelled 3 fenced  -->   <pre><code>...</code></pre>   *** scodeblock ee preprocessor ***
    //    Result := Format(itm.New, [iif.NxD(gvv[1], 'plaintext'), gvv[2].TrimRight])
    //  else
    //    Result := '{???}';

      end else if TStrRec.StrShellThick(gvv[0]) >= 4 then                                           // shelledmulti      -->   <u><b>...</b><u>  __**...**__
        Result := Format(itm.New, [gvv[2]])

      else if TStrRec.StrIsBoxed(gvv[0], alf, ome) then begin                                       // boxed             -->   () [] {}
        tmp := gvv[0];
        tmp := TStrRec.StrUnBox(tmp);
        arv := gvec.VecFromStr(tmp, '|', true);
        if          alf = '(' then begin                                                            // link              -->   <a>...</a>
          if Length(arv) < 4 then SetLength(arv, 4);
          Result := THtmRec.A(arv[0], arv[1], arv[2], arv[3]);
        end else if alf = '[' then begin                                                            // image             -->   <img...>
          if Length(arv) < 6 then SetLength(arv, 6);
          // card?
          isc :=  TStrRec.StrHas(arv[4].Trim, 'card');
          // torn?
               if TStrRec.StrHas(arv[5].Trim, 'topbot') then tor := itTopBottom
          else if TStrRec.StrHas(arv[5].Trim, 'top')    then tor := itTop
          else if TStrRec.StrHas(arv[5].Trim, 'bot')    then tor := itBottom
          else                                        tor := itNone;

          Result := THtmRec.Img(arv[0], arv[1], StrToIntDef(arv[2], 0), StrToIntDef(arv[3], 0), isc, tor);
      //end else if alf = '{' then begin                                                            // unused            -->   <movie...>
        //if Length(arv) < 4 then SetLength(arv, 4);
        //Result := THtmRec.Img(arv[0], arv[1], arv[2], arv[3]);
        end else
          Result := '{???}';

      end else
        Result := '{???}';
      {$ENDREGION}

    end;
  end;
  {$ENDREGION}

begin
  // escape
  Result := TEscRec.CharEscape(IvContent);
  Result := BloksEscape(Result);

  // plain
  Result := Result.Replace('-->'   , '::arrow-right::')   // arrow
                  .Replace('<--'   , '::arrow-left::' )   // arrow
                  .Replace('^^^'   , '::arrow-up::'   )   // arrow
                  .Replace('vvv'   , '::arrow-down::' )   // arrow

                  .Replace(':)'    , '&#x1F642;'      )   // happy
                  .Replace(':|'    , '&#x1F610'       )   // disappointed
                  .Replace(':('    , '&#x1F641;'      )   // unhappy
                                                                       
                  .Replace('(-)'   , '&#x26D4;'       )   // noentry
                  .Replace('(!)'   , '&#x1F6D1;'      )   // stop  
                  .Replace('(!!)'  , '&#x270B;'       )   // stop!
                  
                  .Replace('<3'    , '&#x1F9E1;'      )   // hart
                  .Replace('|>'    , '&#x1F6A9;'      )   // flag
                  .Replace('(U)'   , '&#x1F6A7;'      );  // underconstruction

  // rex
  for itm in MKD_ITEM_VEC do
    try
      tre := TRegEx.Create(itm.Rex, itm.Reo);
//    if itm.Itm = 'Url' then begin // dbg
      mat := tre.Match(Result);
      while mat.Success do begin
        new := MatchProcess(itm, mat);
        Result := tre.Replace(Result, new, 1);
        mat := mat.NextMatch;
      end;
//    end; // dbg
    except
      on e: Exception do
        Result := e.Message;
    end;

  // complex
//ListDefinitionProcess(Result);
  VarLocProcess(Result);
  FootnoteProcess(Result, fno);
  if not fno.IsEmpty then
    Result := Result + '<hr style="width:30%; border-top: 1px solid #000;margin-bottom:8px;">'
        + sLineBreak + '<ol style="margin-top:0;font-size:0.8em;">'
        + sLineBreak + fno
        + sLineBreak + '</ol>'
        + sLineBreak + '<br>';

  // unescape
  Result := BloksUnEscape(Result);
//Result := TEscRec.CharUnEscape(Result); // *** DONE AT THE END AFTER grva.Rva() ***
end;
  {$ENDREGION}

  {$REGION 'TNamRec'}
class function  TNamRec.Rnd(IvSize: integer; IvPrefix, IvSuffix: string; const IvCharSet: string): string;
begin
  Result := TRndRec.RndName(IvSize, IvPrefix, IvSuffix, IvCharSet);
end;

class function TNamRec.RndInt(IvName: string; IvRndIntSize: integer): string;
var
  a, b: extended;
begin
  a := Power10(1.0, IvRndIntSize - 1);
  b := Power10(1.0, IvRndIntSize);
  Result := IvName + IntToStr(TRndRec.RndInt(round(a),round(b)));
end;

class function  TNamRec.Co(IvName: string): string;
begin
  if IvName.IsEmpty then
    Result := TRndRec.RndName(4, 'Co')
  else
    Result := 'Co' + CoRemove(TStrRec.StrCollapse(IvName));
end;

class function TNamRec.Co(IvNameFmt: string; IvVarRecVector: array of TVarRec): string;
begin
  Result := Co(Format(IvNameFmt, IvVarRecVector));
end;

class function TNamRec.CoNameRnd(IvName: string): string;
begin
  Result := 'Co' + CoRemove(TStrRec.StrCollapse(IvName)) + TRndRec.RndName(4);
end;

class function  TNamRec.CoRemove(IvName: string): string;
var
  nam: string;
begin
  // zip
  nam := IvName;

  // exceptionsexit
  if nam.StartsWith('Code')
  or nam.StartsWith('Computer') then begin
    Result := nam;
    Exit;
  end;

  // go
  while nam.StartsWith('Co') and ( not nam.StartsWith('Code') or nam.StartsWith('Computer') ) do
    Delete(nam, 1, 2);
  Result := nam;
end;

class function  TNamRec.IsNameNum(IvNameNum, IvName: string): boolean;
begin
  Result := IvNameNum.StartsWith(IvName, true); // *** ENHANCE ***
end;

class function  TNamRec.NamePart(IvNameNum: string): string;
var
  i: integer;
  c: char;
begin
  Result := '';
  for i := 1 to Length(IvNameNum) do begin
    c := IvNameNum[i];
    if CharInSet(c, ['A'..'z']) then
      Result := Result + c
    else
      Exit;
  end;
end;

class function  TNamRec.NumPart(IvNameNum: string): string;
var
  i: integer;
  c: char;
begin
  Result := '';
  for i := Length(IvNameNum) downto 1 do begin
    c := IvNameNum[i];
    if CharInSet(c, ['0'..'9']) then
      Result := c + Result
    else
      Exit;
  end;
end;

class function  TNamRec.NameNumPrev(IvNameNum: string): string;
var
  i: integer;
  a, b: string;
begin
  a := NamePart(IvNameNum);
  b := NumPart(IvNameNum);
  i := StrToInt(b) - 1;
  Result := a + IntToStr(i);
end;

class function  TNamRec.NameNumNext(IvNameNum: string): string;
var
  i: integer;
  a, b: string;
begin
  a := NamePart(IvNameNum);
  b := NumPart(IvNameNum);
  i := StrToInt(b) + 1;
  Result := a + IntToStr(i);
end;

class function  TNamRec.Username(IvName, IvUsername: string): string; // Federico Carlo Brian, Iarussi (D'Iarussi | Di Iarussi | Del Iarussi)
var                                                                   // Fabio               , Iarussi
  nam, sur, una, fbk, s, t: string;
  nav{, suv}: {$IF COMPILERVERSION < 32.0} TStringDynArray {$ELSE} TArray<string> {$ENDIF};
  i: integer;
  usr: TUsrRec;
  function calc(n, s: string): string;
  begin
    Result := n[1] + s;
  end;
begin
  // prepare
  nam := LowerCase(IvName);                     // federico carlo brian
  sur := LowerCase(IvUsername);                 // d'iarussi | di iarussi | del iarussi

  nam := TStrRec.StrKeep(nam, ['a'..'z', ' ']); // federico carlo brian
  sur := TStrRec.StrKeep(sur, ['a'..'z'     ]); // diarussi | diiarussi | deliarussi

  nav := {TStringDynArray}TArray<string>(SplitString(nam, ' ')); // [federico, carlo, brian]

  for i := Low(nav) to High(nav) do
    nav[i] := LeftStr(nav[i], 1);               // [f, c, b]

  // try1 - use all 1st letters of multiple names
  t := '';
  for s in nav do begin
    t := t + s;                                 // f          fc          fcb
    una := t + sur;                             // fiarussi   fciarussi   fcbiarussi
    if not usr.Exists(una, fbk) then begin
      Result := una;
      Exit;
    end;
  end;

  // try2 - in case of just 1 name, use more then 1 letter of the name until the complete name
  nam := TStrRec.StrKeep(nam, ['a'..'z']); // federicocarlobrian
  t := '';
  for i := 1 to Length(nam) do begin
    t := t + nam[i];
    una := t + sur;
    if not usr.Exists(una, fbk) then begin
      Result := una;
      Exit;
    end;
  end;

  // try3 - add sequential number
  i := 2;
  t := una;
  una := t + IntToStr(i);
  while usr.Exists(una, fbk) do begin
    Inc(i);
    una := t + IntToStr(i);
  end;
  Result := una;
end;
  {$ENDREGION}

  {$REGION 'TNetRec'}
class function  TNetRec.Domain: string;
begin
  Result := LowerCase(GetEnvironmentVariable('USERDNSDOMAIN'));
  if Result = '' then
    Result := 'nodomain';
end;

class function  TNetRec.Host: string;
var
  s: dword; // size
  b: array[0..255] of char; // buffer
begin
  s := 256;
  if Winapi.Windows.GetComputerName(b, s) then
    Result := LowerCase(b)
  else
    Result := 'nohost';
end;

class function  TNetRec.Info: string;
begin
  if OsLogin <> '' then Result := OsLogin;
  if Host    <> '' then Result := Result + '@' + Host;
  if Domain  <> '' then Result := Result + '.' + Domain;
end;

class function  TNetRec.Info2: string;
begin
  Result := Format('OsUser: %s@%s.%s   Lan: %s   Wan: %s', [OsLogin, Host, Domain, IpLan, IpWan]);
end;

class function  TNetRec.InternetIsAvailable(var IvFbk: string): boolean;
const
  URL = 'http://www.google.com';
  WWW = 'www.google.com';
//var
  //o: cardinal; // origin
begin
{ // connected?
  Result := InternetGetConnectedState(@o, 0);

  // kind
  if      o =  0                             then IvFbk := 'Internet connection not available, please check your internet connection'
  else if o = INTERNET_CONNECTION_MODEM      then IvFbk := 'Internet connection available via modem'
  else if o = INTERNET_CONNECTION_LAN        then IvFbk := 'Internet connection available via local area network'
  else if o = INTERNET_CONNECTION_PROXY      then IvFbk := 'Internet connection available via proxy server'
  else if o = INTERNET_CONNECTION_MODEM_BUSY then IvFbk := 'Internet connection modem busy, no longer used'
  else if o = INTERNET_RAS_INSTALLED         then IvFbk := 'Internet connection not available, local system has RAS installed'
  else if o = INTERNET_CONNECTION_OFFLINE    then IvFbk := 'Internet connection not available, local is in offline mode'
  else if o = INTERNET_CONNECTION_CONFIGURED then IvFbk := 'Internet connection configured but it might or might not be currently connected'
  else                                            IvFbk := UNKNOWN_STR;}

  // i
{ with TIdHTTP.Create(nil) do try
    try
      HandleRedirects := true;
      Result := Get(URL) <> '';
      IvFbk := 'Internet connection is available';
    except
      Result := false;
      IvFbk := 'Internet connection is not available';
    end;
  finally
    free;
  end;}

  // ii
  Result := Ping(giif.NxD(gaps.Www, WWW), IvFbk); // ping does not work in case of :8080
  if not Result then
    IvFbk := Format('Internet connection is not available (%s)', [IvFbk])
  else
    IvFbk := 'Internet connection is available';
end;

class function  TNetRec.IpLan: string;
var
  k: string;
begin
  IpLanFn(Result, k);
end;

class function  TNetRec.IpLanFn(var IvIpLan, IvFbk: string): boolean;
type
  l = ^u_long;
var
  w: TWSAData;
  h: PHostEnt;
  a: TInAddr;
  b: array[0..255] of ansichar; // buffer
begin
  Result := WSAStartup($101, w) = 0;
  if not Result then begin
    IvIpLan := 'nolanip';
    IvFbk := IntToStr(GetLastError); // GetLastOSError;
  end else begin
    GetHostName(b, sizeof(b));
    h := gethostbyname(b);
    a.S_addr := u_long(l(h^.h_addr_list^)^);
    IvIpLan := string(inet_ntoa(a));
    IvFbk := OK_STR;
  end;
  WSACleanup;
end;

class function  TNetRec.IpWan: string;
var
  k: string;
begin
  IpWanFn(Result, k);
end;

class function  TNetRec.IpWanFn(var IvIpWan, IvFbk: string): boolean; // ipbihindrouter
var
  {h, i,} hc: string; // html, ip, httpcontent
//  l, l2: Word; // htmllen, flaglen
//  b, b2, c: PChar; // htmlbuff, flagbuff
//  p: integer; // pos
begin
  Result := THttRec.Get(Wks000Unit.TUrlRec.MYIPDOTNET, hc, IvFbk);
  if not Result then
    IvIpWan := 'nowanip'
  else
    IvIpWan := Trim(hc);
end;

class function  TNetRec.OsLogin: string;
var
  s: DWord; // size
  b: array[0..255] of char; // buffer
begin
  s := SizeOf(b);
  if GetUsername(b, s) then // GetUsernameEx get the user's domain (if there even is one), not the machine's joined domain
    Result := LowerCase(b)
  else
    Result := 'nooslogin'
end;

class function  TNetRec.Ping(IvAddress: string; var IvFbk: string; IvRetries: integer): boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to IvRetries-1 do
  //Result := PingRaw(IvAddress, IvFbk)
    Result := PingWmi(IvAddress, 1, 32, IvFbk);
end;

class function  TNetRec.PingRaw(const IvAddress: string; var IvFbk: string): boolean;
//var
//  h: THandle;
//  a: TIPAddr;
//  d: DWORD;
//  r: array[1..128] of byte; // reply
begin
  Result := false;
  IvFbk := TStdRec.StdNotImplemented('PingRaw');
//  h := NetIcmpCreateFile;
//  if h = INVALID_HANDLE_VALUE then
//    Exit;
//  NetTranslateStringToAddr(IvAddress, a);
//  d := NetIcmpSendEcho(h, a, nil, 0, nil, @r, 128, 0);
//  Result := (d <> 0);
//  NetIcmpCloseHandle(h);
end;

class function  TNetRec.PingStateFromCode(IvCode: integer): string;
begin
  case IvCode of
        0: Result := 'Success';
    11001: Result := 'Buffer Too Small';
    11002: Result := 'Destination Net Unreachable';
    11003: Result := 'Destination Host Unreachable';
    11004: Result := 'Destination Protocol Unreachable';
    11005: Result := 'Destination Port Unreachable';
    11006: Result := 'No Resources';
    11007: Result := 'Bad Option';
    11008: Result := 'Hardware Error';
    11009: Result := 'Packet Too Big';
    11010: Result := 'Request Timed Out';
    11011: Result := 'Bad Request';
    11012: Result := 'Bad Route';
    11013: Result := 'TimeToLive Expired Transit';
    11014: Result := 'TimeToLive Expired Reassembly';
    11015: Result := 'Parameter Problem';
    11016: Result := 'Source Quench';
    11017: Result := 'Option Too Big';
    11018: Result := 'Bad Destination';
    11032: Result := 'Negotiating IPSEC';
    11050: Result := 'General Failure'
  else     Result := 'Unknow';
  end;
end;

class function  TNetRec.PingWmi(const IvAddress: string; IvRetries, IvBufferSize: Word; var IvFbk: string): boolean;
var
  FSWbemLocator: OLEVariant;
  FWMIService: OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject: OLEVariant;
  q: string; // query
  e: IEnumVariant;
  l: LongWord;
  i: integer;
  r: integer; // packetsreceived
  min: integer;
  max: integer;
  avg: integer;
begin;
  // init
  IvFbk := Format('Pinging %s with %d bytes of data', [IvAddress, IvBufferSize]);
  r := 0;
  min := 0;
  max := 0;
  avg := 0;
  q := Format('select * from Win32_PingStatus where Address=%s and BufferSize=%d and Timeout=100',[QuotedStr(IvAddress), IvBufferSize]);

  // wmi
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  FWMIService   := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');
//FWMIService   := FSWbemLocator.ConnectServer('192.168.52.130', 'root\CIMV2', 'Username', 'password');
  // loop
  for i := 0 to IvRetries-1 do begin
    FWbemObjectSet := FWMIService.ExecQuery(q, 'WQL', 0);
    e := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;
    if e.Next(1, FWbemObject, l) = 0 then begin
      if FWbemObject.StatusCode = 0 then begin
        Inc(r);
        if FWbemObject.ResponseTime > 0 then
          IvFbk := IvFbk + sLineBreak + Format('Reply from %s: bytes=%s time=%sms TTL=%s',[FWbemObject.ProtocolAddress, FWbemObject.ReplySize, FWbemObject.ResponseTime, FWbemObject.TimeToLive])
        else
          IvFbk := IvFbk + sLineBreak + Format('Reply from %s: bytes=%s time=<1ms TTL=%s',[FWbemObject.ProtocolAddress, FWbemObject.ReplySize, FWbemObject.TimeToLive]);
        if FWbemObject.ResponseTime > max then
          max := FWbemObject.ResponseTime;
        if min = 0 then
          min := max;
        if FWbemObject.ResponseTime < min then
          min := FWbemObject.ResponseTime;
        avg := avg + FWbemObject.ResponseTime;
      end else if not VarIsNull(FWbemObject.StatusCode) then
        IvFbk := IvFbk + sLineBreak + Format('Reply from %s: %s', [FWbemObject.ProtocolAddress, PingStateFromCode(FWbemObject.StatusCode)])
      else
        IvFbk := IvFbk + sLineBreak + Format('Reply from %s: %s', [IvAddress, 'Error processing request']);
    end;
    FWbemObject := Unassigned;
    FWbemObjectSet := Unassigned;
    //Sleep(500);
  end;

  IvFbk := IvFbk + sLineBreak + Format('Ping statistics for %s:', [IvAddress]);
  IvFbk := IvFbk + sLineBreak + Format('Packets: Sent=%d, Received=%d, Lost=%d (%d%% loss),', [IvRetries, r, IvRetries - r, Round((IvRetries - r) * 100 / IvRetries)]);
  if r > 0 then begin
    IvFbk := IvFbk + sLineBreak + 'Approximate round trip times in milli-seconds:';
    IvFbk := IvFbk + sLineBreak + Format('Minimum=%dms, Maximum=%dms, Average=%dms',[min, max, Round(avg / r)]);
  end;

  // return
  Result := IvRetries = r;
end;
  {$ENDREGION}

  {$REGION 'TObjRec MASTER'}
procedure TObjRec.Free;
begin
  if Assigned(Image) then
    try
    //Image.Free;
      FreeAndNil(Image);
    except
      on e: Exception do
        glog.Log(e.Message);
    end;
end;

procedure TObjRec.Reset;
begin
  Id              := {0}-1    ;
  PId             := {0}-1    ;
  Id8             := ''    ;
  Order           := 0     ;
  Rev             := 0     ;
  Created         := 0     ;
  Updated         := 0     ;
  FromOrganization:= ''    ;
  FromDepartment  := ''    ;
  FromArea        := ''    ;
  FromTeam        := ''    ;
  FromMember      := ''    ;
  ToOrganization  := ''    ;
  ToDepartment    := ''    ;
  ToArea          := ''    ;
  ToTeam          := ''    ;
  ToMember        := ''    ;
  Route           := ''    ;
  ObjectKind      := ''    ;
  ContentKind     := ''    ;
  DataKind        := ''    ;
  State           := ''    ;
  Title           := ''    ;
  Subtitle        := ''    ;
  Description     := ''    ;
  Spare           := ''    ;
  Encrypted       := false ;
  Persist         := false ;
  Image           := nil   ;
  ContentPrev     := ''    ;
  Content         := ''    ;
  Data            := ''    ;
  Note            := ''    ;
  &Object         := ''    ;
end;

function  TObjRec.InitDba(IvObj: string; IvId: integer): boolean;
var
  sql: string;
  dst: TDataset;
begin
  sql := TSqlRec.SqlSelectFromTblObjectById(IvObj, IvId);
  {Result :=} TDbaRec.DsFromSql(sql, dst);
  try
    Result := not dst.IsEmpty;
    if not Result then
      Reset
    else begin
      Id                   := dst.FieldByName('FldId'                 ).AsInteger ;
      PId                  := dst.FieldByName('FldPId'                ).AsInteger ;
      Id8                  := dst.FieldByName('FldId8'                ).AsString  ;
      Order                := dst.FieldByName('FldOrder'              ).AsInteger ;
      Rev                  := dst.FieldByName('FldRev'                ).AsInteger ;
      Created              := dst.FieldByName('FldCreated'            ).AsDateTime;
      Updated              := dst.FieldByName('FldUpdated'            ).AsDateTime;
      FromOrganization     := dst.FieldByName('FldFromOrganization'   ).AsString  ;
      FromDepartment       := dst.FieldByName('FldFromDepartment'     ).AsString  ;
      FromArea             := dst.FieldByName('FldFromArea'           ).AsString  ;
      FromTeam             := dst.FieldByName('FldFromTeam'           ).AsString  ;
      FromMember           := dst.FieldByName('FldFromMember'         ).AsString  ;
      ToOrganization       := dst.FieldByName('FldToOrganization'     ).AsString  ;
      ToDepartment         := dst.FieldByName('FldToDepartment'       ).AsString  ;
      ToArea               := dst.FieldByName('FldToArea'             ).AsString  ;
      ToTeam               := dst.FieldByName('FldToTeam'             ).AsString  ;
      ToMember             := dst.FieldByName('FldToMember'           ).AsString  ;
     {ToMember}JobGradeMin := dst.FieldByName('FldJobGradeMin'        ).AsInteger ;
    //ToMemberJobTitle     := dst.FieldByName('FldToMemberJobTitle'   ).AsString  ;
      Route                := dst.FieldByName('FldRoute'              ).AsString  ;
      ObjectKind           := dst.FieldByName('FldObjectKind'         ).AsString  ;
      ContentKind          := dst.FieldByName('FldContentKind'        ).AsString  ;
      DataKind             := dst.FieldByName('FldDataKind'           ).AsString  ;
      State                := dst.FieldByName('FldState'              ).AsString  ;
      Title                := dst.FieldByName('FldTitle'              ).AsString  ;
      Subtitle             := dst.FieldByName('FldSubtitle'           ).AsString  ;
      Description          := dst.FieldByName('FldDescription'        ).AsString  ;
      Spare                := dst.FieldByName('FldSpare'              ).AsString  ;
      Encrypted            := dst.FieldByName('FldEncrypted'          ).AsBoolean ;
      Persist              := dst.FieldByName('FldPersist'            ).AsBoolean ;
    //Image                := dst.FieldByName('FldImage'              ).AsString  ;
    //TGraRec.FromBlobField(Image, TBlobField(dst.FieldByName('FldImage')));
      ContentPrev          := dst.FieldByName('FldContentPrev'        ).AsString  ;
      Content              := dst.FieldByName('FldContent'            ).AsString  ;
      Data                 := dst.FieldByName('FldData'               ).AsString  ;
      Note                 := dst.FieldByName('FldNote'               ).AsString  ;
      &Object              := dst.FieldByName('FldObject'             ).AsString  ;
    end;
  finally
    dst.Free;
  end;
end;

procedure TObjRec.RecFromRem(IvObjRem: TObjRem);
begin
  if not Assigned(IvObjRem) then
    Exit;

  Id               := IvObjRem.Id              ;
  PId              := IvObjRem.PId             ;
  Id8              := IvObjRem.Id8             ;
  Order            := IvObjRem.Order           ;
  Rev              := IvObjRem.Rev             ;
  Created          := IvObjRem.Created         ;
  Updated          := IvObjRem.Updated         ;
  FromOrganization := IvObjRem.FromOrganization;
  FromDepartment   := IvObjRem.FromDepartment  ;
  FromArea         := IvObjRem.FromArea        ;
  FromTeam         := IvObjRem.FromTeam        ;
  FromMember       := IvObjRem.FromMember      ;
  ToOrganization   := IvObjRem.ToOrganization  ;
  ToDepartment     := IvObjRem.ToDepartment    ;
  ToArea           := IvObjRem.ToArea          ;
  ToTeam           := IvObjRem.ToTeam          ;
  ToMember         := IvObjRem.ToMember        ;
  JobGradeMin      := IvObjRem.JobGradeMin     ;
//ToMemberJobTitle := IvObjRem.ToMemberJobTitle;
  Route            := IvObjRem.Route           ;
  ObjectKind       := IvObjRem.ObjectKind      ;
  DataKind         := IvObjRem.DataKind        ;
  State            := IvObjRem.State           ;
  Title            := IvObjRem.Title           ;
  Subtitle         := IvObjRem.Subtitle        ;
  Description      := IvObjRem.Description     ;
  Spare            := IvObjRem.Spare           ;
  Encrypted        := IvObjRem.Encrypted       ;
  Persist          := IvObjRem.Persist         ;
//Image            := IvObjRem.Image           ;
  ContentPrev      := IvObjRem.ContentPrev     ;
  Content          := IvObjRem.Content         ;
  Data             := IvObjRem.Data            ;
  Note             := IvObjRem.Note            ;
  &Object          := IvObjRem.&Object         ;
end;

procedure TObjRec.RecToRem(var IvObjRem: TObjRem);
begin
  IvObjRem.Id               := Id              ;
  IvObjRem.PId              := PId             ;
  IvObjRem.Id8              := Id8             ;
  IvObjRem.Order            := Order           ;
  IvObjRem.Rev              := Rev             ;
  IvObjRem.Created          := Created         ;
  IvObjRem.Updated          := Updated         ;
  IvObjRem.FromOrganization := FromOrganization;
  IvObjRem.FromDepartment   := FromDepartment  ;
  IvObjRem.FromArea         := FromArea        ;
  IvObjRem.FromTeam         := FromTeam        ;
  IvObjRem.FromMember       := FromMember      ;
  IvObjRem.ToOrganization   := ToOrganization  ;
  IvObjRem.ToDepartment     := ToDepartment    ;
  IvObjRem.ToArea           := ToArea          ;
  IvObjRem.ToTeam           := ToTeam          ;
  IvObjRem.ToMember         := ToMember        ;
  IvObjRem.JobGradeMin      := JobGradeMin     ;
//IvObjRem.ToMemberJobTitle := ToMemberJobTitle;
  IvObjRem.Route            := Route           ;
  IvObjRem.ObjectKind       := ObjectKind      ;
  IvObjRem.ContentKind      := ContentKind     ;
  IvObjRem.DataKind         := DataKind        ;
  IvObjRem.State            := State           ;
  IvObjRem.Title            := Title           ;
  IvObjRem.Subtitle         := Subtitle        ;
  IvObjRem.Description      := Description     ;
  IvObjRem.Spare            := Spare           ;
  IvObjRem.Encrypted        := Encrypted       ;
  IvObjRem.Persist          := Persist         ;
//IvObjRem.Image            := Image           ;
  IvObjRem.ContentPrev      := ContentPrev     ;
  IvObjRem.Content          := Content         ;
  IvObjRem.Data             := Data            ;
  IvObjRem.Note             := Note            ;
  IvObjRem.&Object          := &Object         ;
end;

function  TObjRec.ObjObjectSafe: string;
begin
  Result := TStrRec.StrSafe(&Object);
end;

function  TObjRec.ContentKindIsMarkdown: boolean;
begin
  Result := ContentKind = TCodRec.MD.Kind;
end;

class function  TObjRec.IsBusinessObj(const IvObj: string): boolean;
begin
  Result := TStrRec.StrHas('Person,User,Organization,Member,Page,Document', IvObj);
end;

class function  TObjRec.ObjPropertyVector: TArray<string>;
var
  ctx: TRttiContext;
  fld: TRttiField;
//typ: TRttiType;
  {tyn, }nam: string;
begin
  try
    ctx := TRttiContext.Create;
    for fld in ctx.GetType(TypeInfo(TObjRec)).GetFields do begin
    //typ := fld.FieldType;
    //tyn := fld.FieldType.Name;
      nam := fld.Name;
      Insert([nam], Result, High(Result));
    end;
  except
    on e: Exception do
      glog.Log(e);
  end;
end;

class function  TObjRec.ObjKindVector: TArray<string>; // [OBJECTLIST]
begin
  Result := [
  // base
    'Root'
  , 'Zzz'
  , 'Temp'
  , 'Test'
  , 'Help'
  , 'Param'
  , 'Switch'
  , 'Template'
  , 'Organization'
  , 'Public'
  , 'System'
  , 'Reserved'

  // objectkind
  , 'Folder'
  , 'Library'
  , 'Link'

  // obj
  , 'Person'
  , 'User'
//, 'Organization'
  , 'Member'
  , 'Account'
  , 'Code'
  , 'Page'
  , 'Document'
  , 'Report'
//, 'System'
//, 'Task'

  // structure
//, 'Organization'
  , 'Department'
  , 'Area'
  , 'Team'
  , 'Member'

  // task
  , 'Portfolio'
  , 'Program'
  , 'Package'
  , 'Project'
  , 'Phase'
  , 'Group'
  , 'Task'
  ];
end;

class function  TObjRec.HasProperty(const IvProperty: string): boolean;
var
  prv: TArray<string>;
  pro: string;
begin
  Result := false;
  prv := ObjPropertyVector;
  for pro in prv do begin
    Result := SameText(pro, IvProperty);
    if Result then
      Exit;
  end;
end;

class function  TObjRec.IdNext(const IvObj: string; var IvIdNext: integer; var IvFbk: string): boolean;
var
  tbl: string;
begin
  tbl := Format('Dba%s.dbo.TblObject', [IvObj]);
  IvIdNext := TDbaRec.TblIdNext(tbl, true);
  IvFbk := ifthen(true, 'Found idnext using 1st available id in missed blocks', 'Found idnext using idmax');
  Result := true;
end;

class function  TObjRec.IdNextRio(const IvObj: string; var IvIdNext: integer; var IvFbk: string): boolean;
begin
  Result := (grio.HttpRio as ISystemSoapMainService).SystemObjectIdNextSoap(IvObj, IvIdNext, IvFbk);
end;

class function  TObjRec.New(IvObj, IvIdOrPath, IvObject, IvObjectKind, IvContentKind, IvFromOrganization, IvFromMember: string; var IvIdNew: integer): boolean;
var
  idn, pid, aff: integer;
  tbl, sql, fbk: string;
  mbr: TMbrRec;
begin
  {Result :=} IdNext(IvObj, idn, fbk);

  tbl := TSqlRec.TblMasterFromObj(IvObj); // DbaCode.dbo.TblObject
  
  pid := TDbaRec.ObjIdFromIdOrPath(IvObj, IvIdOrPath);

  mbr.InitDba(IvFromOrganization, IvFromMember, fbk);

  sql :=         'insert into Dba'+IvObj+'.dbo.TblObject'
  + sLineBreak + 'select'
  + sLineBreak + '    FldId = '               + idn.ToString
  + sLineBreak + '  , FldPId = '              + pid.ToString
  + sLineBreak + '  , FldId8 = '              + TId8Rec.Generate.QuotedString
  + sLineBreak + '  , FldOrder = '            + 'null'
  + sLineBreak + '  , FldRev = '              + '0'
  + sLineBreak + '  , FldCreated = '          + DateTimeToStr(now).QuotedString
  + sLineBreak + '  , FldUpdated = '          + DateTimeToStr(now).QuotedString
  + sLineBreak + '  , FldFromOrganization = ' + TSqlRec.Val(mbr.Organization)
  + sLineBreak + '  , FldFromDepartment = '   + TSqlRec.Val(mbr.Department)
  + sLineBreak + '  , FldFromArea = '         + TSqlRec.Val(mbr.Area)
  + sLineBreak + '  , FldFromTeam = '         + TSqlRec.Val(mbr.Team)
  + sLineBreak + '  , FldFromMember = '       + TSqlRec.Val(mbr.Member)
  + sLineBreak + '  , FldToOrganization = '   + TSqlRec.Val(mbr.Organization)
  + sLineBreak + '  , FldToDepartment = '     + TSqlRec.Val(mbr.Department)
  + sLineBreak + '  , FldToArea = '           + TSqlRec.Val(mbr.Area)
  + sLineBreak + '  , FldToTeam = '           + TSqlRec.Val(mbr.Team)
  + sLineBreak + '  , FldToMember = '         + QuotedStr('*')
  + sLineBreak + '  , FldRoute = '            + 'null'
  + sLineBreak + '  , FldObjectKind = '       + QuotedStr('Member')
  + sLineBreak + '  , FldContentKind = '      + QuotedStr('Txt')
  + sLineBreak + '  , FldDataKind = '         + 'null'
  + sLineBreak + '  , FldState = '            + TStaRec.Active.Name.QuotedString
  + sLineBreak + '  , FldTitle = '            + 'null'
  + sLineBreak + '  , FldSubtitle = '         + 'null'
  + sLineBreak + '  , FldDescription = '      + 'null'
  + sLineBreak + '  , FldSpare = '            + 'null'
  + sLineBreak + '  , FldEncrypted = '        + '0'
  + sLineBreak + '  , FldPersist = '          + '1'
  + sLineBreak + '  , FldImage = '            + 'null'
  + sLineBreak + '  , FldContentPrev = '      + 'null'
  + sLineBreak + '  , FldContent = '          + 'null'
  + sLineBreak + '  , FldData = '             + 'null'
  + sLineBreak + '  , FldNote = '             + 'null'
  + sLineBreak + '  , FldObject = '           + IvObject.QuotedString;
  Result := TDbaRec.CmdExec(sql, aff, fbk);
end;

class function  TObjRec.NewRio(IvObj, IvIdOrPath, IvObject, IvObjectKind, IvContentKind, IvFromOrganization, IvFromMember: string; var IvIdNew: integer): boolean;
begin
  Result := (grio.HttpRio as ISystemSoapMainService).SystemObjectNewRio(IvObj, IvIdOrPath, IvObject, IvObjectKind, IvContentKind, IvFromOrganization, IvFromMember, IvIdNew);
end;

class function  TObjRec.FieldGet(const IvObj, IvIdOrPath, IvField: string; var IvValue: variant; const IvDefault: variant): boolean;
var
  tbl, fld, sql: string;
  oid: integer;
begin
  tbl := TSqlRec.TblMasterFromObj(IvObj);
  fld := ifthen(SameStr(IvObj, 'Object'), 'FldId', 'FldObjectId');
  oid := TDbaRec.ObjIdFromIdOrPath(IvObj, IvIdOrPath);
  sql := Format('select top(1) %s from %s where %s = %d', [IvField, tbl, fld, oid]);
  IvValue := TDbaRec.Scalar(sql, IvDefault);
  Result := true;
end;

class function  TObjRec.FieldSet(const IvObj, IvIdOrPath, IvField: string; const IvValue: variant): boolean;
var
  tbl, fld, sql, fbk: string;
  oid, aff: integer;
begin
  tbl := TSqlRec.TblMasterFromObj(IvObj);
  fld := ifthen(SameStr(IvObj, 'Object'), 'FldId', 'FldObjectId');
  oid := TDbaRec.ObjIdFromIdOrPath(IvObj, IvIdOrPath);
  sql := Format('update %s set %s = %s where %s = %d', [tbl, IvField, IvValue, fld, oid]);
  Result := TDbaRec.CmdExec(sql, aff, fbk);
end;
  {$ENDREGION}

  {$REGION 'TObjRec DETAILS'}
  {$ENDREGION}

  {$REGION 'TOrgRec'}
function  TOrgRec.Info: string;
begin
  Result := Format('%s - %s', [Obj.&Object.ToUpper, Www]);
end;

procedure TOrgRec.Free;
begin
  Obj.Free;
  if Assigned(LogoGraphic) then
    LogoGraphic.Free;
  if Assigned(LogoLongGraphic) then
    LogoLongGraphic.Free;
end;

procedure TOrgRec.Reset(IvOrganizationOrWwwDefault: string; IvResetObjAlso: boolean);
begin
  // master
  if IvResetObjAlso then
    Obj.Reset;

  // detail
  ObjectId        := 0;
  Www             := IvOrganizationOrWwwDefault; // use host temporarily
  Phone           := '';
  Email           := '';
  About           := '';
  Slogan          := '';
  LogoGraphic     := nil;
  LogoLongGraphic := nil;

  // derived
  HomePageId      := 0;
end;

function  TOrgRec.InitDba(IvOrganization: string; var IvFbk: string): boolean;
var
  sql: string;
  dst: TDataset;
begin
  sql := Format('select top(1) b.* from DbaOrganization.dbo.TblObject a inner join DbaOrganization.dbo.TblOrganization b on (b.FldObjectId = a.FldId) where a.FldObject = ''%s''', [IvOrganization]);
  TDbaRec.DsFromSql(sql, dst);
  try
    // notdefined
    Result := not dst.IsEmpty;
    if not Result then begin
      Reset(IvOrganization);
      IvFbk := Format('Unable to load TOrgRec, organization "%s" does not exist in database', [IvOrganization]);

    // defined
    end else begin;
      // master
      Obj.InitDba('Organization', dst.FieldByName('FldObjectId').AsInteger);

      // detail
      ObjectId     := dst.FieldByName('FldObjectId'    ).AsInteger;
      Www          := dst.FieldByName('FldWww'         ).AsString;
      Phone        := dst.FieldByName('FldPhone'       ).AsString;
      Email        := dst.FieldByName('FldEmail'       ).AsString;
      About        := dst.FieldByName('FldAbout'       ).AsString;
      Slogan       := dst.FieldByName('FldSlogan'      ).AsString;
      TGraRec.FromBlobField(LogoGraphic    , TBlobField(dst.FieldByName('FldLogo'    ))); //LogoGraphic := TPngImage.Create; //LogoGraphic.LoadFromFile('C:\$Org\W\Wks\WksLogo.png');
      TGraRec.FromBlobField(LogoLongGraphic, TBlobField(dst.FieldByName('FldLogoLong')));

      // derived
      sql := Format('select FldId from DbaPage.dbo.TblObject where FldObject = ''%s''', [Obj.&Object]);
      HomePageId := TDbaRec.Scalar(sql, 0);

      IvFbk := Format('OrgRec loaded from database with %s data', [IvOrganization]);
    end;
  finally
    dst.Free;
  end;
end;

function  TOrgRec.InitByWww(IvWww: string; var IvFbk: string): boolean;
var
  sql, org: string;
begin
  sql := Format('select top(1) a.FldObject from DbaOrganization.dbo.TblObject a inner join DbaOrganization.dbo.TblOrganization b on (b.FldObjectId = a.FldId) where b.FldWww = ''%s''', [IvWww]);
  org := TDbaRec.Scalar(sql, '');
  Result := not org.IsEmpty;
  if not Result then begin
    IvFbk := Format('Unable to initialize TOrgRec by www "%s", it does not exists in the database', [IvWww]);
    Exit;
  end;
  Result := InitDba(org, IvFbk);
end;

function  TOrgRec.InitRio(IvOrganization: string; var IvFbk: string): boolean;
var
  rem: TOrgRem;
begin
  Reset('');

  rem := TOrgRem.Create;
  try
    Result := (grio.HttpRio as ISystemSoapMainService).SystemOrganizationInitSoap(IvOrganization, rem, IvFbk);
    if Result then begin
      // master
      Obj.RecFromRem(rem.ObjRem);

      // detail
      ObjectId        := rem.ObjectId;
      Www             := rem.Www;
      About           := rem.About;
      Phone           := rem.Phone;
      Email           := rem.Email;
      Slogan          := rem.Slogan;
    //LogoGraphic     := TPngImage.Create; LogoGraphic.LoadFromFile('C:\$Org\W\Wks\WksLogo.png');
    //LogoLongGraphic := TPngImage.Create; LogoLongGraphic.LoadFromFile('C:\$Org\W\Wks\WksLogoLong.png');
      TGraRec.FromByteArray(LogoGraphic    , rem.LogoBytes    );
      TGraRec.FromByteArray(LogoLongGraphic, rem.LogoLongBytes);
    end;
  finally
  {$IF COMPILERVERSION < 32.0}
    rem.ObjRem.Free;
  {$ELSE}
    FreeAndNil(rem.ObjRem);
  {$ENDIF}
    FreeAndNil(rem);
  end;
end;

function  TOrgRec.TreeDir(IvOrganization: string): string;
var
  org: string;
begin
  if IvOrganization = '' then org := Obj.&Object else org := IvOrganization;
  Result := Format('Root/Organization/%s', [org[1]]);
end;

function  TOrgRec.TreePath(IvOrganization: string): string;
var
  org: string;
begin
  if IvOrganization = '' then org := Obj.&Object else org := IvOrganization;
  Result := TreeDir(IvOrganization) + Format('/%s', [org]);
end;

function  TOrgRec.HomePath: string;
begin
  Result := Format('C:\$Org\%s\%s', [Obj.&Object[1], Obj.&Object]);                                         // C:\$Org\W\Wks
end;

function  TOrgRec.LogoFile: string;
begin
  Result := HomePath + Format('\%sLogo.png', [Obj.ObjObjectSafe]);                                          // C:\$Org\W\Wks\WksLogo.png
end;

function  TOrgRec.LogoLongFile: string;
begin
  Result := LogoFile.Replace('Logo.png', 'LogoLong.png');                                                   // C:\$Org\W\Wks\WksLogoLong.png
end;

function  TOrgRec.HomeUrl(IvRelative: boolean): string;
begin
  if Obj.&Object.Trim.IsEmpty then
    Result := ''
  else
    Result := Format('%s/Organization/%s/%s', [ifthen(IvRelative, '', Www), Obj.&Object[1], Obj.&Object]);  // /Organization/W/Wks
end;

function  TOrgRec.LogoUrl(IvRelative, IvInverted: boolean): string;
var
  inv: string;
begin
  inv := ifthen(IvInverted, 'Inv', '');
  Result := HomeUrl(IvRelative) + Format('/%sLogo%s.png', [Obj.&Object, inv]);                              // /Organization/W/Wks/WksLogo.png *** DUPLICATED in TTheRec ***
end;                         // + gthe.LogoImg

function  TOrgRec.LogoLongUrl(IvRelative: boolean): string;
begin
  Result := LogoUrl(IvRelative).Replace('Logo.png', 'LogoLong.png');                                        // /Organization/W/Wks/WksLogoLong.png
end;

function  TOrgRec.IconUrl(IvRelative: boolean): string;
begin
  Result := HomeUrl(IvRelative) + Format('/%sIcon.ico', [Obj.&Object]);                                     // /Organization/W/Wks/WksIcon.ico
end;
  {$ENDREGION}

  {$REGION 'TPagRec'}
procedure TPagRec.Reset(IvResetObjAlso: boolean);
begin
  // master
  if IvResetObjAlso then
    Obj.Reset;

  // detail
  ObjectId                 := 0    ;
  Page                     := ''   ;
  Menu                     := ''   ;
  Popup                    := ''   ;
  Icon                     := ''   ;
  Head                     := ''   ;
  Css                      := ''   ;
  Js                       := ''   ;
  JsAfter                  := ''   ;
  Header                   := ''   ;
  Footer                   := ''   ;
  UniPage                  := ''   ;
  ContainerOn              := true ;
  ContentFixed             := true ;
  Centered                 := true ;
  TitleShow                := false;
  SubtitleShow             := false;
  TopSpace                 :=  0   ;
  BottomSpace              :=  0   ;
  LeftSpace                :=  0   ;
  RightSpace               :=  0   ;
  AuthenticationNeeded     := false;

  // derived
  // ...
end;

function  TPagRec.InitDba(IvId: integer): boolean;
var
  sql: string;
  dst: TDataset;
  cxt: TRttiContext;
  rty: TRttiType;
begin
  // master
  Result := Obj.InitDba('Page', IvId);
  if not Result then begin
    Reset;
  //IvFbk := Format('Unable to load PagRec, page %d does not exist in database', [IvId]);
    Exit;
  end;

  // detail
  sql := TSqlRec.SqlSelectFromTblDetailById('Page', IvId);
  Result := TDbaRec.DsFromSql(sql, dst);
  try
    if dst.IsEmpty then
      Reset
    else begin
      ObjectId                 := dst.FieldByName('FldObjectId'            ).AsInteger;
      Page                     := dst.FieldByName('FldPage'                ).AsString ;
      Menu                     := dst.FieldByName('FldMenu'                ).AsString ;
      Popup                    := dst.FieldByName('FldPopup'               ).AsString ;
      Icon                     := dst.FieldByName('FldIcon'                ).AsString ;
      Head                     := dst.FieldByName('FldHead'                ).AsString ;
      Css                      := dst.FieldByName('FldCss'                 ).AsString ;
      Js                       := dst.FieldByName('FldJs'                  ).AsString ;
      JsAfter                  := dst.FieldByName('FldJsAfter'             ).AsString ;
      Header                   := dst.FieldByName('FldHeader'              ).AsString ;
      Footer                   := dst.FieldByName('FldFooter'              ).AsString ;
      UniPage                  := dst.FieldByName('FldUniPage'             ).AsString ;
      ContainerOn              := dst.FieldByName('FldContainerOn'         ).AsBoolean;
      ContentFixed             := dst.FieldByName('FldContentFixed'        ).AsBoolean;
      Centered                 := dst.FieldByName('FldCentered'            ).AsBoolean;
      TitleShow                := dst.FieldByName('FldTitleShow'           ).AsBoolean;
      SubtitleShow             := dst.FieldByName('FldSubtitleShow'        ).AsBoolean;
      TopNavOff                := dst.FieldByName('FldTopNavOff'           ).AsBoolean;
      SystemInfoOff            := dst.FieldByName('FldSystemInfoOff'       ).AsBoolean;
      TopSpace                 := dst.FieldByName('FldTopSpace'            ).AsInteger;
      BottomSpace              := dst.FieldByName('FldBottomSpace'         ).AsInteger;
      LeftSpace                := dst.FieldByName('FldLeftSpace'           ).AsInteger;
      RightSpace               := dst.FieldByName('FldRightSpace'          ).AsInteger;
      AuthenticationNeeded     := dst.FieldByName('FldAuthenticationNeeded').AsBoolean;
    end;
  finally
    dst.Free;
  end;

  // compile
  cxt := TRttiContext.Create;
  try
    // getrttitypeinformationfortherecord
    rty := cxt.GetType(TypeInfo(TObjRec));
    // rv
    Head    := grva.RvaRecord(Head   , rty, @Obj);
    Css     := grva.RvaRecord(Css    , rty, @Obj);
    Js      := grva.RvaRecord(Js     , rty, @Obj);
    JsAfter := grva.RvaRecord(JsAfter, rty, @Obj);
    Header  := grva.RvaRecord(Header , rty, @Obj);
    Footer  := grva.RvaRecord(Footer , rty, @Obj);
  finally
    cxt.Free;
  end;
end;
  {$ENDREGION}

  {$REGION 'TPatRec'}
class function  TPatRec.DelimiterEnsure(IvPath: string): string;
begin
  Result := IncludeTrailingPathDelimiter(IvPath);
end;

class function  TPatRec.Ext(IvFile: string): string;
begin
  Result := LowerCase(ExtractFileExt(IvFile)); // .txt
end;

class function  TPatRec.ExtChange(const IvFile, IvExtNew: string): string;
begin
  Result := ChangeFileExt(IvFile, IvExtNew);
end;

class function  TPatRec.ExtEnsure(IvExt: string): string;
begin
  if IvExt = '' then
    Exit;
  Result := LowerCase(IvExt);
  if Result[1] <> '.' then
    Result := '.' + Result;
end;

class function  TPatRec.ExtHas(IvFile: string): boolean;
begin
  Result := IvFile.Contains('.');
end;

class function  TPatRec.Head(IvFile: string; IvElemCount: integer): string;
var
  i, p, z: integer; // pos, founddelimiters
begin
  p := 0;
  z := 0;
  for i := 1 to Length(IvFile) do
    if IvFile[i] = '\' then begin
      Inc(z);
      if z = IvElemCount then begin
        p := i;
        break;
      end;
    end;
  if p = 0 then
    raise Exception.Create('Original path is too short, unable to get enough head elements')
  else
    Result := System.Copy(IvFile, 1, p - 1);
end;

class function  TPatRec.Name(IvFile: string): string;
begin
  // removepath
  Result := ExtractFileName(IvFile);
  // removeext
  Result := Copy(Result, 1, Pos('.', Result)-1);
end;

class function  TPatRec.NameChange(const IvFile, IvNameNew: string): string;
var                                // C:\Path\Name.ext
  p, n, e: string;
begin
  p := ExtractFilePath(IvFile); // C:\Path\
  n := Name(IvFile);            // Name
  e := Ext(IvFile);             // .ext
  Result := p + IvNameNew + e;  // FsFileMove(IvFile, IvNameNew + e);
end;

class function  TPatRec.NameDotExt(IvFile: string): string;
begin
  Result := ExtractFileName(IvFile); // Aaa.txt
end;

class function  TPatRec.Path(IvFile: string): string;
begin
//Result := ExtractFilePath(IvFile); // will include the final \
  Result := ExtractFileDir(IvFile);  // will NOT include the final \
end;

class function  TPatRec.Tail(IvFile: string; IvElemCount: integer): string;
var
  i, p, z: integer; // pos, founddelimiters
begin
  p := 0;
  z := 0;
  for i := Length(IvFile) downto 1 do
    if IvFile[i] = '\' then begin
      Inc(z);
      if z = IvElemCount then begin
        p := i;
        break;
      end;
    end;
  if p = 0 then
    raise Exception.Create('Original path is too short, unable to get enough tail elements')
  else
    Result := System.Copy(IvFile, p, MaxInt);
end;

class function  TPatRec.TreePathIs(IvThreePath: string): boolean;
begin
  Result := IvThreePath.StartsWith('/Root') or IvThreePath.StartsWith('Root');
end;

class function  TPatRec.TreePathNormalize(IvThreePath: string): string;
var
  coi: TCoiRec; // codeitem
//cod: TCodRec; // coderecord
begin
  Result := TStrRec.StrReplace(IvThreePath, '\', '/');
  Result := TStrRec.StrReplace(Result     , '.', '/'); // *** warning, breaks paths like Root/Organization/W/W3/W3.js ***

  for coi in TCodRec.Vector do
    if Result.EndsWith('/' + coi.Kind, true) then begin
      Result := TStrRec.StrReplace(Result, '/' + coi.Kind, '.' + coi.Kind.ToLower);
      Break
    end;

  if not Result.IsEmpty then
    if Result[1] = '/' then
      Delete(Result, 1, 1);
end;

class function  TPatRec.Volume(IvFile: string): string;
begin
  Result := ExtractFileDrive(IvFile);
end;
  {$ENDREGION}

  {$REGION 'TPerRec'}
function  TPerRec.Info(IvSurnameName: boolean): string;
begin
  if IvSurnameName then
    Result := Format('%s %s', [Surname, Name])
  else
    Result := Format('%s %s', [Name, Surname]);
end;

procedure TPerRec.Reset;
begin
  // master
  if IvResetObjAlso then
    Obj.Reset;

  // detail
  ObjectId       := 0 ;
  Person         := '';
  Name           := '';
  Surname        := '';
  Phone          := '';
  Email          := '';
  PictureGraphic := nil;

  // derived
  // ...
end;

function  TPerRec.InitDba(IvPerson: string; var IvFbk: string): boolean;
var
  sql: string;
  dst: TDataset;
begin
  sql := Format('select top(1) * from DbaPerson.dbo.TblPerson where FldPerson = ''%s''', [IvPerson]);
  TDbaRec.DsFromSql(sql, dst);
  try
    // notdefined
    Result := not dst.IsEmpty;
    if not Result then begin
      Reset;
      IvFbk := Format('Unable to load PerRec, %s does not exist in database', [IvPerson]);

    // defined
    end else begin;
      // master
      Obj.InitDba('Person', dst.FieldByName('FldObjectId').AsInteger);

      // detail
      ObjectId       := dst.FieldByName('FldObjectId'    ).AsInteger;
      Person         := dst.FieldByName('FldPerson'      ).AsString;
      Name           := dst.FieldByName('FldName'        ).AsString;
      Surname        := dst.FieldByName('FldSurname'     ).AsString;
      Phone          := dst.FieldByName('FldPhone'       ).AsString;
      Email          := dst.FieldByName('FldEmail'       ).AsString;
      TGraRec.FromBlobField(PictureGraphic, TBlobField(dst.FieldByName('FldPicture')));

      // derived
      // ...

      IvFbk := Format('PerRec loaded from database with %s data', [IvPerson]);
    end;
  finally
    dst.Free;
  end;
end;

function  TPerRec.InitRio(IvPerson: string; var IvFbk: string): boolean;
var
  rem: TPerRem;
begin
  Reset;

  rem := TPerRem.Create;
  try
    Result := (grio.HttpRio as ISystemSoapMainService).SystemPersonInitSoap(IvPerson, rem, IvFbk);
    if Result then begin
      // master
      Obj.RecFromRem(rem.ObjRem);

      // detail
      ObjectId := rem.ObjectId;
      Person   := rem.Person  ;
      Name     := rem.Name    ;
      Phone    := rem.Phone   ;
      Email    := rem.Email   ;
      Surname  := rem.Surname ;
      TGraRec.FromByteArray(PictureGraphic, rem.PictureBytes);
    end;
  finally
  {$IF COMPILERVERSION < 32.0}
    rem.ObjRem.Free;
  {$ELSE}
    FreeAndNil(rem.ObjRem);
  {$ENDIF}
    FreeAndNil(rem);
  end;
end;

procedure TPerRec.Free;
begin
  Obj.Free;
  if Assigned(PictureGraphic) then
    PictureGraphic.Free;
end;

function  TPerRec.NameCompact: string;
var
  nav: TArray<string>;
  i: integer;
begin
  nav := TArray<string>(SplitString(Name, ' '));

  Result := '';
  for i := 0 to High(nav) do
    if i = 0 then
      Result := nav[0] + ' '
    else
      Result := Result + Format('%s.', [LeftStr(nav[i], 1)]);
end;

function  TPerRec.SurnameNameSafe: string;
begin
  Result := TStrRec.StrSafe(Surname) + TStrRec.StrSafe(Name);
end;

function  TPerRec.FileSpecWithTags(IvTagVec: TArray<string>; IvExt: string): string;
var
  tai: string; // tail
begin
  tai := TStrRec.StrConcat(IvTagVec, '_');
  if not tai.IsEmpty then
    tai := '_' + tai;

  Result := HomePath + Format('\%s%s.%s', [SurnameNameSafe, tai, IvExt]);                                 // C:\$Per\I\IarussiFedericoCarloBrian\IarussiFedericoCarloBrian_Tag0_Tag1_[...].ext
end;

function  TPerRec.HomePath: string;
begin
  Result := Format('C:\$Per\%s\%s', [Surname[1].ToUpper, SurnameNameSafe]);                                     // C:\$Per\I\IarussiFedericoCarloBrian
end;

function  TPerRec.PictureFile: string;
begin
  Result := HomePath + Format('\%sPicture.png', [SurnameNameSafe]);                                             // C:\$Per\I\IarussiFedericoCarloBrian\IarussiFedericoCarloBrian_Picture.png
end;

function  TPerRec.HomeUrl(IvRelative: boolean): string;
begin
  Result := Format('%s/Person/%s/%s', [ifthen(IvRelative, '', gorg.Www), Surname[1].ToUpper, SurnameNameSafe]); // /Person/I/IarussiFedericoCarloBrian
end;

function  TPerRec.PictureUrl(IvRelative: boolean): string;
begin
  Result := HomeUrl(IvRelative) + Format('/%sPicture.png', [SurnameNameSafe]);                                  // /Person/I/IarussiFedericoCarloBrian/IarussiFedericoCarloBrian_Picture.png
end;
  {$ENDREGION}

  {$REGION 'TPgcRec'}
class function  TPgcRec.Subject(IvPageControl: TPageControl): string;
var
  pgc: TPageControl; // eventualsubpagectrl
  cap, sca: string; // caption, subcaption
begin
  // caption
  cap := Trim(IvPageControl.ActivePage.Caption);

  // subcaption
  pgc := FindNestedComponent(IvPageControl, cap + 'PageControl') as TPageControl;
  if Assigned(pgc) then
    sca := Trim(pgc.ActivePage.Caption)
  else
    sca := '';

  // subject
  if cap = sca then // Request+Request = Request
    Result := cap
  else
    Result := cap + sca;
end;

class procedure TPgcRec.PagesShow(IvPageControl: TPageControl; IvShow: boolean; IvPageActive: TTabSheet);
var
  i: integer;
begin
  // showorhideall
  for i := 0 to IvPageControl.PageCount - 1 do
    IvPageControl.Pages[i].TabVisible := IvShow;

  // stillshowone
  IvPageControl.ActivePage := IvPageActive;
  if not IvShow then
    IvPageControl.Height := IvPageControl.Height - 18
  else
    IvPageControl.Height := IvPageControl.Height + 18;
end;

class procedure TPgcRec.PagePrev(IvPageControl: TPageControl);
begin
  if IvPageControl.ActivePageIndex > 0 then
    IvPageControl.SelectNextPage(false, false);
end;

class procedure TPgcRec.PageNext(IvPageControl: TPageControl);
begin
  if IvPageControl.ActivePageIndex < IvPageControl.PageCount-1 then
    IvPageControl.SelectNextPage(true, false);
end;
  {$ENDREGION}

  {$REGION 'TPicRec'}
class function  TPicRec.PicGraphicClassDetectFromStream(IvStream: TStream): TGraphicClass;
var
  buf: array[0..7] of byte; // buffer
  opo: Int64; // originalposition
begin
  // default
  Result := nil;

  // originalstreamposition
  opo := IvStream.Position;

  // determinegraphictypebyexaminingfirstfewbytes
  try
    // readfirst8bytes
    IvStream.ReadBuffer(buf, SizeOf(buf));
    IvStream.Position := opo; // restore the original position

    // checkforPNGformat
    if (buf[0] = $89) and (buf[1] = $50) and (buf[2] = $4E) and (buf[3] = $47) and (buf[4] = $0D) and (buf[5] = $0A) and (buf[6] = $1A) and (buf[7] = $0A) then begin
      Result := TPNGImage;

    // checkforJPEGformat
    end else if (buf[0] = $FF) and (buf[1] = $D8) then begin
      Result := TJPEGImage;

    // checkforBMPformat
    end else if (buf[0] = $42) and (buf[1] = $4D) then begin
      Result := TBitmap;
    end;
  except
    on e: Exception do
      raise Exception.Create('Unable to detect graphic format from a stream: ' + e.Message);
  end;
end;

class procedure TPicRec.PicToStream(IvPicture: TPicture; var IvStream: TStream);
begin
  if Assigned(IvPicture) and Assigned(IvPicture.Graphic) and Assigned(IvStream) then begin
    {$IF COMPILERVERSION < 32.0}
         if IvPicture.Graphic is TBitmap    then TBitmap(IvPicture.Graphic).SaveToStream(IvStream)
    else if IvPicture.Graphic is TJPEGImage then TJPEGImage(IvPicture.Graphic).SaveToStream(IvStream)
    else if IvPicture.Graphic is TPNGImage  then TPNGImage(IvPicture.Graphic).SaveToStream(IvStream)
    else begin
      raise Exception.Create('Unable to save into a stream, unsupported graphic format');
    end
    {$ELSE}
    IvPicture.SaveToStream(IvStream);
    {$ENDIF}
//  end else begin
//    raise Exception.Create('Unable to save into a stream, no graphic available');
  end;
end;

class procedure TPicRec.PicFromStream(var IvPicture: TPicture; const IvStream: TStream);
{$IF COMPILERVERSION < 32.0}
var
  gcl: TGraphicClass;
  gra: TGraphic;
{$ENDIF}
begin
  if Assigned(IvPicture) {and Assigned(IvPicture.Graphic)} and Assigned(IvStream) then begin
    IvStream.Position := 0;
    {$IF COMPILERVERSION < 32.0}
    // determinethegraphicclass
    gcl := PicGraphicClassDetectFromStream(IvStream);
    if Assigned(gcl) then begin
      gra := gcl.Create;
      try
        gra.LoadFromStream(IvStream);
        IvPicture.Graphic := gra;
      except
        gra.Free;
        raise;
      end;
    end else begin
      raise Exception.Create('Unable to load IvPicture from IvStream, unsupported graphic format');
    end;
    {$ELSE}
    IvPicture.LoadFromStream(IvStream);
    {$ENDIF}
//  end else begin
//    raise Exception.Create('Unable to load IvPicture from IvStream, no picture, graphic or stream available');
  end;
end;

class function  TPicRec.PicFromByteArray(const IvByteArray: TByteDynArray): TPicture;
var
  m: TMemoryStream;
  p: pointer;
begin
  // create
  Result := TPicture.Create;

  // exit
  if Length(IvByteArray) = 0 then
    Exit;

  // load
  m := TMemoryStream.Create;
  try
    p := @IvByteArray[0];
    m.Write(p^, Length(IvByteArray));
    m.Position := 0;
    Result.Graphic.LoadFromStream(m);
  finally
    m.Free;
  end;
end;

class procedure TPicRec.PicFromGraphic(IvPicture: TPicture; IvGraphic: TGraphic; IvSize: integer);
var
  mes: TMemoryStream;
  ida: TImageData;
  {$IF CompilerVersion < 32.0}png: TPngImage;{$IFEND}
begin
  if not Assigned(IvGraphic) then
    Exit;
  mes := TMemoryStream.Create;
  InitImage(ida);
  try
    try
      IvGraphic.SaveToStream(mes);
      mes.Position := 0;
      if not Imaging.LoadImageFromStream(mes, ida) then
        Exit;
      if not Imaging.ResizeImage(ida, IvSize, IvSize, rfBicubic) then
        Exit;
      mes.Clear;
    //Imaging.SaveImageToFile('C:\Temp\1.png', ida);
      if not Imaging.SaveImageToStream('png', mes, ida) then // without dot! if logographic has transparency with png it will be preserved
        Exit;
      mes.Position := 0;
      {$IF CompilerVersion < 32.0}
      png := TPngImage.Create;
      try
        png.LoadFromStream(mes);
        IvPicture.Graphic := png;
      finally
        png.Free;
      end;
      {$ELSE}
      IvPicture.LoadFromStream(mes);
      {$IFEND}
    //IvPicture.SaveToFile('.\ImagePictureFromGraphic.png')
    except
      on e: Exception do begin
        glog.Log(e, 'ImagePictureFromGraphic');
      //raise;
      end;
    end;
  finally
    FreeImage(ida);
    FreeAndNil(mes);
  end;
end;

class procedure TPicRec.PicFromUrl(IvUrl: string; var IvPicture: TPicture);
var
  ext: string;
  mes: TMemoryStream;
  htt: TIdHTTP;
  gif: TGIFImage;
  jpg: TJPEGImage;
  png: TPNGImage;
begin
  ext := ExtractFileExt(IvUrl);
  mes := TMemoryStream.Create;
  htt := TIdHTTP.Create(nil);
  try
//    h.ProxyParams.ProxyServer   := '10.176.64.206';
//    h.ProxyParams.ProxyPort     := 8080;
//    h.ProxyParams.ProxyUsername := 'giarussi';
//    h.ProxyParams.ProxyPassword := 'Dd00Ee11Ff';
    htt.get(IvUrl, mes);
    mes.Seek(0, soFromBeginning);
    if          ext = '.gif' then begin
      gif := TGIFImage.Create;
      try
        gif.LoadFromStream(mes);
        IvPicture.Assign(gif);
      finally
        FreeAndNil(gif);
      end;
    end else if ext = '.jpg' then begin
      jpg := TJPEGImage.Create;
      try
      //mes.SaveToFile('c:\temp\0.jpg');
        jpg.LoadFromStream(mes);
        IvPicture.Assign(jpg);
      //jpg.SaveToFile('c:\temp\1.jpg');
      finally
        FreeAndNil(jpg);
      end;
    end else if ext = '.png' then begin
      png := TPNGImage.Create;
      try
        png.LoadFromStream(mes);
        IvPicture.Assign(png);
      finally
        FreeAndNil(png);
      end;
    end else begin
      glog.Log('Unknown image type');
    //raise Exception.Create('Unknown image type');  // see registerclass(...)  in the initialization section
    end;
  finally
    FreeAndNil(htt);
    FreeAndNil(mes);
  end;
end;
  {$ENDREGION}

  {$REGION 'TPngRec'}
class function TPngRec.PngFromBmp(const IvBmp: TBitmap): TPngImage;
begin
  try
    Result := TPngImage.Create;
    try
      Result.Assign(IvBmp);
    //Result.SaveToFile('image.png');
    finally
    //Result.Free; *** consumer will free ***
    end;
  finally
    IvBmp.Free;
  end;
end;

class function TPngRec.PngFromByteArray(const IvByteArray: TByteDynArray): TPngImage;
var
  m: TMemoryStream;
  p: pointer;
begin
  // create
  Result := TPngImage.Create;

  // exit
  if Length(IvByteArray) = 0 then
    Exit;

  // load
  m := TMemoryStream.Create;
  try
    p := @IvByteArray[0];
    m.Write(p^, Length(IvByteArray));
    m.Position := 0;
    Result.LoadFromStream(m);
  finally
    m.Free;
  end;
end;
  {$ENDREGION}

  {$REGION 'TPwdRec'}
class function TPwdRec.PwdRnd: string; // word + specialchar + 3numbers
begin
  Result := TWorRec.WordDbaSelectRnd + TChaRec.CharSpecialRnd + IntToStr(RandomRange(100, 999));
end;
  {$ENDREGION}

  {$REGION 'TPxyRec'}
function  TPxyRec.AddressAndPort: string;
begin
  Result := Format('%s:%s', [UrlOrAddress, Port]);
end;

function  TPxyRec.ProxyGetViaRegistry(var IvProxy: string; var IvProxyUse: boolean; var IvFbk: string; IvProtocol: string): boolean;
const
  REGISTRY_KEY =                   'SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings';
//REGISTRY_KEY = 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings';
var
  han: HKey;                  // handle
  buf: array[0..256] of char; // buffer
  buz: integer;               // buffersize
  dty: integer;               // datatype
  idw: dword;                 // ???
begin
  try
    if not (RegOpenKeyEx(HKEY_CURRENT_USER, REGISTRY_KEY, 0, KEY_READ, han) = ERROR_SUCCESS) then begin
      IvProxy := '';
      IvProxyUse := false;
    end else begin
      buz := SizeOf(buf);

      // proxy
      dty := reg_sz;
      if RegQueryValueEx(han, 'ProxyServer', nil, @dty, @buf, @buz) = ERROR_SUCCESS then begin
        IvProxy := buf;
        // now if proxy used, IvProxy is like this: 'ftp=proxy.domain.com:8082;gopher=proxy.domain.com:8083;http=proxy.domain.com:8080;https=proxy.domain.com:8081'
        // where domain.com is our proxy, depending from protocol (ftp/http/htt) we need, we now have to parse that string to get the correct proxy server and port
        IvProxy := TDicRec.DicValueFromKeyFromKeyValueCsv(IvProtocol, IvProxy, '', ';');
      end;

      // enabled
      buz := SizeOf(integer);
      if RegQueryValueEx(han, 'ProxyEnable', nil, @dty, @idw, @buz) = ERROR_SUCCESS then
        IvProxyUse := (idw <> 0);
    end;
  finally
    RegCloseKey(han);
  end;

  // fbk
  IvFbk := Format('Proxy %s %s enabled (from registry)', [IvProxy, ifthen(IvProxyUse, 'is', 'is not')]).Replace('  ', ' ', [rfReplaceAll]);
  Result := true;
end;

function  TPxyRec.ProxyGetViaWinInet(var IvProxy: string; var IvProxyUse: boolean; var IvFbk: string; IvProtocol: string): boolean;
var
  pxi: PInternetProxyInfo;
  len: longword;
begin
  len := 4096;
  GetMem(pxi, len);
  try
    if not InternetQueryOption(nil, INTERNET_OPTION_PROXY, pxi, len) then begin
      IvProxy    := '';
      IvProxyUse := false;
    end else begin
      if not (pxi^.dwAccessType = INTERNET_OPEN_TYPE_PROXY) then begin
        IvProxy    := '';
        IvProxyUse := false;
      end else begin
        IvProxy    := string(pxi^.lpszProxy);
        IvProxyUse := true;
        // now if proxy used, IvProxy is like this: 'ftp=proxy.domain.com:8082;gopher=proxy.domain.com:8083;http=proxy.domain.com:8080;https=proxy.domain.com:8081'
        // where domain.com is our proxy, depending from protocol (ftp/http/htt) we need, we now have to parse that string to get the correct proxy server and port
        IvProxy := TDicRec.DicValueFromKeyFromKeyValueCsv(IvProtocol, IvProxy, '', ';');
      end;
    end;
  finally
    FreeMem(pxi);
  end;

  // fbk
  IvFbk := Format('Proxy %s %s enabled (from wininet)', [IvProxy, ifthen(IvProxyUse, 'is', 'is not')]).Replace('  ', ' ', [rfReplaceAll]);
  Result := true;
end;
  {$ENDREGION}

  {$REGION 'TReportRec'}
procedure TReportEdiRec.LoadFrom(IvEditable: boolean; IvSelect, IvInsert, IvUpdate, IvDelete, IvJson: string);
//var
//  l: TStringList;
begin
  // new
  Editable := IvEditable;
  Select   := IvSelect  ;
  Insert   := IvInsert  ;
  Update   := IvUpdate  ;
  Delete   := IvDelete  ;
//EditIni  := IvEditIni ; // old to remove
  Json     := IvJson    ; // new substitute

  // exit
//  if Trim(IvEditIni) = '' then
//    Exit;

  // legacy
  {
  l := TStringList.Create;
  try
    l.Text := EditIni;
    ReportId          := l.Values['EditReportId'].ToInteger;      // ReportId=49
    DatasetName       := l.Values['EditDatasetName'];             // DatasetName=Main
    InsertIfNotExists := l.Values['InsertIfNotExists'].ToBoolean; // InsertIfNotExists=true
    Table             := l.Values['EditTable'];                   // EditTable=DbaPerson.dbo.TblPerson
    KeyFieldList      := l.Values['EditKeyFieldList'];            // EditKeyFieldList=["FldId","FldOwner"]
    OwnerField        := l.Values['EditOwnerField'];              // EditOwnerField=
    OneWayField       := l.Values['EditOneWayField'];             // EditOneWayField=FldState
    OneWayRange       := l.Values['EditOneWayRange'];             // EditOneWayRange=["Active","Inactive"]
    FieldList         := l.Values['EditFieldList'];               // EditFieldList=["FldSurname","FldName","FldGender","FldNationality","FldLanguage","FldSsn","FldPhone","FldMobile","FldEmail"]
    ValueRange        := l.Values['EditValueRange'];              // EditValueRange=[]
    UpdatedField      := l.Values['EditUpdatedField'];            // EditUpdatedField=
    EnabledStateList  := l.Values['EditEnabledStateList'];        // EditEnabledStateList=["Active","OnHold"]
  finally
    l.Free;
  end;
  }
end;

function  TReportDataSetRec.EditInfoRec: TReportEdiRec;
begin
  Result.LoadFrom(Editable, Select, Insert, Update, Delete{, EditIni}, Json);
end;

function  TReportRec.ParamDbaSelect(var IvParamRecVector: TReportParamRecVector; IvReportId: integer; var IvFbk: string): boolean;
var
  rid, i: integer; // reportid
  sql: string;
  dst: TDataSet;
begin

  {$REGION 'zip'}
  rid := IvReportId;
  {$ENDREGION}

  {$REGION 'load'}
  sql := Format(   'select'
  + sLineBreak + '    *'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaReport.dbo.TblParam'
  + sLineBreak + 'where'
  + sLineBreak + '    FldState        = ''Active'''
  + sLineBreak + 'and FldObjectId     = %d'
  + sLineBreak + 'order by'
  + sLineBreak + '    FldOrder', [rid]);
  {Result :=} TDbaRec.DsFromSql(sql, dst, true);
  try
    // exit
    if dst.IsEmpty then begin
      IvFbk := TFbkRec.WFmt('No param data for report %d', [rid]);
      Result := true;
      Exit;
    end;

    // loop
    i := -1;
    while not dst.Eof do begin
      // morespace
      Inc(i);
      SetLength(IvParamRecVector, Length(IvParamRecVector)+1);

      // param
      IvParamRecVector[i].ReportId       := dst.FieldByName('FldObjectId'      ).AsInteger;  {  ReportId  key }
      IvParamRecVector[i].Order          := dst.FieldByName('FldOrder'         ).AsInteger;  {  Order         }
      IvParamRecVector[i].State          := dst.FieldByName('FldState'         ).AsString ;  {  State         }
      IvParamRecVector[i].Param          := dst.FieldByName('FldParam'         ).AsString ;  {  Param     key }
      IvParamRecVector[i].Default        := dst.FieldByName('FldDefault'       ).AsString ;  {  Default       }
      IvParamRecVector[i].Caption        := dst.FieldByName('FldCaption'       ).AsString ;  {  Caption       }
      IvParamRecVector[i].Placeholder    := dst.FieldByName('FldPlaceholder'   ).AsString ;  {  Placeholder   }
      IvParamRecVector[i].Description    := dst.FieldByName('FldDescription'   ).AsString ;  {  Description   }
      IvParamRecVector[i].Help           := dst.FieldByName('FldHelp'          ).AsString ;  {  Help          }
      IvParamRecVector[i].Kind           := dst.FieldByName('FldKind'          ).AsString ;  {  Kind          }
      IvParamRecVector[i].Hidden         := dst.FieldByName('FldHidden'        ).AsBoolean;  {  Hidden        }
      IvParamRecVector[i].Required       := dst.FieldByName('FldRequired'      ).AsBoolean;  {  Required      }
      IvParamRecVector[i].Disabled       := dst.FieldByName('FldDisabled'      ).AsBoolean;  {  Disabled      }
    //IvParamRecVector[i].LineGrid12     := dst.FieldByName('FldLineGrid12'    ).AsString ;  {  LineGrid12    }
      IvParamRecVector[i].OptionCsv      := dst.FieldByName('FldOptionCsv'     ).AsString ;  {  OptionCsv     }
      IvParamRecVector[i].OptionJson     := dst.FieldByName('FldOptionJson'    ).AsString ;  {  OptionJson    }
      IvParamRecVector[i].OptionQuery    := dst.FieldByName('FldOptionQuery'   ).AsString ;  {  OptionQuery   }
      IvParamRecVector[i].ConnStr        := dst.FieldByName('FldConnStr'       ).AsString ;  {  ConnStr       }
      IvParamRecVector[i].ConnLib        := dst.FieldByName('FldConnLib'       ).AsString ;  {  ConnLib       }
      IvParamRecVector[i].&Class         := dst.FieldByName('FldClass'         ).AsString ;  {  Classs        }
      IvParamRecVector[i].Style          := dst.FieldByName('FldStyle'         ).AsString ;  {  Style         }
    //IvParamRecVector[i].Format         := dst.FieldByName('FldFormat'        ).AsString ;  {  Format        }
    //IvParamRecVector[i].ReadOnly       := dst.FieldByName('FldReadOnly'      ).AsBoolean;  {  ReadOnly      }
    //IvParamRecVector[i].AjaxValidate   := dst.FieldByName('FldAjaxValidate'  ).AsString ;  {  AjaxValidate  }
    //IvParamRecVector[i].Switch         := dst.FieldByName('FldSwitch'        ).AsString ;  {//Switch        }
    //IvParamRecVector[i].ToOrganization := dst.FieldByName('FldToOrganization').AsString ;  {//ToOrganization}
    //IvParamRecVector[i].ToDepartment   := dst.FieldByName('FldToDepartment'  ).AsString ;  {//ToDepartment  }
    //IvParamRecVector[i].ToArea         := dst.FieldByName('FldToArea'        ).AsString ;  {//ToArea        }
    //IvParamRecVector[i].ToActivity     := dst.FieldByName('FldToActivity'    ).AsString ;  {//ToActivity    }
    //IvParamRecVector[i].ToTeam         := dst.FieldByName('FldToTeam'        ).AsString ;  {//ToTeam        }
    //IvParamRecVector[i].ToMember       := dst.FieldByName('FldToMember'      ).AsString ;  {//ToMember      }
      IvParamRecVector[i].Value          := ''                                            ;  {  Value         }

      // next
      dst.Next;
    end;

    // end
    IvFbk := Format('Selected %d param(s) for report %d', [dst.RecordCount, rid]);
    Result := true;
  finally
    dst.Free;
  end;
  {$ENDREGION}

end;

function  TReportRec.DatasetDbaSelect(var IvDatasetRecVector: TReportDataSetRecVector; IvReportId: integer; var IvFbk: string): boolean;
var
  rid, i: integer; // reportid
  sql: string;
  dst: TDataSet;
begin

  {$REGION 'zip'}
  rid := IvReportId;
  {$ENDREGION}

  {$REGION 'load'}
  sql := Format( ' select'
  + sLineBreak + '     *'
  + sLineBreak + ' from'
  + sLineBreak + '     DbaReport.dbo.TblDataset'
  + sLineBreak + ' where'
  + sLineBreak + '     FldState        = ''Active'''
  + sLineBreak + ' and FldObjectId     = %d'
  + sLineBreak + ' order by'
  + sLineBreak + '     FldOrder', [rid]);
  {Result :=} TDbaRec.DsFromSql(sql, dst, true);
  try
    // exit
    if dst.IsEmpty then begin
      IvFbk := TFbkRec.WFmt('No dataset data for report %d', [rid]);
      Result := true;
      Exit;
    end;

    // loop
    i := -1;
    while not dst.Eof do begin
      // morespace
      Inc(i);
      SetLength(IvDatasetRecVector, Length(IvDatasetRecVector)+1);

      // dataset
      IvDatasetRecVector[i].ReportId        := dst.FieldByName('FldObjectId'       ).AsInteger; // key
      IvDatasetRecVector[i].Order           := dst.FieldByName('FldOrder'          ).AsInteger;
      IvDatasetRecVector[i].State           := dst.FieldByName('FldState'          ).AsString ;
      IvDatasetRecVector[i].Dataset         := dst.FieldByName('FldDataset'        ).AsString ; // key
      IvDatasetRecVector[i].Title           := dst.FieldByName('FldTitle'          ).AsString ;
      IvDatasetRecVector[i].Description     := dst.FieldByName('FldDescription'    ).AsString ;
      IvDatasetRecVector[i].Mode            := dst.FieldByName('FldMode'           ).AsString ; // Horizontal/Vertical
      IvDatasetRecVector[i].ConnStr         := dst.FieldByName('FldConnStr'        ).AsString ;
      IvDatasetRecVector[i].ConnLib         := dst.FieldByName('FldConnLib'        ).AsString ;
    //IvDatasetRecVector[i].ParamStr        := dst.FieldByName('FldParamStr'       ).AsString ;
    //IvDatasetRecVector[i].DefaultStr      := dst.FieldByName('FldDefaultStr'     ).AsString ;
      IvDatasetRecVector[i].Language        := dst.FieldByName('FldLanguage'       ).AsString ;
      IvDatasetRecVector[i].MaxRecords      := dst.FieldByName('FldMaxRecords'     ).AsInteger;
    //IvDatasetRecVector[i].MaxRecordsCsv   := dst.FieldByName('FldMaxRecordsCsv'  ).AsString ;
      IvDatasetRecVector[i].Select          := dst.FieldByName('FldSelect'         ).AsString ;
      IvDatasetRecVector[i].SelectDev       := dst.FieldByName('FldSelectDev'      ).AsString ;
      IvDatasetRecVector[i].SelectBak       := dst.FieldByName('FldSelectBak'      ).AsString ;
      IvDatasetRecVector[i].Insert          := dst.FieldByName('FldInsert'         ).AsString ;
      IvDatasetRecVector[i].Update          := dst.FieldByName('FldUpdate'         ).AsString ;
      IvDatasetRecVector[i].Delete          := dst.FieldByName('FldDelete'         ).AsString ;
      IvDatasetRecVector[i].ViewerCsv       := dst.FieldByName('FldViewerCsv'      ).AsString ;
      IvDatasetRecVector[i].Editable        := dst.FieldByName('FldEditable'       ).AsBoolean;
      IvDatasetRecVector[i].EditorCsv       := dst.FieldByName('FldEditorCsv'      ).AsString ;
      IvDatasetRecVector[i].EditIni         := dst.FieldByName('FldEditIni'        ).AsString ;
      IvDatasetRecVector[i].Json            := dst.FieldByName('FldJson'           ).AsString ;
      IvDatasetRecVector[i].Switch          := dst.FieldByName('FldSwitch'         ).AsString ;
      IvDatasetRecVector[i].Classs          := dst.FieldByName('FldClass'          ).AsString.Replace(',', '');
      IvDatasetRecVector[i].Style           := dst.FieldByName('FldStyle'          ).AsString.Replace(',', ';');
      IvDatasetRecVector[i].TitleOn         := dst.FieldByName('FldTitleOn'        ).AsBoolean;
      IvDatasetRecVector[i].PanelOn         := dst.FieldByName('FldPanelOn'        ).AsBoolean;
      IvDatasetRecVector[i].PanelClosed     := dst.FieldByName('FldPanelClosed'    ).AsBoolean;
      IvDatasetRecVector[i].TimeoutSec      := dst.FieldByName('FldTimeoutSec'     ).AsInteger;
      IvDatasetRecVector[i].FeedbackIfEmpty := dst.FieldByName('FldFeedbackIfEmpty').AsString ;

      // charts
      {Result :=} ChartDbaSelect(IvDatasetRecVector[i].ChartRecVector, rid, IvDatasetRecVector[i].Dataset, IvFbk);

      // next
      dst.Next;
    end;

    // end
    IvFbk := Format('Selected %d dataset(s) for report %d', [dst.RecordCount, rid]);
    Result := true;
  finally
    dst.Free;
  end;
  {$ENDREGION}

end;

function  TReportRec.ChartDbaSelect(var IvChartRecVector: TChartRecVector; IvReportId: integer; IvDatasetName: string; var IvFbk: string): boolean;
var
  rid, i: integer;  // reportid
  sql, dsn: string; // datasetname
  dst: TDataSet;
begin

  {$REGION 'zip'}
  rid := IvReportId;

  dsn := IvDatasetName;
  Result := not dsn.IsEmpty;
  if not Result then begin
    IvFbk := TFbkRec.W('DatasetName is empty');
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'load'}
  sql := Format(   ' select'
  + sLineBreak + '     *'
  + sLineBreak + ' from'
  + sLineBreak + '     DbaReport.dbo.TblChart'
  + sLineBreak + ' where'
  + sLineBreak + '     FldState        = ''Active'''
  + sLineBreak + ' and FldObjectId     = %d'
  + sLineBreak + ' and FldDataset      = ''%s'''
  + sLineBreak + ' order by'
  + sLineBreak + '     FldOrder', [rid, dsn]);
  {Result :=} TDbaRec.DsFromSql(sql, dst, true);
  try
    // exit
    if dst.IsEmpty then begin
      IvFbk := TFbkRec.WFmt('No chart data for report %d and dataset %s', [rid, dsn]);
      Result := true;
      Exit;
    end;

    // loop
    i := -1;
    while not dst.Eof do begin
      // morespace
      Inc(i);
      SetLength(IvChartRecVector, Length(IvChartRecVector)+1);

      // chart
      IvChartRecVector[i].ReportId                   := dst.FieldByName('FldObjectId'      ).AsVariant; // key
      IvChartRecVector[i].Order                      := dst.FieldByName('FldOrder'         ).AsVariant;
      IvChartRecVector[i].State                      := dst.FieldByName('FldState'         ).AsVariant;
      IvChartRecVector[i].Dataset                    := dst.FieldByName('FldDataset'       ).AsVariant; // key
      IvChartRecVector[i].Chart                      := dst.FieldByName('FldChart'         ).AsVariant; // key
      IvChartRecVector[i].Title                      := dst.FieldByName('FldTitle'         ).AsVariant;
      IvChartRecVector[i].Subtitle                   := dst.FieldByName('FldSubtitle'      ).AsVariant;
      IvChartRecVector[i].Description                := dst.FieldByName('FldDescription'   ).AsVariant;
      IvChartRecVector[i].Width                      := dst.FieldByName('FldWidth'         ).AsVariant;
      IvChartRecVector[i].Height                     := dst.FieldByName('FldHeight'        ).AsVariant;
      IvChartRecVector[i].TitleOn                    := dst.FieldByName('FldTitleOn'       ).AsVariant;
      IvChartRecVector[i].PanelOn                    := dst.FieldByName('FldPanelOn'       ).AsVariant;
      IvChartRecVector[i].PanelClosed                := dst.FieldByName('FldPanelClosed'   ).AsVariant;
      IvChartRecVector[i].XAxisRec.TitleRec.Caption  := dst.FieldByName('FldXCaption'      ).AsVariant;
      IvChartRecVector[i].YAxisRec.TitleRec.Caption  := dst.FieldByName('FldYCaption'      ).AsVariant;
      IvChartRecVector[i].XAxisRec.LabelRec.AngleDeg := dst.FieldByName('FldXLabelAngleDeg').AsVariant;
      IvChartRecVector[i].YAxisRec.LabelRec.AngleDeg := dst.FieldByName('FldYLabelAngleDeg').AsVariant;

      // series
      {Result :=} SerieDbaSelect(IvChartRecVector[i].SerieRecVector, rid, IvChartRecVector[i].Dataset, IvChartRecVector[i].Chart, IvFbk);

      // next
      dst.Next;
    end;

    // end
    IvFbk := Format('Selected %d chart(s) for report %d and dataset %s', [dst.RecordCount, rid, dsn]);
    Result := true;
  finally
    dst.Free;
  end;
  {$ENDREGION}

end;

function  TReportRec.SerieDbaSelect(var IvSerieRecVector: TChartSerieRecVector; IvReportId: integer; IvDatasetName, IvChartName: string; var IvFbk: string): boolean;
var
  rid, i: integer;       // reportid
  sql, dsn, chn: string; // datasetname, chartname
  dst: TDataSet;
begin

  {$REGION 'zip'}
  rid := IvReportId;

  dsn := IvDatasetName;
  Result := not dsn.IsEmpty;
  if not Result then begin
    IvFbk := TFbkRec.W('DatasetName is empty');
    Exit;
  end;

  chn := IvChartName;
  Result := not chn.IsEmpty;
  if not Result then begin
    IvFbk := TFbkRec.W('ChartName is empty');
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'load'}
  sql := Format(  ' select'
  + sLineBreak + '     *'
  + sLineBreak + ' from'
  + sLineBreak + '     DbaReport.dbo.TblSerie'
  + sLineBreak + ' where'
  + sLineBreak + '     FldState        = ''Active'''
  + sLineBreak + ' and FldObjectId     = %d'
  + sLineBreak + ' and FldDataset      = ''%s'''
  + sLineBreak + ' and FldChart        = ''%s'''
  + sLineBreak + ' order by'
  + sLineBreak + '     FldOrder', [rid, dsn, chn]);
  {Result :=} TDbaRec.DsFromSql(sql, dst, true);
  try
    // exit
    if dst.IsEmpty then begin
      IvFbk := TFbkRec.WFmt('No serie data for report %d, dataset %s and chart %s', [rid, dsn, chn]);
      Result := true;
      Exit;
    end;

    // loop
    i := -1;
    while not dst.Eof do begin
      // morespace
      Inc(i);
      SetLength(IvSerieRecVector, Length(IvSerieRecVector)+1);

      // serie
      IvSerieRecVector[i].ReportId      := dst.FieldByName('FldObjectId'     ).AsVariant; // key
      IvSerieRecVector[i].Order         := dst.FieldByName('FldOrder'        ).AsVariant;
      IvSerieRecVector[i].State         := dst.FieldByName('FldState'        ).AsVariant;
      IvSerieRecVector[i].Dataset       := dst.FieldByName('FldDataset'      ).AsVariant; // key
      IvSerieRecVector[i].Chart         := dst.FieldByName('FldChart'        ).AsVariant; // key
      IvSerieRecVector[i].Serie         := dst.FieldByName('FldSerie'        ).AsVariant; // key
      IvSerieRecVector[i].Kind          := dst.FieldByName('FldKind'         ).AsVariant;
      IvSerieRecVector[i].Title         := dst.FieldByName('FldTitle'        ).AsVariant;
      IvSerieRecVector[i].Legend        := dst.FieldByName('FldLegend'       ).AsVariant;
      IvSerieRecVector[i].LegendOn      := dst.FieldByName('FldLegendOn'     ).AsVariant;
      IvSerieRecVector[i].ToolTip       := dst.FieldByName('FldToolTip'      ).AsVariant;
      IvSerieRecVector[i].ToolTipShared := dst.FieldByName('FldToolTipShared').AsBoolean;
      IvSerieRecVector[i].XLabelField   := dst.FieldByName('FldXLabelField'  ).AsVariant;
      IvSerieRecVector[i].XField        := dst.FieldByName('FldXField'       ).AsVariant;
      IvSerieRecVector[i].YField        := dst.FieldByName('FldYField'       ).AsVariant;
      IvSerieRecVector[i].ZField        := dst.FieldByName('FldZField'       ).AsVariant;
      IvSerieRecVector[i].ToolTipField  := dst.FieldByName('FldToolTipField' ).AsVariant;
      IvSerieRecVector[i].ColorField    := dst.FieldByName('FldColorField'   ).AsVariant;
      IvSerieRecVector[i].SizeField     := dst.FieldByName('FldSizeField'    ).AsVariant;
      IvSerieRecVector[i].ShapeField    := dst.FieldByName('FldShapeField'   ).AsVariant;

      // next
      dst.Next;
    end;

    // end
    IvFbk := Format('Selected %d serie(s) for report %d, dataset %s and chart %s', [dst.RecordCount, rid, dsn, chn]);
    Result := true;
  finally
    dst.Free;
  end;
  {$ENDREGION}

end;

function  TReportRec.DbaSelect(var IvFbk: string): boolean;
var
  sql: string;
  dst: TDataSet;
begin
  sql := Format('select top(1) * from DbaReport.dbo.TblReport where FldObjectId = %d', [Obj.Id]);
  Result := TDbaRec.DsFromSql(sql, dst, true);
  try
    // notdefined
    if not Result then begin
    //Reset;
      IvFbk := Format('Unable to load ReportRec, report %d does not exist in database', [Obj.Id]);

    // defined
    end else begin;
      // master
      Obj.InitDba('Report', dst.FieldByName('FldObjectId').AsInteger); // = Obj.Id

      // detail
      ObjectId          := dst.FieldByName('FldObjectId'         ).AsInteger;
      Export            := dst.FieldByName('FldExport'           ).AsString ;
      Source            := dst.FieldByName('FldSource'           ).AsString ;
      Store             := dst.FieldByName('FldStore'            ).AsString ;
      Environment       := dst.FieldByName('FldEnvironment'      ).AsString ;
      ValidatorCsv      := dst.FieldByName('FldValidatorCsv'     ).AsString ;
      ReportTitleOn     := dst.FieldByName('FldReportTitleOn'    ).AsBoolean;
      ReportPanelOn     := dst.FieldByName('FldReportPanelOn'    ).AsBoolean;
      ReportPanelClosed := dst.FieldByName('FldReportPanelClosed').AsBoolean;
      ParamsTitleOn     := dst.FieldByName('FldParamsTitleOn'    ).AsBoolean;
      ParamsPanelOn     := dst.FieldByName('FldParamsPanelOn'    ).AsBoolean;
      ParamsPanelClosed := dst.FieldByName('FldParamsPanelClosed').AsBoolean;
      DsHeaderOff       := dst.FieldByName('FldDsHeaderOff'      ).AsBoolean;
      DsRecordCountOff  := dst.FieldByName('FldDsRecordCountOff' ).AsBoolean;
      Link              := dst.FieldByName('FldLink'             ).AsString ;
      Header            := dst.FieldByName('FldHeader'           ).AsString ;
      Footer            := dst.FieldByName('FldFooter'           ).AsString ;
      Code              := dst.FieldByName('FldCode'             ).AsString ;
      CodeState         := dst.FieldByName('FldCodeState'        ).AsString ;
      CodeKind          := dst.FieldByName('FldCodeKind'         ).AsString ;
      Alias             := dst.FieldByName('FldAlias'            ).AsString ;
      Classs            := dst.FieldByName('FldClass'            ).AsString ;
      Style             := dst.FieldByName('FldStyle'            ).AsString ;
      Layout            := dst.FieldByName('FldLayout'           ).AsString ;

      // derived
      // ...

      // params
      {Result :=} ParamDbaSelect(ParamRecVector, Obj.Id, IvFbk);

      // datasets
      {Result :=} DatasetDbaSelect(DatasetRecVector, Obj.Id, IvFbk);

      IvFbk := Format('ReportRec %d loaded from database', [Obj.Id]);
    end;
  finally
    dst.Free;
  end;
end;
  {$ENDREGION}

  {$REGION 'TResRec'}
  // no methods for now
  {$ENDREGION}

  {$REGION 'TRexRec'}
function  TRexRec.RexHas(IvStr, IvPattern: string; IvOpt: TRegExOptions): boolean;
var
  rex: TRegEx;
  mat: TMatch;
begin
  try
    rex := TRegEx.Create(IvPattern, IvOpt);
  //Result := rex.IsMatch(IvStr);
    mat := rex.Match(IvStr);
    Result := mat.Success;
  except
    on e: ERegularExpressionError do begin
    //Result := false;
      raise e;
    end;
  end;
end;  

procedure TRexRec.RexReplace(var IvStr: string; IvReOut, IvStrIn: string; IvOpt: TRegExOptions; IvCount: integer);

  {$REGION 'var'}
var
  rex: TRegEx;
  mat: TMatch;

//macro
  procedure MatchProcess(var IvMatch: TMatch; var IvZ: integer);
  begin
    // replace-SINGLE
    IvStr := StringReplace(IvStr, IvMatch.Value, IvStrIn, []); // rfReplaceAll  // *** WARNING non rimpiazza usando rex! ***
  //IvStr := rex.Replace(IvStr, IvReOut, IvStrIn);                              // per esempio, se in 'style="aaa bbb"'
                                                                                // bisogna rimpiazzare l'ultima '"' con ' ccc"'
    // nextrecursive-ALL                                                        // in realta' rimpiazza la prima, ottienendo 'style= ccc"aaa bbb"'
    if IvZ = -1 then begin                                                      // invece di 'style="aaa bbb ccc"'
      IvMatch := IvMatch.NextMatch;
      if IvMatch.Success then
        MatchProcess(IvMatch, IvZ);

    // nextrecursive-COUNTING
    end else begin
      Dec(IvZ);
      if IvZ > 0 then begin
        IvMatch := IvMatch.NextMatch;
        if IvMatch.Success then
          MatchProcess(IvMatch, IvZ);
      end;
    end;
  end;
  {$ENDREGION}

begin
  // 0 = donothing
  if IvCount = 0 then
    Exit;

  // -1= replaceall; >1 = replacecounting
  try
    rex := TRegEx.Create(IvReOut, IvOpt);
    mat := rex.Match(IvStr);
    if mat.Success then
      MatchProcess(mat, IvCount);
  except
    raise Exception.Create('Error in rex.Replace() routine');
  end;
end;
  {$ENDREGION}

  {$REGION 'TRicRec'}
class procedure TRicRec.RowCol(IvRichEdit: TRichEdit; var IvRow, IvCol: integer);
begin
  IvRow := SendMessage(IvRichEdit.Handle, EM_EXLINEFROMCHAR, 0, IvRichEdit.SelStart);
  IvCol := (IvRichEdit.SelStart - SendMessage(IvRichEdit.Handle, EM_LINEINDEX, IvRow, 0));
end;

class procedure TRicRec.TextAdd(IvRichEdit: TRichEdit; IvString: string; IvColorFg,
  IvColorBg: TColor; IvAlign: TAlignment; IvSize: integer; IvBold, IvUnderline,
  IvItalic, IvStrikeOut: boolean);
var
  cha: TCharFormat2;
begin
  // bg
  if IvColorBg <> clWindow then begin
    FillChar(cha, sizeof(cha), 0);
    cha.cbSize := sizeof(cha);
    cha.dwMask := CFM_BACKCOLOR;
    cha.crBackColor := ColorToRGB(IvColorBg);
    IvRichEdit.Perform(EM_SETCHARFORMAT, SCF_SELECTION, lparam(@cha));
  end;

  // fg
  IvRichEdit.SelAttributes.Color := IvColorFg;

  // align
  IvRichEdit.Paragraph.Alignment := IvAlign;

  // size
  IvRichEdit.SelAttributes.Size  := IvSize;

  // style
  IvRichEdit.SelAttributes.Style := [];
  if IvBold      then IvRichEdit.SelAttributes.Style := IvRichEdit.SelAttributes.Style + [fsBold];
  if IvUnderline then IvRichEdit.SelAttributes.Style := IvRichEdit.SelAttributes.Style + [fsUnderline];
  if IvItalic    then IvRichEdit.SelAttributes.Style := IvRichEdit.SelAttributes.Style + [fsItalic];
  if IvStrikeOut then IvRichEdit.SelAttributes.Style := IvRichEdit.SelAttributes.Style + [fsStrikeOut];

  // scrolldown
  SendMessage(IvRichEdit.Handle, EM_LINESCROLL, 0, 1);

  // add
  IvRichEdit.SelText := IvString;
end;

class procedure TRicRec.RowAdd(IvRichEdit: TRichEdit; IvString: string; IvColorFg,
  IvColorBg: TColor; IvAlign: TAlignment; IvSize: integer; IvBold, IvUnderline,
  IvItalic, IvStrikeOut: boolean);
begin
  TextAdd(IvRichEdit, IvString + sLineBreak, IvColorFg, IvColorBg, IvAlign, IvSize, IvBold, IvUnderline, IvItalic, IvStrikeOut);
end;
  {$ENDREGION}

  {$REGION 'TRioRec'}
class function TRioRec.HttpRio(IvObj: string): THTTPRIO;
var
  fbk: string;
begin
  // httprio
  // it uses interface reference counting to manage its lifetime
  // if no owner is specified it free itself when interface is released!
  // typecasting it to IXxx creates a temporary interface reference that gets released at the end of the function
  Result := THTTPRIO.Create(nil);

  // agent
  HttpRioAgentSet(fbk, Result);

  // proxy
  if gpxy.Use then
    HttpRioProxySet(fbk, Result, gpxy.UrlOrAddress, gpxy.Port, gpxy.Username, gpxy.Password);

  // url
  HttpRioUrlSet(fbk, Result);

  // note
  // httprio is created then agent, proxy and url are set in the same session
  // for soapconnection this is not true because soapconn is already created, so agent, proxy and url must be set in form.create event
end;

class function TRioRec.HttpRioAgentSet(var IvFbk: string; var IvHttpRio: THTTPRIO; IvAgentBrowserUse: boolean): boolean;
begin
  if IvAgentBrowserUse then
    IvHttpRio.HTTPWebNode.Agent := USER_AGENT_BROWSER
  else
    IvHttpRio.HTTPWebNode.Agent := TBynRec.Info; // USER_AGENT_WKS

  IvFbk := Format('Rio connection agent set to %s', [IvHttpRio.HTTPWebNode.Agent]);
  Result := true;
end;

class function TRioRec.HttpRioProxySet(var IvFbk: string; var IvHttpRio: THTTPRIO; IvProxyUrl, IvProxyPort, IvUsername, IvPassword: string): boolean;
begin
  IvHttpRio.HTTPWebNode.Proxy    := Format('%s:%s', [IvProxyUrl, IvProxyPort]);
  IvHttpRio.HTTPWebNode.UserName := IvUsername;
  IvHttpRio.HTTPWebNode.Password := IvPassword;

  // end
  IvFbk := Format('Rio proxy set to %s %s %s', [IvHttpRio.HTTPWebNode.Proxy, IvHttpRio.HTTPWebNode.UserName, IvHttpRio.HTTPWebNode.Password]);
  Result := true;
end;

class function TRioRec.HttpRioUrlSet(var IvFbk: string; var IvHttpRio: THTTPRIO; IvObj, IvService: string): boolean;
var
  url: string;
begin
  if not TSopRec.SoapRioUrl(IvFbk, url, IvObj, IvService) then begin
    raise Exception.Create(IvFbk);
    Result := false;
    Exit;
  end;

  IvHttpRio.URL := url;

  // end
  IvFbk := Format('Rio url set to %s', [IvHttpRio.URL]);
  Result := true;
end;
  {$ENDREGION}

  {$REGION 'TRndRec'}
class function TRndRec.RndInt(IvBegin, IvEnd: integer): integer;
begin
  Result := IvBegin + Random(Abs(IvEnd - IvBegin));
end;

class function TRndRec.RndStr(IvSize: integer; IvCapitalize: boolean): string;
const
  CHAR_SET = 'abcdefghijklmnopqrstuvwxyz';
var
  i, l: integer; // char, setlength
begin
  l := Length(CHAR_SET);
  SetLength(Result, IvSize);
  Randomize;
  for i := Low(Result) to High(Result) do
    Result[i] := CHAR_SET.Chars[Random(l)];
  if IvCapitalize then
    Result := TStrRec.StrCapitalize(Result);
end;

class function TRndRec.RndName(IvSize: integer; IvPrefix, IvSuffix: string; const IvCharSet: string): string;
var
  i, l: integer; // char, setlength
begin
  l := Length(IvCharSet);
  SetLength(Result, IvSize);
  Randomize;
  for i := Low(Result) to High(Result) do
    Result[i] := IvCharSet.Chars[Random(l)];
  Result := IvPrefix + TStrRec.StrCapitalize(Result) + IvSuffix;
end;
  {$ENDREGION}

  {$REGION 'TRstRec'}
  // no methods for now
  {$ENDREGION}

  {$REGION 'TRvaRec'}
procedure TRvaRec.RvaIf(var s: string);
const
  PATTERN = '\[RvIf\((.*?)\)\]'
          +   '\s*(.*)\s*'
          + '\[RvIfEnd\]';
var
  who, scr, tma, new: string; // wholematch, scriptmatch, truematch
  rex: TRegEx;
  mat: TMatch;
  irs: IScope; // rootscope
  icb: ICompiledBinding;
  sre: TValue; // scriptresult
begin
  rex := TRegEx.Create(PATTERN, [roIgnoreCase, roMultiLine, roSingleLine]);
  mat := rex.Match(s);
  while mat.Success do begin
    if (mat.Groups.Count = 3) then begin
      // extract
      who := mat.Groups[0].Value;
      scr := mat.Groups[1].Value;
      tma := mat.Groups[2].Value;

      // eval
      try
        irs := TNestedScope.Create(BasicOperators, BasicConstants); // BasicOperators define: + - * / < <= > >= not and or xor, BasicConstants define: nil, true, false, and PI.
        icb := Compile(scr, irs);
        sre := icb.Evaluate(irs, nil, nil).GetValue;
      except
        on e: Exception do begin
          glog.Log(e);
          sre := false;
        end;
      end;

      // decide
      if sre.AsBoolean then
        new := tma // truepart
      else
        new := ''; // falsepart

      // replace
    //ReReplace2(s, PATTERN, new, [roIgnoreCase, roSingleLine], 1);
      s := rex.Replace(s, new, 1);
    end;
    mat := mat.NextMatch;
  end;
end;

procedure TRvaRec.RvaIfElse(var s: string);
const
  PATTERN = '\[RvIf\((.*?)\)\]'
          +   '\s*?(.*?)\s*?'
          + '\[RvIfElse\]'
          +   '\s*?(.*?)\s*?'
          + '\[RvIfEnd\]';
var
  who, scr, tma, ema, new: string; // wholematch, scriptmatch, truematch, elsematch
  rex: TRegEx;
  mat: TMatch;
  irs: IScope;
  icb: ICompiledBinding;
  sre: TValue;
begin
  rex := TRegEx.Create(PATTERN, [roIgnoreCase, roMultiLine, roSingleLine]);
  mat := rex.Match(s);
  while mat.Success do begin
    if (mat.Groups.Count = 4) then begin
      try
        // extract
        who := mat.Groups[0].Value;
        scr := mat.Groups[1].Value;
        tma := mat.Groups[2].Value;
        ema := mat.Groups[3].Value;

        // eval
        irs := TNestedScope.Create(BasicOperators, BasicConstants);
        icb := Compile(scr, irs);
        sre := icb.Evaluate(irs, nil, nil).GetValue;

        // decide
        if sre.AsBoolean then
          new := tma // truepart
        else
          new := ema; // falsepart

        // replace
        s := rex.Replace(s, new, 1);
      except
        on e: Exception do begin
          glog.Log(e);
          s := StringReplace(s, who, Format('{%s}', [e.Message]), []);
        end;
      end;
    end;
    mat := mat.NextMatch;
  end;
end;

function  TRvaRec.RvaFunction(f, a: TArray<string>): string;

  {$REGION 'var'}
var
  fun: string; // function
  {$ENDREGION}

  {$REGION 'macro'}
  function  MacroDba: string;
  var
    ars: string;                   // argsstr
    sql: string;                   // query
    obj: string;                   // object
    tbm: string;                   // tablemaster
    tbd: string;                   // tabledetail
    oid: integer;                  // objid
    jst: string;                   // jsonstr
    jso: superobject.ISuperObject; // jsonsuperobject
    jpa: string;                   // jsonpath
    jva: string;                   // jsonval
  begin
    // init
    Result := '?';
    obj := f[0];

    // tablemaster(TblObject)
    tbm := TSqlRec.TblMasterFromObj(obj);
    if not TDbaRec.TblExists(tbm) then
      Exit;

    // tabledetail(TblXxx)
    tbd := TSqlRec.TblDetailFromObj(obj);
    if not TDbaRec.TblExists(tbd) then
      Exit;

    // for orgs and pages, a[0] is an id or path, if it is empty we defaults to the current orgaid or currentpageid
    if a[0].Trim.IsEmpty then begin
      if obj.Equals('Organization') then
        a[0] := gorg.ObjectId.ToString
      else if obj.Equals('Page') then
        a[0] := gwrq.PageId.ToString;
//      if StrToInt(a[0]) = 0 then
//        Exit;
    end;

    // objid
    oid := TDbaRec.ObjIdFromIdOrPath(obj, a[0]);

    try
      // tablemaster
      if TObjRec.HasProperty(f[1]) then begin
        // sql
        sql := Format('select Fld%s from %s where FldId = %d', [f[1], tbm, oid]);

        // property = Data (ex Json)                                            // [RvPageJson(id | jsonpath | default)]
        if f[1].Equals('Data') then begin
          jst := TDbaRec.Scalar(sql, '{}');
          jso := superobject.SO(jst);
          if not Assigned(jso) then
            Result := a[2]
          else begin
            jpa := a[1];
            jva := jso.AsObject.S[jpa];
            Result := giif.NxD(jva, a[2]);
          end;

        // property = Content, Title, Subtitle, ...                             // [RvPageContent(id | default)]
        end else if TObjRec.IsBusinessObj(obj) then
          Result := TDbaRec.Scalar(sql, a[1]);

      // tabledetail
      end else if TDbaRec.ObjTblHasField(obj, f[1]) then begin
        // sql
        sql := Format('select Fld%s from %s where FldObjectId = %d', [f[1], tbd, oid]);

        // property = *** can be anything! ***
        Result := TDbaRec.Scalar(sql, a[1]);
      end else
        Result := Format('Invalid %s field %s', [obj, f[1]]);
    except
      on e: Exception do begin
        gvec.VecRemoveWith(a, '');
        ars := gvec.VecToList(a, '|');
        Result := Format('{Rv%s(%s)} (%s)', [fun, ars, e.Message]);
      end;
    end;
  end;

  function  MacroDat: string;
  begin
    Result := '?';
    // now
         if fun.Equals('DatNow')        then Result := TDatRec.DatNowStr
    else if fun.Equals('DatNowDate')    then Result := TDatRec.DatNowDateStr
    else if fun.Equals('DatNowTime')    then Result := TDatRec.DatNowTimeStr
    else if fun.Equals('DatNowYear')    then Result := TDatRec.DatNowYear.ToString
    else if fun.Equals('DatNowQuarter') then Result := TDatRec.DatNowQuarter.ToString
    else if fun.Equals('DatNowMonth')   then Result := TDatRec.DatNowMonth.ToString
    else if fun.Equals('DatNowWeek')    then Result := TDatRec.DatNowWeek.ToString
    else if fun.Equals('DatNowDay')     then Result := TDatRec.DatNowDay.ToString
    else if fun.Equals('DatNowHour')    then Result := TDatRec.DatNowHour.ToString
    else if fun.Equals('DatNowMinute')  then Result := TDatRec.DatNowMinute.ToString
    else if fun.Equals('DatNowSecond')  then Result := TDatRec.DatNowSecond.ToString
    else if fun.Equals('DatNowAmPm')    then Result := TDatRec.DatNowAmPm
    else if fun.Equals('DatNowCode')    then Result := TDatRec.DatNowCode
    else if fun.Equals('DatNowMs')      then Result := TDatRec.DatNowMs.ToString
  //else if fun.Equals('DatNowWorkYear')    then Result := TDatRec.
  //else if fun.Equals('DatNowWorkQuarter') then Result := TDatRec.
  //else if fun.Equals('DatNowWorkWeek')    then Result := TDatRec.

    // year

    // quarter

    // month

    // week

    // day
    ;
  end;

  function  MacroCalc: string;
  var
    eva: TEvaluator;       // matheval
    irs: IScope;           // rootscope
    icb: ICompiledBinding; //
    isr: TValue;           // scriptresult
  begin
    Result := '?';

    if fun.Equals('CalcJedi') then begin // not used
      eva := TEvaluator.Create;
      try
        try
          Result := eva.Evaluate(a[0]).ToString;
        except
          on e: Exception do
            Result := e.Message;
        end;
      finally
        eva.Free;
      end;

    end else if fun.Equals('Calc') then begin
      try
        irs := TNestedScope.Create(BasicOperators, BasicConstants); // BasicOperators define: + - * / < <= > >= not and or xor, BasicConstants define: nil, true, false, and PI.
        icb := Compile(a[0], irs);
        isr := icb.Evaluate(irs, nil, nil).GetValue;
        if not isr.IsEmpty then
          Result := isr.ToString
        else
          Result := a[1];
      except
        on e: Exception do begin
          glog.Log(e);
          Result := giif.ExR(a[1], '{'+e.Message+'}');
        end;
      end;
    end;
  end;

  function  MacroHtm: string;
  begin
    Result := '?';
         if fun.Equals('HtmForm')                then Result := 'DaFare'
    else if fun.Equals('HtmReport')              then Result := THtmRec.Report(a[0].ToInteger, a[1])                                      // [RvHtmReportFromId(id | default-if-any-ds-is-empty)]]
    else if fun.Equals('HtmRepeatFromSql')       then Result := THtmRec.RepeatFromSql(a[0], a[1], a[2], a[3], a[4])                       // [RvHtmRepeatSql(sql | html-block-with-$FldAaa$ | header | footer | default-if-empty)]
    else if fun.Equals('HtmSlidesFromSql')       then Result := THtmRec.SlidesFromSql(a[0], a[1], a[2], a[3], a[4], StrToIntDef(a[5], 1)) // [RvHtmSlidesSql(sql | html-slide-block-with-$FldAaa$ | header | footer | default-if-empty | slideid)] (similar to repeater)
    else if fun.Equals('HtmTableFromSql')        then Result := THtmRec.TableFromSql(a[0], a[1])                                          // [RvHtmTableFromSql(sql | default-if-empty | editable-true-false | edit-json | direction-horiz-vert)
    else if fun.Equals('HtmWordifyFromSql')      then Result := 'DaFare'
    ;
  end;

  function  MacroLorem: string;
  begin
    Result := '?';
         if fun.Equals('LoremTitle')       then Result := TLorRec.Title(      StrToIntDef(a[0], 1), StrToIntDef(a[1], 2), StrToIntDef(a[2],  1), StrToBoolDef(a[3], false)                          ) // [RvLoremTitle(3| 6| 1| false)]
    else if fun.Equals('LoremParagraphs')  then Result := TLorRec.Paragraphs( StrToIntDef(a[0], 1), StrToIntDef(a[1], 3), StrToIntDef(a[2], 12), StrToIntDef (a[3], 24   )                          ) // [RvLoremParagraphs(1| 3| 12| 24)]
    else if fun.Equals('LoremHTitle')      then Result := TLorRec.HTitle(     StrToIntDef(a[0], 1), StrToIntDef(a[1], 2), StrToIntDef(a[2],  1), StrToIntDef (a[2], 1    ), StrToBoolDef(a[3], true)) // [RvLoremTitle(3| 6| 1| false)]
    else if fun.Equals('LoremHParagraphs') then Result := TLorRec.HParagraphs(StrToIntDef(a[0], 1), StrToIntDef(a[1], 3), StrToIntDef(a[2], 12), StrToIntDef (a[3], 24   )                          ) // [RvLoremParagraphs(1| 3| 12| 24)]
    ;
  end;

  function  MacroSql: string;
  begin
    Result := '?';
         if fun.Equals('SqlFilter')     then Result := TSqlRec.SqlFilterRv(a[0], a[1])       // [RvSqlFilter(FldXxx | complex-filter-str)]
    else if fun.Equals('SqlDistinct')   then Result := TSqlRec.SqlDistinct(a[0], a[1], a[2]) // [RvSqlDistinct(DbaPage.dbo.TblPage | FldKind | Page)]
    ;
  end;

  function  MacroW3: string;
  begin
    Result := '?';
         if fun.Equals('W3StateColor')  then Result := TStaRec.ColorW3FromState(a[0]) // [RvColorW3FromState(state)]
    ;
  end;

  function  MacroWebsite: string;
  begin
    Result := '?';
         if fun.Equals('WebsiteWww')  then Result := gwsi.Www                            // [RvWebsiteWww()]
    else if fun.Equals('WebsiteUrl')  then Result := gwsi.Url(StrToBoolDef(a[0], false)) // [RvWebsiteUrl()]
    ;
  end;

  function  MacroWse: string;
  begin
    Result := '?';
         if fun.Equals('WseDateTimeBegin') then Result := DateTimeToStr(gwse.DateTimeBegin) // [RvWseDateTimeBegin()]
    else if fun.Equals('WseKind')          then Result := gwse.Kind                   // [RvWseKind()]
    else if fun.Equals('WseSessionId')     then Result := gwse.SessionId.ToString     // [RvWseSessionId()]
    ;
  end;

  function  MacroWrq: string;
  begin
    Result := '?';
         if fun.Equals('WrqFingerprintId') then Result := gwrq.FingerprintId.ToString
  //else if fun.Equals('WrqSessionId')     then Result := gwrq.SessionId.ToString // remove, already in TWseRec
    else if fun.Equals('WrqRequestId')     then Result := gwrq.RequestId.ToString
    else if fun.Equals('WrqPageId')        then Result := gwrq.PageId.ToString
    else if fun.Equals('WrqField')         then Result := gwrq.FieldGet       (a[0], a[1])  // [RvWreField(field-coname | default)]
    else if fun.Equals('WrqCookieField')   then Result := gwrq.FieldCookieGet (a[0], a[1])
    else if fun.Equals('WrqQueryField')    then Result := gwrq.FieldQueryGet  (a[0], a[1])
    else if fun.Equals('WrqContentField')  then Result := gwrq.FieldContentGet(a[0], a[1])
    ;
  end;

  function  MacroWks: string;
  begin
    Result := '?';
         if fun.Equals('Wks')            then Result := TWksRec.ACRONYM
    else if fun.Equals('WksAuthor')      then Result := TWksRec.AUTHOR
    else if fun.Equals('WksAcro')        then Result := TWksRec.ACRONYM
    else if fun.Equals('WksName')        then Result := TWksRec.NAME
    else if fun.Equals('WksDescription') then Result := TWksRec.DESCRIPTION
    else if fun.Equals('WksCopyright')   then Result := TWksRec.Copyright
    else if fun.Equals('WksWww')         then Result := TWksRec.WWW
    else if fun.Equals('WksPhone')       then Result := TWksRec.PHONE
    else if fun.Equals('WksEmail')       then Result := TWksRec.EMAIL
    else if fun.Equals('WksHomePath')    then Result := TWksRec.HOME_PATH
    else if fun.Equals('WksIncPath')     then Result := TWksRec.INC_PATH
    else if fun.Equals('WksHomeUrl')     then Result := TWksRec.HOME_URL
    else if fun.Equals('WksIconUrl')     then Result := TWksRec.ICON_URL
    else if fun.Equals('WksLogoUrl')     then Result := TWksRec.LOGO_URL
    else if fun.Equals('WksLogoLongUrl') then Result := TWksRec.LOGO_LONG_URL
    else if fun.Equals('WksLogoImg')     then Result := Format('<img src="%s" title="%s" style="height:%spx">', [TWksRec.LOGO_URL     , TWksRec.Info, a[0]]) // TWksRec.LogoGraphic
    else if fun.Equals('WksLogoLongImg') then Result := Format('<img src="%s" title="%s" style="height:%spx">', [TWksRec.LOGO_LONG_URL, TWksRec.Info, a[0]]) // TWksRec.LogoLongGraphic
    else if fun.Equals('WksInfo')        then Result := TWksRec.Info
    ;
  end;

  function  MacroPerson: string;
  begin
    Result := '?';
         if fun.Equals('PersonId')          then Result := gper.ObjectId.ToString
    else if fun.Equals('Person')            then Result := gper.Person
    else if fun.Equals('PersonName')        then Result := gper.Name
    else if fun.Equals('PersonSurname')     then Result := gper.Surname
    else if fun.Equals('PersonPhone')       then Result := gper.Phone
    else if fun.Equals('PersonEmail')       then Result := gper.Email
    else if fun.Equals('PersonInfo')        then Result := gper.Info
    else if fun.Equals('PersonHomePath')    then Result := gper.HomePath
    else if fun.Equals('PersonHomeUrl')     then Result := gper.HomeUrl
    else if fun.Equals('PersonPictureUrl')  then Result := gper.PictureUrl
    else if fun.Equals('PersonPictureImg')  then Result := Format('<img src="%s" title="%s" style="height:%spx">', [gper.PictureUrl, gper.Info, a[0]]) // gper.PictureGraphic
    ;
  end;

  function  MacroUser: string;
  begin
    Result := '?';
         if fun.Equals('UserId')            then Result := gusr.PersonId.ToString
    else if fun.Equals('UserUsername')      then Result := gusr.Username
    else if fun.Equals('UserPassword')      then Result := '********' // gusr.Password
    else if fun.Equals('UserState')         then Result := gusr.State
    else if fun.Equals('UserInfo')          then Result := gusr.Info
    else if fun.Equals('UserHomePath')      then Result := gusr.HomePath
    else if fun.Equals('UserHomeUrl')       then Result := gusr.HomeUrl
    else if fun.Equals('UserAvatarUrl')     then Result := gusr.AvatarUrl
    else if fun.Equals('UserAvatarImg')     then Result := Format('<img src="%s" title="%s" style="height:%spx">', [gusr.AvatarUrl, gusr.Info, a[0]]) // gusr.AvatarGraphic
    ;
  end;

  function  MacroOrganization: string;
  begin
    Result := '?';
         if fun.Equals('Organization')            then Result := gorg.Obj.&Object
    else if fun.Equals('OrganizationId')          then Result := gorg.Obj.Id.ToString
    else if fun.Equals('OrganizationWww')         then Result := gorg.Www
    else if fun.Equals('OrganizationAbout')       then Result := gorg.About
    else if fun.Equals('OrganizationSlogan')      then Result := gorg.Slogan
    else if fun.Equals('OrganizationHomePageId')  then Result := gorg.HomePageId.ToString
    else if fun.Equals('OrganizationHomePath')    then Result := gorg.HomePath
    else if fun.Equals('OrganizationHomeUrl')     then Result := gorg.HomeUrl(TBolRec.BolFromStr(a[0], true))
    else if fun.Equals('OrganizationIconUrl')     then Result := gorg.IconUrl(TBolRec.BolFromStr(a[0], true))
    else if fun.Equals('OrganizationLogoUrl')     then Result := gorg.LogoUrl(TBolRec.BolFromStr(a[0], true))
    else if fun.Equals('OrganizationLogoLongUrl') then Result := gorg.LogoLongUrl(TBolRec.BolFromStr(a[0], true))
    else if fun.Equals('OrganizationLogoImg')     then Result := Format('<img src="%s" title="%s" style="height:%spx">', [gorg.LogoUrl    , gorg.Info, a[0]]) // gorg.LogoGraphic
    else if fun.Equals('OrganizationLogoLongImg') then Result := Format('<img src="%s" title="%s" style="height:%spx">', [gorg.LogoLongUrl, gorg.Info, a[0]]) // gorg.LogoLongGraphic
    else if fun.Equals('OrganizationInfo')        then Result := gorg.Info
    ;
  end;

  function  MacroMember: string;
  begin
    Result := '?';
         if fun.Equals('MemberId')           then Result := gmbr.Id.ToString
    else if fun.Equals('MemberPId')          then Result := gmbr.PId.ToString
    else if fun.Equals('MemberOrganization') then Result := gmbr.Organization
    else if fun.Equals('MemberDepartment')   then Result := gmbr.Department
    else if fun.Equals('MemberArea')         then Result := gmbr.Area
    else if fun.Equals('MemberTeam')         then Result := gmbr.Team
    else if fun.Equals('MemberSite')         then Result := gmbr.Site
    else if fun.Equals('MemberMember')       then Result := gmbr.Member
    else if fun.Equals('MemberEmail')        then Result := gmbr.Email
    else if fun.Equals('MemberState')        then Result := gmbr.State
    else if fun.Equals('MemberJobTitle')     then Result := gmbr.JobTitle
    else if fun.Equals('MemberJobRole')      then Result := gmbr.JobRole
    else if fun.Equals('MemberJobLevel')     then Result := gmbr.JobLevel
    else if fun.Equals('MemberJobGrade')     then Result := gmbr.JobGrade.ToString
    else if fun.Equals('MemberHomePath')     then Result := gmbr.HomePath
    else if fun.Equals('MemberHomeUrl')      then Result := gmbr.HomeUrl
    else if fun.Equals('MemberBadgeUrl')     then Result := gmbr.BadgeUrl
    else if fun.Equals('MemberBadgeImg')     then Result := Format('<img src="%s" title="%s" style="height:%spx">', [gmbr.BadgeUrl, gmbr.Info, a[0]]) // gmbr.BadgeGraphic
    else if fun.Equals('MemberInfo')         then Result := gmbr.Info
    ;
  end;

  function  MacroTheme: string;
  begin
    Result := '?';
         if fun.Equals('OrganizationId')          then Result := gthe.ObjectId.ToString
    else if fun.Equals('Theme')                   then Result := gthe.Theme
    else if fun.Equals('Grade')                   then Result := gthe.Grade
    else if fun.Equals('ThemeFontFamily')         then Result := gthe.FontFamily
    else if fun.Equals('ThemeFontWeight')         then Result := gthe.FontWeight
    else if fun.Equals('ThemeSizeClass')          then Result := gthe.SizeClass
    else if fun.Equals('ThemePaddingClass')       then Result := gthe.PaddingClass
    else if fun.Equals('ThemeBorderedClass')      then Result := gthe.BorderedClass
    else if fun.Equals('ThemeHighlightJs')        then Result := gthe.HighlightJs
    else if fun.Equals('ThemePrimary60BgColor')   then Result := gthe.Primary60BgColor
    else if fun.Equals('ThemeSecondary30FgColor') then Result := gthe.Secondary30FgColor
    else if fun.Equals('ThemeAccent10Color')      then Result := gthe.Accent10Color
    else if fun.Equals('ThemeErrorColor')         then Result := gthe.ErrorColor
    else if fun.Equals('ThemeDangerColor')        then Result := gthe.DangerColor
    else if fun.Equals('ThemeWarningColor')       then Result := gthe.WarningColor
    else if fun.Equals('ThemeInfoColor')          then Result := gthe.InfoColor
    else if fun.Equals('ThemeSuccessColor')       then Result := gthe.SuccessColor
    ;
  end;

  function  MacroPage: string;
  begin
         if fun.Equals('PageUrl')                 then Result := Format('/%s?CoId=%s%s', [TBynRec.BinaryName, a[0] , a[1]]) // [RvPageUrl(123 | &CoEnv=Dev)] --> /WksPageIsapiProject.dll?CoId=123&CoEnv=Dev
    else Result := MacroDba;
    ;
  end;

  function  MacroDocument: string;
  begin
    Result := '?';
         if fun.Equals('DocumentUrl')             then Result := THtmRec.A(Format('/WksPageIsapiProject.dll/View?CoId=167&CoDocumentId=%s', [a[0]]), a[1], a[2], a[3], a[4], a[5])
    ;
  end;
  {$ENDREGION}

begin

  {$REGION 'default'}
  Result := '';
  {$ENDREGION}

  {$REGION 'exit'}
  if Length(f) = 0 then // no function
    Exit;
  {$ENDREGION}

  {$REGION 'doaminshortcutexpand'}
       if SameText(f[0], 'Dt' ) then f[0] := 'Dat'
  else if SameText(f[0], 'Org') then f[0] := 'Organization'
  else if SameText(f[0], 'Pag') then f[0] := 'Page'
  else if SameText(f[0], 'Wre') then f[0] := 'Wrq'
  else if SameText(f[0], 'Sys') then f[0] := 'System'
  ;
  {$ENDREGION}

  {$REGION 'function'}
  fun := gvec.VecCollapse(f);
  {$ENDREGION}

  {$REGION 'argumentsvec'}
  if Length(a) < 10 then
    SetLength(a, 10);
  {$ENDREGION}

  {$REGION '1ST TRY - DOMAINS'}
  // here we process Nlevels tags like: [RvAaaBbbCcc(arg0|arg1|...)]
  // f[0], f[1], ... = anything
  // a[0], a[1], ... = anything
  // a[z]            = default

       if f[0].Equals('Dat')     then Result := MacroDat
  else if f[0].Equals('Calc')    then Result := MacroCalc
  else if f[0].Equals('Htm')     then Result := MacroHtm
  else if f[0].Equals('Lorem')   then Result := MacroLorem
  else if f[0].Equals('Sql')     then Result := MacroSql
  else if f[0].Equals('W3')      then Result := MacroW3
  else if f[0].Equals('Website') then Result := MacroWebsite
  else if f[0].Equals('Wse')     then Result := MacroWse
  else if f[0].Equals('Wrq')     then Result := MacroWrq
  {$ENDREGION}

  {$REGION '2ND TRY - OBJECTS'}
  // here we process 2levels tags like: [RvObjectProperty(arg0)]
  // f[0] = object:      Person, User, Organization, Member, Document, Page, ...
  // f[1] = property:    Id, PId, State, Content, Json, ..., Object  (see DbaXxx.dbo.TblObject) or ObjectId, Xxx, Property1, Property2, ... (see DbaXxx.dbo.TblXxx)
  // a[0] = id:          orgaid or currentpageid (if empty defaults to currentpageid)
  // a[.] = anything
  // a[z] = default

  else if f[0].Equals('Wks')          then Result := MacroWks
  else if f[0].Equals('Person')       then Result := MacroPerson
  else if f[0].Equals('User')         then Result := MacroUser
  else if f[0].Equals('Organization') then Result := MacroOrganization
  else if f[0].Equals('Member')       then Result := MacroMember
  else if f[0].Equals('Theme')        then Result := MacroTheme
  else if f[0].Equals('Page')         then Result := MacroPage
  else if f[0].Equals('Document')     then Result := MacroDocument
  {$ENDREGION}

  {$REGION '3RD TRY - DATABASE'}
  // here we process ...

  else Result := MacroDba;
  {$ENDREGION}

end;

function  TRvaRec.Rva(IvStr: string; IvCommentRemove, IvEmptyLinesRemove, IvTrim: boolean; IvRecMax: integer): string;

  {$REGION 'var'}
type
  TTag = record
    Orig: string;
    Func: string;
    Args: string;
  end;

var               
  i  : integer;
  tav: TArray<TTag>;        // tagvec
  rvo: string;              // rvoriginal
  fnv, arv: TArray<string>; // funcvec, argsvec 
  fre: string;              // funcresult
  tre: TRegEx;              // rexobj
  tma: TMatch;
  {$ENDREGION}

  {$REGION 'macros'}
  function  StrIsDirty(ivstr: string): boolean;
  begin
  //Result := TStrRec.StrHas(ivstr, '[Rv') or TStrRec.StrHas(ivstr, '[--Rv');
    Result := TStrRec.StrHasRex(ivstr, grex.REX_RV_CHECK_PAT, [roSingleLine{, roMultiLine, roIgnoreCase}]);
  end;

  procedure StrTagAllMute();
  var
    tre: TRegEx;
    mat: TMatch;
    val: string;
  begin
  //Result := TStrRec.Replace('[Rv', '{Rv').Replace(']', '}'); *** spaccava tutto, ovviamente! ***

    tre := TRegEx.Create(grex.REX_RV_CHECK_PAT, [roMultiLine, roSingleLine]);
    mat := tre.Match(Result);
    while mat.Success do begin
      val := mat.Value.Replace('[Rv', '{Rv').Replace(']', '}');
      Result := tre.Replace(Result, val, 1);
      mat := mat.NextMatch;
    end;
  end;

  procedure StrClean();
  begin
    if TStrRec.StrHasRex(Result, '\[--Rv.*\]', [roIgnoreCase]) then
      grex.RexReplace(Result, '\[--Rv.*\]', '--comment--', [roIgnoreCase]);

    if IvCommentRemove then
      Result := TStrRec.StrCommentRemove(Result);

    if IvEmptyLinesRemove then
      Result := TStrRec.StrEmptyLinesRemove(Result);

    if IvTrim then
      Result := Trim(Result);
  end;

  procedure StrDollarsProcess();
  var
    i: integer;
    fld, dfl, val: string; // field, dollarfield, value
  begin
    if Assigned(gwrq.WebRequestOrig) then // serversonly
      for i := 0 to gwrq.WebRequestOrig.QueryFields.Count-1 do begin
        fld := gwrq.WebRequestOrig.QueryFields.Names[i];
        dfl := Format('$%s$', [fld]);
        val := gwrq.WebRequestOrig.QueryFields.Values[fld];
        if TStrRec.StrHas(Result, dfl) then
          Result := StringReplace(Result, dfl, val, [rfReplaceAll]);
      end;
  end;
  {$ENDREGION}

begin

  {$REGION 'init'}
  Result := IvStr;
  {$ENDREGION}

  {$REGION 'exit'}
  Dec(IvRecMax);
  if IvRecMax = -1 then begin
  //raise Exception.CreateFmt('MAX RECURSION REACHED ON: %s', [IvStr.Replace('[Rv', '{Rv').Replace(']', '}')]);
    //raise Exception.Create('MAX RECURSION REACHED');
    StrTagAllMute();
    glog.Log('RV MAX REURSION %d REACHED SEE FILE: %s', [IvRecMax, 'LogRvaMaxRecursion.tx']);
    glog.LogToFile(IvStr, 'LogRvaMaxRecursion.txt');
    Exit;
  end;

  if not StrIsDirty(Result) then
    Exit;
  {$ENDREGION}

  {$REGION 'clean'}
  StrClean();
  {$ENDREGION}

  {$REGION 'ifthen'}
  RvaIf(Result);
  RvaIfElse(Result);
  {$ENDREGION}

  {$REGION '$abc$'}
  StrDollarsProcess();
  {$ENDREGION}

  {$REGION 'matches'};
  tre := TRegEx.Create(grex.REX_RV_RECURSIVE_PAT, [roSingleLine{, roIgnoreCase, roIgnorePatternSpace}]);
//glog.LogToFile(Result, 'LogRvaResult.txt');
  tma := tre.Match(Result);
  i := -1;
  while tma.Success and (tma.Groups.Count >= 3) do begin
    SetLength(tav, Length(tav)+1);
    Inc(i);

    tav[i].Orig := tma.Groups[0].Value;
    tav[i].Func := tma.Groups[1].Value;
    tav[i].Args := tma.Groups[2].Value;          // warning, is like: (aaa|bbb|...)
    Delete(tav[i].Args, 1, 1);                   // remove 1st (
    Delete(tav[i].Args, Length(tav[i].Args), 1); // remove 2nd )

    tma := tma.NextMatch;
  end;
  {$ENDREGION}

  {$REGION 'shortcutexpand'}
  for i := Low(tav) to High(tav) do begin
         if tav[i].Func = 'Now'                then      tav[i].Func := 'DatNow'
    else if tav[i].Func = 'NowYear'            then      tav[i].Func := 'DatNowYear'
    else if tav[i].Func = 'NowCode'            then      tav[i].Func := 'DatNowCode'
    else if tav[i].Func = 'CryptoEncode'       then      tav[i].Func := 'CryptoCipher'
    else if tav[i].Func = 'CryptoDecode'       then      tav[i].Func := 'CryptoDecipher'
    else if tav[i].Func = 'Org'                then      tav[i].Func := 'Organization'
    else if tav[i].Func = 'OrganizationPath'   then      tav[i].Func := 'OrganizationHomePath'
    else if tav[i].Func = 'OrganizationUrl'    then      tav[i].Func := 'OrganizationHomeUrl'
    else if tav[i].Func = 'Page'               then      tav[i].Func := 'PageContent'
  end;
  {$ENDREGION}

  {$REGION 'loop'}
  for i := Low(tav) to High(tav) do begin
    // isfuncdirty
    while StrIsDirty(tav[i].Func) do
      tav[i].Func := Rva(tav[i].Func, IvCommentRemove, IvEmptyLinesRemove, IvTrim, IvRecMax);

    // isargsdirty
    while StrIsDirty(tav[i].Args) do
      tav[i].Args := Rva(tav[i].Args, IvCommentRemove, IvEmptyLinesRemove, IvTrim, IvRecMax);

    // init
    rvo := tav[i].Orig;
    fnv := gvec.VecFromStrCamel(tav[i].Func);
    arv := gvec.VecFromStr(tav[i].Args, '|');   // was '|;,'   comma [,] interfere with args that are lists   and semicolon [;] interfere with args that are python or pas code

    // funcresult
    fre := RvaFunction(fnv, arv);

    // replace
    Result := TStrRec.StrReplace(Result, rvo, fre);
  end;
  {$ENDREGION}

  {$REGION 'clean'}
  StrClean();
  {$ENDREGION}

  {$REGION 'recursive'}
  if StrIsDirty(Result) then begin
  //TFile.AppendAllText('C:\$Tmp\1.txt', Result, TEncoding.Unicode);
    Result := Rva(Result, IvCommentRemove, IvEmptyLinesRemove, IvTrim, IvRecMax);
  end;
  {$ENDREGION}

end;

function  TRvaRec.RvaDsRecord(IvString: string; IvDsVec: TArray<TDataset>): string;
var
  j, i: integer;
  flv: TStringVector;  // flds
  vav: TVariantVector; // vals
begin
  Result := IvString;
  if Result.Trim.IsEmpty then
    Exit;

  for j := Low(IvDsVec) to High(IvDsVec) do begin
    TDstRec.DsRecordToFldAndValueVectors(IvDsVec[j], flv, vav);
  //Result := IvString;
    for i := Low(flv) to High(flv) do
      Result := StringReplace(Result, '$'+flv[i]+'$', VarToStrDef(vav[i], '?'+flv[i]+'?'), [rfReplaceAll{, rfIgnoreCase}]);
  end;
end;

function  TRvaRec.RvaRecord(IvString: string; const IvRecType: TRttiType; const IvRec: Pointer): string;
var
  fld: TRttiField;
  val: TValue;
  fls, vas: string;
begin
  Result := IvString;
  if Result.Trim.IsEmpty then
    Exit;

  for fld in IvRecType.GetFields do begin
    if fld.FieldType.Handle = TypeInfo(TGraphic) then
      continue;
    fls := fld.Name;
    val := fld.GetValue(IvRec);
    vas := val.ToString;
    Result := StringReplace(Result, '$'+fls+'$', vas, [rfReplaceAll{, rfIgnoreCase}]);
  end;

//if TRegEx.IsMatch(Result, TRexRec.REX_RV_DOLLAR_PAT) then // *** might hide additional replacers ***
  //Result := TRegEx.Replace(Result, TRexRec.REX_RV_DOLLAR_PAT, '?$1?')
end;

function  TRvaRec.RvaJson(IvString, IvJsonStr: string; IvReplaceFlag: TReplaceFlags): string;
var
  o{, o2}: superobject.ISuperObject; // givenobj, objinarray
//  i: superobject.TSuperObjectIter; // item
//i2: superobject.TSuperAvlEntry; // item
//  a: superobject.TSuperArray; // aray
//  n, v: string; // name, value
//  j: integer;
  {s,} IvResultRecursive: string;

  procedure JsonObjectProcess(const IvAsObject: superobject.TSuperTableString; const IvPrefix: string = ''); // RECURSIVE
  var
    i: integer; // idx
    n, v: string; // name, value
    nv, vv: superobject.ISuperObject; // namevector, valuevector
    i1, i2: superobject.ISuperObject; // itemvalue, vectoritem
  begin
    if Assigned(IvAsObject) then begin
      nv := IvAsObject.GetNames;
      vv := IvAsObject.GetValues;

      for i := 0 to vv.AsArray.Length - 1 do begin
        n := nv.AsArray[i].AsString;
        i1 := vv.AsArray[i];
        if i1.DataType = stObject then begin
        //v := '<Object>';
          JsonObjectProcess(i1.AsObject, IvPrefix + n + '.');
        end else if i1.DataType = stArray then begin
        //v := '<Array>';
          for i2 in i1 do
            JsonObjectProcess(i2.AsObject, IvPrefix + n + '.');
        end else begin
          v := i1.AsString;
          if True then
            v := TStrRec.StrReplace(v, '*', '%');
        //IvResultRecursive := str.Replace  (IvResultRecursive, '$' + IvPrefix + n + '$', v); // '[RvAgent'+n+'()]'
          IvResultRecursive := StringReplace(IvResultRecursive, '$' + IvPrefix + n + '$', v, IvReplaceFlag);
        end;
//        if i1.DataType = stArray then
//        if i1.DataType = stObject then
      end;
    end;
  end;

begin
  // before
  IvResultRecursive := StringReplace(IvString, '$Json$', '***NOTALLOWED***', [rfReplaceAll, rfIgnoreCase]);

  // jsonobject
  o := superobject.SO(IvJsonStr);
  JsonObjectProcess(o.AsObject);

  // after
  Result := IvResultRecursive;

  {
  if superobject.ObjectFindFirst(o, i) then begin
    try
      repeat
        if (i.val.IsType(stArray)) then begin
          a := i.val.AsArray;
          for j := 0 to a.Length-1 do begin  //for j in a do begin
            o2 := a.O[j];
            // recursive ...
          //RvJ(Result, ???);
          end;
        end else begin
          n := i.key;
          v := i.val.AsString;
          Result := str.Replace(Result, '[RvAgent'+n+'()]', v);
        end;
      until not superobject.ObjectFindNext(i);
    finally
      superobject.ObjectFindClose(i);
    end;
  end;

  for j := 0 to o.AsArray.Length-1 do begin
    // the object in the array
    a := o.AsArray[j].AsObject;

    // 1 asobject
//  for i1 in a.AsObject do begin
//    n := i1.Name;
//    v := i1.Value.AsString;
//    IvString := str.Replace(IvString, '[Rv'+n+'()]', v);
//  end;

    // 2 browsing
    if ObjectFindFirst(a, i2) then
    repeat
      n := i2.key;
      v := i2.val.AsString;
      IvString := str.Replace(IvString, '[Rv'+n+'()]', v);
    until not ObjectFindNext(i2);
    ObjectFindClose(i2);
  end;
  }
end;
  {$ENDREGION}

  {$REGION 'TSbuRec'}
procedure TSbuRec.Clr;
begin
  Text := '';
end;

procedure TSbuRec.Anl(IvNl: integer);
var
  i: integer;
begin
  for i := 1 to IvNl do
    Text := Text + sLineBreak;
end;

procedure TSbuRec.Anp(IvStr: string; IvIfTrue: boolean);
begin
  Add(IvStr, IvIfTrue, 0);
end;

procedure TSbuRec.Add(IvStr: string; IvIfTrue: boolean; IvNlPrefix: integer);
begin
  // exit
  if (not IvIfTrue) or IvStr.Trim.IsEmpty then
    Exit;

  // appendnewline
  Anl(IvNlPrefix);

  // appendstring
  Text := Text + IvStr;
end;

procedure TSbuRec.Top(IvStr: string; IvIfTrue: boolean);
begin
  // exit
  if (not IvIfTrue) or IvStr.Trim.IsEmpty then
    Exit;

  // prependstring
  Text :=        IvStr
  + sLineBreak + Text;
end;

procedure TSbuRec.Add(IvFormat: string; IvVarRecVec: array of TVarRec; IvIfTrue: boolean; IvNlPrefix: integer);
begin
  Add(Format(IvFormat, IvVarRecVec), IvIfTrue, IvNlPrefix);
end;

procedure TSbuRec.Aif(IvStrT, IvStrF: string; IvTest, IvIfTrue: boolean; IvNlPrefix: integer);
begin
  if IvTest then
    Add(IvStrT, IvIfTrue, IvNlPrefix)
  else
    Add(IvStrF, IvIfTrue, IvNlPrefix);
end;

procedure TSbuRec.Wra(IvA, IvZ: string);
begin
  Text :=        IvA
  + sLineBreak + Text
  + sLineBreak + IvZ;
end;

procedure TSbuRec.SaveToFile(IvFile: string);
var
  stl: TStrings;
begin
  stl := TStringList.Create;
  stl.Text := Text;
  try
    stl.SaveToFile(IvFile);
  finally
    stl.Free;
  end;
end;
  {$ENDREGION}

  {$REGION 'TSopRec'}
class function TSopRec.SoapUrl(var IvFbk, IvUrl: string; IvObj: string): boolean;
var
  obj: string;
begin
  // object
  obj := IvObj;
  if obj = '' then
    obj := TBynRec.Obj;

  // url
  IvUrl := gaps.Url + Format(SOAP_DLL_URL, [obj]);

  // exist
  Result := TUrlRec.Exists(IvUrl, TWksRec.URL_CHECK);

  // fbk
  IvFbk := Format('Soap url %s %s', [IvUrl, ifthen(Result, 'exists', 'does not exists')]);
end;

class function TSopRec.SoapRioUrl(var IvFbk, IvUrl: string; IvObj, IvService: string): boolean;
begin
  Result := SoapUrl(IvFbk, IvUrl, IvObj);
  IvUrl := IvUrl + Format(SOAP_RIO_URL, [IvObj, IvService]);
end;

class function TSopRec.SoapRioWsdl(var IvFbk, IvWsdl: string; IvObj, IvService: string): boolean;
begin
  Result := SoapUrl(IvFbk, IvWsdl, IvObj);
  IvWsdl := IvWsdl + Format(SOAP_WSDL_URL, [IvObj, IvService]);
end;

class function  TSopRec.SoapDataModuleUrl(var IvFbk, IvUrl: string; IvObj, IvService: string): boolean;
begin
  Result := SoapUrl(IvFbk, IvUrl, IvObj);
  IvUrl := IvUrl + Format(SOAP_DATAMODULE_URL, [IvObj, IvService]);
end;

class function  TSopRec.SoapConnectionAgentSet(var IvFbk: string; var IvSoapConnection: TSoapConnection; IvAgentBrowserUse: boolean): boolean;
begin
  if IvAgentBrowserUse then
    IvSoapConnection.Agent := USER_AGENT_BROWSER
  else
    IvSoapConnection.Agent := TBynRec.Info; // USER_AGENT_WKS

  // end
  IvFbk := Format('Soap connection agent set to %s', [IvSoapConnection.Agent]);
  Result := true;
end;

class function  TSopRec.SoapConnectionProxySet(var IvFbk: string; var IvSoapConnection: TSoapConnection; IvProxyUrl, IvProxyPort, IvUsername, IvPassword: string): boolean;
begin
  IvSoapConnection.RIO.HTTPWebNode.Proxy    := Format('%s:%s', [IvProxyUrl, IvProxyPort]);
  IvSoapConnection.RIO.HTTPWebNode.UserName := IvUsername;
  IvSoapConnection.RIO.HTTPWebNode.Password := IvPassword;

  // end
  IvFbk := Format('Soap connection proxy set to %s %s %s', [IvSoapConnection.RIO.HTTPWebNode.Proxy, IvSoapConnection.RIO.HTTPWebNode.UserName, IvSoapConnection.RIO.HTTPWebNode.Password]);
  Result := true;
end;

class function  TSopRec.SoapConnectionUrlSet(var IvFbk: string; var IvSoapConnection: TSoapConnection; IvObj, IvService: string): boolean;
var
  url: string;
begin
  Result := SoapDataModuleUrl(IvFbk, url, IvObj, IvService);
  if not Result then
    Exit;
  IvSoapConnection.URL := url;

  // end
  IvFbk := Format('Soap connection url set to %s', [IvSoapConnection.URL]);
  Result := true;
end;

class procedure TSopRec.SoapProviderCsv(IvSoapConnection: TSoapConnection; var IvCsv: string);
var
  i: integer;
  vve: variant; // vector
begin
  VarClear(vve);
  IvCsv := '';
  try
    vve := IvSoapConnection.GetServer.AS_GetProviderNames;
  except
    // any errors means the list is not available
  end;
  if VarIsArray(vve) and (VarArrayDimCount(vve) = 1) then
    for i := VarArrayLowBound(vve, 1) to VarArrayHighBound(vve, 1) do
      IvCsv := IvCsv + ',' + vve[i];
  Delete(IvCsv, 1, 1);
end;
  {$ENDREGION}

  {$REGION 'TSqlRec'}
class function  TSqlRec.DbaMainFromTbl(IvTbl: string): string;
begin
  Result := IvTbl.Remove(Pos('.', IvTbl) - 1);
end;

class function  TSqlRec.TblMasterFromObj(IvObj: string): string;
begin
  Result := Format('Dba%s.dbo.TblObject', [IvObj]);
end;

class function  TSqlRec.TblDetailFromObj(IvObj: string): string;
begin
  Result := Format('Dba%s.dbo.Tbl%s', [IvObj, IvObj]);
end;

class function  TSqlRec.FldMainFromTbl(IvTbl: string): string;
var
  vec: TArray<string>;
begin  
  vec := TArray<string>(SplitString(IvTbl, '.'));
  Result := vec[High(vec)].Replace('Tbl', 'Fld');
end;
     
class function  TSqlRec.WhereEnsure(IvWhere: string): string;
begin
       if IvWhere.Trim.IsEmpty then
    Result := ''
  else if IvWhere.StartsWith('where') then
    Result := ' ' + IvWhere
  else
    Result := Format(' where (%s)', [IvWhere]);
end;

class function  TSqlRec.OrderByEnsure(IvOrderBy: string): string;
begin
       if IvOrderBy.Trim.IsEmpty then
    Result := ''
  else if IvOrderBy.StartsWith('order by') then
    Result := ' ' + IvOrderBy
  else
    Result := Format(' order by %s', [IvOrderBy]);
end;

class function  TSqlRec.Val(IvValue: variant; IvDefault: string): string;
begin
  if      VarIsEmpty(IvValue) or VarIsNull(IvValue) or (Trim(IvValue) = '') or SameText(IvValue, 'NULL') then
    Result := IvDefault

  else if VarIsType(IvValue, varBoolean) then
    Result := ifthen(IvValue, '1', '0')

  else if VarIsNumeric(IvValue) then
    Result := Trim(IvValue)

  else if VarIsFloat(IvValue) then
    Result := Trim(IvValue)

  else if VarIsType(IvValue, varDate) or (VarType(IvValue) = 271) then begin // 271 = SQLTimeStampVariantType
    if IvValue = 0.0 then // nulldatetime
      Result := IvDefault
    else
      Result := TDatRec.DatToSql(IvValue).QuotedString
  end

//else if dat.TimeIsValid(IvValue) then
//  Result := dat.TimeToSql(StrToTime(IvValue))

//else if dat.DateTimeIsValid(IvValue) then
//  Result := dat.DateTimeToSql(StrToDateTime(IvValue))

//else if VarIsType(IvValue, TBytes) then
//  Result := IvValue

  else
    Result := Trim(IvValue).QuotedString;
end;

class function  TSqlRec.SqlFilterRv(IvField, IvValue: string): string;

  {$REGION 'Help'}
  {
  sintax: [RvSqlFilter(FldAaa | complex-filter-str)]

  complex-filter-str can be:

  expression :
    ^                   field is blank (empty|spaces|tabs) (see last in yms code)
    #                   field is null                      (see last in yms code)
    $                   field is not null|empty|blank (remove records where value is null|empty|whitechar)
    value               secco
    value*              like
    value1,value2       in
    value1,value2*      C24A, K22B*    multy secco or like

  negated :
    ^ <expression>      ^ at beginning of the expression will negate the all elements

  +nulls :
    <expression> #      ' #' at the end of the expression will also add records with null values

  negated +nulls :
    ^ <expression> #    ^ C24A #   ;   ^ C24A* #   ;  ^ C24A, K22B* #
  }
  {$ENDREGION}

var
  a, b, w, x: string; // field, expression-cleaned, singletoken, final whereexpression
  n, m: boolean;      // negate, ornull
  v: TArray<string>;  // tokens
  i: integer;         // count
begin
  // zip
  a := Trim(IvField);
  b := Trim(TStrRec.StrReplace(IvValue, '*', '%')); // * --> %
  n := b.StartsWith('^ ');                          // if start with '^ ' then negate all after '^ ' i.e. ^ aaa,bbb*,ccc  -->  ^ at the beginning means "all" so both aaa and bbb* will be negated
  if n then Delete(b, 1, 2);                        // remove '^ '
  m := b.EndsWith(' #');                            // if end with ' #' a " or FldXxx is null" will be added
  if m then b := LeftStr(b, Length(b)-2);           // remove ' #'
  v := gvec.VecFromStr(b, ',', true);               // v[0]='C24A*' , v[1]='K22B*' , ...

  // loop
  x := '';
  for i := Low(v) to High(v) do begin
    w := v[i];

    if n then begin // ^ aaa,bbb*,ccc

      {$REGION 'Negate'}
               if w.Contains('%') then begin                      // not like
        x := x + ' and ' + Format('(%s not like ''%s'')', [a, w])
      end else                                                    // diverse
        x := x + ' and ' + Format('(%s != ''%s'')'      , [a, w])
      {$ENDREGION}

    end else begin // aaa,bbb*,ccc

      {$REGION 'Plain'}
               if w.Contains('%') then begin                      // like
        x := x + ' or  ' + Format('(%s like ''%s'')', [a, w])
      end else                                                    // equal
        x := x + ' or  ' + Format('(%s = ''%s'')', [a, w])
      {$ENDREGION}

    end;

  end;

  // remove 1st ' or  ' or ' and '
  Delete(x, 1, 5);

  // eventually add orisnull for the given field
  if m then
    x := x + ' or (' + a + ' is null)';

  // end
  Result := '(' + x + ')';

end;

class function  TSqlRec.SqlFilter(IvStrToSearch, IvFieldToSearchCsv, IvAdditionalExplicitFilter: string; IvUsePercent: boolean): string;
var
  i: integer;
  vec: {$IF COMPILERVERSION < 32.0} TStringDynArray {$ELSE} TArray<string> {$ENDIF}; // fieldvec
  fil: string;          // filter
begin
  // vector
  vec := TArray<string>(SplitString(IvFieldToSearchCsv, ',')); // 10.1
//vec := TStrRec.StrSplit(IvFieldToSearchCsv);                 // 11.0

  // filter
  fil := '(RvFld like ' + QuotedStr('*' + IvStrToSearch + '*') + ')';

  // decore
  for i := Low(vec) to High(vec) do
    vec[i] := StringReplace(fil, 'RvFld', vec[i], []); // integers could not be 'like', try CAST([FldId] as varchar(10))

  // build
  fil := vec[0];
  for i := Low(vec)+1 to High(vec) do
    if (fil <> '') and (vec[i] <> '') then
      fil := fil + ' OR ' + vec[i];

  // additionalexplicitfilter
  if not IvAdditionalExplicitFilter.IsEmpty then
    fil := '(' + fil + ') and (' + IvAdditionalExplicitFilter + ')';

  // **replace
  repeat
    fil := StringReplace(fil, '**', '*', [rfReplaceAll]);
  until {Pos('**', fil) = 0} not fil.Contains('**');

  // *replace
  if IvUsePercent then
    Result := StringReplace(fil, '*', '%', [rfReplaceAll])
  else
    Result := fil;
end;

class function  TSqlRec.SqlDistinct(IvTbl, IvFld, IvItemDefault: string): string;
var
  sql: string;
begin
  sql := Format('select distinct %s from %s order by 1', [IvFld, IvTbl]);
  Result := TDbaRec.CsvFromSql(sql, false);
  Result := TStrRec.StrReplace(Result, sLineBreak, ' | ');
  Result := TStrRec.StrReplace(Result, IvItemDefault, '('+IvItemDefault+')');
end;

class function  TSqlRec.SqlSelectFromTblObjectById(IvObject: string; IvId: integer): string;
begin
  Result := Format('select * from Dba%s.dbo.TblObject where FldId = %d', [IvObject, IvId]);
end;

class function TSqlRec.SqlSelectFromTblDetailById(IvObject: string; IvId: integer): string;
begin
  Result := Format('select * from Dba%s.dbo.Tbl%s where FldObjectId = %d', [IvObject, IvObject, IvId]);
end;
  {$ENDREGION}

  {$REGION 'TStaRec'}
class function TStaRec.Vector: TStiRecVec;
begin
  Result := [
    ACTIVE
  , CANCELLED
  , COMPLETED
  , DONE
  , INACTIVE
  , NEW
  , ONGOING
  , ONHOLD
  , PLANNED
  , TESTING
  , UNKNOWN
  , UNDERCONSTRUCTION
  , VALIDATED
  , VALIDATING
  ];
end;

class function TStaRec.IsActive(IvState: string): boolean;
begin
  Result := SameText(IvState, Active.Name);
end;

class function TStaRec.ColorW3FromState(IvState: string): string;
var
  i: TStiRec;
begin
  Result := 'black';
  for i in Vector do
    if i.Name = IvState then begin
    //Result := Format('w3-%s', [i.Color]);
      Result := i.Color;
      Break;
    end;
end;
  {$ENDREGION}

  {$REGION 'TStdRec'}
class function TStdRec.StdException(IvE: Exception): string;
begin
  Result := Format('EXCEPTION: %s', [IvE.Message.Replace('''', '`')]);
end;

class function TStdRec.StdException(IvEStr: string): string;
begin
  Result := Format('EXCEPTION: %s', [IvEStr]);
end;

class function TStdRec.StdInfo(IvInfo, IvInfo2, IvInfo3: string): string;
begin
  Result := Format('%s %s %s', [IvInfo, IvInfo2, IvInfo3]);
end;

class function TStdRec.StdNotImplemented(IvWhat: string): string;
begin
  Result := Format('%s %s', [IvWhat, NOT_IMPLEMENTED_STR]);
end;
  {$ENDREGION}

  {$REGION 'TStlRec'}
class function TStlRec.StlSort(IvStringList: TStringList; IvIndex1, IvIndex2: integer; IvAscending: integer): integer;
begin
  Result := -AnsiCompareText(IvStringList[IvIndex1], IvStringList[IvIndex2]); // negate the result so a descending sort is done
end;

class function TStlRec.StlSortAsc(IvStringList: TStringList; IvIndex1, IvIndex2: integer): integer;
begin
  Result := StlSort(IvStringList, IvIndex1, IvIndex2, 1);
end;

class function TStlRec.StlSortDesc(IvStringList: TStringList; IvIndex1, IvIndex2: integer): integer;
begin
  Result := StlSort(IvStringList, IvIndex1, IvIndex2, -1);
end;
  {$ENDREGION}

  {$REGION 'TStmRec'}
class procedure TStmRec.FromByteArray(const IvByteArray: TByteDynArray; IvStream: TStream);
var
  ptr: Pointer;
begin
  ptr := @IvByteArray[0];
  IvStream.Write(ptr^, Length(IvByteArray));
  IvStream.Position := 0; // IvStream.Seek(0, soFromBeginning);
end;

class function TStmRec.ToByteArray(IvStream: TMemoryStream): TByteDynArray;
var
  ptr: pointer;
begin
  SetLength(Result, IvStream.Size);
  ptr := @Result[0];
  IvStream.Position := 0;
//IvStream.Seek(0, soFromBeginning);
  IvStream.Read(ptr^, IvStream.Size);
end;
  {$ENDREGION}

  {$REGION 'TStrRec'}
class function  TStrRec.StrIs09(const IvString: string): boolean;
var
  p: PChar;
begin
  Result := false;
  p := PChar(IvString);
  while p^ <> #0 do begin
  //if not (p^ in ['0'..'9']) then
    if not CharInSet(p^, ['0'..'9']) then
      Exit;
    Inc(p);
  end;
  Result := true;
end;

class function  TStrRec.StrIsInteger(IvStr: string): boolean;
var
  int: integer;
begin
  Result := TryStrToInt(IvStr, int);
end;   

class function  TStrRec.StrIsFloat(const IvString: string): boolean;
var
  ext: extended;
begin
  Result := TryStrToFloat(IvString, ext);
end;

class function  TStrRec.StrIsNumeric(const IvString: string): boolean;
begin
  if IvString.IsEmpty then
    Result := false
  else
    Result := StrIsInteger(IvString) or StrIsFloat(IvString);
end;

class function  TStrRec.StrIsPath(IvStr: string): boolean;
begin
  Result := IvStr.Contains('/') or IvStr.Contains('\') or IvStr.Contains('.'); // should be more restrictive...
end;

class function  TStrRec.StrIsChars(IvStr: string; IvChar: char; var IvCount: integer): boolean;
var
  s: string;
begin
  s := StringReplace(IvStr, IvChar, ' ', [rfReplaceAll, rfIgnoreCase]);
  IvCount := Length(s);
  Result := (IvCount > 0) and (s.Trim = '');
end;

class function  TStrRec.StrIsShell(IvStr: string): boolean;
var
  e: boolean;       // equal
  l, a, z: integer; // len, idxstart, idxend
begin
  a := 1;
  l := Length(IvStr);
  e := true;
  repeat
  //if ansichar(IvStr[a]) in ['a'..'z', 'A'..'Z', '0'..'9'] then
    if CharInSet(IvStr[a], ['a'..'z', 'A'..'Z', '0'..'9']) then // ** topolina see: https://stackoverflow.com/questions/43360192/using-charinset-in-delphi-or-firemonkey ***
      break;
    z := l+1 - a;
    e := e and (IvStr[a] = IvStr[z]);
    if e then
      Inc(a);
  until (not e) or (a = l div 2);

  Result := a-1 >= 1; // like (...) | [...] | **...**
end;

class function  TStrRec.StrIsShelledWith(IvStr, IvChars: string): boolean;
begin
  Result := IvStr.StartsWith(IvChars) and IvStr.EndsWith(IvChars);
end;

class procedure TStrRec.StrInsertAt(var IvStr: string; const IvStrToInsert: string; IvAtPos: integer);
begin
  // adjust position if it is out of bounds
  if IvAtPos < 1 then
    IvAtPos := 1
  else if IvAtPos > Length(IvStr) + 1 then
    IvAtPos := Length(IvStr) + 1;
  // insert string at position
  Insert(IvStrToInsert, IvStr, IvAtPos);
end;

class function  TStrRec.StrLeft(IvStr: string; IvLen: integer): string;
begin
  Result := Copy(IvStr, 1, IvLen);
end;

class function  TStrRec.StrRight(IvStr: string; IvLen: integer): string;
begin
  if IvLen >= Length(IvStr) then
    Result := IvStr
  else
    Result := Copy(IvStr, Succ(Length(IvStr)) - IvLen, IvLen);
end;

class function  TStrRec.StrLeftOf(IvTag, IvString: string; IvTagInclude, IvCaseSensitive: boolean): string;
var
  str, tag: string;
begin
  if IvCaseSensitive then begin
    str := IvString;
    tag := IvTag;
  end else begin
    str := IvString.ToLowerInvariant;
    tag := IvTag.ToLowerInvariant;
  end;

  if not str.Contains(tag) then
    Result := IvString
  else
    Result := Copy(IvString, 1, Pos(tag, str)-1);

  if IvTagInclude then
    Result := Result + IvTag;
end;

class function  TStrRec.StrRightOf(IvTag, IvString: string; IvTagInclude, IvCaseSensitive, IvLast: boolean): string;
var
  str, tag: string;
  z, w, p: integer;
begin
  if IvCaseSensitive then begin
    str := IvString;
    tag := IvTag;
  end else begin
    str := IvString.ToLowerInvariant;
    tag := IvTag.ToLowerInvariant;
  end;

  z := Length(str);
  w := Length(tag);
  if IvLast then
    p := str.LastIndexOf(tag)+1 // 0-based
  else
    p := Pos(tag, str);
  if p = 0 then
    p := 1;

  Result := Copy(IvString, p+w, z-p+w-1);

  if IvTagInclude then
    Result := IvTag + Result;
end;

class function  TStrRec.StrBetween(IvTagLeft, IvTagRight, IvString: string; IvCaseSensitive: boolean): string;
begin
  Result := StrLeftOf(IvTagRight, StrRightOf(IvTagLeft, IvString, false, IvCaseSensitive, false), false, IvCaseSensitive);
end;

class function  TStrRec.StrIsBoxed(IvStr: string; var IvBoxA, IvBoxZ: char): boolean;
begin
  IvBoxA := '('; IvBoxZ := ')';
  Result := IvStr.StartsWith(IvBoxA) and IvStr.EndsWith(IvBoxZ);
  if Result then Exit;

  IvBoxA := '['; IvBoxZ := ']';
  Result := IvStr.StartsWith(IvBoxA) and IvStr.EndsWith(IvBoxZ);
  if Result then Exit;

  IvBoxA := '{'; IvBoxZ := '}';
  Result := IvStr.StartsWith(IvBoxA) and IvStr.EndsWith(IvBoxZ);
  if not Result then begin IvBoxA := #0; IvBoxZ := #0 end;
end;

class function  TStrRec.StrHas(IvStr, IvSubStr: string; IvCaseInsensitive: boolean): boolean;
begin
  if IvCaseInsensitive then
    Result := IvStr.ToLowerInvariant.Contains(IvSubStr.ToLowerInvariant)
  else
    Result := IvStr.Contains(IvSubStr);
end;

class function  TStrRec.StrHasRex(IvStr, IvRex: string; IvOpt: TRegExOptions): boolean;
begin
  Result := grex.RexHas(IvStr, IvRex, IvOpt);
end;

class function  TStrRec.StrHasWithOpt(IvString, IvSubString: string; IvWholeWord, IvMatchCase: boolean): boolean;
begin
  if IvWholeWord then begin
    if IvMatchCase then begin
       Result := TRegEx.IsMatch(IvString, '\b'+IvSubString+'\b', []); // 1stmatch
    end else begin
       Result := TRegEx.IsMatch(IvString, '\b'+IvSubString+'\b', [TRegExOption.roIgnoreCase]);
    end;

  end else begin
    if IvMatchCase then begin
       Result := Pos(IvSubString, IvString) > 0;
    end else begin
       Result := Pos(IvSubString.ToUpper, IvString.ToUpper) > 0;
    end;

  end;
end;

class function  TStrRec.StrOccurences(const IvString, IvSubString: string; IvWholeWord, IvMatchCase: boolean): integer;
var
  l0, l1, l2: integer;
begin
  if (IvString = '') or (IvSubString = '') or (StrPosWithOpt(IvString, IvSubString, IvWholeWord, IvMatchCase) = 0) then begin // posiscasesensitive
    Result := 0;
    Exit;
  end;

  l0 := Length(IvString);
  l1 := Length(IvSubString);
  l2 := Length(StrReplaceWithOpt(IvString, IvSubString, '', IvWholeWord, IvMatchCase)); // canbecasesensorinsens

  Result := (l0 - l2) div l1;
end;

class function  TStrRec.StrPosWithOpt(IvString, IvSubString: string; IvWholeWord, IvMatchCase: boolean): integer;
var
  mch: TMatch;
begin
  if IvWholeWord then begin

    if IvMatchCase then begin
       mch := TRegEx.Match(IvString, '\b'+IvSubString+'\b', []); // 1stmatch
    end else begin
       mch := TRegEx.Match(IvString, '\b'+IvSubString+'\b', [TRegExOption.roIgnoreCase]);
    end;
    Result := mch.Index;

  end else begin

    if IvMatchCase then begin
       Result := Pos(IvSubString, IvString);
    end else begin
       Result := Pos(IvSubString.ToUpper, IvString.ToUpper);
    end;

  end;
end;

class function  TStrRec.StrCapitalize(IvStr: string; IvAll: boolean): string;
const
  DELIMITERS = [#9, #10, #13, ' ', ',', '.', ':', ';', '"', '\', '/', '(', ')', '[', ']', '{', '}'];   
var
  i: integer;
begin
  Result := IvStr.Trim;
  if Result.IsEmpty then
    Exit;

  if IvAll then begin
    Result := Result.ToLower;
  //Result[1] := CharUpper(Result[1]);
    Result[1] := Result[1].ToUpper;
    for i := 2 to Length(Result) do
    //if Result[i-1] in DELIMITERS then
      if CharInSet(Result[i-1], DELIMITERS) then
      //Result[i] := CharUpper(Result[i]);
        Result[i] := Result[i].ToUpper;
  end else
    Result := Uppercase(Copy(IvStr, 1, 1)) + Lowercase(Copy(IvStr, 2, Length(IvStr))); // proper
end;

class function  TStrRec.StrCase(IvStr: string; IvCase: TCaseEnum): string;
begin
  case IvCase of
    cAsIs:
      Result := IvStr;
    cLower:
      Result := IvStr.ToLower;
    cUpper:
      Result := IvStr.ToUpper;
    cCapital:    
      Result := StrCapitalize(IvStr, false);
    cCapitalAll:            
      Result := StrCapitalize(IvStr, true);
  end;
end;

class function  TStrRec.StrCollapse(IvStr: string; IvCapitalize: boolean): string;
begin
  if IvCapitalize then
    Result := StrCapitalize(IvStr)
  else
    Result := IvStr;
  while Result.Contains(' ') do
    Result := Result.Replace(' ', '');
  while Result.Contains(#9) do
    Result := Result.Replace(#9, '');    
  while Result.Contains(#10) do
    Result := Result.Replace(#10, '');    
  while Result.Contains(#13) do
    Result := Result.Replace(#13, '');
end;

class function  TStrRec.StrExpand(IvStr, IvDelimiter: string{; IvCase: TCaseEnum}): string;
var                                                           
  p, c: char;       // prevchar, currchar
  i, j, k: integer; // count, prevcharord, currcharord
begin
  p := #0;
  Result := '';
  for i := 1 to Length(IvStr) do begin
    c := IvStr[i];
    j := Ord(p);
    k := Ord(c);
    if ( ( (47 < j) and (j < 58) ) or ( (96 < j) and (j < 123) ) )  and  ( (64 < k) and (k < 91) ) then // (numbers or minnuscole) and (maiuscole)
      Result := Result + IvDelimiter + c
    else if c = '_' then // nocollapse
      Result := Result + c
    else
      Result := Result + c;
    p := c;
  end;
  if IvDelimiter <> '_' then
    Result := StringReplace(Result, '_', '', [rfReplaceAll]);
end;

class function  TStrRec.StrCamelCaseFromVec(IvVec: TArray<string>): string;
var
  i: integer;
begin
  if Length(IvVec) = 0 then begin
    Result := '';
    Exit;
  end;
  Result := IvVec[Low(IvVec)].ToLower;
  for i := Low(IvVec)+1 to High(IvVec) do
    Result := Result + StrCapitalize(IvVec[i], false);
end;

class function  TStrRec.StrPascalCaseFromVec(IvVec: TArray<string>): string;
var
  s: string;
begin
  for s in IvVec do
    Result := Result + StrCapitalize(s, false);
end;

class function  TStrRec.StrCommentHas(IvStr, IvComment: string; out IvBlanks: integer): boolean;
var
  i: integer;
begin
  // iscommented
  Result := IvStr.Trim.StartsWith(IvComment);

  // count how many spaces are in front of the string
  IvBlanks := 0;
  for i := 1 to Length(IvStr) do
    if IvStr[i] = ' ' then
      Inc(IvBlanks)
    else
      Break;
end;

class function  TStrRec.StrCommentToggle(IvStr, IvComment: string; IvAtBegin, IvReplace: boolean): string;
var
  isc: boolean;      // iscommented
  blz, coz: integer; // blankscount, commentsignslen
  spa: string;       // spaceslikecommentsigns
begin
  // init
  Result := IvStr;
  coz := Length(IvComment);
  spa := StringOfChar(' ', coz);
  isc := StrCommentHas(Result, IvComment, blz);

  // commented --> remove#
  if isc then begin
    Delete(Result, blz+1, Length(IvComment));
    if IvReplace then
      StrInsertAt(Result, spa, blz+1);

  // notcommented --> add#       *** TBD ***
  end else begin
    // '#    aaa'
    if IvAtBegin then begin
      StrInsertAt(Result, IvComment, 1)

    // '    #aaa'
    end else begin
      StrInsertAt(Result, IvComment, blz+1);
    end;
  end;
end;

class function  TStrRec.StrCommentRemove(IvStr: string; IvPythonCommentRemove: boolean): string;
begin
  // zip
  Result := IvStr;

  // remove html <!-- -->
  if grex.RexHas(Result, grex.REX_HTML_COMMENT_PAT, [roIgnoreCase, roSingleLine]) then
    grex.RexReplace(Result, grex.REX_HTML_COMMENT_PAT, '', [roIgnoreCase, roSingleLine]);

  // remove sql --
  if grex.RexHas(Result, grex.REX_SQL_COMMENT_PAT , [roIgnoreCase, roMultiLine])  then
    grex.RexReplace(Result, grex.REX_SQL_COMMENT_PAT , '', [roIgnoreCase, roMultiLine]);

  // remove c style comments
  if grex.RexHas(Result, grex.REX_CPP_COMMENT_PAT , [roIgnoreCase, roMultiLine])  then
    grex.RexReplace(Result, grex.REX_CPP_COMMENT_PAT , '', [roIgnoreCase, roMultiLine]);

  // remove python #
  if IvPythonCommentRemove then
  if grex.RexHas(Result, grex.REX_PY_COMMENT_PAT  , [roIgnoreCase, roMultiLine])  then
    grex.RexReplace(Result, grex.REX_PY_COMMENT_PAT  , '', [roIgnoreCase, roMultiLine]);

  // remove [--Rv...()]
  if grex.RexHas(Result, grex.REX_RV_COMMENT_PAT  , [roIgnoreCase, roMultiLine])  then
    grex.RexReplace(Result, grex.REX_RV_COMMENT_PAT  , '', [roIgnoreCase, roMultiLine]);
end;

class function  TStrRec.StrDel(IvStr, IvStrOrCharToDelete: string): string;
begin
  Result := StrReplace(IvStr, IvStrOrCharToDelete, '');
end;

class function  TStrRec.StrEmptyLinesRemove(IvStr: string): string;
var
  i: integer;
  l: TStrings;
begin     
  // zip
  Result := IvStr;   

  // i
  //while Pos(Char(13)+Char(10)+Char(13)+Char(10), Result) > 0 do
    //Result := StringReplace(Result, Char(13)+Char(10)+Char(13)+Char(10), Char(13)+Char(10), [rfReplaceAll]);

  // ii
  //if grex.RexHas(Result, grex.REX_EMPTY_LINE_PAT2, [roSingleLine]) then
    //grex.RexReplace(Result, grex.REX_EMPTY_LINE_PAT2, sLineBreak, [roSingleLine]);

  // iii
  l := TStringList.Create;
  l.Text := Result;
  try
    for i := l.count - 1 downto 0 do begin
      if Trim(l[i]) = '' then
        l.Delete(i);
    end;
    Result := Trim(l.Text); // trim to remove the extra crlf at the end added by stringlist
  finally
    FreeAndNil(l);
  end;
end;

class function  TStrRec.StrRemoveFirst(IvStr: string; IvCharCount: integer): string;
begin
  Result := IvStr.Remove(0, IvCharCount);
end;

class function  TStrRec.StrRemoveLast(IvStr: string; IvCharCount: integer): string;
begin
  Result := IvStr.Remove(Length(IvStr) - IvCharCount);
end;

class function  TStrRec.StrReplace(IvStr, IvOut, IvIn: string): string;
begin
  Result := StringReplace(IvStr, IvOut, IvIn, [rfReplaceAll, rfIgnoreCase]);
end;

class function  TStrRec.StrReplaceWithOpt(IvString, IvStrOut, IvStrIn: string; IvWholeWord, IvMatchCase: boolean): string;
begin
  if IvWholeWord then begin
    if IvMatchCase then begin
       Result := TRegEx.Replace(IvString, '\b'+IvStrOut+'\b', IvStrIn, []);
    end else begin
       Result := TRegEx.Replace(IvString, '\b'+IvStrOut+'\b', IvStrIn, [TRegExOption.roIgnoreCase]);
    end;

  end else begin
    if IvMatchCase then begin
       Result := {System.AnsiStrings.}StringReplace(IvString, IvStrOut, IvStrIn, [rfReplaceAll]);
    end else begin
       Result := {System.AnsiStrings.}StringReplace(IvString, IvStrOut, IvStrIn, [rfIgnoreCase, rfReplaceAll]);
    end;

  end;
end;

class function  TStrRec.StrReplicate(IvStr: string; IvN: integer): string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to IvN-1 do
    Result := Result + IvStr;
end;

//class function  TStrRec.StrSplitB(IvString, IvDelimiters: string): TStringDynArray;
//begin
//  Result := SplitString(IvString, IvDelimiters);
//end;

class function  TStrRec.StrShellIt(IvStr, IvStartEndStr: string): string;
begin
  Result := IvStartEndStr + IvStr + IvStartEndStr;
end;

class function  TStrRec.StrUnShell(IvStr: string): string;
begin
  Result := IvStr;
  while StrIsShell(Result) do begin
    Delete(Result, 1, 1);
    Delete(Result, Length(Result), 1);
  end;
end;

class function  TStrRec.StrUnBox(IvStr: string): string;
var
  a, z: char;
begin
  Result := IvStr;
  while StrIsBoxed(Result, a, z) do begin
    Delete(Result, 1, 1);
    Delete(Result, Length(Result), 1);
  end;
end;

class function  TStrRec.StrShellThick(IvStr: string): integer;
var
  s: string;
  e: boolean;       // equal
  l, a, z: integer; // len, idxstart, idxend
begin
  s := IvStr;
  a := 1;
  l := Length(IvStr);
  e := true;
  repeat
  //if ansichar(IvStr[a]) in ['a'..'z', 'A'..'Z', '0'..'9'] then
    if CharInSet(IvStr[a], ['a'..'z', 'A'..'Z', '0'..'9']) then // ** topolina see: https://stackoverflow.com/questions/43360192/using-charinset-in-delphi-or-firemonkey ***
      break;
    z := l+1 - a;
    e := e and (IvStr[a] = IvStr[z]);
    if e then
      Inc(a);
  until (not e) or (a > l div 2);
  Result := a - 1;
end;

class function  TStrRec.StrSafe(IvStr: string): string;
begin
  Result := StrCapitalize(IvStr);
  Result := StrClean(Result);
end;

class function  TStrRec.StrShellChrs(IvStr: string): string;
begin
  Result := '';
  while StrIsShell(IvStr) do begin
    Result := Result + IvStr[1];
    Delete(Result, 1, 1);
    Delete(Result, Length(Result), 1);
  end;
end;

class function  TStrRec.StrWordAppend(IvStr, IvWord: string): string;
begin
  if IvStr.IsEmpty then
    Result := IvWord
  else
    Result := IvStr + ' ' + IvWord;
end;

class function  TStrRec.StrKeep(IvStr: string; const IvCharToKeepSet: TSysCharSet): string;
begin
  Result := string(JclAnsiStrings.StrKeepChars(ansistring(IvStr), IvCharToKeepSet));
end;

class function  TStrRec.StrClean(IvStr: string): string;
begin
  Result := string(JclAnsiStrings.StrKeepChars(ansistring(IvStr), ['A'..'Z', 'a'..'z', ' ']));
end;

class function  TStrRec.StrCoalesce(IvStrVector: TArray<string>; IvDefault: string): string;
var
  str: string;
begin
  for str in IvStrVector do
    if not str.IsEmpty then begin
      Result := str;
      Break;
    end;
  if Result.IsEmpty then
    Result := IvDefault;
end;

class function TStrRec.StrConcat(IvStrVector: TArray<string>; IvDelimiter: string): string;
var
  str: string;
begin
  Result := '';
  for str in IvStrVector do
    Result := Result + IvDelimiter + str;
end;
  {$ENDREGION}

  {$REGION 'TSvcRec'}
class function TSvcRec.ServiceName(IvName: string): string;
begin
  Result := Format('Wks%sService', [IvName]);
end;

class function TSvcRec.DisplayName(IvName: string): string;
begin
  Result := Format('WKS %s Service', [IvName]);
end;

class function TSvcRec.ExePath(IvName: string): string;
begin
  Result := Format('%s\Wks%sServiceProject.exe', [TBynRec.BinaryDir, IvName]);
end;
  {$ENDREGION}

  {$REGION 'TSynRec'}
{class} procedure TSynRec.Setup(IvSynEdit: TCustomSynEdit; IvTabWidth: integer; IvCodKind: TCodKindEnum; IvFoldingLineShow: boolean);
begin
  // set before calling ScanForFoldRanges
  CodeKind := IvCodKind;

  // common
//IvSynEdit.FontSmoothing                     := fsmClearType;
  IvSynEdit.WantTabs                          := true;
  IvSynEdit.TabWidth                          := IvTabWidth;
  IvSynEdit.Options                           := IvSynEdit.Options + [eoAltSetsColumnMode];
  IvSynEdit.Options                           := IvSynEdit.Options - [eoScrollPastEol];
  IvSynEdit.Options                           := IvSynEdit.Options + [eoTabIndent];
  IvSynEdit.ActiveLineColor                   := clYellow;
//IvSynEdit.RightEdge                         := 0;

  // highlighter
  IvSynEdit.Highlighter                       := Highlighter(IvSynEdit.Owner, IvCodKind);

  // gutter
  {$IF COMPILERVERSION > 32.0}
  IvSynEdit.Gutter.TrackChanges.Visible       := true;
//IvSynEdit.Gutter.ShowLineNumbers            := true;
//IvSynEdit.Gutter.CodeFolding.Visible        := true;
//IvSynEdit.Gutter.CodeFolding.Collapsed      := false;
  {$ENDIF}

  // folding
  IvSynEdit.OnScanForFoldRanges               := ScanForFoldRanges;
  IvSynEdit.CodeFolding.ShowCollapsedLine     := IvFoldingLineShow;
  if IvFoldingLineShow then
    IvSynEdit.CodeFolding.CollapsedLineColor  := $F0F0F0;
//IvSynEdit.CodeFolding.FolderBarLinesColor   := clFuchsia;
  IvSynEdit.CodeFolding.ShowHintMark          := false;
  IvSynEdit.UseCodeFolding                    := false;
  IvSynEdit.UseCodeFolding                    := true;
end;

{class} procedure TSynRec.CharOnOff(IvSynEdit: TCustomSynEdit; IvOn: boolean);
begin
  if IvOn then
    IvSynEdit.Options := IvSynEdit.Options + [eoShowSpecialChars]
  else
    IvSynEdit.Options := IvSynEdit.Options - [eoShowSpecialChars];
end;

{class} function  TSynRec.PositionPoint(IvSynEdit: TCustomSynEdit; IvColumn, IvLine: integer): TPoint;
begin
  Result := IvSynEdit.ClientToScreen(
    IvSynEdit.RowColumnToPixels(
      IvSynEdit.BufferToDisplayPos(
        BufferCoord(IvColumn, IvLine)
      )
    )
  );
end;

{class} procedure TSynRec.SearchPrev(IvSynEdit: TCustomSynEdit; IvString: string);
begin
  SearchNext(IvSynEdit, IvString);
end;

{class} procedure TSynRec.SearchNext(IvSynEdit: TCustomSynEdit; IvString: string);
var
  {s, l,} f: LongInt; // searchstart, searchlength, foundat
begin
  // searchstart (begin after the current selection if there is one otherwise begin at start)
//  if IvSynEdit.SelLength <> 0 then
//    s := IvSynEdit.SelStart + IvSynEdit.SelLength
//  else
//    s := 0;

  // searchlength is the length from searchstart to the end of the text
//l := IvSynEdit.Length(Text) - s;

  // foundat i
//f := System.Pos(IvString, IvSynEdit.Text, s); // *** not working if s=0 ***

  // foundat ii
//SynEdit.SearchEngine.Pattern := IvString;
//f := SynEdit.SearchEngine.FindAll('Pippo'); // f := FindText(IvString, s, l, [stWholeWord, stMatchCase]); // ReSearch(DBMemoValue.Text, IvString, s, f, m);

  // foundat iii
  f := IvSynEdit.SearchReplace(IvString, '', []); // if do not specify the "replace flag", then it is a search

  // do
  if f > 0 then begin
    IvSynEdit.SetFocus;
    IvSynEdit.SelStart := f - 1;
    IvSynEdit.SelLength := Length(IvString);
  end else begin
    Beep;
  //mes.IFmt('%s not found, restart from beginning', [IvString]);
    IvSynEdit.SelStart := 0;
    IvSynEdit.SelLength := 0;
  end;

//SendMessage(IvSynEdit.Handle, EM_SCROLLCARET, 0, 0); // Perform(EM_SCROLLCARET, 0, 0);
end;

{class} procedure TSynRec.KeyUp(IvSynEdit: TCustomSynEdit{; var IvSearch: string}; IvCodeKindEnum: TCodKindEnum; var Key: Word; Shift: TShiftState);
var
  ses, sel{, coz, blz}: longint; // selectionstart, selectionlength, codecommentlen, blankscount
  lin, com{, spa}: string;  // linetextcurrent, codecommentchar(s), space(s)
begin
  // CRTL+SHIFT
  if Shift*[ssShift, ssCtrl] = [ssShift, ssCtrl] then begin

    // +f = searchbackward
             if Key = vkF then begin
      gsyg.Backwards := true;
      SearchReplaceDo(Focused, gsyg, false);

    // +u capitalizeallwords
    end else if Key = vkU then begin
      ses := IvSynEdit.SelStart;
      sel := IvSynEdit.SelLength;
      IvSynEdit.SelText := TStrRec.StrCapitalize(IvSynEdit.SelText, true);
      IvSynEdit.SelStart := ses;
      IvSynEdit.SelLength := sel;
    end;

  // CRTL
  end else if Shift*[ssCtrl] = [ssCtrl] then begin

    // +a = selectall
             if Key = vkA then begin
      IvSynEdit.SelStart := 0;
      IvSynEdit.SelLength := Length(IvSynEdit.Text);

    // +f = searchforward
    end else if Key = vkF then begin
      gsyg.Backwards := false;
      SearchReplaceDo(Focused, gsyg, false);

    // +o = gohome
    end else if Key = vkHome then begin
      IvSynEdit.SelStart := 0;
      IvSynEdit.SelLength := 0;

    // +e = goend
    end else if Key = vkEnd then begin
      IvSynEdit.SelStart := Length(IvSynEdit.Text) - 1;
      IvSynEdit.SelLength := 0;

    // +/ comments
    end else if Key in [vkSlash] then begin // slash interfere with [REGION]
      lin := LineCurrentText(IvSynEdit);
      com := TCodRec.CommentStr(IvCodeKindEnum);  // -- or // or # or ...
    //coz := Length(com);
      lin := TStrRec.StrCommentToggle(lin, com, false, false);
      LineCurrentTextSet(IvSynEdit, lin);
      IvSynEdit.CaretX := 0;
      IvSynEdit.CaretY := IvSynEdit.CaretY + 1;

    // +. comments (consider/replace spaces)
    end else if Key in [vkPeriod] then begin
      lin := LineCurrentText(IvSynEdit);
      com := TCodRec.CommentStr(IvCodeKindEnum);  // -- or // or # or ...
      lin := TStrRec.StrCommentToggle(lin, com, false, true);
      LineCurrentTextSet(IvSynEdit, lin);
      IvSynEdit.CaretX := 0;
      IvSynEdit.CaretY := IvSynEdit.CaretY + 1;

    // letterscase
    end else if Key in [vkL, vkU] then begin
      ses := IvSynEdit.SelStart;
      sel := IvSynEdit.SelLength;
      // +l --> lower
           if Key = vkL then IvSynEdit.SelText := LowerCase(IvSynEdit.SelText)

      // +u --> upper
      else if Key = vkU then IvSynEdit.SelText := UpperCase(IvSynEdit.SelText);

      IvSynEdit.SelStart := ses;
      IvSynEdit.SelLength := sel;
    end;
  end;
end;

{class} procedure TSynRec.SearchReplaceFormShow(IvSynEdit: TCustomSynEdit; var IvGlobalSearch: TSygRec; IvReplace: boolean);
var
  d: TSearchForm; // dialogform, this will work also for TReplaceForm because it is a descendent !!!
begin
  // exit
  if not Assigned(IvSynEdit) then begin
    TMesRec.W('Not a valid SynEdit control, please try a different text control');
    Exit;
  end;

  //Statusbar.SimpleText := '';

  // dialogkind
  if IvReplace then
    d := TReplaceForm.Create(nil)
  else
    d := TSearchForm.Create(nil);

  // position
  d.Top := 0;
  d.Left := Screen.Width - d.Width + 3;

  try
    // assignsearchoptions
    d.CaseSensitive   := IvGlobalSearch.CaseSensitive;
    d.WholeWord       := IvGlobalSearch.WholeWord;
    d.SearchFromCaret := IvGlobalSearch.SearchFromCaret;
    d.SelectionOnly   := IvGlobalSearch.SelectionOnly;
    d.RegEx           := IvGlobalSearch.RegEx;
    d.Backwards       := IvGlobalSearch.Backwards;

    // assignsearchtext, if something is selected in a single row search for that text
    if IvSynEdit.SelAvail and (IvSynEdit.BlockBegin.Line = IvSynEdit.BlockEnd.Line) then
      d.SearchText    := IvSynEdit.SelText
    // start with last search text
    else
      d.SearchText    := IvGlobalSearch.SearchText; // IvSynEdit.GetWordAtRowCol(IvSynEdit.CaretXY);
    d.SearchHistory   := IvGlobalSearch.SearchHistory;

    // assignreplacetext
    if IvReplace then with d as TReplaceForm do begin
      ReplaceText     := IvGlobalSearch.ReplaceText;
      ReplaceHistory  := IvGlobalSearch.ReplaceHistory;
    end;

    // showdialogform
    if d.ShowModal = mrOK then begin
      IvGlobalSearch.CaseSensitive    := d.CaseSensitive;
      IvGlobalSearch.WholeWord        := d.WholeWord;
      IvGlobalSearch.SearchFromCaret  := d.SearchFromCaret;
      IvGlobalSearch.SelectionOnly    := d.SelectionOnly;
      IvGlobalSearch.Regex            := d.RegEx;
      IvGlobalSearch.Backwards        := d.Backwards;
      IvGlobalSearch.SearchText       := d.SearchText;
      IvGlobalSearch.SearchHistory    := d.SearchHistory;
      if IvReplace then with d as TReplaceForm do begin
        IvGlobalSearch.ReplaceText    := ReplaceText;
        IvGlobalSearch.ReplaceHistory := ReplaceHistory;
      end;
      if IvGlobalSearch.SearchText <> '' then begin
        SearchReplaceDo(IvSynEdit, IvGlobalSearch, IvReplace);
      end;
    end;
  finally
    FreeAndNil(d);
  end;
end;

{class} procedure TSynRec.SearchReplaceDo(IvSynEdit: TCustomSynEdit; var IvGlobalSearch: TSygRec; IvReplace: boolean);
var
  opt: TSynSearchOptions; // options
//b, e: integer;
begin
  // options
  if IvReplace then
    opt := [ssoPrompt, ssoReplace, ssoReplaceAll]
  else
    opt := [];
  if IvGlobalSearch.CaseSensitive       then Include(opt, ssoMatchCase);
  if IvGlobalSearch.WholeWord           then Include(opt, ssoWholeWord);
  if IvGlobalSearch.Backwards           then Include(opt, ssoBackwards);
  if not IvGlobalSearch.SearchFromCaret then Include(opt, ssoEntireScope);
  if IvGlobalSearch.SelectionOnly       then Include(opt, ssoSelectedOnly);
  if IvGlobalSearch.RegEx               then IvSynEdit.SearchEngine := SynEditRegexSearch
                                        else IvSynEdit.SearchEngine := SynEditSearch;
  // assignsearchtext
  //if IvGlobalSearch.SearchText = '' then
    if IvSynEdit.SelAvail and (IvSynEdit.BlockBegin.Line = IvSynEdit.BlockEnd.Line) then
      IvGlobalSearch.SearchText := IvSynEdit.SelText;

  // searchreplace
  if IvSynEdit.SearchReplace(IvGlobalSearch.SearchText, IvGlobalSearch.ReplaceText, opt) = 0 then begin
    MessageBeep(MB_ICONASTERISK);
  //mes.IFmt('"%s" %s', [IvGlobalSearch.SearchText, NOT_FOUND_STR.ToLower]); //Statusbar.SimpleText := NOT_FOUND;
//    b := IvSynEdit.SelStart;
//    e := IvSynEdit.SelEnd;
//    IvGlobalSearch.Backwards := not IvGlobalSearch.Backwards;
//    SearchReplaceDo(IvSynEdit, IvGlobalSearch, IvReplace);
//    if ssoBackwards in o{not IvGlobalSearch.Backwards} then begin
    //IvSynEdit.CaretXY  := IvSynEdit.BlockEnd;
//      IvSynEdit.SelStart := b;
//      IvSynEdit.SelEnd   := e;
//    end else begin
//      IvSynEdit.CaretXY  := IvSynEdit.BlockBegin;
//      IvSynEdit.SelStart := b;
//      IvSynEdit.SelEnd   := e;
//    end;
  end;

  // ???
  if ReplaceConfirmForm <> nil then
    FreeAndNil(ReplaceConfirmForm);
end;

{class} procedure TSynRec.OnReplaceText(IvSynEdit: TCustomSynEdit; const ASearch, AReplace: string; Line, Column: Integer; var Action: TSynReplaceAction);
var
  p: TPoint;
  r: Winapi.Windows.TRect; // editorrect
begin
  if ASearch = AReplace then
    Action := raSkip // nothing to replace, they are equal

  else begin
    p := PositionPoint(IvSynEdit, Column, Line);
    r := IvSynEdit.ClientRect;
    r.TopLeft     := IvSynEdit.ClientToScreen(r.TopLeft);
    r.BottomRight := IvSynEdit.ClientToScreen(r.BottomRight);

    if ReplaceConfirmForm = nil then
      ReplaceConfirmForm := TReplaceConfirmForm.Create(Application);
    ReplaceConfirmForm.PrepareShow(r, p.X, p.Y, p.Y + IvSynEdit.LineHeight, ASearch, AReplace);

    case ReplaceConfirmForm.ShowModal of
      mrYes        : Action := raReplace;
      mrNo         : Action := raSkip;
      mrYesToAll   : Action := raReplaceAll;
      else           Action := raCancel;
    end;
  end;
end;

{class} procedure TSynRec.InsertTextAtCaret(IvSynEdit: TCustomSynEdit; IvString: string);
begin
//IvSynEdit.InsertBlock(IvSynEdit.CaretXY   , IvSynEdit.CaretXY , PWideChar(IvString), true);
//IvSynEdit.InsertBlock(IvSynEdit.BlockBegin, IvSynEdit.BlockEnd, PWideChar(IvString), true);

  ggui.SelLength := IvSynEdit.SelStart + Length(IvString);
  IvSynEdit.SelText := IvString;
end;

{class} procedure TSynRec.InsertHeader(IvSynEdit: TCustomSynEdit);
var
  c, m: string; // content, comment
begin
  m := TCodRec.Vector[IvSynEdit.Tag].Comm;
  if m.Length = 1 then
    m := m + m;
  c := StringReplace(TCodRec.HEADER_BLOCK_TEMPLATE, '~~', m, [rfReplaceAll]);
  c := grva.Rva(c);

  // pas?
  if IvSynEdit.Tag = Ord(TCodRec.PAS.Tag) then begin
    c := c.Replace('//[', '{$');
    c := c.Replace(']', '}');
  end;

  InsertTextAtCaret(IvSynEdit, c);
end;

{class} procedure TSynRec.InsertRegion(IvSynEdit: TCustomSynEdit);
var
  con, com: string; // content, comment
begin
  com := TCodRec.Vector[IvSynEdit.Tag].Comm;
  if com.Length = 1 then
    com := com + com;
  con := StringReplace(TCodRec.FOLDING_BLOCK_TEMPLATE, '~~', com, [rfReplaceAll]);

  // pas?
  if IvSynEdit.Tag = Ord(TCodRec.PAS.Tag) then begin
    con := con.Replace('//[', '{$');
    con := con.Replace(']', '}');
  end;

  InsertTextAtCaret(IvSynEdit, con);
end;

{class} procedure TSynRec.RegionCollapse(IvSynEdit: TCustomSynEdit);
begin
  IvSynEdit.CollapseFoldType(FoldRegionType);
end;

{class} procedure TSynRec.RegionExpand(IvSynEdit: TCustomSynEdit);
begin
  IvSynEdit.UnCollapseFoldType(FoldRegionType);
end;

{class} procedure TSynRec.InsertSection(IvSynEdit: TCustomSynEdit);
var
  con, com: string; // content, comment
begin
  com := TCodRec.Vector[IvSynEdit.Tag].Comm;
  if com.Length = 1 then
    com := com + com;
  con := StringReplace(TCodRec.SECTION_BLOCK_TEMPLATE, '~~', com, [rfReplaceAll]);
  InsertTextAtCaret(IvSynEdit, con);
end;

{class} procedure TSynRec.InsertContentTemplate(IvSynEdit: TCustomSynEdit);
var
  c: string; // content
begin
  c := TCodRec.Vector[IvSynEdit.Tag].ContentTemplate;
  c := grva.Rva(c);
  InsertTextAtCaret(IvSynEdit, c);
end;

{class} procedure TSynRec.InsertJsonTemplate(IvSynEdit: TCustomSynEdit);
var
  c: string; // content
begin
  c := TCodRec.Vector[IvSynEdit.Tag].JsonTemplate;
  c := grva.Rva(c);
  InsertTextAtCaret(IvSynEdit, c);
end;

{class} procedure TSynRec.ScanForFoldRanges(Sender: TObject; TopFoldRanges: TSynFoldRanges; LinesToScan: TStrings; FromLine, ToLine: Integer);
var
  r, a, b: string; // row, startboundary, endboundary
  i: integer;
begin
  // regionskind
           if CodeKind in [ckJava, ckJs, ckJsl] then begin
    a := '\/\/\[REGION ''.*''\]';                                               // //[REGION 'abc']
    b := '\/\/\[ENDREGION\]';                                                   // //[ENDREGION]

  end else if CodeKind = ckCss  then begin
    a := '\/\*\[REGION ''.*''\]\*\/';                                           // /*[REGION 'abc']*/
    b := '\/\*\[ENDREGION\]\*\/';                                               // /*[ENDREGION]*/

  end else if CodeKind in [ckHtml] then begin
    a := '<!--\[REGION ''.*''\]-->';                                            // <!--[REGION 'abc']-->
    b := '<!--\[ENDREGION\]-->';                                                // <!--[ENDREGION]-->

  end else if CodeKind in [ckDws, ckPas] then begin
    a := '{$REGION ''.*''}';                                                    // {REGION 'abc'}
    b := '{$ENDREGION}';                                                        // {ENDREGION}

  end else if CodeKind in [ckPy, ckR, ckYaml]  then begin
    a := '##\[REGION ''.*''\]';                                                 // ##[REGION 'abc']
    b := '##\[ENDREGION\]';                                                     // ##[ENDREGION]

  end else begin  // ckJson, ckSql, ckTxt
    a := '--\[REGION ''.*''\]';                                                 // --[REGION 'abc']
    b := '--\[ENDREGION\]';                                                     // --[ENDREGION]
  end;

  // scan
  for i := FromLine to ToLine do begin
    // row
    r := LinesToScan[i];

    // region boundaries start
    if TRegEx.IsMatch(r, a)  then begin
      TopFoldRanges.StartFoldRange(i + 1, FoldRegionType);
      Continue;

    // region boundaries stop
    end else if TRegEx.IsMatch(r, b) then begin
      TopFoldRanges.StopFoldRange(i + 1, FoldRegionType);
      Continue;
    end;
  end;
end;

{class} function  TSynRec.Focused: TCustomSynEdit;
begin
  Result := nil;
  if Screen.ActiveControl is TCustomSynEdit then
    Result := Screen.ActiveControl as TCustomSynEdit;
end;

{class} function  TSynRec.Highlighter(IvOwner: TComponent; IvCodeKindEnum: TCodKindEnum): TSynCustomHighlighter;
begin
           if IvCodeKindEnum = ckBat  then begin
    Result := TSynBatSyn.Create(IvOwner);
    with Result as TSynBatSyn do begin
      CommentAttri.Foreground             := clMedGray;    // ::
      CommentAttri.Style                  := [fsItalic];
      IdentifierAttri.Foreground          := clBlue;       // "id":
      KeyAttri.Foreground                 := clMaroon;     //
      KeyAttri.Style                      := [fsBold];
      NumberAttri.Foreground              := clRed;
      VariableAttri.Foreground            := clOlive;
    end;

  end else if IvCodeKindEnum = ckCss  then begin
    Result := TSynCssSyn.Create(IvOwner);
    with Result as TSynCssSyn do begin
      AttributeAttri.Foreground           := clOlive;      //
      ColorAttri.Foreground               := clLime;       //
      CommentAttri.Foreground             := clMedGray;    // /**/
      CommentAttri.Style                  := [fsItalic];
      ImportantPropertyAttri.Foreground   := clGreen;      //
      NumberAttri.Foreground              := clFuchsia;    // 123, 123.4
      PropertyAttri.Foreground            := clBlue;       //
      SelectorAttri.Foreground            := clMaroon;     // .wks-centered
      StringAttri.Foreground              := clRed;        // "abc"
      SymbolAttri.Foreground              := clPurple;     // [] {} ...
      SymbolAttri.Style                   := [fsBold];
      TextAttri.Foreground                := clBlack;      //
      undefPropertyAttri.Foreground       := clSkyBlue;    //
      ValueAttri.Foreground               := clTeal;       // ipx solod red
    end;

  end else if IvCodeKindEnum = ckDws  then begin
    Result := TSynDwsSyn.Create(IvOwner);
    with Result as TSynDwsSyn do begin
      CommentAttri.Foreground             := clMedGray;    //
      CommentAttri.Style                  := [fsItalic];
    end;

  end else if IvCodeKindEnum = ckHtml then begin
    Result := TSynHTMLSyn.Create(IvOwner);
    with Result as TSynHTMLSyn do begin
      AndAttri.Foreground                 := clLime;       //
      CommentAttri.Foreground             := clMedGray;    // <!-- -->
      CommentAttri.Style                  := [fsItalic];
      IdentifierAttri.Foreground          := clBlue;       // "id":
      KeyAttri.Foreground                 := clMaroon;     //
      KeyAttri.Style                      := [fsBold];
      SymbolAttri.Foreground              := clPurple;     // [] {} ...
      SymbolAttri.Style                   := [fsBold];
      TextAttri.Foreground                := clBlack;      //
      UndefKeyAttri.Foreground            := clMaroon;     //
      UndefKeyAttri.Style                 := [fsBold];
      ValueAttri.Foreground               := clTeal;       //
    end;

  end else if IvCodeKindEnum = ckJava then begin
    Result := TSynJavaSyn.Create(IvOwner);
    with Result as TSynJavaSyn do begin
      CommentAttri.Foreground             := clMedGray;    // // /* */
      CommentAttri.Style                  := [fsItalic];
    end;

  end else if IvCodeKindEnum = ckJs   then begin
    Result := TSynJScriptSyn.Create(IvOwner);
    with Result as TSynJScriptSyn do begin
      CommentAttri.Foreground             := clMedGray;    // // /**/
      CommentAttri.Style                  := [fsItalic];
      EventAttri.Foreground               := clGreen;      // ?
      IdentifierAttri.Foreground          := clBlue;       // "id":
      KeyAttri.Foreground                 := clMaroon;     //
      KeyAttri.Style                      := [fsBold];
      NonReservedKeyAttri.Foreground      := clNavy;       // ?
      NumberAttri.Foreground              := clFuchsia;    // 123, 123.4
      StringAttri.Foreground              := clRed;        // "abc"
      SymbolAttri.Foreground              := clPurple;     // [] {} ...
      SymbolAttri.Style                   := [fsBold];
    end;

  end else if IvCodeKindEnum = ckJsl  then begin
    Result := TSynCppSyn.Create(IvOwner);
    with Result as TSynCppSyn do begin
      CommentAttri.Foreground             := clMedGray;    // // /**/
      CommentAttri.Style                  := [fsItalic];
    end;

  end else if IvCodeKindEnum = ckJson then begin
    Result := TSynJSONSyn.Create(IvOwner);
    with Result as TSynJSONSyn do begin
      AttributeAttri.Foreground           := clBlue;       // "id":
      NumberAttri.Foreground              := clFuchsia;    // 123, 123.4
      ReservedAttri.Foreground            := clTeal;       //
      SymbolAttri.Foreground              := clPurple;     // [] {} ...
      SymbolAttri.Style                   := [fsBold];
      ValueAttri.Foreground               := clRed;        // "abc"
    end;

  end else if IvCodeKindEnum = ckPas  then begin
    Result := TSynPasSyn.Create(IvOwner);
    with Result as TSynPasSyn do begin
      CommentAttri.Foreground             := clMedGray;    // // {} (**)
      CommentAttri.Style                  := [fsItalic];
    end;

  end else if IvCodeKindEnum = ckPy   then begin
    Result := TSynPythonSyn.Create(IvOwner);
    with Result as TSynPythonSyn do begin
      CommentAttri.Foreground             := clMedGray;    // #
      CommentAttri.Style                  := [fsItalic];
      DocStringAttri.Foreground           := clMoneyGreen; // """ """
      ErrorAttri.Foreground               := clLime;       // "abc"
      FloatAttri.Foreground               := clFuchsia;    // 123.4
      HexAttri.Foreground                 := clFuchsia;    //
      IdentifierAttri.Foreground          := clBlue;       // "id":
      KeyAttri.Foreground                 := clMaroon;     //
      KeyAttri.Style                      := [fsBold];
      NonKeyAttri.Foreground              := clOlive;      //
      NumberAttri.Foreground              := clFuchsia;    // 123
      OctalAttri.Foreground               := clFuchsia;    //
      StringAttri.Foreground              := clRed;        // "abc"
      SymbolAttri.Foreground              := clPurple;     // [] {} ...
      SymbolAttri.Style                   := [fsBold];
      SystemAttri.Foreground              := clSkyBlue;    //
    end;

  end else if IvCodeKindEnum = ckR  then begin
    Result := TSynRSyn.Create(IvOwner);
    with Result as TSynRSyn do begin
      CommentAttri.Foreground             := clMedGray;    // ##
      CommentAttri.Style                  := [fsItalic];
    end;

  end else if IvCodeKindEnum = ckSql then begin
    Result := TSynSQLSyn.Create(IvOwner);
    with Result as TSynSQLSyn do begin
      CommentAttri.Foreground             := clMedGray;    // --
      CommentAttri.Style                  := [fsItalic];
      ConditionalCommentAttri.Foreground  := clMedGray;    //
      DataTypeAttri.Foreground            := clGreen;      //
      DefaultPackageAttri.Foreground      := clAqua;       //
      DelimitedIdentifierAttri.Foreground := clTeal;       //
      ExceptionAttri.Foreground           := clYellow;     //
      FunctionAttri.Foreground            := clLime;       //
      IdentifierAttri.Foreground          := clBlue;       // "id":
      KeyAttri.Foreground                 := clMaroon;     //
      KeyAttri.Style                      := [fsBold];
      NumberAttri.Foreground              := clFuchsia;    // 123, 123.4
      PLSQLAttri.Foreground               := clYellow;     //
      SQLPlusAttri.Foreground             := clYellow;     //
      StringAttri.Foreground              := clRed;        // 'abc'
      SymbolAttri.Foreground              := clNavy;       // [] {} ...
      SymbolAttri.Style                   := [fsBold];
      TableNameAttri.Foreground           := clGray;       //
      VariableAttri.Foreground            := clOlive;      //
    end;

  end else if IvCodeKindEnum = ckYaml then begin
    Result := TSynYAMLSyn.Create(IvOwner);
    with Result as TSynYAMLSyn do begin
      CommentAttri.Foreground             := clMedGray;    // #
      CommentAttri.Style                  := [fsItalic];
      AnchorAttri.Foreground              := clMaroon;     // &xxx
      AnchorAttri.Style                   := [fsBold];
      DirectiveAttri.Foreground           := clGreen;      // ?
      DocDelimiterAttri.Foreground        := clPurple;     // ?
      DocDelimiterAttri.Style             := [fsBold];
      ErrorAttri.Foreground               := clYellow;     // ?
      KeyAttri.Foreground                 := clBlue;       // key:
      KeyAttri.Style                      := [fsBold];
      NumericValueAttri.Foreground        := clFuchsia;    // 123, 123.4
      StringAttri.Foreground              := clRed;        // "abc" 'abc' abc
      SymbolAttri.Foreground              := clPurple;     // [] {} ...
      SymbolAttri.Style                   := [fsBold];
      TagAttri.Foreground                 := clTeal;       // ?
      TextValueAttri.Foreground           := clRed;        // abc def
    end;

  end else begin {ckTxt}
    Result := TSynGeneralSyn.Create(IvOwner);
    with Result as TSynGeneralSyn do begin
      CommentAttri.Foreground             := clMedGray;    // --
      CommentAttri.Style                  := [fsItalic];
    end;
  end;
end;

{class} function  TSynRec.LineCurrentText(IvSynEdit: TCustomSynEdit): string;
var
  idx: Integer;
begin
  // current line number (carety is 1-based)
  idx := IvSynEdit.CaretY - 1;

  // ensure the line index is valid
  if (idx >= 0) and (idx < IvSynEdit.Lines.Count) then begin
    // get the text of the current line
    Result := IvSynEdit.Lines[idx];
  end else
    Result := '';
end;

{class} procedure TSynRec.LineCurrentTextSet(IvSynEdit: TCustomSynEdit; IvString: string);
var
  idx: Integer;
begin
  idx := IvSynEdit.CaretY - 1;
  IvSynEdit.Lines[idx] := IvString.TrimRight;
end;

{class} procedure TSynRec.CaretMoveToLine(IvSynEdit: TCustomSynEdit; IvLineNumber: integer);
begin
  if IvLineNumber <= 0 then
    IvSynEdit.CaretY := 1

  else if IvLineNumber > IvSynEdit.Lines.Count then
    IvSynEdit.CaretY := IvSynEdit.Lines.Count

  else
    IvSynEdit.CaretY := IvLineNumber;

  IvSynEdit.CaretX := 1; // move to the first column of the specified line
  IvSynEdit.SetFocus;    // optional: Set focus to the SynEdit control
end;
  {$ENDREGION}

  {$REGION 'TTblRec'}
class function TTblRec.TblEditJsonStr(IvTable: string; IvKeyFieldVec: TArray<string>; IvEditFieldVec: TArray<string>): string;
//const
//  TEMPLATE     = '{'
//  + sLineBreak + '  "EditData": {'
//  + sLineBreak + '    "EditTable"       : "DbaAaa.dbo.TblAaa"'
//  + sLineBreak + '  , "EditKeyFieldList": ["FldId"]'
//  + sLineBreak + '  , "EditFieldList"   : ['
//  + sLineBreak + '      {"Field": "FldA"}'
//  + sLineBreak + '    , {"Field": "FldB"}'
//  + sLineBreak + '    ]'
//  + sLineBreak + '  }'
//  + sLineBreak + '}';
var
  sbu: TSbuRec;
  kfl, efl: string;
begin
  // keyfldlist
  kfl := TVecRec.VecToList(IvKeyFieldVec, ',', true);

  // editfldlist
  efl := TVecRec.VecToListFmt(IvEditFieldVec, ',', '{"Field": "%s"}');

  // build
  sbu.Anp('{'                                      );
  sbu.Add('  "EditData": {'                        );
  sbu.Add('    "EditTable"       : "%s"', [IvTable]);
  sbu.Add('  , "EditKeyFieldList": [%s]', [kfl]    );
  sbu.Add('  , "EditFieldList"   : [%s]', [efl]    );
  sbu.Add('  }'                                    );
  sbu.Add('}'                                      );

  // end
  Result := sbu.Text;
end;
  {$ENDREGION}

  {$REGION 'TTheRec'}
procedure TTheRec.Reset;
begin
  ObjectId           := 0                      ;
  Theme              := THEME_DEF              ;
  Grade              := GRADE_DEF              ;
  FontFamily         := FONT_FAMILY_DEF        ;
  FontWeight         := FONT_WEIGHT_DEF        ;
  SizeClass          := SIZE_CLASS_DEF         ;
  PaddingClass       := PADDING_CLASS_DEF      ;
  BorderedClass      := BORDERED_CLASS_DEF     ;
  HighlightJs        := HIGHLIGHTJS_THEME_DEF  ;
  Primary60BgColor   := PRIMARY60BG_COLOR_DEF  ;
  Secondary30FgColor := SECONDARY30FG_COLOR_DEF;
  Accent10Color      := ACCENT10_COLOR_DEF     ;
  ErrorColor         := ERROR_COLOR_DEF        ;
  DangerColor        := DANGER_COLOR_DEF       ;
  WarningColor       := WARNING_COLOR_DEF      ;
  InfoColor          := INFO_COLOR_DEF         ;
  SuccessColor       := SUCCESS_COLOR_DEF      ;
end;

function  TTheRec.InitDba(IvOrganizationId: integer; var IvFbk: string): boolean;
var
  aff: integer;
  sql: string;
  dst: TDataset;
begin
  sql := Format('select top(1) * from DbaOrganization.dbo.TblTheme where FldObjectId = %d', [IvOrganizationId]);
  TDbaRec.DsFromSql(sql, dst);
  try
    // insertnew
    if dst.IsEmpty then begin
      sql :=         'insert into DbaOrganization.dbo.TblTheme'
      + sLineBreak + 'select'
      + sLineBreak + '    FldObjectId = '           + TSqlRec.Val(IvOrganizationId       )
      + sLineBreak + '  , FldTheme = '              + TSqlRec.Val(THEME_DEF              )
      + sLineBreak + '  , FldGrade = '              + TSqlRec.Val(GRADE_DEF              )
      + sLineBreak + '  , FldFontFamily = '         + TSqlRec.Val(FONT_FAMILY_DEF        )
      + sLineBreak + '  , FldFontWeight = '         + TSqlRec.Val(FONT_WEIGHT_DEF        )
      + sLineBreak + '  , FldSizeClass = '          + TSqlRec.Val(SIZE_CLASS_DEF         )
      + sLineBreak + '  , FldPaddingClass = '       + TSqlRec.Val(PADDING_CLASS_DEF      )
      + sLineBreak + '  , FldBorderedClass = '      + TSqlRec.Val(BORDERED_CLASS_DEF     )
      + sLineBreak + '  , FldHighlightJs = '        + TSqlRec.Val(HIGHLIGHTJS_THEME_DEF  )
      + sLineBreak + '  , FldPrimary60BgColor = '   + TSqlRec.Val(PRIMARY60BG_COLOR_DEF  )
      + sLineBreak + '  , FldSecondary30FgColor = ' + TSqlRec.Val(SECONDARY30FG_COLOR_DEF)
      + sLineBreak + '  , FldAccent10Color = '      + TSqlRec.Val(ACCENT10_COLOR_DEF     )
      + sLineBreak + '  , FldErrorColor = '         + TSqlRec.Val(ERROR_COLOR_DEF        )
      + sLineBreak + '  , FldDangerColor = '        + TSqlRec.Val(DANGER_COLOR_DEF       )
      + sLineBreak + '  , FldWarningColor = '       + TSqlRec.Val(WARNING_COLOR_DEF      )
      + sLineBreak + '  , FldInfoColor = '          + TSqlRec.Val(INFO_COLOR_DEF         )
      + sLineBreak + '  , FldSuccessColor = '       + TSqlRec.Val(SUCCESS_COLOR_DEF      );
      TDbaRec.CmdExec(sql, aff, IvFbk);
      // retry
      InitDba(IvOrganizationId, IvFbk);

    // load
    end else begin
      ObjectId           :=          dst.FieldByName('FldObjectId'          ).AsInteger;
      Theme              := giif.NxD(dst.FieldByName('FldTheme'             ).AsString, THEME_DEF              );
      Grade              := giif.NxD(dst.FieldByName('FldGrade'             ).AsString, GRADE_DEF              );
      FontFamily         := giif.NxD(dst.FieldByName('FldFontFamily'        ).AsString, FONT_FAMILY_DEF        );
      FontWeight         := giif.NxD(dst.FieldByName('FldFontWeight'        ).AsString, FONT_WEIGHT_DEF        );
      SizeClass          := giif.NxD(dst.FieldByName('FldSizeClass'         ).AsString, SIZE_CLASS_DEF         );
      PaddingClass       := giif.NxD(dst.FieldByName('FldPaddingClass'      ).AsString, PADDING_CLASS_DEF      );
      BorderedClass      := giif.NxD(dst.FieldByName('FldBorderedClass'     ).AsString, BORDERED_CLASS_DEF     );
      HighlightJs        := giif.NxD(dst.FieldByName('FldHighlightJs'       ).AsString, HIGHLIGHTJS_THEME_DEF  );
      Primary60BgColor   := giif.NxD(dst.FieldByName('FldPrimary60BgColor'  ).AsString, PRIMARY60BG_COLOR_DEF  );
      Secondary30FgColor := giif.NxD(dst.FieldByName('FldSecondary30FgColor').AsString, SECONDARY30FG_COLOR_DEF);
      Accent10Color      := giif.NxD(dst.FieldByName('FldAccent10Color'     ).AsString, ACCENT10_COLOR_DEF     );
      ErrorColor         := giif.NxD(dst.FieldByName('FldErrorColor'        ).AsString, ERROR_COLOR_DEF        );
      DangerColor        := giif.NxD(dst.FieldByName('FldDangerColor'       ).AsString, DANGER_COLOR_DEF       );
      WarningColor       := giif.NxD(dst.FieldByName('FldWarningColor'      ).AsString, WARNING_COLOR_DEF      );
      InfoColor          := giif.NxD(dst.FieldByName('FldInfoColor'         ).AsString, INFO_COLOR_DEF         );
      SuccessColor       := giif.NxD(dst.FieldByName('FldSuccessColor'      ).AsString, SUCCESS_COLOR_DEF      );
    end;
  finally
    dst.Free;
  end;

  // end
  IvFbk := 'TheRec loaded from database';
  Result := true;
end;

function  TTheRec.InitRio(IvOrganizationId: integer; var IvFbk: string): boolean;
var
  rem: TTheRem;
begin
  Reset;

  rem := TTheRem.Create;
  try
    Result := (grio.HttpRio as ISystemSoapMainService).SystemThemeInitSoap(IvOrganizationId, rem, IvFbk);
    if Result then begin
                                                                ObjectId           := rem.ObjectId          ;
                                                                Theme              := rem.Theme             ;
                                                                Grade              := rem.Grade             ;
                                                                FontFamily         := rem.FontFamily        ;
                                                                FontWeight         := rem.FontWeight        ;
                                                                SizeClass          := rem.SizeClass         ;
                                                                PaddingClass       := rem.PaddingClass      ;
                                                                BorderedClass      := rem.BorderedClass     ;
                                                                HighlightJs        := rem.HighlightJs       ;
      if TColRec.StrIsHtmlHexColor(rem.Primary60BgColor  ) then Primary60BgColor   := rem.Primary60BgColor  ;
      if TColRec.StrIsHtmlHexColor(rem.Secondary30FgColor) then Secondary30FgColor := rem.Secondary30FgColor;
      if TColRec.StrIsHtmlHexColor(rem.Accent10Color     ) then Accent10Color      := rem.Accent10Color     ;
      if TColRec.StrIsHtmlHexColor(rem.ErrorColor        ) then ErrorColor         := rem.ErrorColor        ;
      if TColRec.StrIsHtmlHexColor(rem.DangerColor       ) then DangerColor        := rem.DangerColor       ;
      if TColRec.StrIsHtmlHexColor(rem.WarningColor      ) then WarningColor       := rem.WarningColor      ;
      if TColRec.StrIsHtmlHexColor(rem.InfoColor         ) then InfoColor          := rem.InfoColor         ;
      if TColRec.StrIsHtmlHexColor(rem.SuccessColor      ) then SuccessColor       := rem.SuccessColor      ;
    end;
  finally
    FreeAndNil(rem);
  end;
end;
  {$ENDREGION}

  {$REGION 'TTicRec'}
function TTicRec.ElapsedMs: cardinal;
begin
  Result := TThread.GetTickCount - Tick;
end;

procedure TTicRec.Init;
begin
  Tick := TThread.GetTickCount;
end;
  {$ENDREGION}

  {$REGION 'TTxtRec'}
class function  TTxtRec.TxtCharsFrequency(IvText: TStrings; var IvDigits, IvLetters, IvLowers, IvUppers, IvPucts, IvSeps, IvSymbols, IvWhites: integer; var IvFbk: string): boolean;
var
  t: string; // alltext
  i: integer;
begin
  // init
  t := IvText.Text;
  IvDigits   := 0;
//IvNumbers  := 0;
  IvLetters  := 0;
  IvLowers   := 0;
  IvUppers   := 0;
  IvPucts    := 0;
  IvSeps     := 0;
  IvSymbols  := 0;
  IvWhites   := 0;

  // count
  for i := 1 to Length(t) do begin
    if {TCharacter.IsDigit(      t[i])} t[i].IsDigit       then Inc(IvDigits ); // 0..9
  //if {TCharacter.IsNumber(     t[i])} t[i].IsNumber      then Inc(IvNumbers); // 0..9
    if {TCharacter.IsLetter(     t[i])} t[i].IsLetter      then Inc(IvLetters); // a..z A..Z
    if {TCharacter.IsLower(      t[i])} t[i].IsLower       then Inc(IvLowers ); // a..z
    if {TCharacter.IsUpper(      t[i])} t[i].IsUpper       then Inc(IvUppers ); // A..Z
    if {TCharacter.IsPunctuation(t[i])} t[i].IsPunctuation then Inc(IvPucts  ); // ;:'",._()[]{}?*/\&%@#-
    if {TCharacter.IsSeparator(  t[i])} t[i].IsSeparator   then Inc(IvSeps   ); // blank-space
    if {TCharacter.IsSymbol(     t[i])} t[i].IsSymbol      then Inc(IvSymbols); // $|~^`+=<>
    if {TCharacter.IsWhiteSpace( t[i])} t[i].IsWhiteSpace  then Inc(IvWhites ); // Char(32)blank-space, Chr(9)tab, Chr(10)linefeed, Char()verttab, Char()formfeed, Chr(13)return
  end;

  IvFbk := Format('%d digits'
//+ sLineBreak  + '%d numbers'
  + sLineBreak  + '%d letters (%d lower, %d upper)'
  + sLineBreak  + '%d puctuation'
  + sLineBreak  + '%d separators'
  + sLineBreak  + '%d symbols'
  + sLineBreak  + '%d whitespaces'
  , [IvDigits{, IvNumbers}, IvLetters, IvLowers, IvUppers, IvPucts, IvSeps, IvSymbols, IvWhites]
  );

  Result := true;
end;

class function  TTxtRec.TxtWordCount(IvText: TStrings; IvWord: string): integer;
begin
  Result := TStrRec.StrOccurences(IvText.Text, IvWord);
end;

class function  TTxtRec.TxtWordDensity(IvText: TStrings; IvWord: string): single;
begin
  Result := TxtWordCount(IvText, IvWord) / TxtWordsCount(IvText);
end;

class function  TTxtRec.TxtWordFirst(IvText: TStrings): string;
var
  i: integer;
  s: string;
begin
  s := IvText.Text.Trim;

  i := 1;
  while not s[i].IsWhiteSpace do
    Inc(i);

  Result := Copy(s, 1, i);
end;

class function  TTxtRec.TxtWordsCount(IvText: TStrings): integer;
var
  i: integer;
  w, o: boolean; // iswhite, iswhiteold
  t: string; // txt
begin
  o := true;
  Result := 0;
  t := IvText.Text;
  for i := 1 to length(t) do begin
    w := t[i].IsWhiteSpace;
    if o and not w then
      Inc(Result);
    o := w;
  end;
end;

class function  TTxtRec.TxtWordsDistinctVector(IvText: TStrings; var IvStringVector: TStringVector): integer;
begin
  Result := -1;
end;

class function  TTxtRec.TxtWordsFrequencyVector(IvText: TStrings; var IvKvv: TKvaRecVec): integer;
begin
  Result := -1;
end;

class function  TTxtRec.TxtWordsVector(IvText: TStrings; var IvStringVector: TStringVector): integer;
var
  t: string;
begin
  // init
  t := IvText.Text;

  // split
  IvStringVector := TStringVector(SplitString(t, ' ,;:/\*-+?!'));

  Result := Length(IvStringVector);
end;
  {$ENDREGION}

  {$REGION 'TUrlRec'}
function  TUrlRec.Parse(IvUrl, IvPart: string): string;
var
  u: TIdURI;
begin
  u := TIdURI.Create(IvUrl);
  try
    Scheme    := u.Protocol;
    Username  := u.Username;
    Password  := u.Password;
    Host      := u.Host;
    Port      := u.Port;
    Path      := u.Path;
    QueryInfo := u.Params;
    Fragment  := TStrRec.StrRightOf('#', IvUrl, true);
  finally
    u.Free;
  end;
  PathInfo  := TStrRec.StrLeftOf('?', IvUrl); if PathInfo = '' then PathInfo := IvUrl;
  PathInfo  := TStrRec.StrRightOf('/', PathInfo, true, true, true);
end;

function  TUrlRec.PatInfo(IvUrl: string): string;
begin
  Parse(IvUrl);
  Result := PathInfo;
end;

class function  TUrlRec.HttpRemove(IvUrl: string): string;
begin
  // init
  Result := IvUrl;

  if      Pos('https://', Lowercase(Result)) > 0 then
    Delete(Result, 1, 8)
  else if Pos('http://', Lowercase(Result)) > 0 then
    Delete(Result, 1, 7);
end;

class function  TUrlRec.ProtocolEnsure(IvUrl, IvProtocol: string; IvSecure: boolean): string;
begin
  if IvUrl.StartsWith(IvProtocol, true) then
    Result := IvUrl
  else
    Result := IvProtocol + IvUrl;

  if IvSecure then
    Result := Result.Replace(IvProtocol, 'https://');
end;

class function  TUrlRec.Encode(IvQueryClearValue: string): string;
// you can not encode the whole URL with this function
// you need to encode the parts that you want to have no special meaning (typically the values of the variables aka queryfields)
//const
//  CHAR_OK = ['A'..'Z','a'..'z','0','1'..'9','-','_','~','.','*','@','=','&',':','?','/']; // noconversion
//var
//  i: integer;
begin
  // i
//Result := '';
//for i := 1 to Length(IvQueryClearValue) do
//  if IvQueryClearValue[i] in CHAR_OK then
//    Result := Result + IvQueryClearValue[i]
//  else
//    Result := Result + '%' + IntToHex(Ord(IvQueryClearValue[i]), 2)
//;

  // ii
  Result := TNetEncoding.URL.Encode(IvQueryClearValue);
end;

class function  TUrlRec.Decode(IvQueryObscureValue: string): string;
begin
  Result := TNetEncoding.URL.Decode(IvQueryObscureValue);
end;

class function  TUrlRec.IsValid(IvUrl: string): boolean;
begin
  Result := TRegEx.IsMatch(IvUrl, grex.REX_URL_PAT)
end;

class function  TUrlRec.Exists(IvUrl: string; IvCheck: boolean{; IvProtocol: string}): boolean;
var
  u: string;
  s, e: hInternet;          // session, request
  i, l: dword;              // index, codelen
  c: array[1..20] of char;  // code
  r: pchar;                 // result
  z: integer;               // httpstatuscode
begin
  // skip
  if not IvCheck then begin
    Result := true;
    Exit;
  end;

  // ensure
//u := ProtocolEnsure(IvUrl.Trim, IvProtocol);
  u := IvUrl;

  // exit
//Result := WksAllUnit.url.IsValid(u);
//if not Result then
//  Exit;

  // getinternetsession *** proxy? ***
//s := InternetOpen(PChar(IvAgent), INTERNET_OPEN_TYPE_PROXY    , PChar(IvProxyServer), nil, 0);
  s := InternetOpen('InetURL:/1.0', INTERNET_OPEN_TYPE_PRECONFIG, nil                 , nil, 0); // set proxy automatically?
  Result := Assigned(s);
  if not Result then
    Exit;

  // request
  e := InternetOpenUrl(s, pchar(u), nil, 0, INTERNET_FLAG_RELOAD, 0);
  i := 0;
  l := 10;
  Result := HttpQueryInfo(e, HTTP_QUERY_STATUS_CODE, @c, l, i);
  if Assigned(e) then InternetCloseHandle(e);
  if Assigned(s) then InternetCloseHandle(s);
  if not Result then
    Exit;

  // result
  r := PChar(@c);
  z := StrToInt(r);
  Result := (z = THttRec.HTTP_STATUS_200_OK) or (z = THttRec.HTTP_STATUS_302_REDIRECT);
end;

class procedure TUrlRec.Open(IvUrl: string);
begin
  // get the default browser from HKEY_CLASSES_ROOT\HTTP\shell\open\command

  // open
  ShellExecute({Application.Handle}0, 'open', PChar(IvUrl), nil, nil, SW_SHOWNORMAL);
end;

class procedure TUrlRec.Go(IvUrl: string);
var
  l: string;
  b: TBrowseURL;
begin
  l := IvUrl.Trim;
  if l.IsEmpty then
    Exit;
//l := ProtocolEnsure(l, wes.Protocol);

  // i
//ShellExecute({Application.Handle}0, nil, PChar(l), nil, nil, SW_SHOWNORMAL);

  // ii
  b := TBrowseURL.Create(nil);
  try
    b.URL := l;
    try
      b.ExecuteTarget(nil);
    except
      ;
    end;
  finally
    FreeAndNil(b);
  end;

  // zzz
//if Chrome.Installed then
//  GoChrome(IvUrl: string)
//else if Edge.Installed then
//  GoEdge(IvUrl: string)
//else ...
end;

class procedure TUrlRec.GoChrome(IvUrl: string);
var
  c, p: string;
begin
  c := 'chrome.exe';
  p := '--app=' + IvUrl;
  ShellExecute(Application.Handle, nil, PChar(c), PChar(p), nil, SW_SHOWMAXIMIZED);
  //win.ShellExec(Application.Handle, c);
end;

class procedure TUrlRec.GoEdge(IvUrl: string);
var
  c: string;
begin
  c := 'cmd /C start microsoft-edge:' + IvUrl;
  ShellExecute(Application.Handle, nil, PChar(c), nil, nil, SW_SHOWMAXIMIZED);
  //win.ShellExec(Application.Handle, c);
end;

class procedure TUrlRec.GoFirefox(IvUrl: string);
var
  c: string;
begin
  c := 'firefox.exe' + IvUrl;
  ShellExecute(Application.Handle, nil, PChar(c), nil, nil, SW_SHOWMAXIMIZED);
  //win.ShellExec(Application.Handle, c);
end;
  {$ENDREGION}

  {$REGION 'TUsrRec'}
function  TUsrRec.Info: string;
begin
  Result := '';
  if not Username.IsEmpty then Result := Username;
  if not gorg.Obj.&Object.IsEmpty then Result := Result + Format('@%s', [gorg.Obj.&Object]);
end;

procedure TUsrRec.Reset;
begin
  PersonId      := 0;
  Username      := 'unknown';
  Password      := '';
  State         := '';
  AvatarGraphic := nil;
end;

function  TUsrRec.InitDba(IvUsername: string; var IvFbk: string): boolean;
var
  sql: string;
  dst: TDataset;
begin
  sql := Format('select top(1) * from DbaUser.dbo.TblUser where FldUsername = ''%s''', [IvUsername]); // *** move TblUser to DbaPerson and remove DbaUser ***
  TDbaRec.DsFromSql(sql, dst);
  try
    // usernologged
    if dst.IsEmpty then
      Reset

    // userlogged
    else begin
      PersonId := dst.FieldByName('FldPersonId'  ).AsInteger; // *** user is hosted by person ***
      Username := dst.FieldByName('FldUsername'  ).AsString;
      Password := dst.FieldByName('FldPassword'  ).AsString;
      State    := dst.FieldByName('FldState'     ).AsString;
      TGraRec.FromBlobField(AvatarGraphic, TBlobField(dst.FieldByName('FldAvatar'))); // change to FldAvatarGraphic
    end;
  finally
    dst.Free;
  end;

  // end
  IvFbk := 'UsrRec loaded from database';
  Result := true;
end;

function  TUsrRec.InitRio(IvUsername: string; var IvFbk: string): boolean;
var
  rem: TUsrRem;
begin
  Reset;

  rem := TUsrRem.Create;
  try
    Result := (grio.HttpRio as ISystemSoapMainService).SystemUserInitSoap(IvUsername, rem, IvFbk);
    if Result then begin
      PersonId      := rem.PersonId;
      Username      := rem.Username;
      Password      := rem.Password;
      State         := rem.State;
      TGraRec.FromByteArray(AvatarGraphic, rem.AvatarBytes);
    end;
  finally
    FreeAndNil(rem);
  end;
end;

procedure TUsrRec.Free;
begin
  if Assigned(AvatarGraphic) then
    AvatarGraphic.Free;
end;

function  TUsrRec.Exists(IvUsername: string; var IvFbk: string): boolean;
var
  sql: string;
begin
  sql :=         'select 1 from DbaUser.dbo.TblUser'
  + sLineBreak + 'where'
  + sLineBreak + '    FldUsername     = ' + TSqlRec.Val(IvUsername);
  Result := TDbaRec.Scalar(sql, 0) = 1;
  IvFbk := ifthen(Result, 'User exists', 'User does not exists');
end;

function  TUsrRec.ExistsRio(IvUsername: string; var IvFbk: string): boolean;
begin
  Result := (grio.HttpRio as ISystemSoapMainService).SystemUserExistsSoap(IvUsername, IvFbk);
end;

function  TUsrRec.IsActive(IvUsername: string; var IvFbk: string): boolean;
var
  sql: string;
begin
  sql :=         'select 1 from DbaUser.dbo.TblUser'
  + sLineBreak + 'where'
  + sLineBreak + '    FldUsername     = ' + TSqlRec.Val(IvUsername)
  + sLineBreak + 'and FldState        = ''Active''';
  Result := TDbaRec.Scalar(sql, 0) = 1;
  IvFbk := ifthen(Result, 'User is Active', 'User is not Active');
end;

function  TUsrRec.IsActiveRio(IvUsername: string; var IvFbk: string): boolean;
begin
  Result := (grio.HttpRio as ISystemSoapMainService).SystemUserIsActiveSoap(IvUsername, IvFbk);
end;

function  TUsrRec.IsAuthenticated(IvUsername, IvPassword: string; var IvFbk: string): boolean;
var
  sql: string;
begin
  sql :=         'select 1 from DbaUser.dbo.TblUser'
  + sLineBreak + 'where'
  + sLineBreak + '    FldState        = ''Active'''
//+ sLineBreak + 'and FldOrganization = ' + sql.Val(IvOrganization)
  + sLineBreak + 'and FldUsername     = ' + TSqlRec.Val(IvUsername)
  + sLineBreak + 'and FldPassword     = ' + TSqlRec.Val(IvPassword)
  + sLineBreak + 'collate sql_latin1_general_cp1_cs_as';
  Result := TDbaRec.Scalar(sql, 0) = 1;
  IvFbk := ifthen(Result, 'User is authenticated', 'User is not authenticated');
end;

function  TUsrRec.IsAuthenticatedRio(IvUsername, IvPassword: string; var IvFbk: string): boolean;
begin
  Result := (grio.HttpRio as ISystemSoapMainService).SystemUserIsAuthenticatedSoap(IvUsername, IvPassword, IvFbk);
end;

function  TUsrRec.HomePath: string;
begin
  Result := gper.HomePath;                                                         // C:\$Per\I\IarussiFedericoCarloBrian
end;

function  TUsrRec.AvatarFile: string;
begin
  Result := HomePath + Format('\%sAvatar.png', [gper.SurnameNameSafe]);            // C:\$Per\I\IarussiFedericoCarloBrian\IarussiFedericoCarloBrian_Avatar.png
end;

function  TUsrRec.HomeUrl(IvRelative: boolean): string;
begin
  Result := gper.HomeUrl(IvRelative);                                              // /Person/I/IarussiFedericoCarloBrian
end;

function  TUsrRec.AvatarUrl(IvRelative: boolean): string;
begin
  Result := HomeUrl(IvRelative) + Format('/%sAvatar.png', [gper.SurnameNameSafe]); // /Person/I/IarussiFedericoCarloBrian/IarussiFedericoCarloBrian_Avatar.png
end;

procedure TUsrRec.AvatarGenerate(var IvAvatar: TBitmap; IvSize: integer);
var
  w, h: integer;
  w2, h2: double;
  agg: TAgg2D;
begin
  // geometry
  w := IvSize;
  h := IvSize;
  w2 := w / 2;
  h2 := h / 2;

  // bmp
  if not Assigned(IvAvatar) then begin
    {$IF COMPILERVERSION < 32.0}
    IvAvatar := TBitmap.Create;
    IvAvatar.SetSize(w, h);
    {$ELSE}
    IvAvatar := TBitmap.Create(w, h);
    {$ENDIF}
  end;
  IvAvatar.SetSize(w, h);

  // agg
  agg := TAgg2D.Create;
  TAggRec.Attach(agg, IvAvatar, true);
  agg.ClearAll($ff, $ff, $ff, $ff);
//agg.Line(0, 0, 100, 100);

  // origin
  agg.Translate(w2, h2);

  // badge
  TAggRec.DrawSetup(agg);
  TAggRec.Star(agg , 0, 0
  , h2 * RandomMinMax(0.5, 1.0)    // r1
  , h2 * RandomMinMax(0.5, 1.0)    // r2
  , Deg2Rad(Random(90))            // angle
  , RandomRange(4, 20)             // rays
  , RandomFrom([2, 4, 6, 8, 10])   // lw
  , TColRec.ColorAggRnd($00, 'ff') // lc
  , TColRec.ColorAggRnd($00, 'ff') // fc
  );

  // free
  agg.Free;
end;

procedure TUsrRec.AvatarGenerateAI(var IvAvatar: TBitmap; IvSize: integer; IvAiInstructions: string);
begin
  AvatarGenerate(IvAvatar, IvSize);
end;
  {$ENDREGION}

  {$REGION 'TVecRec'}
class function  TVecRec.VecNx(IvStringVec: array of string): boolean;
begin
  Result := Length(IvStringVec) <= 0;
end;

class function  TVecRec.VecEx(IvStringVec: array of string): boolean;
begin
  Result := Length(IvStringVec) > 0;
end;

class function  TVecRec.VecHas(const IvString: string; IvStringVector: TStringVector; IvCaseSensitive: boolean): boolean;
var
  i: integer;
begin
  Result := false;
  for i := Low(IvStringVector) to High(IvStringVector) do begin
    Result := IvStringVector[i] = IvString;
    if Result then
      Exit;
  end;
end;

class function  TVecRec.VecFromStr(IvStr, IvDelimChars: string; IvTrim: boolean): TArray<string>;
var
  i: integer;
begin
//Result := SplitString(IvStr, IvDelimChars);
  Result := IvStr.Split(IvDelimChars); // *** WARNING ***
  if IvTrim then
    for i := Low(Result) to High(Result) do
      Result[i] := Result[i].Trim;
end;

class function  TVecRec.VecToList(IvStrVec: TArray<string>; IvDelimiter: string; IvQuoted: boolean): string;
begin
  if IvQuoted then
    Result := VecToListFmt(IvStrVec, IvDelimiter, '"%s"')
  else
    Result := VecToListFmt(IvStrVec, IvDelimiter, '%s');
end;

class function TVecRec.VecToListFmt(IvStrVec: TArray<string>; IvDelimiter, IvItemFmt: string): string;
var
  i: integer;
  val: string;
begin
  Result := '';
  if Length(IvStrVec) = 0 then
    Exit;
  Result := Format(IvItemFmt, [IvStrVec[0].Trim]);
  for i := 1 to High(IvStrVec) do begin
    val := Format(IvItemFmt, [IvStrVec[i].Trim]);
    Result := Result + IvDelimiter + val;
  end;
end;

class function  TVecRec.VecCollapse(IvStrVec: TArray<string>): string;
begin
  Result := VecToList(IvStrVec, '');
end;

class function  TVecRec.VecFromStrCamel(IvStr: string; IvCase: TCaseEnum): TArray<string>;
var
  s: string;
  i: integer;
begin
  s := TStrRec.StrExpand(IvStr);
//Result := System.StrUtils.SplitString(s, ' ._-');
  Result := s.Split([' ', '.', '_', '-']);

  for i := Low(Result) to High(Result) do
    Result[i] := TStrRec.StrCase(Result[i], IvCase);
end;

class procedure TVecRec.VecRemoveWith(var IvStrVec: TArray<string>; IvStr: string);
var
  i, z: integer; // idx, count
begin
  // step through the array until we find a match, or reach the end
  z := 0;
  while (z <= High(IvStrVec)) and (IvStrVec[z] <> IvStr) do
    Inc(z);
  // here z is either the index of the first match or one off the end

  // loop over the rest of the array copying non-matching values to the next slot
  for i := z to High(IvStrVec) do begin
    if IvStrVec[i] <> IvStr then begin
      IvStrVec[z] := IvStrVec[i];
      Inc(z);
    end;
  end;

  // resize the array
  SetLength(IvStrVec, z);
end;
  {$ENDREGION}

  {$REGION 'TVntRec'}
class function  TVntRec.VntIsEmpty(const IvVariant: variant): boolean;
var
  dat: PVarData; // data
begin
  dat := FindVarData(IvVariant);
  case dat^.VType of
    varOleStr:
      Result := (dat^.VOleStr^ = #0);
    varString:
      Result := (dat^.VString = nil);
    varUString:
      Result := (dat^.VUString = nil);
    else
      Result := false;
  end;
end;

class function  TVntRec.VntIsWhite(const IvVariant: variant): boolean;
begin
  Result := ( VarIsStr(IvVariant) and (Length(VarToStr(IvVariant)) = 0) ) or VarIsClear(IvVariant) or VarIsEmpty(IvVariant) or VarIsNull(IvVariant) or VarIsType(IvVariant, Unassigned);
end;

class function  TVntRec.VntToInt(const IvVariant: variant; IvDefault: integer): integer;
begin
  if IvVariant = null then
    Result := IvDefault
  else
    Result := IvVariant;
end;

class function TVntRec.VntToStr(IvVariant: variant; IvDefault: string): string;
begin
  if IvVariant = null then
    Result := IvDefault
  else
    Result := System.Variants.VarToStr(IvVariant);
end;

class function TVntRec.VntVecToCsv(IvVarRecVector: array of TVarRec): string;
var
  itm: TVarRec;
begin
  Result := '';
  for itm in IvVarRecVector do begin
    case itm.VType of
      vtInteger      : TCsvRec.CsvRowFieldAppend(Result, itm.VInteger.ToString);
      vtBoolean      : TCsvRec.CsvRowFieldAppend(Result, BoolToStr(itm.VBoolean, true));
      vtChar         : TCsvRec.CsvRowFieldAppend(Result, string(itm.VChar));
      vtExtended     : TCsvRec.CsvRowFieldAppend(Result, FloatToStr(itm.VExtended^));
      vtString       : TCsvRec.CsvRowFieldAppend(Result, string(itm.VString^));
      vtPointer      : TCsvRec.CsvRowFieldAppend(Result, IntToHex(NativeInt(itm.VPointer), 8));
      vtPChar        : TCsvRec.CsvRowFieldAppend(Result, string(itm.VPChar));
      vtObject       : TCsvRec.CsvRowFieldAppend(Result, itm.VObject.ClassName);
      vtClass        : TCsvRec.CsvRowFieldAppend(Result, itm.VClass.ClassName);
      vtAnsiString   : TCsvRec.CsvRowFieldAppend(Result, string(AnsiString(itm.VAnsiString)));
      vtCurrency     : TCsvRec.CsvRowFieldAppend(Result, FloatToStr(itm.VCurrency^));
      vtVariant      : TCsvRec.CsvRowFieldAppend(Result, itm.VVariant^);
    //vtInterface    : TCsvRec.CsvRowFieldAppend(Result, IInterface(itm.VInterface));
      vtWideChar     : TCsvRec.CsvRowFieldAppend(Result, itm.VWideChar);
      vtPWideChar    : TCsvRec.CsvRowFieldAppend(Result, itm.VPWideChar);
      vtWideString   : TCsvRec.CsvRowFieldAppend(Result, WideString(itm.VWideString));
      vtInt64        : TCsvRec.CsvRowFieldAppend(Result, IntToStr(itm.VInt64^));
      vtUnicodeString: TCsvRec.CsvRowFieldAppend(Result, UnicodeString(itm.VUnicodeString));
    else
      TCsvRec.CsvRowFieldAppend(Result, 'UnknownType');
    end;
  end;
end;
  {$ENDREGION}

  {$REGION 'TVstRec'}
class function  TVstRec.NodePath(IvVst: TBaseVirtualTree; IvNode: PVirtualNode; IvDelimiter: char; IvUseLevels: boolean): string;
const
  COLUMN = 0;
var
  lev: cardinal;
begin
  if not Assigned(IvNode) then begin
    Result := '';
    Exit;
  end;

  if not IvUseLevels then begin
    Result := (IvVst as TVirtualStringTree).Path(IvNode, COLUMN, IvDelimiter);
    Delete(Result, Length(Result), 1);
    Exit;
  end;

  Result := '';
  while IvNode <> IvVst.RootNode do begin
    lev := IvVst.GetNodeLevel(IvNode);
    Result := IntToStr(lev) + IvDelimiter + Result;
    IvNode := IvNode.Parent;
  end;
  Delete(Result, Length(Result), 1);
end;

class procedure TVstRec.NodeInfo(IvVst: TBaseVirtualTree; IvNode: PVirtualNode; var IvPath, IvCaption: string; var IvKey, IvLevel, IvChildCount: integer);
var
  ndp: PNodeItem; // nodedatapointer
begin
  ndp          := IvVst.GetNodeData(IvNode);
  IvPath       := NodePath(IvVst, IvNode, '/');
  IvCaption    := ndp.Caption;
  IvKey        := ndp.Key.ToInteger;
  IvLevel      := IvVst.GetNodeLevel(IvNode);
  IvChildCount := IvNode.ChildCount;
end;

class function  TVstRec.NodeHasChildren(IvNode: PVirtualNode): boolean;
begin
//if Assigned(IvNode) then
  Result := IvNode.ChildCount > 0 {IvNode.FirstChild <> nil};
end;

class procedure TVstRec.NodeParamSet(IvVst: TBaseVirtualTree; IvNode: PVirtualNode; IvObj: string; IvDs: TDataSet);
var
  ndp: PNodeItem;
  iid, pid, zor, obj, obk, cok, sta, org, dat: string;
begin
  // exit
  if not Assigned(IvNode) then
    Exit;

  // infofromds
  if Assigned(IvDs.FindField('FldId'          )) then iid := IvDs.FieldByName('FldId'          ).AsString else iid := '0';         {0 id           }
  if Assigned(IvDs.FindField('FldPId'         )) then pid := IvDs.FieldByName('FldPId'         ).AsString else pid := '0';         {1 pid          }
  if Assigned(IvDs.FindField('FldOrder'       )) then zor := IvDs.FieldByName('FldOrder'       ).AsString else zor := '0';         {2 order        }
                                                      obj := IvObj; // Xxx, Person, ... *** USELESS SEE obk ***                    {3 object       }
  if Assigned(IvDs.FindField('FldObjectKind'  )) then obk := IvDs.FieldByName('FldObjectKind'  ).AsString else obk := UNKNOWN_STR; {4 objectkind   }
  if Assigned(IvDs.FindField('FldContentKind' )) then cok := IvDs.FieldByName('FldContentKind' ).AsString else cok := UNKNOWN_STR; {5 contentkind  }
  if Assigned(IvDs.FindField('FldState'       )) then sta := IvDs.FieldByName('FldState'       ).AsString else sta := UNKNOWN_STR; {6 state        }
  if Assigned(IvDs.FindField('FldOrganization')) then org := IvDs.FieldByName('FldOrganization').AsString else org := UNKNOWN_STR; {7 organization }
                                                      dat := '';                                                                   {8 sparedataslot}

  // paramsset   in OnFormCreate set ObjectDTClientTree.NodeDataSize := SizeOf(PNodeItem)
  ndp := IvVst.GetNodeData(IvNode);
  ndp.Param := VarArrayOf([iid, pid, zor, obj, obk, cok, sta, org, dat]);
end;                    // 0    1    2    3    4    5    6    7    8

class procedure TVstRec.NodeParamGet(IvVst: TBaseVirtualTree; IvNode: PVirtualNode; var IvId, IvPId, IvOrder: integer; var IvName, IvObj, IvObjectKind, IvContentKind, IvState, IvOrganization, IvData: string);
var
  ndp: PNodeItem;
  vnt: variant;
begin
  // data
  ndp := IvVst.GetNodeData(IvNode);
  if not Assigned(ndp) then
    Exit;

  // params
  try
    // level
  //IvLevel := IvVst.GetNodeLevel(IvNode);

    // name
    IvName := ndp.Caption;        // always available
  //IvName := ndp.Param[0];       // only available if ndp.Param has been set during ObjectDTClientTreeDBTreeCreateNode
  //IvName := ndp.FieldValues[1]; // only available if header columns values are present

                                             IvId           :={ndp.Param[0]}StrToIntDef(ndp.Key, 0); //  {0 id           }
    if VarIsClear(ndp.Param) then Exit;
                                             IvPId          := ndp.Param[1];                             {1 pid          }
    if TVntRec.VntIsEmpty(ndp.Param[2]) then IvOrder        := 0
    else                                     IvOrder        := ndp.Param[2];                             {2 order        }
                                             IvObj          := ndp.Param[3];                             {3 obj          }
                                             IvObjectKind   := ndp.Param[4];                             {4 objectkind   }
                                             IvContentKind  := ndp.Param[5];                             {5 contentkind  }
                                             IvState        := ndp.Param[6];                             {6 state        }
                                             IvOrganization := ndp.Param[7]; // ndp.FieldValues[7]       {7 organization }
                                             IvData         := ndp.Param[8];                             {8 sparedataslot}

                                             vnt := ndp.FieldValues;
  except
    ;
  end;
end;

class procedure TVstRec.OnPaintText(IvVst: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var
  idi, pid, azo: integer; nam{, lev}, obj, obk, cok, sta, org, dat: string; // id, pid, ord, name, level, obj, objectkind, contentkind, state, orga, dataslot
begin
  // exit
  if Column > 0 then // -1 = nocolumns, 0 = 1stcol, 1..= 2nd..col
    Exit;

  // nodeparams
  NodeParamGet(IvVst, Node, idi, pid, azo, nam, obj, obk, cok, sta, org, dat);

  // colorbystate
       if sta = TStaRec.UNKNOWN.Name    then       TargetCanvas.Font.Color := TStaRec.UNKNOWN.ColorT
  else if sta = TStaRec.ACTIVE.Name     then       TargetCanvas.Font.Color := TStaRec.ACTIVE.ColorT  //; TargetCanvas.Brush.Color := clBlue; TargetCanvas.Font.Style := Font.Style + [{fsBold,} fsItalic];
  else if sta = TStaRec.INACTIVE.Name   then       TargetCanvas.Font.Color := TStaRec.INACTIVE.ColorT
  else if sta = TStaRec.ONGOING.Name    then       TargetCanvas.Font.Color := TStaRec.ONGOING.ColorT
  else if sta = TStaRec.ONHOLD.Name     then       TargetCanvas.Font.Color := TStaRec.ONHOLD.ColorT
  else if sta = TStaRec.DONE.Name       then       TargetCanvas.Font.Color := TStaRec.DONE.ColorT
  else if sta = TStaRec.COMPLETED.Name  then       TargetCanvas.Font.Color := TStaRec.COMPLETED.ColorT
  else if sta = TStaRec.CANCELLED.Name  then       TargetCanvas.Font.Color := TStaRec.CANCELLED.ColorT
  else if sta = TStaRec.NEW.Name        then       TargetCanvas.Font.Color := TStaRec.NEW.ColorT
  else if sta = TStaRec.TESTING.Name    then begin TargetCanvas.Font.Color := TStaRec.TESTING.ColorT   ; TargetCanvas.Font.Style := TargetCanvas.Font.Style + [{fsBold,} fsItalic]; end
  else if sta = TStaRec.VALIDATING.Name then       TargetCanvas.Font.Color := TStaRec.VALIDATING.ColorT
  else if sta = TStaRec.VALIDATED.Name  then       TargetCanvas.Font.Color := TStaRec.VALIDATED.ColorT;
end;

class procedure TVstRec.OnCompareNodes(IvVst: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: integer);
var
  m1, m2: PNodeItem;
  r1, r2: string;  // orderstr
  i1, p1, z1: integer; n1{, l1}, x1, k1, l1, s1, o1, d1: string; // id, pid, ord, name, level, obj, objectkind, contentkind, state, orga, data
  i2, p2, z2: integer; n2{, l2}, x2, k2, l2, s2, o2, d2: string;
begin
  // 1
  m1 := IvVst.GetNodeData(Node1);
  if not Assigned(m1) then begin
    Result := 0;
    Exit;
  end;
  NodeParamGet(IvVst, Node1, i1, p1, z1, n1, x1, k1, l1, s1, o1, d1);

  // 2
  m2 := IvVst.GetNodeData(Node2);
  if not Assigned(m2) then begin
    Result := 0;
    Exit;
  end;
  NodeParamGet(IvVst, Node2, i2, p2, z2, n2, x2, k2, l2, s2, o2, d2);

  // sort
  try
    // byparamandcaption
    if Column <= 0 then begin
      r1 := Format('%.*d', [8, z1]) + m1.Caption;
      r2 := Format('%.*d', [8, z2]) + m2.Caption;

    // byspecificcolumn
    end else begin
      r1 := m1.FieldValues[Column]; // if VarIsNull(a.FieldValues[Column]) then r1 := 0 else r1 := a.FieldValues[Column];
      r2 := m2.FieldValues[Column]; // if VarIsNull(b.FieldValues[Column]) then r2 := 0 else r2 := b.FieldValues[Column];
    end;
    if TStrRec.StrIsInteger(r1) and TStrRec.StrIsInteger(r2) then
      Result := StrToIntDef(r1, 0) - StrToIntDef(r2, 0)
    else
      Result := CompareText(r1, r2);
  except
    Result := 0;
  end;
end;

class procedure TVstRec.OnGetImageIndex(IvVst: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex);
var
  idi, pid, azo: integer; nam{, lev}, obj, obk, cok, sta, org, dat: string; // id, pid, ord, name, level, obj, objectkind, contentkind, state, orga, dataslot
begin
  // default
  ImageIndex := -1;

  {$REGION 'Exit'}
  if not (Kind in [ikNormal, ikSelected]) then // only selected or not
    Exit;
  if Column > 0 then // -1 = nocolumns, 0 = 1stcol, 1..= 2nd..col
    Exit;
  {$ENDREGION}

  // params
  NodeParamGet(IvVst, Node, idi, pid, azo, nam, obj, obk, cok, sta, org, dat);

  {$REGION 'level-0'}
  if                        idi = 1                      then ImageIndex :=   1 // 'Root' (real)
  {$ENDREGION}

  {$REGION 'level-1'}
  else if SameText(         nam, 'Zzz'                 ) then ImageIndex :=   2
  else if SameText(         nam, 'Temp'                ) then ImageIndex :=   3
  else if SameText(         nam, 'Test'                ) then ImageIndex :=   4
  else if SameText(         nam, 'Help'                ) then ImageIndex :=   5
  else if SameText(         nam, 'Template'            ) then ImageIndex :=   6
  else if SameText(         nam, 'Organization'        ) then ImageIndex :=   7
  else if SameText(         nam, 'Public'              ) then ImageIndex :=   8
  else if SameText(         nam, 'System'              ) then ImageIndex :=   9
  else if TNamRec.IsNameNum(nam, 'Reserved'            ) then ImageIndex :=  10
  {$ENDREGION}

  {$REGION 'containers'}
  else if (Length(nam) = 1) and TStrRec.StrIs09(nam)     then ImageIndex :=  11 // 0..9   numbers
  else if (                 nam = '_'                  ) then ImageIndex :=  12 // _      letters
  else if (Length(nam) = 1) and TChaRec.CharIsAZ(nam[1]) then ImageIndex :=  13 // A..Z   letters
  {$ENDREGION}

  {$REGION 'library/folder/link'}
  else if SameText(         obk, 'Library'             ) then ImageIndex :=  14
  else if SameText(         obk, 'Folder'              ) then ImageIndex :=  15
  else if SameText(         obk, 'Link'                ) then ImageIndex :=  16
  {$ENDREGION}

  {$REGION 'param/switch'}
  else if SameText(         obk, 'Param'               ) then ImageIndex :=  17
  else if SameText(         obk, 'switch'              ) then ImageIndex :=  18
  {$ENDREGION}

  {$REGION 'objectkind i (common)'}
  else if giis.Same([obk, obj] , 'Xxx'                 ) then ImageIndex :=  20 // [OBJECTLIST]
  else if giis.Same([obk, obj] , 'Person'              ) then ImageIndex :=  21
  else if giis.Same([obk, obj] , 'User'                ) then ImageIndex :=  22
  else if giis.Same([obk, obj] , 'Organization'        ) then ImageIndex :=  23 // structure
  else if giis.Same([obk, obj] , 'Department'          ) then ImageIndex :=  24
  else if giis.Same([obk, obj] , 'Area'                ) then ImageIndex :=  25
  else if giis.Same([obk, obj] , 'Team'                ) then ImageIndex :=  26
  else if giis.Same([obk, obj] , 'Member'              ) then ImageIndex :=  27 // male
  else if giis.Same([obk, obj] , 'Member'              ) then ImageIndex :=  28 // female
//else if giis.Same([obk, obj] , 'Page'                ) then ImageIndex :=  29
  {$ENDREGION}

  {$REGION 'objectkind ii (task)'}
  else if giis.Same([obk, obj] , 'Portfolio'           ) then ImageIndex :=  50
  else if giis.Same([obk, obj] , 'Program'             ) then ImageIndex :=  51
  else if giis.Same([obk, obj] , 'Package'             ) then ImageIndex :=  52
  else if giis.Same([obk, obj] , 'Project'             ) then ImageIndex :=  53
  else if giis.Same([obk, obj] , 'Phase'               ) then ImageIndex :=  54
  else if giis.Same([obk, obj] , 'Group'               ) then ImageIndex :=  55
  else if giis.Same([obk, obj] , 'Task'                ) then begin
    if      sta = TStaRec.NEW.Name                       then ImageIndex :=  56 // unplanned
    else if sta = TStaRec.ACTIVE.Name                    then ImageIndex :=  57 // planned
    else if sta = TStaRec.ONGOING.Name                   then ImageIndex :=  58 // focused
    else if sta = TStaRec.DONE.Name                      then ImageIndex :=  59 // completed
    else                                                      ImageIndex :=   0;
  end
  {$ENDREGION}

  {$REGION 'contentkind'}
  else if SameText(       cok, TCodRec.BAT.Kind        ) then ImageIndex :=  32
  else if SameText(       cok, TCodRec.CSS.Kind        ) then ImageIndex :=  30
  else if SameText(       cok,        'Csv'            ) then ImageIndex :=  31
  else if SameText(       cok, TCodRec.DWS.Kind        ) then ImageIndex :=  61
  else if SameText(       cok,        'Etl'            ) then ImageIndex :=  33
  else if SameText(       cok, TCodRec.HTML.Kind       ) then ImageIndex :=  34
  else if SameText(       cok, TCodRec.INI.Kind        ) then ImageIndex :=  35
  else if SameText(       cok, TCodRec.JAVA.Kind       ) then ImageIndex :=  36
  else if SameText(       cok, TCodRec.JS.Kind         ) then ImageIndex :=  37
  else if SameText(       cok, TCodRec.JSL.Kind        ) then ImageIndex :=  38
  else if SameText(       cok, TCodRec.JSON.Kind       ) then ImageIndex :=  39
  else if SameText(       cok, TCodRec.MD.Kind         ) then ImageIndex :=  60
  else if SameText(       cok,        'Ocv'            ) then ImageIndex :=  40
  else if SameText(       cok, TCodRec.PAS.Kind        ) then ImageIndex :=  41
  else if SameText(       cok, TCodRec.PY.Kind         ) then ImageIndex :=  42
  else if SameText(       cok, TCodRec.R.Kind          ) then ImageIndex :=  43
  else if SameText(       cok, TCodRec.SQL.Kind        ) then ImageIndex :=  44
  else if SameText(       cok, TCodRec.TXT.Kind        ) then ImageIndex :=  45
  else if SameText(       cok, TCodRec.YAML.Kind       ) then ImageIndex :=  62
  {$ENDREGION}

  {$REGION 'unknown'}
  else                                                        ImageIndex :=   0;
  {$ENDREGION}

end;
  {$ENDREGION}

  {$REGION 'TW3fRec'}
class function  TW3fRec.W3ColorFromTheme(IvTheme: string): string;
var
  i: integer;
begin
  for i := Low(THEME_NAME_VEC) to High(THEME_NAME_VEC) do
    if SameText(IvTheme, THEME_NAME_VEC[i]) then
      Break;

  if (i < Low(THEME_NAME_VEC)) or (High(THEME_NAME_VEC) < i) then
    i := 0;

  Result := THEME_COLOR_VEC[i];
end;

class function  TW3fRec.W3ThemeCssGenerate(IvTheme, IvH60PrimaryBgColor, IvH30SecondaryFgColor, IvH10AccentColor: string): string;

  {$REGION 'var'}
const
  K = 255; // white/black soglia
var
  sbu: TSbuRec;

  // primary 60% (white)                                ****
  ptl9, ptl8, ptl7, ptl6, ptl5, ptl4, ptl3, ptl2, ptl1, ptco, ptd1, ptd2, ptd3, ptd4, ptd5, ptd6, ptd7, ptd8, ptd9: TColor; // lights, tcolor    , darks
  pbl9, pbl8, pbl7, pbl6, pbl5, pbl4, pbl3, pbl2, pbl1, pbco, pbd1, pbd2, pbd3, pbd4, pbd5, pbd6, pbd7, pbd8, pbd9: word;   // lights, brightness, darks
  phl9, phl8, phl7, phl6, phl5, phl4, phl3, phl2, phl1, phco, phd1, phd2, phd3, phd4, phd5, phd6, phd7, phd8, phd9: string; // lights, htmlcolor , darks
  // secondary/primarydark 30% (black)
                          stl5,                         stco,                         std5                        : TColor; // light , tcolor    , dark
                          sbl5,                         sbco,                         sbd5                        : word;   // light , brightness, dark
                          shl5,                         shco,                         shd5                        : string; // light , htmlcolor , dark
  // accent 10% (red)
                          atl5,                         atco,                         atd5                        : TColor; // light , tcolor    , dark
                          abl5,                         abco,                         abd5                        : word;   // light , brightness, dark
                          ahl5,                         ahco,                         ahd5                        : string; // light , htmlcolor , dark
  {$ENDREGION}

begin

  {$REGION 'fix'}
       if IvH60PrimaryBgColor = '#0f0f0f' then IvH60PrimaryBgColor := '#404040'
  else if IvH60PrimaryBgColor = '#ffffff' then IvH60PrimaryBgColor := '#e0e0e0';
  {$ENDREGION}

  {$REGION 'primarybg60%'}
  // color
  ptco := TColRec.TColFromHtmlHexStr(IvH60PrimaryBgColor);

  // colorgrades in tcolor, brightness, htmlcolor
  ptl9 := {TColRec.TColLighten(tco, 90)} THlsRec.Brighten(ptco, 90); pbl9 := THlsRec.TColLuminance(ptl9); phl9 := TColRec.TColToHtmlHexStr(ptl9); // light   #
  ptl8 := {TColRec.TColLighten(tco, 80)} THlsRec.Brighten(ptco, 80); pbl8 := THlsRec.TColLuminance(ptl8); phl8 := TColRec.TColToHtmlHexStr(ptl8); //         #
  ptl7 := {TColRec.TColLighten(tco, 70)} THlsRec.Brighten(ptco, 70); pbl7 := THlsRec.TColLuminance(ptl7); phl7 := TColRec.TColToHtmlHexStr(ptl7); //         #
  ptl6 := {TColRec.TColLighten(tco, 60)} THlsRec.Brighten(ptco, 60); pbl6 := THlsRec.TColLuminance(ptl6); phl6 := TColRec.TColToHtmlHexStr(ptl6); //         #
  ptl5 := {TColRec.TColLighten(tco, 50)} THlsRec.Brighten(ptco, 50); pbl5 := THlsRec.TColLuminance(ptl5); phl5 := TColRec.TColToHtmlHexStr(ptl5); //         #
  ptl4 := {TColRec.TColLighten(tco, 40)} THlsRec.Brighten(ptco, 40); pbl4 := THlsRec.TColLuminance(ptl4); phl4 := TColRec.TColToHtmlHexStr(ptl4); //         #d9d9d9
  ptl3 := {TColRec.TColLighten(tco, 30)} THlsRec.Brighten(ptco, 30); pbl3 := THlsRec.TColLuminance(ptl3); phl3 := TColRec.TColToHtmlHexStr(ptl3); //         #d2d2d2
  ptl2 := {TColRec.TColLighten(tco, 20)} THlsRec.Brighten(ptco, 20); pbl2 := THlsRec.TColLuminance(ptl2); phl2 := TColRec.TColToHtmlHexStr(ptl2); //         #cccccc
  ptl1 := {TColRec.TColLighten(tco, 10)} THlsRec.Brighten(ptco, 10); pbl1 := THlsRec.TColLuminance(ptl1); phl1 := TColRec.TColToHtmlHexStr(ptl1); //         #c6c6c6
                                                                     pbco := THlsRec.TColLuminance(ptco); phco := IvH60PrimaryBgColor           ; // normal  #c0c0c0
  ptd1 := {TColRec.TColDarken (tco, 10)} THlsRec.Darken  (ptco, 10); pbd1 := THlsRec.TColLuminance(ptd1); phd1 := TColRec.TColToHtmlHexStr(ptd1); //         #adadad
  ptd2 := {TColRec.TColDarken (tco, 20)} THlsRec.Darken  (ptco, 20); pbd2 := THlsRec.TColLuminance(ptd2); phd2 := TColRec.TColToHtmlHexStr(ptd2); //         #9a9a9a
  ptd3 := {TColRec.TColDarken (tco, 30)} THlsRec.Darken  (ptco, 30); pbd3 := THlsRec.TColLuminance(ptd3); phd3 := TColRec.TColToHtmlHexStr(ptd3); //         #878787
  ptd4 := {TColRec.TColDarken (tco, 40)} THlsRec.Darken  (ptco, 40); pbd4 := THlsRec.TColLuminance(ptd4); phd4 := TColRec.TColToHtmlHexStr(ptd4); //         #747474
  ptd5 := {TColRec.TColDarken (tco, 50)} THlsRec.Darken  (ptco, 50); pbd5 := THlsRec.TColLuminance(ptd5); phd5 := TColRec.TColToHtmlHexStr(ptd5); //         #
  ptd6 := {TColRec.TColDarken (tco, 60)} THlsRec.Darken  (ptco, 60); pbd6 := THlsRec.TColLuminance(ptd6); phd6 := TColRec.TColToHtmlHexStr(ptd6); //         #
  ptd7 := {TColRec.TColDarken (tco, 70)} THlsRec.Darken  (ptco, 70); pbd7 := THlsRec.TColLuminance(ptd7); phd7 := TColRec.TColToHtmlHexStr(ptd7); //         #
  ptd8 := {TColRec.TColDarken (tco, 80)} THlsRec.Darken  (ptco, 80); pbd8 := THlsRec.TColLuminance(ptd8); phd8 := TColRec.TColToHtmlHexStr(ptd8); //         #
  ptd9 := {TColRec.TColDarken (tco, 90)} THlsRec.Darken  (ptco, 90); pbd9 := THlsRec.TColLuminance(ptd9); phd9 := TColRec.TColToHtmlHexStr(ptd9); // dark    #
  {$ENDREGION}

  {$REGION 'secondaryfg30%'}
  // color
  stco := TColRec.TColFromHtmlHexStr(IvH30SecondaryFgColor);

  // colorgrades
  stl5 := {TColRec.TColLighten(tco, 50)} THlsRec.Brighten(ptco, 50); sbl5 := THlsRec.TColLuminance(ptl5); shl5 := TColRec.TColToHtmlHexStr(ptl5); // light   #c6c6c6
                                                                     sbco := THlsRec.TColLuminance(ptco); shco := IvH30SecondaryFgColor         ; // normal  #c0c0c0
  std5 := {TColRec.TColDarken (tco, 50)} THlsRec.Darken  (ptco, 50); sbd5 := THlsRec.TColLuminance(ptd5); shd5 := TColRec.TColToHtmlHexStr(ptd5); // dark    #adadad
  {$ENDREGION}

  {$REGION 'accent10%'}
  // color
  atco := TColRec.TColFromHtmlHexStr(IvH10AccentColor);

  // colorgrades
  atl5 := {TColRec.TColLighten(atco, 50)} THlsRec.Brighten(atco, 50); abl5 := THlsRec.TColLuminance(atl5); ahl5 := TColRec.TColToHtmlHexStr(atl5); // light   #c6c6c6
                                                                      abco := THlsRec.TColLuminance(atco); ahco := IvH10AccentColor              ; // normal  #c0c0c0
  atd5 := {TColRec.TColDarken (atco, 50)} THlsRec.Darken  (atco ,50); abd5 := THlsRec.TColLuminance(atd5); ahd5 := TColRec.TColToHtmlHexStr(atd5); // dark    #adadad
  {$ENDREGION}

  {$REGION 'w3 theme primary 60%'}
  sbu.Add('/***'                                                                                , true , 0);
  sbu.Add(' * W3CSS THEME(%s) PRIMARY-COLOR (%s) 60% - %s%'          , [IvTheme, phco, DateTimeToStr(Now)]);
  sbu.Add(' */'                                                                                           );
  sbu.Add(' /* GRADES */'                                                                                 );
  sbu.Add('.w3-theme-l9        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbl9 > K, '#000', '#fff'), phl9, pbl9]);
  sbu.Add('.w3-theme-l8        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbl8 > K, '#000', '#fff'), phl8, pbl8]);
  sbu.Add('.w3-theme-l7        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbl7 > K, '#000', '#fff'), phl7, pbl7]);
  sbu.Add('.w3-theme-l6        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbl6 > K, '#000', '#fff'), phl6, pbl6]);
//sbu.Add('.w3-theme-light     {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbl5 > K, '#000', '#fff'), phl5, pbl5]);
  sbu.Add('.w3-theme-l5        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbl5 > K, '#000', '#fff'), phl5, pbl5]);
  sbu.Add('.w3-theme-l4        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbl4 > K, '#000', '#fff'), phl4, pbl4]);
  sbu.Add('.w3-theme-l3        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbl3 > K, '#000', '#fff'), phl3, pbl3]);
  sbu.Add('.w3-theme-l2        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbl2 > K, '#000', '#fff'), phl2, pbl2]);
  sbu.Add('.w3-theme-l1        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbl1 > K, '#000', '#fff'), phl1, pbl1]);
  sbu.Add('.w3-theme           {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbco > K, '#000', '#fff'), phco, pbco]);
  sbu.Add('.w3-theme-d1        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbd1 > K, '#000', '#fff'), phd1, pbd1]);
  sbu.Add('.w3-theme-d2        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbd2 > K, '#000', '#fff'), phd2, pbd2]);
  sbu.Add('.w3-theme-d3        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbd3 > K, '#000', '#fff'), phd3, pbd3]);
  sbu.Add('.w3-theme-d4        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbd4 > K, '#000', '#fff'), phd4, pbd4]);
  sbu.Add('.w3-theme-d5        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbd5 > K, '#000', '#fff'), phd5, pbd5]);
//sbu.Add('.w3-theme-dark      {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbd5 > K, '#000', '#fff'), phd5, pbd5]);
  sbu.Add('.w3-theme-d6        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbd6 > K, '#000', '#fff'), phd6, pbd6]);
  sbu.Add('.w3-theme-d7        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbd7 > K, '#000', '#fff'), phd7, pbd7]);
  sbu.Add('.w3-theme-d8        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbd8 > K, '#000', '#fff'), phd8, pbd8]);
  sbu.Add('.w3-theme-d9        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(pbd9 > K, '#000', '#fff'), phd9, pbd9]);
  {$ENDREGION}

  {$REGION 'w3 theme secondary 30%'}
  sbu.Anl;
  sbu.Add('/***'                                                                                          );
  sbu.Add(' * W3CSS THEME(%s) SECONDARY-COLOR (%s) 30%%'                                 , [IvTheme, shco]);
  sbu.Add(' */'                                                                                           );
  sbu.Add(' /* GRADES */'                                                                                 );
  sbu.Add('.w3-theme-s-l      {color:%s !important; background-color:%s !important} /* %d */', [ifthen(sbl5 > K, '#000', '#fff'), shl5, sbl5]);
  sbu.Add('.w3-theme-s        {color:%s !important; background-color:%s !important} /* %d */', [ifthen(sbco > K, '#000', '#fff'), shco, sbco]);
  sbu.Add('.w3-theme-s-d      {color:%s !important; background-color:%s !important} /* %d */', [ifthen(sbd5 > K, '#000', '#fff'), shd5, sbd5]);
  {$ENDREGION}

  {$REGION 'w3 theme accent 10%'}
  sbu.Anl;
  sbu.Add('/***'                                                                                          );
  sbu.Add(' * W3CSS THEME(%s) ACCENT-COLOR (%s) 10%%'                                    , [IvTheme, ahco]);
  sbu.Add(' */'                                                                                           );
  sbu.Add('.w3-theme-a-l      {color:%s !important; background-color:%s !important} /* %d */', [{ifthen(abl5 > K, '#000', '#fff')}ahd5, ahl5, abl5]); // light
  sbu.Add('.w3-theme-a        {color:%s !important; background-color:%s !important} /* %d */', [ ifthen(abco > K, '#000', '#fff')     , ahco, abco]); // normal
  sbu.Add('.w3-theme-a-d      {color:%s !important; background-color:%s !important} /* %d */', [{ifthen(abd5 > K, '#000', '#fff')}ahl5, ahd5, abd5]); // dark
  sbu.Add('.w3-theme-a-t    {color:%s !important; background-color:%s80 !important} /* %d */', [{ifthen(abco > K, '#000', '#fff')}ahd5, ahco, abco]); // t???
  {$ENDREGION}

  {$REGION 'w3 theme text'}
  sbu.Anl;
  sbu.Add('/***'                                                                                          );
  sbu.Add(' * W3CSS THEME(%s) TEXT'                                                            , [IvTheme]);
  sbu.Add(' */'                                                                                           );
//sbu.Add('.w3-theme-text             {color:%s !important;}'                                     , [shco]);
  sbu.Add('.w3-theme-text-muted       {color:%s !important;}'                                     , [shl5]);
  sbu.Add('.w3-theme-text-light       {color:%s !important;}'                                     , [shl5]);
  sbu.Add('.w3-theme-text             {color:%s !important;}'                                     , [phco]);
  sbu.Add('.w3-theme-text-dark        {color:%s !important;}'                                     , [shd5]);
  sbu.Add('.w3-theme-text-underline-s {text-decoration: underline;text-decoration-color: %s;text-decoration-thickness: 4px;}', [ahco]);
  sbu.Add('.w3-theme-text-underline-m {text-decoration: underline;text-decoration-color: %s;text-decoration-thickness: 8px;}', [ahco]);
  sbu.Add('.w3-theme-text-underline-l {text-decoration: underline;text-decoration-color: %s;text-decoration-thickness:12px;}', [ahco]);
  {$ENDREGION}

  {$REGION 'w3 theme border'}
  sbu.Anl;
  sbu.Add('/***'                                                                                          );
  sbu.Add(' * W3CSS THEME(%s) BORDER'                                                          , [IvTheme]);
  sbu.Add(' */'                                                                                           );
  sbu.Anl;
  sbu.Add('.w3-theme-border-l {border-color:%s !important;}'                                      , [shl5]);
  sbu.Add('.w3-theme-border   {border-color:%s !important;}'                                      , [shco]);
  sbu.Add('.w3-theme-border-d {border-color:%s !important;}'                                      , [shd5]);
  {$ENDREGION}

  {$REGION 'w3 theme gradient'}
  sbu.Anl;
  sbu.Add('/***'                                                                                          );
  sbu.Add(' * W3CSS THEME(%s) GRADIENT (%s)'                                             , [IvTheme, ahco]);
  sbu.Add(' */'                                                                                           );
  sbu.Add('.w3-theme-gradient  {color:%s !important; background:-webkit-linear-gradient(top,%s 25%%,%s 75%%)}', [ifthen(pbco > K, '#000', '#fff'), phl2, phd1]);
  sbu.Add('.w3-theme-gradient  {color:%s !important; background:   -moz-linear-gradient(top,%s 25%%,%s 75%%)}', [ifthen(pbco > K, '#000', '#fff'), phl2, phd1]);
  sbu.Add('.w3-theme-gradient  {color:%s !important; background:     -o-linear-gradient(top,%s 25%%,%s 75%%)}', [ifthen(pbco > K, '#000', '#fff'), phl2, phd1]);
  sbu.Add('.w3-theme-gradient  {color:%s !important; background:    -ms-linear-gradient(top,%s 25%%,%s 75%%)}', [ifthen(pbco > K, '#000', '#fff'), phl2, phd1]);
  sbu.Add('.w3-theme-gradient  {color:%s !important; background:        linear-gradient(top,%s 25%%,%s 75%%)}', [ifthen(pbco > K, '#000', '#fff'), phl2, phd1]);
  {$ENDREGION}

  {$REGION 'w3 theme hover'}
  sbu.Anl;
  sbu.Add('/***'                                                                                          );
  sbu.Add(' * W3CSS THEME(%s) HOVER'                                                           , [IvTheme]);
  sbu.Add(' */'                                                                                           );
  sbu.Anl;
  sbu.Add('.w3-theme-hover:hover        {color:#000 !important; background-color:%s !important}'  , [ahco]);
  sbu.Add('.w3-theme-hover-text:hover   {color:%s                                   !important}'  , [ahco]);
  sbu.Add('.w3-theme-hover-border:hover {border-color:%s                            !important}'  , [ahco]);
  {$ENDREGION}

  {$REGION 'w3 theme waitloader'}
  sbu.Anl;
  sbu.Add('/***'                                                                                          );
  sbu.Add(' * W3CSS ADDIN(%s) WAITLOADER'                                                      , [IvTheme]);
  sbu.Add(' */'                                                                                           );
  sbu.Add('@-webkit-keyframes CoSpin { /* safari */'                                                      ); // ?
  sbu.Add('  0% { -webkit-transform: rotate(0deg); }'                                                     );
  sbu.Add('  100% { -webkit-transform: rotate(360deg); }'                                                 );
  sbu.Add('}'                                                                                             );
  sbu.Add('@keyframes CoSpin {'                                                                           ); // ?
  sbu.Add('  0% { transform: rotate(0deg); }'                                                             );
  sbu.Add('  100% { transform: rotate(360deg); }'                                                         );
  sbu.Add('}'                                                                                             );
  sbu.Add('.w3-waitloader-spin {'                                                                         ); // byclass
  sbu.Add('  position: absolute;'                                                                         );
  sbu.Add('  width: 150px;'                                                                               ); // width
  sbu.Add('  height: 150px;'                                                                              ); // height
  sbu.Add('  border: 15px solid %s;'                                                              , [phl4]); // thickness and bgcolor
  sbu.Add('  border-top: 15px solid %s;'                                                          , [phd2]); // thickness and fgcolor
  sbu.Add('  border-radius: 50%;'                                                                         );
  sbu.Add('  margin-top: -75px;'                                                                          );
  sbu.Add('  margin-left: -75px;'                                                                         );
  sbu.Add('  top: 50%;'                                                                                   );
  sbu.Add('  left: 50%;'                                                                                  );
  sbu.Add('  z-index: 1;'                                                                                 );
  sbu.Add('  -webkit-animation: CoSpin 2s linear infinite;'                                               ); // safari
  sbu.Add('  animation: CoSpin 2s linear infinite;'                                                       );
  sbu.Add('}'                                                                                             );
  sbu.Add('.w3-waitloader-number {'                                                                       );
  sbu.Add('  position: absolute;'                                                                         );
  sbu.Add('  width: 150px;'                                                                               );
  sbu.Add('  height: 150px;'                                                                              );
//sbu.Add('  border: 0px solid red;'                                                                      );
  sbu.Add('  top: 50%;'                                                                                   );
  sbu.Add('  left: 50%;'                                                                                  );
  sbu.Add('  transform: translate(-50%, -50%);'                                                           );
  sbu.Add('  display: flex;'                                                                              );
  sbu.Add('  justify-content: center;'                                                                    );
  sbu.Add('  align-items: center;'                                                                        );
  sbu.Add('  font-size: 70px;'                                                                            );
  sbu.Add('  font-weight: bold;'                                                                          );
  sbu.Add('  color: %s;'                                                                          , [phd2]);
  sbu.Add('}'                                                                                             );
  {$ENDREGION}

  {$REGION 'w3 theme snackbar'}
  sbu.Anl;
  sbu.Add('/***'                                                                                          );
  sbu.Add(' * W3CSS THEME(%s) SNACKBAR'                                                        , [IvTheme]);
  sbu.Add(' */'                                                                                           );
  sbu.Add('@-webkit-keyframes CoSnackbarFadein {'                                                         );
  sbu.Add('  from {bottom: 0; opacity: 0;} to {bottom: 30px; opacity: 1;}'                                );
  sbu.Add('}'                                                                                             );
  sbu.Add('@keyframes CoSnackbarFadein {'                                                                 );
  sbu.Add('  from {bottom: 0; opacity: 0;} to {bottom: 30px; opacity: 1;}'                                );
  sbu.Add('}'                                                                                             );
  sbu.Add('@-webkit-keyframes CoSnackbarFadeout {'                                                        );
  sbu.Add('  from {bottom: 30px; opacity: 1;} to {bottom: 0; opacity: 0;}'                                );
  sbu.Add('}'                                                                                             );
  sbu.Add('@keyframes CoSnackbarFadeout {'                                                                );
  sbu.Add('  from {bottom: 30px; opacity: 1;} to {bottom: 0; opacity: 0;}'                                );
  sbu.Add('}'                                                                                             );
  sbu.Add('#CoSnackbar {'                                                                                 ); // byid
  sbu.Add('  visibility: hidden;'                                                                         );
  sbu.Add('  background-color: %s;'                                                               , [phd4]);
  sbu.Add('  color: %s;'                                                                          , [phl4]);
  sbu.Add('  position: fixed;'                                                                            );
  sbu.Add('  min-width: 400px;'                                                                           );
  sbu.Add('  margin-left: -200px;'                                                                        );
  sbu.Add('  left: 50%;'                                                                                  );
  sbu.Add('  bottom: 30px;'                                                                               );
  sbu.Add('  text-align: center;'                                                                         );
  sbu.Add('  border-radius: 8px;'                                                                         );
  sbu.Add('  padding: 16px;'                                                                              );
  sbu.Add('  z-index: 1;'                                                                                 );
  sbu.Add('}'                                                                                             );
  sbu.Add('#CoSnackbar.show {'                                                                            );
  sbu.Add('  visibility: visible;'                                                                        );
  sbu.Add('  -webkit-animation: CoSnackbarFadein 0.5s, fadeout 0.5s 2.5s;'                                );
  sbu.Add('  animation: CoSnackbarFadein 0.5s, fadeout 0.5s 2.5s;'                                        );
  sbu.Add('}'                                                                                             );
  {$ENDREGION}

  {$REGION 'w3 addins'}
  sbu.Anl;
  sbu.Add('/***'                                                                                          );
  sbu.Add(' * W3CSS ADDINS'                                                                               );
  sbu.Add(' */'                                                                                           );

  sbu.Add('.w3-padding-zero     {padding: 0px      !important;}'                                          );
  sbu.Add('.w3-padding-xsmall   {padding: 2px  4px !important;}'                                          );
  sbu.Add('.w3-padding-small    {padding: 4px  4px !important;}'                                          );
  sbu.Add('.w3-padding-medium   {padding: 8px  8px !important;}'                                          );
  sbu.Add('.w3-padding-large    {padding:12px 12px !important;}'                                          );
  sbu.Add('.w3-padding-xlarge   {padding:16px 16px !important;}'                                          );

  sbu.Add('.w3-padding-y-zero   {padding-top: 0px !important; padding-bottom: 0px !important;}'           );
  sbu.Add('.w3-padding-y-xsmall {padding-top: 2px !important; padding-bottom: 2px !important;}'           );
  sbu.Add('.w3-padding-y-small  {padding-top: 4px !important; padding-bottom: 4px !important;}'           );
  sbu.Add('.w3-padding-y-medium {padding-top: 8px !important; padding-bottom: 8px !important;}'           );
  sbu.Add('.w3-padding-y-large  {padding-top:12px !important; padding-bottom:12px !important;}'           );
  sbu.Add('.w3-padding-y-xlarge {padding-top:16px !important; padding-bottom:16px !important;}'           );

  sbu.Add('.w3-padding-x-zero   {padding-left: 0px !important; padding-right: 0px !important;}'           );
  sbu.Add('.w3-padding-x-small  {padding-left: 2px !important; padding-right: 2px !important;}'           );
  sbu.Add('.w3-padding-x-small  {padding-left: 4px !important; padding-right: 4px !important;}'           );
  sbu.Add('.w3-padding-x-medium {padding-left: 8px !important; padding-right: 8px !important;}'           );
  sbu.Add('.w3-padding-x-large  {padding-left:12px !important; padding-right:12px !important;}'           );
  sbu.Add('.w3-padding-x-xlarge {padding-left:16px !important; padding-right:16px !important;}'           );

  sbu.Add('.w3-text-italic            {font-style: italic;}'                                              );
  sbu.Add('.w3-table-centered         {margin-left: auto;margin-right: auto; display: block;}'            );
  sbu.Add('.w3-table-centered-compact {margin-left: auto;margin-right: auto; display: block;width: 0;}'   );

  sbu.Add('.w3-shadow           {filter: drop-shadow(0px 0px 2px rgba(0, 0, 0, 0.5));}'                   );
  sbu.Add('.w3-shadow-theme     {filter: drop-shadow(0px 0px 2px rgba(%d, %d, %d, %f));}', [TColRec.R(ptco),TColRec.G(ptco),TColRec.B(ptco), 0.5]);

  sbu.Add('.w3-torn-bot{'         );
  sbu.Add('    clip-path:polygon(');
  sbu.Add('     0% 0%'            );
  sbu.Add('    ,0% 100%'          );
  sbu.Add('    ,02% 96%,04% 90%,06% 99%,08% 99%,10% 95%,12% 99%,14% 93%,16% 95%,18% 93%,20% 98%,22% 90%,24% 96%,26% 92%,28% 92%,30% 93%,32% 95%,34% 90%,36% 97%,38% 97%,40% 99%,42% 92%,44% 99%,46% 99%,48% 96%,50% 99%'+',52% 97%,54% 98%,56% 98%,58% 95%,60% 90%,62% 91%,64% 97%,66% 94%,68% 95%,70% 98%,72% 95%,74% 94%,76% 98%,78% 90%,80% 95%,82% 99%,84% 96%,86% 96%,88% 98%,90% 96%,92% 94%,94% 90%,96% 91%,98% 98%');
  sbu.Add('    ,100% 100%'        );
  sbu.Add('    ,100% 0%'          );
  sbu.Add('    ,0% 0%'            );
  sbu.Add('    )'                 );
  sbu.Add('}'                     );
  sbu.Add('.w3-torn-top-bot{'     );
  sbu.Add('    clip-path:polygon(');
  sbu.Add('     0% 10%'           );
  sbu.Add('    ,0% 100%'          );
  sbu.Add('    ,02% 96%,04% 90%,06% 99%,08% 99%,10% 95%,12% 99%,14% 93%,16% 95%,18% 93%,20% 98%,22% 90%,24% 96%,26% 92%,28% 92%,30% 93%,32% 95%,34% 90%,36% 97%,38% 97%,40% 99%,42% 92%,44% 99%,46% 99%,48% 96%,50% 99%'+',52% 97%,54% 98%,56% 98%,58% 95%,60% 90%,62% 91%,64% 97%,66% 94%,68% 95%,70% 98%,72% 95%,74% 94%,76% 98%,78% 90%,80% 95%,82% 99%,84% 96%,86% 96%,88% 98%,90% 96%,92% 94%,94% 90%,96% 91%,98% 98%');
  sbu.Add('    ,100% 100%'        );
  sbu.Add('    ,100% 10%'         );
  sbu.Add('    ,98% 08%,96% 01%,94% 00%,92% 04%,90% 06%,88% 08%,86% 06%,84% 06%,82% 09%,80% 05%,78% 00%,76% 08%,74% 04%,72% 05%,70% 08%,68% 05%,66% 04%,64% 07%,62% 01%,60% 00%,58% 05%,56% 08%,54% 08%,52% 07%,50% 09%'+',48% 06%,46% 09%,44% 09%,42% 02%,40% 09%,38% 07%,36% 07%,34% 00%,32% 05%,30% 03%,28% 02%,26% 02%,24% 06%,22% 00%,20% 08%,18% 03%,16% 05%,14% 03%,12% 09%,10% 05%,08% 09%,06% 09%,04% 00%,02% 06%');
  sbu.Add('    ,0% 10%'           );
  sbu.Add('    )'                 );
  sbu.Add('}'                     );
   sbu.Add('.w3-torn-top{'         );
  sbu.Add('    clip-path:polygon(');
  sbu.Add('     0% 10%'           );
  sbu.Add('    ,0% 100%'          );
  sbu.Add('    ,100% 100%'        );
  sbu.Add('    ,100% 10%'         );
  sbu.Add('    ,98% 08%,96% 01%,94% 00%,92% 04%,90% 06%,88% 08%,86% 06%,84% 06%,82% 09%,80% 05%,78% 00%,76% 08%,74% 04%,72% 05%,70% 08%,68% 05%,66% 04%,64% 07%,62% 01%,60% 00%,58% 05%,56% 08%,54% 08%,52% 07%,50% 09%'+',48% 06%,46% 09%,44% 09%,42% 02%,40% 09%,38% 07%,36% 07%,34% 00%,32% 05%,30% 03%,28% 02%,26% 02%,24% 06%,22% 00%,20% 08%,18% 03%,16% 05%,14% 03%,12% 09%,10% 05%,08% 09%,06% 09%,04% 00%,02% 06%');
  sbu.Add('    ,0% 10%'           );
  sbu.Add('    )'                 );
  sbu.Add('}'                     );
   {$ENDREGION}

  {$REGION 'w3 overrides'}
  sbu.Anl;
  sbu.Add('/***'                                                                                          );
  sbu.Add(' * W3CSS OVERRIDES'                                                                            );
  sbu.Add(' */'                                                                                           );
  sbu.Add('.w3-modal {'                                                                                   );
  sbu.Add('  background-color: rgb(%d,%d,%d);'    , [TColRec.R(phd5),TColRec.G(phd5),TColRec.B(phd5)     ]);
  sbu.Add('  background-color: rgba(%d,%d,%d,%f);', [TColRec.R(phd7),TColRec.G(phd7),TColRec.B(phd7), 0.5]);
  sbu.Add('}'                                                                                             );
  {$ENDREGION}

  {$REGION 'html overrides'}
  sbu.Anl;
  sbu.Add('/***'                                                                                          );
  sbu.Add(' * HTML OVERRIDES'                                                                             );
  sbu.Add(' */'                                                                                           );
  sbu.Add('a:link     {color: %s;background-color: transparent;text-decoration: none;}'           , [ahco]); // anchor
  sbu.Add('a:visited  {color: %s;background-color: transparent;text-decoration: none;}'           , [ahco]);
  sbu.Add('a:hover    {color: %s;background-color: transparent;text-decoration: underline;}'      , [ahd5]);
  sbu.Add('a:active   {color: %s;background-color: transparent;text-decoration: underline;}'      , [ahco]);
  sbu.Add('abbr       {color: %s;font-weight: bold;}'                                             , [ahd5]);
  sbu.Add('blockquote {'                                                                                  ); // blockquote
  sbu.Add('  display: block;'                                                                             );
  sbu.Add('  position: relative;'                                                                         );
  sbu.Add('  background: %s;'                                                                     , [phl8]);
  sbu.Add('  margin: 0 0 16px;'                                                                           );
  sbu.Add('  border-left: 8px solid %s;'                                                          , [phd3]);
  sbu.Add('  border-top: 1px solid %s;'                                                           , [phd1]);
  sbu.Add('  border-right: 1px solid %s;'                                                         , [phd1]);
  sbu.Add('  border-bottom: 1px solid %s;'                                                        , [phd1]);
  sbu.Add('  padding: 8px 32px 8px 32px;'                                                                 );
//sbu.Add('  font-size: 14px;'                                                                            );
//sbu.Add('  line-height: 1.6;'                                                                           );
  sbu.Add('  color: %s;'                                                                          , [phd4]);
//sbu.Add('  /* shadow */'                                                                                );
  sbu.Add('  -moz-box-shadow: 2px 2px 16px %s;'                                                   , [phl2]);
  sbu.Add('  -webkit-box-shadow: 2px 2px 16px %s;'                                                , [phl2]);
  sbu.Add('  box-shadow: 2px 2px 16px %s;'                                                        , [phl2]);
  sbu.Add('}'                                                                                             );
  sbu.Add('cite {color: %s;}'                                                                     , [phd5]);
  sbu.Add('code {'                                                                                        ); // code snipet box fillet
  sbu.Add('  background-color: #eee;'                                                                     );
  sbu.Add('  border-radius: 4px;'                                                                         );
//sbu.Add('  font-family: %s;'                                                         , [gthe.FontFamily]); // courier, monospace
  sbu.Add('  padding: 1px 3px;'                                                                           );
  sbu.Add('  border: 1px solid silver;'                                                                   );
  sbu.Add('}'                                                                                             );
  sbu.Add('del {'                                                                                         ); // textremoved
  sbu.Add('  background: %s;'                                                              , ['lightpink']);
  sbu.Add('  color: %s;'                                                                   , ['indianred']);
  sbu.Add('  padding: 1px 4px;'                                                                           );
  sbu.Add('  border-radius: 4px;'                                                                         );
  sbu.Add('}'                                                                                             );
  sbu.Add('em {'                                                                                          ); // textwarning
  sbu.Add('  background: %s;'                                                                   , ['gold']);
  sbu.Add('  color: %s;'                                                                      , ['sienna']);
  sbu.Add('  padding: 1px 4px;'                                                                           );
  sbu.Add('  border-radius: 4px;'                                                                         );
  sbu.Add('  font-style: normal;'                                                                         );
  sbu.Add('}'                                                                                             );
//sbu.Add('h1,h2,h3,h4,h5,h6 {'                                                                           ); // already in ThtmRec.Page
//sbu.Add('  font-family: %s;'                                                         , [gthe.FontFamily]);
//sbu.Add('  font-weight: 500;'                                                                           );
//sbu.Add('  margin :16px 0;'                                                                             );
//sbu.Add('}'                                                                                             );
  sbu.Add('ins {'                                                                                         ); // textadded
  sbu.Add('  background: %s;'                                                              , ['palegreen']);
  sbu.Add('  color: %s;'                                                                 , ['forestgreen']);
  sbu.Add('  padding: 1px 4px;'                                                                           );
  sbu.Add('  border-radius: 4px;'                                                                         );
  sbu.Add('}'                                                                                             );
  sbu.Add('kbd {'                                                                                         ); // textinfo
  sbu.Add('  background: %s;'                                                          , ['paleturquoise']);
  sbu.Add('  color: %s;'                                                                  , ['dodgerblue']);
  sbu.Add('  padding: 1px 4px;'                                                                           );
  sbu.Add('  border-radius: 4px;'                                                                         );
  sbu.Add('}'                                                                                             );
  sbu.Add('mark {'                                                                                        ); // texthighlight
  sbu.Add('  background: %s;'                                                   {lemonyellow} , ['#afa33']);
  sbu.Add('  color: %s;'                                                                     , ['dimgray']);
  sbu.Add('  padding: 1px 4px;'                                                                           );
  sbu.Add('  border-radius: 4px;'                                                                         );
  sbu.Add('}'                                                                                             );
  sbu.Add('progress{'                                                                                     );
  sbu.Add('  -webkit-appearance: none;'                                                                   );
  sbu.Add('  appearance: none;'                                                                           );
  sbu.Add('  width: 5em;'                                                                                 );
  sbu.Add('  height: 0.5em;'                                                                              );
  sbu.Add('  margin: 1px;'                                                                                );
  sbu.Add('}'                                                                                             );
  sbu.Add('progress::-webkit-progress-bar {'                                                              );
  sbu.Add('  background-color: white;'                                                                    );
  sbu.Add('  border: 1px solid darkgray;'                                                                 );
  sbu.Add('  border-radius: 0.3em;'                                                                       );
  sbu.Add('}'                                                                                             );
  sbu.Add('progress::-webkit-progress-value {'                                                            );
  sbu.Add('  background-color: #107C10;' {limegreen same as std meter}                                    );
  sbu.Add('  border-radius: 0.3em;'                                                                       );
  sbu.Add('}'                                                                                             );
  sbu.Add('q  {color: %s;}'                                                                       , [shd5]); // textquote

    {$REGION 'inputs'}
  sbu.Add('input:hover, textarea:hover, select:hover {'                                                   ); // color on mouse over
  sbu.Add('  background-color: %s;'                                                               , [phl2]);
  sbu.Add('}'                                                                                             );
  sbu.Add('input:focus, textarea:focus, select:focus {'                                                   );
  sbu.Add('  outline: none !important;'                                                                   ); // prevent highligh input elements
  sbu.Add('  border-color: %s;'                                                                   , [phd3]);
  sbu.Add('  box-shadow: 0 0 10px %s;'                                                            , [phd3]);
//sbu.Add('*:focus {'                                                                                     ); // prevent chrome to highligh other elements
//sbu.Add('  outline: none;'                                                                              );
//sbu.Add('}'                                                                                             );
  sbu.Add('}'                                                                                             );
    {$ENDREGION}

    {$REGION 'list'}
  // listunordered
  sbu.Add('ul             {padding-left: 1.2em;}'                                                         );
  sbu.Add('ul.none        {list-style-type: none;}'                                                       );
  sbu.Add('ul.circle      {list-style-type: circle;}'                                                     );
  sbu.Add('ul.disc        {list-style-type: disc;}'                                                       );
  sbu.Add('ul.square      {list-style-type: square;}'                                                     );
  sbu.Add('ul.dash        {list-style-type: none;}'                                                       );
//sbu.Add('ul.dash > li:before {content: "–";position: absolute;margin-left: -1.1em;}'                    );
  sbu.Add('ul.dash > li   {list-style-type: ''– '';}'                                                     ); // list-style-position: outside;
  // listordered
  sbu.Add('ol             {padding-left: 1.2em;}'                                                         );
  sbu.Add('ol.none        {list-style-type: none;}'                                                       );
  sbu.Add('ol.decimal     {list-style-type: decimal;}'                                                    );
  sbu.Add('ol.decimal0    {list-style-type: decimal-leading-zero;}'                                       );
  sbu.Add('ol.alpha       {list-style-type: lower-alpha;}'                                                );
  sbu.Add('ol.alpha-upper {list-style-type: upper-alpha;}'                                                );
  sbu.Add('ol.roman       {list-style-type: lower-roman;}'                                                );
  sbu.Add('ol.roman-upper {list-style-type: upper-roman;}'                                                );
  sbu.Add('ol.greek       {list-style-type: lower-greek;}'                                                );
  // definitionlist
  sbu.Add('dl             {border: 1px solid #ccc; padding: 1em;}'                                        );
  sbu.Add('dt             {font-weight: bold; text-decoration: underline;}'                               );
  sbu.Add('dd             {margin: 0.5em 1em; padding: 0 0 0.5em 0;}'                                     );
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'w3 theme zzz'}
//sbu.Anl;
//sbu.Add('.w3-theme-action             {color:#fff !important; background-color:%s !important}'  , [ahd5]);
//sbu.Add('.w3-theme-border             {border-color:%s                            !important}'  , [ahco]);
//sbu.Add('.w3-theme-scrollbar::-webkit-scrollbar             {width:12px;height:12px;}'                  );
//sbu.Add('.w3-theme-scrollbar::-webkit-scrollbar-track       {background:%s;}'                   , [phd1]);
//sbu.Add('.w3-theme-scrollbar::-webkit-scrollbar-thumb       {background:%s;}'                   , [phd2]);
//sbu.Add('.w3-theme-scrollbar::-webkit-scrollbar-thumb:hover {background:%s;}'                   , [phd3]);
//sbu.Add('.w3-theme-scrollbar::-webkit-scrollbar-corner      {background: transparent;}'                 );
  {$ENDREGION}

  Result := sbu.Text;
end;

class function  TW3fRec.W3ThemeTestHtmlGenerate: string;
var
  sbu: TSbuRec;
begin
  sbu.Add('<h2>%s Theme</h2>'                                     , [gthe.Theme]);
  sbu.Add('<div class="w3-card-4">'                                             );
  sbu.Add(  '<div class="w3-container w3-theme-gradient">'                      ); // theme-gradient
  sbu.Add(    '<h3>w3-theme-gradient</h3>'                                      );
  sbu.Add(  '</div>'                                                            );
  sbu.Add(  '<div class="w3-container w3-theme">'                               ); // theme
  sbu.Add(    '<h3>w3-theme</h3>'                                               );
  sbu.Add(  '</div>'                                                            );
  sbu.Add(  '<div class="w3-container w3-theme-text-muted">'                    ); // theme-text-muted
  sbu.Add(    '<h3>w3-theme-text-muted</h3>'                                    );
  sbu.Add(  '</div>'                                                            );
  sbu.Add(  '<div class="w3-container w3-theme-a">'                             ); // theme-accent
  sbu.Add(    '<h3>w3-theme-accent</h3>'                                        );
  sbu.Add(  '</div>'                                                            );
  sbu.Add(  '<a class="w3-button w3-xlarge w3-circle w3-theme-a-l" style="position:fixed;top:64px;right:160px;">+</a>'); // circlebutton
  sbu.Add(  '<a class="w3-button w3-xlarge w3-circle w3-theme-a"   style="position:fixed;top:64px;right:100px;">+</a>');
  sbu.Add(  '<a class="w3-button w3-xlarge w3-circle w3-theme-a-d" style="position:fixed;top:64px;right: 40px;">+</a>');
  sbu.Add('</div>'                                                              );

  sbu.Add('<br>'                                                                );
  sbu.Add('<h2>%s Levels</h2>'                                    , [gthe.Theme]);
  sbu.Add('<div class="w3-card-4">'                                             );
  sbu.Add(  '<ul class="w3-ul w3-border-top">'                                  ); // list
  sbu.Add(    '<li class="w3-theme-l9"><p>w3-theme-l9</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-l8"><p>w3-theme-l8</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-l7"><p>w3-theme-l7</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-l6"><p>w3-theme-l6</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-l5"><p>w3-theme-l5 (w3-theme-light)</p></li>');
  sbu.Add(    '<li class="w3-theme-l4"><p>w3-theme-l4</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-l3"><p>w3-theme-l3</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-l2"><p>w3-theme-l2</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-l1"><p>w3-theme-l1</p></li>'                 );
  sbu.Add(    '<li class="w3-theme"><p>w3-theme</p></li>'                       );
  sbu.Add(    '<li class="w3-theme-d1"><p>w3-theme-d1</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-d2"><p>w3-theme-d2</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-d3"><p>w3-theme-d3</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-d4"><p>w3-theme-d4</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-d5"><p>w3-theme-d5 (w3-theme-dark)</p></li>' );
  sbu.Add(    '<li class="w3-theme-d6"><p>w3-theme-d6</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-d7"><p>w3-theme-d7</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-d8"><p>w3-theme-d8</p></li>'                 );
  sbu.Add(    '<li class="w3-theme-d9"><p>w3-theme-d9</p></li>'                 );
  sbu.Add(  '</ul>'                                                             );
  sbu.Add('</div>'                                                              );

  Result := sbu.Text;
end;

class procedure TW3fRec.W3WebFilesGenerate;
var
  stl: TStrings;
  fna: string; // filename
  i: integer;
begin
  if not TDirectory.Exists(TWksRec.INC_PATH + '\w3') then
    TDirectory.CreateDirectory(TWksRec.INC_PATH + '\w3');

  stl := TStringList.Create;
  try
    // w3.js
    stl.Text := TDbaRec.ObjFieldGet('Code', 'FldContent', 'Root/Organization/W/W3/w3.js', '');
    fna := TWksRec.INC_PATH + '\w3\w3.js';
    stl.SaveToFile(fna);

    // w3color.js
    stl.Text := TDbaRec.ObjFieldGet('Code', 'FldContent', 'Root/Organization/W/W3/w3color.js', '');
    fna := TWksRec.INC_PATH + '\w3\w3color.js';
    stl.SaveToFile(fna);

    // w3.css
    stl.Text := TDbaRec.ObjFieldGet('Code', 'FldContent', 'Root/Organization/W/W3/w3.css', '');
    fna := TWksRec.INC_PATH + '\w3\w3.css';
    stl.SaveToFile(fna);

    // w3-theme-xxx.css
    for i := Low(THEME_NAME_VEC) to High(THEME_NAME_VEC) do begin
      stl.Text := W3ThemeCssGenerate(THEME_NAME_VEC[i], THEME_PRIMARY_60_COLOR_VEC[i], THEME_SECONDARY_30_COLOR_VEC[i], THEME_ACCENT_10_COLOR_VEC[i]);
      fna := TWksRec.INC_PATH + Format('\w3\w3-theme-%s.css', [THEME_NAME_VEC[i]]);
      stl.SaveToFile(fna);
    end;
  finally
    stl.Free;
  end;
end;
  {$ENDREGION}

  {$REGION 'TWksRec'}
class function  TWksRec.Info: string;
begin
  Result := Format('(c) %d %s', [TDatRec.DatNowYear, ACRONYM]);
end;

class function  TWksRec.Copyright: string;
begin
  Result := Format('© 2010-present %s %s', [ACRONYM, WWW]);
end;

class procedure TWksRec.WksWebFilesGenerate;
const
  USE_SPIN = false;
var
  aff: integer;
  sbu: TSbuRec;
  nam, txt, fbk: string;
begin
  if not TDirectory.Exists(TWksRec.INC_PATH + '\wks') then
    TDirectory.CreateDirectory(TWksRec.INC_PATH + '\wks');

  // wks.js (hierarchical)
  TDbaRec.ObjTreeContentDba('Code', 'Root/Organization/W/Wks/Website/wks.js', true, aff, nam, txt, fbk);
  sbu.Text := txt;
  sbu.SaveToFile(TWksRec.INC_PATH + '\wks\wks.js');

  // wks.css (hierarchical) *** nop, use w3.css ***
//TDbaRec.ObjTreeContentDba('Code', 'Root/Organization/W/Wks/Website/wks.css', true, aff, nam, txt, fbk);
//sbu.Text := txt;
//sbu.SaveToFile(TWksRec.INC_PATH + '\wks\wks.css');

  // Default.htm
  sbu.Clr;
  sbu.Add('<!DOCTYPE html>'                                                    , true , 0);
  sbu.Add('<html lang="en">'                                                             );
  sbu.Add('<head>'                                                                       );
  sbu.Add('  <title>%s Default Page</title>'                         , [gorg.Obj.&Object]); // TWksRec.ACRONYM
  sbu.Add('  <meta charset="utf-8">'                                                     );
  sbu.Add('  <meta http-equiv="refresh" content="2; url=/WksPageIsapiProject.dll/">'     );
  sbu.Add('  <meta name="author" content="%s" />'                      , [TWksRec.AUTHOR]);
  sbu.Add('  <meta name="description" content="%s" />'                   , [TWksRec.NAME]); // gorg.Name
  sbu.Add('  <link rel="shortcut icon" href="%s" />'                 , [TWksRec.ICON_URL]); // gorg.LogoIconUrl
  if USE_SPIN then begin
  sbu.Add('  <link rel="stylesheet" href="/Include/w3/w3-theme-%s.css" />'   , ['silver']); // gthe.Theme
  sbu.Add('  <link rel="stylesheet" href="/Include/w3/w3.css" />'                        );
  sbu.Add('  <script src="/Include/wks/wks.js"></script>'                                );
  end;
  sbu.Add('</head>'                                                                      );
  sbu.Add('<body>'                                                                       );
  if USE_SPIN then begin
  sbu.Add('  <div class="w3-waitloader-spin"></div>'                                     );
  sbu.Add('  <div class="w3-waitloader-number"</div>'                                    );
  sbu.Add('  <script>'                                                                   );
  sbu.Add('  var waitloadernumber = document.querySelector(".w3-waitloader-number");'    );
  sbu.Add('  var count = 0;'                                                             );
  sbu.Add('  setInterval('                                                               );
  sbu.Add('    () => {'                                                                  );
  sbu.Add('      count++;'                                                               );
  sbu.Add('      if (count > 0) waitloadernumber.textContent = count;'                   );
  sbu.Add('    }'                                                                        );
  sbu.Add('  , 1000);'                                                                   );
  sbu.Add('  </script>'                                                                  );
  end;
  sbu.Add('</body>'                                                                      );
  sbu.Add('</html>'                                                                      );
  sbu.SaveToFile(TWksRec.HOME_PATH + '\Default.htm');
end;

class function  TWksRec.InitDba(var IvFbk: string): boolean;
begin
  IvFbk  := TStdRec.StdNotImplemented('TWksRec.Init');
  Result := true;
end;

class function  TWksRec.InitRio(var IvFbk: string): boolean;
begin
  IvFbk  := TStdRec.StdNotImplemented('TWksRec.InitRio');
  Result := true;
end;
  {$ENDREGION}

  {$REGION 'TWicRec'}
class function TWicRec.WicImgFormat(IvGraphic: TGraphic): string;
var
  iw: TWICImage;
begin
  iw := TWICImage.Create;
  iw.Assign(IvGraphic);
  case iw.ImageFormat of
    wifBmp    : Result := 'bmp';
    wifPng    : Result := 'png';
    wifJpeg   : Result := 'jpg';
    wifGif    : Result := 'gif';
    wifTiff   : Result := 'tif';
    wifWMPhoto: Result := 'wdp'; // JPEG XR
    wifOther  : if GUIDToString(iw.EncoderContainerFormat) = GUIDToString(GUID_CONTAINERFORMATICO) then Result := 'ico' else Result := 'unknown';
  end;
  iw.Free;
end;
  {$ENDREGION}

  {$REGION 'TWinRec'}
class function  TWinRec.OsInfo: string;
begin
  Result := Format('%s %s', [OsName, OsVersion]);
end;

class function  TWinRec.OsName: string;
begin
  {$IF Defined(LINUX)}
  Result := 'Linux';
  {$ELSE}
  Result := 'Windows';
  {$ENDIF}
end;

class function  TWinRec.OsVersion: string;
var
  maj, min: integer; // major, minor
  {$IF Defined(LINUX)}
  {$ELSE}
  i: TOSVersionInfo;
  {$ENDIF}
begin
  {$IF Defined(LINUX)}
  Result := UNKNOWN;
  {$ELSE}
  i.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  if GetVersionEx(i) then begin
    min := i.dwMinorVersion;
    maj := i.dwMajorVersion;
    case i.dwPlatformId of
      VER_PLATFORM_WIN32_NT: begin
        if       maj <= 4                    then Result := 'WinNT'
        else if (maj =  5) and (min = 0)     then Result := 'Win2000'
        else if (maj =  5) and (min = 1)     then Result := 'WinXP'
        else if (maj =  5) and (min = 2)     then Result := 'WinServer2003' // Windows Server 2003 R2
        else if (maj =  6) and (min = 0)     then Result := 'WinVista'      // Windows Server 2008
        else if (maj =  6) and (min = 1)     then Result := 'Win7'          // Windows Server 2008 R2
        else if (maj =  6) and (min = 2)     then Result := 'Win8'          // Windows Server 2012
        else if (maj =  6) and (min = 3)     then Result := 'Win8.1'        // Windows Server 2012 R2
        else if (maj = 10) and (min = 0)     then Result := 'Win10'         // Windows Server 2016
        ;
      end;
      VER_PLATFORM_WIN32_WINDOWS: begin
        if      (maj = 4) and (min =  0)     then Result := 'Win95'
        else if (maj = 4) and (min = 10) then begin
          if i.szCSDVersion[1] = 'A'         then Result := 'Win98SE'
          else                                    Result := 'Win98';
        end else if (maj = 4) and (min = 90) then Result := 'WinME'
        else                                      Result := 'Unknown';
      end;
    end;
  end;
  {$ENDIF}
end;

class procedure TWinRec.WinDesktopRefresh;
var
  h: HWnd;
  procedure F5;
  begin
    PostMessage(h, WM_KEYDOWN, VK_F5, 0);
    PostMessage(h, WM_KEYUP, VK_F5, 1 shl 31);
  end;
begin
  h := FindWindow('Progman', 'Program Manager');
  h := FindWindowEx(h, 0,'SHELLDLL_DefView', '');
  h := FindWindowEx(h, 0, 'SysListView32', '');
  F5;
  h := FindWindowEx(h, 0, 'SysHeader32', '');
  F5;
end;

class function  TWinRec.WinNewProcess(IvCommand: string; IvWait, IvHide: boolean): boolean;
var
  s: TStartupInfo;
  p: TProcessInformation;
  x: longword; // exitcode
begin
 // fill with known state
  FillChar(s, SizeOf(TStartupInfo)       , #0);
  FillChar(p, SizeOf(TProcessInformation), #0);

  // setup
  s.cb := SizeOf(TStartupInfo);
//s.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
  if IvHide then
    s.wShowWindow := SW_HIDE;

  // exec
  Result := CreateProcess(
    nil                                            //
  , PChar(IvCommand)                               // file to execute
  , nil                                            //
  , nil                                            //
  , false                                          //
  , CREATE_NEW_PROCESS_GROUP+NORMAL_PRIORITY_CLASS //
  , nil                                            //
  , nil                                            //
  , s                                              //
  , p                                              // proc-info
  );

  // successful
  if Result and IvWait then begin
    WaitForSingleObject(p.hProcess, INFINITE); // may or may not be needed, usually wait for child processes
    GetExitCodeProcess(p.hProcess, x);
  end;

  // cleanup
  CloseHandle(p.hThread);
  CloseHandle(p.hProcess);
end;

class function  TWinRec.WinNewProcess2(const IvFileName, IvParams, IvWorkingDir: string; IvWaitUntilTerminated, IvWaitUntilIdle, IvRunMinimized: boolean; var IvErrorCode: integer): boolean;
var
  c, f: string; // cmdline, folder
  w: PChar;  // workingdirp
  s: TStartupInfo; // startupinfo
  p: TProcessInformation; // processinfo
begin
  // def
  Result := true;

  // cmd
  c := '"' + IvFileName + '" ' + IvParams;

  // wd
  if IvWorkingDir.IsEmpty then
    f := ExcludeTrailingPathDelimiter(ExtractFilePath(IvFileName))
  else
    f := IvWorkingDir;
  if f.IsEmpty then
    w := nil
  else
    w := PChar(f);

  // startupinfo
  ZeroMemory(@s, SizeOf(s));
  s.cb := SizeOf(s);
  if IvRunMinimized then begin
    s.dwFlags := STARTF_USESHOWWINDOW;
    s.wShowWindow := SW_SHOWMINIMIZED;
  end;

  // exec
  if not CreateProcess(nil, PChar(c), nil, nil, false, 0, nil, w, s, p) then begin
    Result := false;
    IvErrorCode := GetLastError;
    Exit;
  end;

  // whendone
  CloseHandle(p.hThread);
  if IvWaitUntilIdle then
    WaitForInputIdle(p.hProcess, INFINITE);
  if IvWaitUntilTerminated then
    repeat
      Application.ProcessMessages;
    until MsgWaitForMultipleObjects(1, p.hProcess, false, INFINITE, QS_ALLINPUT) <> WAIT_OBJECT_0 + 1;
  CloseHandle(p.hProcess);
end;

class function  TWinRec.WinShellExec(IvHandle: HWnd; IvCommand: string; var IvFbk: string): boolean; // *** ZIP WITH FSY SIMILAR FUNCTION ***
var
  h: THandle;
//c: array[0..1] of char;
begin
//StrPCopy(c, IvCommand);
  try
    h := winapi.ShellAPI.ShellExecute( // usage: ShellExecute(Application.Handle, 'cmd');
      IvHandle                         // handle of the parent application that will receive all error messages
    , 'open'                           // verb, the action (open, edit, print, find, explore, null)
    , PChar(Trim(IvCommand))           // file that will receive the action     PWideChar(IvCommand)
    , nil                              // paramenters to pass to file if it is an executable
    , nil                              // default directory
    , SW_NORMAL                        // presentation flag (SW_SHOW, SW_HIDE, SW_MAXIMIZE, SW_MINIMIZE, SW_NORMAL, ...)
    );
    Result := h >= 32;
    if not Result then
    //raise Exception.CreateFmt('ShellExecute problem : %s', [SysErrorMessage(h)]);
    //MessageBox(IvHandle, PChar(SysErrorMessage(h)), 'Error', MB_OK)
    //ods('[???]', SysErrorMessage(h));
      IvFbk := SysErrorMessage(h)
    else
      IvFbk := OK_STR;
  except
    on e: Exception do begin
      IvFbk := e.Message;
      Result := false;
    //MessageDlg(e.Message, mtError, [mbOK], 0);
    end;
  end;
end;
  {$ENDREGION}

  {$REGION 'TWmoRec'}
class procedure TWmoRec.OnWebModuleCreate;
begin
//glog.Log('WebModuleCreate');
end;

class procedure TWmoRec.OnWebModuleDestroy;
begin
//glog.Log('WebModuleDestroy');
end;

class procedure TWmoRec.OnWebModuleException(IvWebResponse: TWebResponse; IvE: Exception);
begin
//glog.Log('WebModuleException');
  glog.Log(IvE);
//TWrsRec.ResponseSet(IvWebResponse, THtmRec.PageWarning(IvE.Message, IvE.StackTrace), TCtyRec.CTY_TXT_HTML, THttRec.HTTP_STATUS_400_SERVER_ERROR);
  IvWebResponse.StatusCode := THttRec.HTTP_STATUS_500_SERVER_ERROR;
  IvWebResponse.Content    := THtmRec.PageDanger(IvE.Message);
end;

class procedure TWmoRec.BeforeDispatch(IvWebRequest: TWebRequest; IvWebResponse: TWebResponse; var IvWrq: TWrqRec; var IvTic: TTicRec);
var
  fid, sid: cardinal;
  ref, red{, dab}, fbk: string; // referer, redirect, datetimebegin

  function host_mistakes_fix(host: string): string;
  begin
    // default
    Result := host.ToLower;

    // no wwww
    if not Result.StartsWith('www.') then
      Result := Format('www.%s', [Result]);
  end;
begin

  {$REGION 'Help'}
  (*
    fingerprintid                user1        a unique client/user
      |
      |__ sessionid              A            a session
      |     |
      |     |__ requestid        A1           a request in session A
      |     |__ requestid        A2           a request in session A
      |     |__ requestid        ...          a request in session A
      |
      |__ sessionid              B            another session
            |
            |__ requestid        B1           a request in session B
            |__ requestid        B2           a request in session B
            |__ requestid        ...          a request in session B
  *)
  {$ENDREGION}

  // start
  IvTic.Init;
//IvWrq.Error := '';
//glog.Log('WebModuleBeforeDispatch');

  // fixearly *** impossible ***
//IvWebRequest.Host := host_mistakes_fix(IvWebRequest.Host);

  // request i
  IvWrq.WebRequestOrig := IvWebRequest;

  // redirect
  ref := IvWebRequest.Referer; // Referer 'http://www.abc.com/Default.htm?CoRedirect=http://www.abc.com/WksPageIsapiProject.dll/View?CoId=167&CoDocumentId=129
  if TStrRec.StrHas(ref, 'CoRedirect=') then begin
    red := TStrRec.StrRightOf('CoRedirect=', ref, false);
    IvWebResponse.Content := TWrsRec.SendRedirectJsStr(red);
    IvWebResponse.SendResponse;
    Exit;
  end;

  // fingerprint
  fid := IvWrq.FieldCookieGet('CoFingerprintId', 0);
  if fid <= 0 then begin // clienthasnotfingerprintid --> ensureredirectingtodefaulthtmthatwillcalculateandstoreitintoclient
    red := Format('http://%s%s', [IvWebRequest.Host, IvWebRequest.URL]);
    if not IvWebRequest.PathInfo.IsEmpty then
      red := Format('%s%s', [red, IvWebRequest.PathInfo]);
    if not IvWebRequest.Query.IsEmpty then
      red := Format('%s?%s', [red, IvWebRequest.Query]);
    IvWebResponse.Content := TWrsRec.SendRedirectJsStr('/Default.htm' + '?CoRedirect=' + red);
    IvWebResponse.SendResponse;
    Exit;
  end;

  // session
//dab := IvWrq.FieldCookieGet('CoDateTime', 0.0);
  sid := IvWrq.FieldCookieGet('CoSessionId', 0);
  if sid <= 0 then begin // clienthasnotsessionid --> createnewonethenstoreitindbaandclient
    Randomize();
    sid := TRndRec.RndInt(10000, 99999);
    gwse.Init('Web', sid, fid, IvWebRequest.RemoteAddr, 'Unknown', 'Unknown', 'Unknown', IvWebRequest.UserAgent, 'SeeUserAgent', IvWebRequest.Host, gwse.Organization, gwse.Username, fbk);
    // savetodba
    gwse.Insert(fbk);
    // savetoclient
    TWrsRec.FieldCookieSet(IvWebResponse, 'CoSessionId', sid);
  end else begin
    gwse.SessionId     := sid;
    gwse.FingerprintId := fid;
    gwse.Select(fbk);
  end;

  // request ii                                                                                    // HTTPHEADER___________________EXAMPLE_____________________________________NOTE__________________________
//IvWrq.WebRequestOrig := IvWebRequest;                                                            //                              whole original webrequest
  IvWrq.FingerprintId  := gwse.FingerprintId;                                                      //                              3681292525                                  IvWebRequest.CookieFields.Values['CoFingerprintId']
  IvWrq.SessionId      := gwse.SessionId;                                                          //
  IvWrq.RequestId      := (IvWebRequest as TISAPIRequest).Ecb^.ConnId;                             // Ecb.ConnId                   095EBA6C
  IvWrq.PageId         := StrToIntDef(IvWebRequest.QueryFields.Values['CoId'], 0);                 //                              123
  IvWrq.DateTime       := TDatRec.DatFromIso(IvWebRequest.CookieFields.Values['CoDateTime'], Now); //                              2019-01-31 12:12:14.377
  IvWrq.Method         := IvWebRequest.Method;                                                     // REQUEST_METHOD               GET | POST
  IvWrq.Protocol       := IvWebRequest.ProtocolVersion;                                            //                              HTTP/1.1
  IvWrq.Host           := host_mistakes_fix(IvWebRequest.Host);                                    // SERVER_NAME                  www.wks.cloud *** THE-ONLY-SURE-INFO ***
  IvWrq.Url            := IvWebRequest.URL;                                                        //                              /WksXxxIsapiProject.dll
  IvWrq.PathInfo       := IvWebRequest.PathInfo;                                                   // PATH_INFO / Ecb.PathInfo     /Info
  IvWrq.Query          := IvWebRequest.Query; {WebRequest.QueryFields.CommaText}                   // QUERY_STRING / Ecb.Query     ?CoId=381&CoXxx=2

  // someoneusedipaddress (http://51.38.98.160/ --unabletogetorganization--rerouteto--> www.wks.cloud)
  if SameText(IvWebRequest.Host, TNetRec.IpLan) then
    IvWrq.Host := TWksRec.WWW;

  // system
  // hardcodedin TWksRec

  // organization
  if not gorg.InitByWww(IvWrq.Host, fbk) then begin
    IvWrq.Error := fbk;
    Exit;
  end;

  // theme
  gthe.InitDba(gorg.ObjectId, fbk);

  // user
  if not gwse.Username.IsEmpty then
    gusr.InitDba(gwse.Username, fbk);

  // person
  if not gwse.Username.IsEmpty then
    gper.InitDba(gwse.Username, fbk);

  // member
  if not gwse.Username.IsEmpty then
    gmbr.InitDba(gwse.Organization, gwse.Username, fbk);

  // page
  if IvWrq.PageId <= 0 then // *** IMPORTANT ***
    IvWrq.PageId := gorg.HomePageId;

  // website
  gwsi.Www := IvWrq.Host;

  // webrequest cagnolina
  gwrq := IvWrq;                                                                       // *** this global var is neeed in the rva function and in other places ***

  // customheaderaddexpire
//IvWebResponse.SetCustomHeader('Expires', THttRec.HTTP_HEADER_EXPIRE);
  IvWebResponse.CustomHeaders.AddPair('Cache'  , 'no-cache no-store must-revalidate'); // askclienttonocachelocally
//IvWebResponse.CustomHeaders.AddPair('Pragma' , 'no-cache');                          // Pragma header should not be used, it is deprecated
//IvWebResponse.CustomHeaders.AddPair('Expires', '0');                                 // Expires header should not be used, 'Cache-Control' should be preferred

  // customheaderaddcors                                                                              // https://www.youtube.com/watch?v=Vbfkw4zR-Cs&list=PLwUPJvR9mZHgsJIwtfjTOSFIM-RX9zxjP&t=5s
//IvWebResponse.SetCustomHeader('Access-Control-Allow-Origin', '*');                   // reports back to the caller that we allow Cross-Origin-Resource Sharing (CORS) for all calling domains
//if IvWebRequest.GetFieldByName('Access-Control-Request-Headers').Trim <> '' then
  //IvWebResponse.SetCustomHeader('Access-Control-Allow-Headers', IvWebRequest.GetFieldByName('Access-Control-Request-Headers'));
end;

class procedure TWmoRec.AfterDispatch(IvWebRequest: TWebRequest; IvWebResponse: TWebResponse; var IvWrq: TWrqRec; var IvTic: TTicRec);
var
  fbk: string;
  ims: integer;
  sbu: TSbuRec; // sbuafter
begin
//glog.Log('WebModuleAfterDispatch');

  {$REGION 'rva'}
  // *** Rva should be just in one place... HERE! ***
  IvWebResponse.Content := TEscRec.CharEscape(IvWebResponse.Content);
  IvWebResponse.Content := grva.Rva(IvWebResponse.Content);
  IvWebResponse.Content := TEscRec.CharUnEscape(IvWebResponse.Content);
  {$ENDREGION}

  {$REGION 'pluginsbefore'}
  // this part will replace the <!--[RvPluginsBefore]--> tag with all pugins scripts needed by the builded page
  sbu.Clr;
     if IvWebResponse.Content.Contains('new Two(') then
  sbu.Add('<script src="/include/two/two.js"></script>')
else if IvWebResponse.Content.Contains('alpine') then
  sbu.Add('<script src="/include/alpinejs/alpine.js" defer></script>')
else if IvWebResponse.Content.Contains(' hx-') then         // readable : <script src="https://unpkg.com/htmx.org@2.0.0/dist/htmx.js" integrity="sha384-Xh+GLLi0SMFPwtHQjT72aPG19QvKB8grnyRbYBNIdHWc2NkCrz65jlU7YrzO6qRp" crossorigin="anonymous"></script>
  sbu.Add('<script src="/include/htmx/htmx.js"></script>'); // minimized: <script src="https://unpkg.com/htmx.org@2.0.0" integrity="sha384-wS5l5IKJBvK6sPTKa2WZ1js3d947pvWXbPJ1OmWfEuxLgeHcEbjUUA5i9V5ZkpCw" crossorigin="anonymous"></script>

if sbu.Text.IsEmpty then
  IvWebResponse.Content := StringReplace(IvWebResponse.Content, '<!--[RvPluginsBefore]-->', '', [])
else begin
  sbu.Top('<!--pluginsbefore-->');
  IvWebResponse.Content := StringReplace(IvWebResponse.Content, '<!--[RvPluginsBefore]-->', sbu.Text, []);
end;
  {$ENDREGION}

  {$REGION 'pluginsafter'}
  // this part will replace the <!--[RvPluginsAfter]--> tag with all pugins scripts needed by the builded page
  sbu.Clr;
if IvWebResponse.Content.Contains('"mermaid"') then begin
  sbu.Add('<!-- mermaid -->'                                                                                                        ); // jsafter
  sbu.Add('<script type="module">'                                                                                                  );
  sbu.Add(  'import mermaid from ''https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs'';'                             );
  if IvWebResponse.Content.Contains('zenuml') then begin // ZenUML (https://mermaid.js.org/syntax/zenuml.html)
  sbu.Add(  'import zenuml  from ''https://cdn.jsdelivr.net/npm/@mermaid-js/mermaid-zenuml@0.1.0/dist/mermaid-zenuml.esm.min.mjs'';');
  sbu.Add(  'await mermaid.registerExternalDiagrams([zenuml]);'                                                                     );
  end;
  sbu.Add(  'mermaid.ganttConfig = {');
  sbu.Add(  '  titleTopMargin: 25,');
  sbu.Add(  '  barHeight: 30,');
  sbu.Add(  '  barGap: 8,');
  sbu.Add(  '  topPadding: 75,');
  sbu.Add(  '  sidePadding: 75,');
  sbu.Add(  '};');
  sbu.Add(  'mermaid.initialize({ startOnLoad: true, securityLevel: ''loose'' });'                                                                            );
  sbu.Add('</script>'                                                                                                               );
end;

if sbu.Text.IsEmpty then
  IvWebResponse.Content := StringReplace(IvWebResponse.Content, '<!--[RvPluginsAfter]-->', '', [])
else begin
  sbu.Top('<!--pluginsafter-->');
  IvWebResponse.Content := StringReplace(IvWebResponse.Content, '<!--[RvPluginsAfter]-->', sbu.Text, []);
end;
  {$ENDREGION}

  // request
  IvWrq.DbaInsert(ims, fbk);
  // stop
  ims := IvTic.ElapsedMs;
  // lastly
  IvWebResponse.Content := StringReplace(IvWebResponse.Content, '$RvElapsedMs$'  , ims.ToString                , [rfReplaceAll]);
end;
  {$ENDREGION}

  {$REGION 'TWorRec'}
class function TWorRec.WordDbaSelectRnd(const IvLanguage: string): string;
const
  QUERY =        'declare @m int, @r int'
  + sLineBreak + 'select @m = count(*) from DbaWord.dbo.TblWord'
//+ sLineBreak + '-- print @m'
  + sLineBreak + 'set @r = round(@m * rand(), 0)'
//+ sLineBreak + '-- print @r'
  + sLineBreak + 'select top(1)'
  + sLineBreak + '    t.Fld%s' // language
  + sLineBreak + 'from ('
  + sLineBreak + '    select top(@r)'
  + sLineBreak + '        Fld%s' // language
  + sLineBreak + '    from'
  + sLineBreak + '        DbaWord.dbo.TblWord with(NOLOCK)'
  + sLineBreak + '    order by'
  + sLineBreak + '        1 desc '
  + sLineBreak + ') t'
  + sLineBreak + 'where'
  + sLineBreak + '    len(Fld%s) between 6 and 8' // language
  + sLineBreak + 'order by'
  + sLineBreak + '    1 asc';
var
  sql: string;
begin
  sql := Format(QUERY, [IvLanguage, IvLanguage, IvLanguage]);
  Result := TDbaRec.Scalar(sql, '');
end;

class function TWorRec.WordFantasyRnd(const IvLen: integer; IvStartWithVowel: boolean): string;
const
  VOWELS: string= 'aeiouy';
  CONSON: string= 'bcdfghjklmnpqrstvwxz';
var
  i: integer;
  b: boolean;
begin
  b:= IvStartWithVowel;
  SetLength(Result, IvLen);
  for i:= 1 to Ivlen do begin
    if b then Result[i]:= VOWELS[Random(Length(VOWELS)) + 1]
         else Result[i]:= CONSON[Random(Length(CONSON)) + 1];
    b := not b;
   end;
end;
  {$ENDREGION}

  {$REGION 'TWseRec'}
function  TWseRec.Info: string; // websession
begin
  Result := '';
  if SessionId > 0 then
    Result := Format('session %d (%s)', [SessionId, Kind]);
end;

function  TWseRec.Exists(IvDateTimeBegin: TDateTime; IvSessionId: integer; var IvFbk: string): boolean;
var
  sql: string;
begin
  sql :=         'select 1 from DbaClient.dbo.TblSession'
  + sLineBreak + 'where'
  + sLineBreak + '    FldDateTimeBegin       = ' + TSqlRec.Val(IvDateTimeBegin)
  + sLineBreak + 'and FldSessionId           = ' + TSqlRec.Val(IvSessionId);
  Result := TDbaRec.Scalar(sql, 0) = 1;
  IvFbk := ifthen(Result, 'Session exists', 'Session does nor exists');
end;

function  TWseRec.IsValid(var IvFbk: string): boolean;
var
  sql: string;
begin
  sql :=         'select 1 from DbaClient.dbo.TblSession'
  + sLineBreak + 'where'
  + sLineBreak + '    FldDateTimeBegin       = ' + TSqlRec.Val(DateTimeBegin)
  + sLineBreak + 'and FldDateTimeEnd        is null'
  + sLineBreak + 'and FldSessionId           = ' + TSqlRec.Val(SessionId    )
  + sLineBreak + 'and FldOrganization        = ' + TSqlRec.Val(Organization )
  + sLineBreak + 'and FldUsername            = ' + TSqlRec.Val(Username     );
  Result := TDbaRec.Scalar(sql, 0) = 1;
  IvFbk := ifthen(Result, 'Session is valid', 'Session is not valid');
end;

function  TWseRec.Init(IvKind: string; IvSessionId, IvFingerprintId: cardinal; IvIpLan, IvDomain, IvComputer, IvOsLogin, IvClient, IvVersion, IvServer, IvOrganization, IvUsername: string; var IvFbk: string): boolean;
begin
  Randomize();

  DateTimeBegin := Now();            // FldDateTimeBegin
  DateTimeEnd   := TDatRec.ZERO_DAT; // FldDateTimeEnd
  Kind          := IvKind;           // FldKind
  SessionId     := IvSessionId;      // FldSessionId              TRndRec.RndInt(100000, 199999)
  FingerprintId := IvFingerprintId;  // FldFingerprintId
  IpLan         := IvIpLan;          // FldIpLan
  Domain        := IvDomain;         // FldDomain
  Computer      := IvComputer;       // FldComputer
  OsLogin       := IvOsLogin;        // FldOsLogin
  Client        := IvClient;         // FldClient
  Version       := IvVersion;        // FldVersion
  Server        := IvServer;         // FldServer
  Organization  := IvOrganization;   // FldOrganization
  Username      := IvUsername;       // FldUsername

  IvFbk := 'WseRec initialized';
  Result := true;
end;

function  TWseRec.Insert(var IvFbk: string): boolean;
var
  aff: integer;
  sql: string;
begin
  sql :=         'insert into DbaClient.dbo.TblSession'
  + sLineBreak + 'select'
  + sLineBreak + '    FldDateTimeBegin = ' + TSqlRec.Val(DateTimeBegin)
  + sLineBreak + '  , FldDateTimeEnd   = ' + TSqlRec.Val(DateTimeEnd  ) // *** should be null, notnull after session close ***
  + sLineBreak + '  , FldKind          = ' + TSqlRec.Val(Kind         )
  + sLineBreak + '  , FldSessionId     = ' + TSqlRec.Val(SessionId    )
  + sLineBreak + '  , FldFingerprintId = ' + TSqlRec.Val(FingerprintId)
  + sLineBreak + '  , FldIpLan         = ' + TSqlRec.Val(IpLan        )
  + sLineBreak + '  , FldDomain        = ' + TSqlRec.Val(Domain       )
  + sLineBreak + '  , FldComputer      = ' + TSqlRec.Val(Computer     )
  + sLineBreak + '  , FldOsLogin       = ' + TSqlRec.Val(OsLogin      )
  + sLineBreak + '  , FldClient        = ' + TSqlRec.Val(Client       )
  + sLineBreak + '  , FldVersion       = ' + TSqlRec.Val(Version      )
  + sLineBreak + '  , FldServer        = ' + TSqlRec.Val(Server       )
  + sLineBreak + '  , FldOrganization  = ' + TSqlRec.Val(Organization )
  + sLineBreak + '  , FldUsername      = ' + TSqlRec.Val(Username     ); // *** sould be null, notnull after user login ***
  Result := TDbaRec.CmdExec(sql, aff, IvFbk);
  if not Result then
    glog.Log(IvFbk);
end;

function  TWseRec.InsertRio(var IvFbk: string): boolean;
begin
  Result := (grio.HttpRio as ISystemSoapMainService).SystemSessionInsertSoap(DateTimeBegin, Kind, SessionId, FingerprintId, IpLan, Domain, Computer, OsLogin, Client, Version, Server, Organization, Username, IvFbk);
end;

function  TWseRec.Select(var IvFbk: string): boolean;
var
  sql: string;
  dst: TDataset;
begin
  sql :=         'select'
  + sLineBreak + '    FldDateTimeBegin'
  + sLineBreak + '  , FldDateTimeEnd  '
  + sLineBreak + '  , FldKind         '
  + sLineBreak + '  , FldSessionId    '
  + sLineBreak + '  , FldFingerprintId'
  + sLineBreak + '  , FldIpLan        '
  + sLineBreak + '  , FldDomain       '
  + sLineBreak + '  , FldComputer     '
  + sLineBreak + '  , FldOsLogin      '
  + sLineBreak + '  , FldClient       '
  + sLineBreak + '  , FldVersion      '
  + sLineBreak + '  , FldServer       '
  + sLineBreak + '  , FldOrganization '
  + sLineBreak + '  , FldUsername     '
  + sLineBreak + 'from'
  + sLineBreak + '    DbaClient.dbo.TblSession'
  + sLineBreak + 'where'
//+ sLineBreak + '    FldDateTimeBegin = ' + TSqlRec.Val(DateTimeBegin)
  + sLineBreak + '    FldSessionId     = ' + TSqlRec.Val(SessionId    )
  + sLineBreak + 'and FldFingerprintId = ' + TSqlRec.Val(FingerprintId);
  Result := TDbaRec.DsFromSql(sql, dst);
  if Result then begin
    DateTimeBegin := dst.FieldByName('FldDateTimeBegin').AsDateTime;
    DateTimeEnd   := dst.FieldByName('FldDateTimeEnd'  ).AsDateTime;
    Kind          := dst.FieldByName('FldKind'         ).AsString  ;
    SessionId     := dst.FieldByName('FldSessionId'    ).AsLongWord;
    FingerprintId := dst.FieldByName('FldFingerprintId').AsLongWord;
    IpLan         := dst.FieldByName('FldIpLan'        ).AsString  ;
    Domain        := dst.FieldByName('FldDomain'       ).AsString  ;
    Computer      := dst.FieldByName('FldComputer'     ).AsString  ;
    OsLogin       := dst.FieldByName('FldOsLogin'      ).AsString  ;
    Client        := dst.FieldByName('FldClient'       ).AsString  ;
    Version       := dst.FieldByName('FldVersion'      ).AsString  ;
    Server        := dst.FieldByName('FldServer'       ).AsString  ;
    Organization  := dst.FieldByName('FldOrganization' ).AsString  ;
    Username      := dst.FieldByName('FldUsername'     ).AsString  ;
  end;
end;

function  TWseRec.Update(var IvFbk: string): boolean;
var
  aff: integer;
  sql: string;
begin
  sql :=         'update DbaClient.dbo.TblSession'
  + sLineBreak + 'set'
  + sLineBreak + '    FldOrganization  = ' + TSqlRec.Val(Organization ) // *** now should be a valid organization ***
  + sLineBreak + '  , FldUsername      = ' + TSqlRec.Val(Username     ) // *** now should be a valid username ***
  + sLineBreak + 'where'
  + sLineBreak + '    FldDateTimeBegin = ' + TSqlRec.Val(DateTimeBegin)
//+ sLineBreak + 'and FldDateTimeEnd  is ' + TSqlRec.Val(DateTimeEnd  )
  + sLineBreak + 'and FldKind          = ' + TSqlRec.Val(Kind         )
  + sLineBreak + 'and FldSessionId     = ' + TSqlRec.Val(SessionId    )
  + sLineBreak + 'and FldFingerprintId = ' + TSqlRec.Val(FingerprintId)
  + sLineBreak + 'and FldIpLan         = ' + TSqlRec.Val(IpLan        )
  + sLineBreak + 'and FldDomain        = ' + TSqlRec.Val(Domain       )
  + sLineBreak + 'and FldComputer      = ' + TSqlRec.Val(Computer     )
  + sLineBreak + 'and FldOsLogin       = ' + TSqlRec.Val(OsLogin      )
  + sLineBreak + 'and FldClient        = ' + TSqlRec.Val(Client       )
  + sLineBreak + 'and FldVersion       = ' + TSqlRec.Val(Version      )
  + sLineBreak + 'and FldServer        = ' + TSqlRec.Val(Server       );
  Result := TDbaRec.CmdExec(sql, aff, IvFbk);
  if not Result then
    glog.Log(IvFbk);
end;

function  TWseRec.Close(var IvFbk: string): boolean;
var
  aff: integer;
  sql: string;
begin
  sql :=         'update DbaClient.dbo.TblSession'
  + sLineBreak + 'set'
  + sLineBreak + '    FldDateTimeEnd   = ' + TSqlRec.Val({DateTimeEnd}Now)
  + sLineBreak + 'where'
  + sLineBreak + '    FldDateTimeBegin = ' + TSqlRec.Val(DateTimeBegin) // *** now should be a valid date ***
  + sLineBreak + 'and FldSessionId     = ' + TSqlRec.Val(SessionId    )
  + sLineBreak + 'and FldFingerprintId = ' + TSqlRec.Val(FingerprintId)
  + sLineBreak + 'and FldDomain        = ' + TSqlRec.Val(Domain       )
  + sLineBreak + 'and FldComputer      = ' + TSqlRec.Val(Computer     )
  + sLineBreak + 'and FldOsLogin       = ' + TSqlRec.Val(OsLogin      )
  + sLineBreak + 'and FldIpLan         = ' + TSqlRec.Val(IpLan        )
  + sLineBreak + 'and FldClient        = ' + TSqlRec.Val(Client       )
  + sLineBreak + 'and FldVersion       = ' + TSqlRec.Val(Version      )
  + sLineBreak + 'and FldServer        = ' + TSqlRec.Val(Server       )
  + sLineBreak + 'and FldOrganization  = ' + TSqlRec.Val(Organization )
  + sLineBreak + 'and FldUsername      = ' + TSqlRec.Val(Username     );
  Result := TDbaRec.CmdExec(sql, aff, IvFbk);
  if not Result then
    glog.Log(IvFbk);

  gwse.DateTimeEnd  := 0.0;
  gwse.Organization := '';
  gwse.Username     := '';
end;

function  TWseRec.CloseRio(var IvFbk: string): boolean;
begin
  Result := (grio.HttpRio as ISystemSoapMainService).SystemSessionCloseSoap(DateTimeBegin, DateTimeEnd, Kind, SessionId, FingerprintId, IpLan, Domain, Computer, OsLogin, Client, Version, Server, Organization, Username, IvFbk);
end;
  {$ENDREGION}

  {$REGION 'TWsiRec'}
function TWsiRec.Url(IvSecure: boolean): string; // website
begin
  Result := TUrlRec.ProtocolEnsure(Www, 'http://', IvSecure);
end;
  {$ENDREGION}

  {$REGION 'TWrqRec'}
function  TWrqRec.FieldCookieExists(IvField: string): boolean; // webrequest
begin
  if not Assigned(WebRequestOrig) then begin
    Error := Format('Unable to verify if cookie %s exist, WebRequestOrig is nil', [IvField]);
    Result := false;
    Exit;
  end;

  Result := WebRequestOrig.CookieFields.IndexOfName(IvField) >= 0;
end;

function  TWrqRec.FieldQueryExists(IvField: string): boolean;
begin
  if not Assigned(WebRequestOrig) then begin
    Error := Format('Unable to verify if queryfield %s, WebRequestOrig is nil', [IvField]);
    Result := false;
    Exit;
  end;

  Result := WebRequestOrig.QueryFields.IndexOfName(IvField) >= 0;
end;

function  TWrqRec.FieldContentExists(IvField: string): boolean;
begin
  if not Assigned(WebRequestOrig) then begin
    Error := Format('Unable to verify if contentfield %s, WebRequestOrig is nil', [IvField]);
    Result := false;
    Exit;
  end;

  Result := WebRequestOrig.ContentFields.IndexOfName(IvField) >= 0;
end;

function  TWrqRec.FieldExists(IvField: string): boolean;
begin
  Result := FieldQueryExists(IvField);
  if Result then Exit;

  Result := FieldContentExists(IvField);
  if Result then Exit;

  Result := FieldCookieExists(IvField);
end;

function  TWrqRec.FieldCookieGet(IvField: string; IvDefault: variant): variant;
begin
  if not Assigned(WebRequestOrig) then begin
    Error := Format('Unable to get cookie %s, WebRequestOrig is nil', [IvField]);
    Result := IvDefault;
    Exit;
  end;

  if Length(WebRequestOrig.CookieFields.Values[IvField]) > 0 then
    Result := WebRequestOrig.CookieFields.Values[IvField]
  else
    Result := IvDefault;
end;

function  TWrqRec.FieldQueryGet(IvField: string; IvDefault: variant): variant;
begin
  if not Assigned(WebRequestOrig) then begin
    Error := Format('Unable to get queryfield %s, WebRequestOrig is nil', [IvField]);
    Result := IvDefault;
    Exit;
  end;

  if FieldQueryExists(IvField) then
    Result := WebRequestOrig.QueryFields.Values[IvField]
  else
    Result := IvDefault;
end;

function  TWrqRec.FieldContentGet(IvField: string; IvDefault: variant): variant;
begin
  if not Assigned(WebRequestOrig) then begin
    Error := Format('Unable to get contentfield %s, WebRequestOrig is nil', [IvField]);
    Result := IvDefault;
    Exit;
  end;

  if Length(WebRequestOrig.ContentFields.Values[IvField]) > 0 then
    Result := WebRequestOrig.ContentFields.Values[IvField]
  else
    Result := IvDefault;
end;

function  TWrqRec.FieldGet(IvField: string; IvDefault: variant): variant;
begin
  // 0th default
//Result := IvDefault;

  // 1st queryfield
  if          FieldQueryExists(IvField) then
  //Result := WebRequestOrig.QueryFields.Values[IvField]
    Result := FieldQueryGet(IvField, IvDefault)

  // 2nd contentfield
  else if FieldContentExists(IvField) then
  //Result := WebRequestOrig.ContentFields.Values[IvField]
    Result := FieldContentGet(IvField, IvDefault)

  // 3rd cookiefield
  else if FieldCookieExists(IvField) then
  //Result := WebRequestOrig.CookieFields.Values[IvField]
    Result := FieldCookieGet(IvField, IvDefault)

  else
    Result := IvDefault
  ;

  // default
//if  TVntRec.VntIsWhite(Result) then
  //Result := IvDefault;
end;

function  TWrqRec.FieldGet(IvField: string; var IvValue: variant; IvDefault: variant; IvFalseIfValueIsEmpty: boolean): boolean;
begin
  IvValue := FieldGet(IvField, IvDefault);
  Result := true;

  if TVntRec.VntIsWhite(IvValue) then
    if IvFalseIfValueIsEmpty then
      Result := false;
end;

function  TWrqRec.FieldGet(IvField: string; var IvValue: string; IvDefault: string; IvFalseIfValueIsEmpty: boolean): boolean;
var
  vnt: variant;
begin
  vnt := FieldGet(IvField, IvDefault);
  IvValue := VarToStr(vnt);
  Result := true;

  if IvValue.IsEmpty then
    if IvFalseIfValueIsEmpty then
      Result := false;
end;

function  TWrqRec.DbaInsert(IvInMs: integer; var IvFbk: string): boolean;
var
  aff: integer;
  sql: string;
begin
  sql :=         'insert into DbaClient.dbo.TblRequestWeb'
  + sLineBreak + 'select'
  + sLineBreak + '    FldFingerprintId = ' + TSqlRec.Val(FingerprintId  )
  + sLineBreak + '  , FldSessionId     = ' + TSqlRec.Val(SessionId      )
  + sLineBreak + '  , FldRequestId     = ' + TSqlRec.Val(RequestId      )
  + sLineBreak + '  , FldDateTime      = ' + TSqlRec.Val(DateTime       )
  + sLineBreak + '  , FldMethod        = ' + TSqlRec.Val(Method         )
  + sLineBreak + '  , FldProtocol      = ' + TSqlRec.Val(Protocol       )
  + sLineBreak + '  , FldHost          = ' + TSqlRec.Val(Host           )
  + sLineBreak + '  , FldUrl           = ' + TSqlRec.Val(Url            )
  + sLineBreak + '  , FldPathInfo      = ' + TSqlRec.Val(PathInfo       )
  + sLineBreak + '  , FldQuery         = ' + TSqlRec.Val(Query          )
  + sLineBreak + '  , FldInMs          = ' + TSqlRec.Val(IvInMs         );
  Result := TDbaRec.CmdExec(sql, aff, IvFbk);
  if not Result then
    glog.Log(IvFbk);
end;

function  TWrqRec.ScriptNameUrl(IvRelative: boolean): string;
var
  www, sna: string;
begin
  if not Assigned(WebRequestOrig) then begin
    Error := 'Unable to calculate the scriptname url, WebRequestOrig is nil';
    Result := '';
    Exit;
  end;

  www := ifthen(IvRelative, '', gorg.Www);
  sna := WebRequestOrig.ScriptName;

  Result := Format('%s%s', [www, sna]);
end;
  {$ENDREGION}

  {$REGION 'TWrsRec'}
class procedure TWrsRec.ResponseSet(IvResponse: TWebResponse; IvContent: string; IvContentType: string; IvStatusCode: integer); // webresponse
begin
  IvResponse.StatusCode  := IvStatusCode;
  IvResponse.ContentType := IvContentType;
  IvResponse.Content     := IvContent;
end;

class procedure TWrsRec.ResponseSet(IvResponse: TWebResponse; IvContentStream: TStringStream; IvContentType: string; IvStatusCode: integer);
begin
  IvResponse.StatusCode    := IvStatusCode;
  IvResponse.ContentType   := IvContentType;
  IvResponse.ContentStream := IvContentStream;
end;

class procedure TWrsRec.ResponseCustomHeaderAdd(IvWebResponse: TWebResponse; IvCustomHeaderKeyValVec: TStringVector);
var
  i: integer;
  key, val: string;
begin
  for i := 0 to (Length(IvCustomHeaderKeyValVec) div 2) - 1 do begin
    key := IvCustomHeaderKeyValVec[i*2];
    val := IvCustomHeaderKeyValVec[i*2+1];
  //IvWebResponse.CustomHeaders.Values[key] := val;
    IvWebResponse.CustomHeaders.AddPair(key, val);
  end;
end;

class function  TWrsRec.SendRedirectJsStr(IvUrl: string): string;
begin
  Result := Format('<script>document.location.href="%s";</script>', [IvUrl]);
end;

class procedure TWrsRec.FieldCookieSet(IvResponse: TWebResponse; IvCookie: string; IvValue: variant; IvExpireInXDay: double; IvDomain, IvPath: string);
begin
  try
    with IvResponse.Cookies.Add do begin
      Name                           := IvCookie; // key
      Value                          := IvValue;  // value
      if IvDomain <> '' then Domain  := IvDomain; // wre.Domain
      Path                           := IvPath;   // '/'
    //Secure                         := false;    // ???
      Expires                        := Now + IvExpireInXDay;
    end;
  except
    on e: Exception do begin
      raise e;
    end;
  end;
end;

class procedure TWrsRec.FieldCookieDelete(IvResponse: TWebResponse; IvCookie, IvDomain, IvPath: string);
begin
  FieldCookieSet(IvResponse, IvCookie, '', -1, IvDomain, IvPath);
end;
  {$ENDREGION}

  {$REGION 'TZipRec'}
class procedure TZipRec.ZipFile(IvZipFileSpec, IvFileToZipSpec: string);
var
  zip: TZipFile;
begin
  if not FileExists(IvFileToZipSpec) then begin
    TMesRec.W('File %s does not exists', [IvFileToZipSpec]);
    Exit;
  end;

  zip := TZipFile.Create;
  try
    // archivedelete
    if FileExists(IvZipFileSpec) then
      DeleteFile(IvZipFileSpec);
    // archivecreateandopen
    zip.Open(IvZipFileSpec, zmWrite);
    // fileaddtoarchive
    zip.Add(IvFileToZipSpec);
    // archiveclose
    zip.Close;
  finally
    zip.Free;
  end;
end;
  {$ENDREGION}

  {$REGION 'new'}
  {$ENDREGION}

{$ENDREGION}

initialization

{$REGION 'Profiler'}
//glog.Log('Initialize global profiler');
gpro := TProfiler.Create(nil);
gpro.Name := 'GlobalProfiler';
{$ENDREGION}

{$REGION 'Jachlog'}
//glog.Log('Initialize global jachlog (create and register writers)');

  // init
  gjlog := TjachLog.Create();
  gjlog.IncludeTopicName := true;
  gjlog.IsActive         := true;

  // topics&levels
  for glo_i := 0 to LOG_TOPIC_ID_MAX do begin
    gjlog.TopicName[glo_i] := LOG_TOPIC_VEC[glo_i];
    gjlog.LogLevel[glo_i]  := llDebug; // (llOff{0}, llEmergency{1}, llAlert{2}, llCritical{3}, llError{4}, llWarning{5}, llNotice{6}, llInfo{7}, llDebug{8}, llAll{9})
  end;

  // diskwriterregister
  gjldsk := TjachLogToDisk.Create;
  gjldsk.BasePath                  := LOG_DIR;         //
  gjldsk.FileNamePrefix            := LOG_FILE_PREFIX; // prefix.processname.suffix.rotidx.log
//gjldsk.FileNameSuffix            := '';              // prefix.processname.suffix.rotidx.log
  gjldsk.MaxLineSize               := 255;             // 255 by default
  gjldsk.MaxFileSize               := 1 * 1024 * 1024; // 1Mb
  gjldsk.FileCountToKeepInRotation := 4;               // 5 files
  gjldsk.IsActive                  := true;
  gjlog.RegisterLogWriter(gjldsk);

  // syslogwriterregister (udp)
  gjludp := TjachLogToSysLogIndyUDP.Create;
  gjludp.idSysLog.Host             := LOG_SYSLOG_HOST;
  gjludp.idSysLog.Port             := LOG_SYSLOG_PORT;
  gjludp.IsActive                  := true;
  gjlog.RegisterLogWriter(gjludp);
{$ENDREGION}

{$REGION 'Icon'}
//glog.Log('Assign icon to the binary exe/dll');
glo_h := LoadIcon(HInstance, '100_WKS_ICON_RC');
if glo_h = 0 then
  glog.Log('Unable to assign main icon')
else
  Application.Icon.Handle := glo_h;
{$ENDREGION}

{$REGION 'IsAny'}
//glog.Log('Initialize global objects regardless of the binary role');
gini := TIniCls.Create;
{$ENDREGION}

{$REGION 'IsClient'}
if TBynRec.IsClient then begin
  //glog.Log('Initialize global objects for Client role');

  // synedit
  gsyn.SynEditSearch      := TSynEditSearch.Create(nil);
  gsyn.SynEditRegexSearch := TSynEditRegexSearch.Create(nil);
  gsyg.SearchFromCaret    := true;

  // gpxy
  // *** gpxy setup happens during LoginForm creation ***

  // grio
  // *** grio setup happens during the call ***
end
{$ENDREGION}

{$REGION 'IsEditor'}
else if TBynRec.IsEditor then begin
  //glog.Log('Initialize global objects for Editor role');

  // synedit
  gsyn.SynEditSearch      := TSynEditSearch.Create(nil);
  gsyn.SynEditRegexSearch := TSynEditRegexSearch.Create(nil);
  gsyg.SearchFromCaret    := true;
end
{$ENDREGION}

{$REGION 'IsServer'}
else if TBynRec.IsEditor then begin
  //glog.Log('Initialize global objects for Server role');

end;
{$ENDREGION}

{$REGION 'GlobalBusinessObject'}
//glog.Log('Initialization of global business objects happens later');
// gorg;
// gusr;
// gper;
// gmbr;
{$ENDREGION}

{$REGION 'MemoryLeaks'}
//glog.Log('Set ReportMemoryLeaksOnShutdown to true');
  ReportMemoryLeaksOnShutdown := true;
{$ENDREGION}

finalization

{$REGION 'GlobalBusinessObject'}
//glog.Log('Free global business objects');
gorg.Free;
gusr.Free;
gper.Free;
gmbr.Free;
{$ENDREGION}

{$REGION 'IsServer'}
if TBynRec.IsServer then begin
  //glog.Log('Free global objects for Server role');

end
{$ENDREGION}

{$REGION 'IsEditor'}
else if TBynRec.IsEditor then begin
  //glog.Log('Free global objects for Editor role');

  // synedit
  FreeAndNil(gsyn.SynEditSearch);
  FreeAndNil(gsyn.SynEditRegexSearch);
end
{$ENDREGION}

{$REGION 'IsClient'}
else if TBynRec.IsClient then begin
  //glog.Log('Free global objects for Server role');

  // synedit
  FreeAndNil(gsyn.SynEditSearch);
  FreeAndNil(gsyn.SynEditRegexSearch);
end;
{$ENDREGION}

{$REGION 'IsAny'}
//glog.Log('Free global objects regardless of the binary role');

FreeAndNil(gini);
{$ENDREGION}

{$REGION 'Jachlog'}
//glog.Log('Unregister and free global jachlog'); // *** lastlog ***

// writersunregister
gjlog.UnRegisterLogWriter(gjldsk);
gjlog.UnRegisterLogWriter(gjludp);

// free
FreeAndNil(gjldsk);
FreeAndNil(gjludp);
FreeAndNil(gjlog);
{$ENDREGION}

{$REGION 'Profiler'}
//glog.Log('Free global profiler');

gpro.Free;
{$ENDREGION}

end.
