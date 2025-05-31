unit WksVfsServerMainFormUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , System.JSON
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.Buttons
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.ExtCtrls
  , Vcl.StdCtrls
  , Vcl.ComCtrls
  , Vcl.DBCtrls
  , Vcl.Grids
  , Vcl.DBGrids
  , Vcl.Mask
  , Data.DB
  , Data.Win.ADODB
  , JvLED
  , JvExControls
  , JvExExtCtrls
  , JvNetscapeSplitter
  , SynEdit
  , SynDBEdit
  , SynEditHighlighter
  , SynHighlighterHtml
  , IdContext
  , IdCustomHTTPServer
  , IdBaseComponent
  , IdComponent
  , IdCustomTCPServer
  , IdHTTPServer
  , Bird.Socket
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TVector<T> = class
    class procedure Add(var IvVector: TArray<T>; IvItem: T);
  end;

  PMessageRec = ^TMessageRec;
  TMessageRec = record
    Many: boolean; // messages body is several lines
    Name: string;
    Body: string;
  end;

  TReplyRec = record // full replay: YMS <code> <json>
    Code: string;    // IGNORED
    Json: string;    // {"yourmessage": "bla bla bla..."}
    procedure Init(IvCode: string; IvJson: string = ''); overload;
    procedure Init(IvCode: string; IvJsonFmt: string; IvVarRecVector: array of TVarRec); overload;
  end;

  PClientDataRec = ^TClientDataRec;
  TClientDataRec = record // currentclientdata
    Ip: string;
    Username: string;
    UserNumber: string;
    PersonId: string;
    UserId: string;
    MemberId: string;
  //Page: string;
    Area3: string;  // * | ALL | CVD
    AreaF9: string; // * | F9_ALL
    BayMes: string; //
    BayCad: string; //
    View: string;   // depend on area39
    LayoutWidth: integer;
    LayoutHeight: integer;
    OptionBoxesPerRow: integer;
  end;

  TBoxColorRec = record
    BgColor: string;
    FgColor: string;
  end;

  TRowRec = record
    Kind: string; {ico}   //    --------------------------------------------------  --- h+mv
    Text: string;         //   |                        mv
    TextHeight: double;   //   |
    TextXPerc: double;    //   |                                                 ___tabcolor
    TextYPerc: double;    //   |                                                /
    BgColor: string;      //   |     ------------------------------------------/--  --- h
    FgColor: string;      //   | mh | ico | Text                         |tabtext|
    TabText: string;      //   |     ---------------------------------------------  --- 0
    TabBgColor: string;   //    --------------------------------------------------  --- 0
    TabFgColor: string;   //
    TabWidth: double;     //
    Align: string;        //
    Height: double; {h}   //
    MarginH: double; {mh} // horiz
    MarginV: double; {mv} // vert
    function HeightHalf: double;
    function HeightFull: double;
  end;

  TMainForm = class(TForm)
    TopPanel: TPanel;
    LogListBox: TListBox;
    LogClearButton: TButton;
    WsClientDisconnectButton: TButton;
    WsClientDisconnectAllButton: TButton;
    BottomPageControl: TPageControl;
    LogTabSheet: TTabSheet;
    LeftPageControl: TPageControl;
    WsClientTabSheet: TTabSheet;
    WsClientListBox: TListBox;
    WsMessageTabSheet: TTabSheet;
    WsMessageListBox: TListBox;
    WsMessageNewButton: TButton;
    WsMessageEditButton: TButton;
    BottomJvNetscapeSplitter: TJvNetscapeSplitter;
    BottomPanel: TPanel;
    GeniusTimer: TTimer;
    TopPageControl: TPageControl;
    WsServerTabSheet: TTabSheet;
    WsServerPortLabel: TLabel;
    WsServerLabel: TLabel;
    WsServerStartedJvLED: TJvLED;
    WsServerPortEdit: TEdit;
    WsServerStopButton: TButton;
    WsServerStartButton: TButton;
    WsMessageEdit: TEdit;
    WsMessageSendButton: TButton;
    WsMessageSendToAllButton: TButton;
    WsMessagesSynEdit: TSynEdit;
    WsMessagesCheckBox: TCheckBox;
    WsMessageCheckBox: TCheckBox;
    MarqueeTabSheet: TTabSheet;
    MarqueeAreaLabel: TLabel;
    MarqueeDataSource: TDataSource;
    MarqueeAreaComboBox: TComboBox;
    MarqueeDBNavigator: TDBNavigator;
    MarqueeSendToAllButton: TButton;
    WsClientDataButton: TButton;
    DataTabSheet: TTabSheet;
    DataDBNavigator: TDBNavigator;
    DataDBEdit: TDBEdit;
    DataCodeDBSynEdit: TDBSynEdit;
    DatalLabel: TLabel;
    DataDataSource: TDataSource;
    SynHTMLSyn1: TSynHTMLSyn;
    DataIdLabel: TLabel;
    DataIdDBEdit: TDBEdit;
    IdHTTPServer: TIdHTTPServer;
    HttpServerTabSheet: TTabSheet;
    HttpServerStartedJvLED: TJvLED;
    HttpServerLabel: TLabel;
    HttpPortLabel: TLabel;
    HttpPortEdit: TEdit;
    HttpServerStartButton: TButton;
    HttpServerStopButton: TButton;
    DataKindDBComboBox: TDBComboBox;
    DataKindLabel: TLabel;
    VfsADOConnection: TADOConnection;
    DataADOTable: TADOTable;
    MarqueeADOQuery: TADOQuery;
    MarqueeDBGrid: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LogClearButtonClick(Sender: TObject);
    procedure WsServerStartButtonClick(Sender: TObject);
    procedure WsServerStopButtonClick(Sender: TObject);
    procedure WsClientDisconnectButtonClick(Sender: TObject);
    procedure WsClientDisconnectAllButtonClick(Sender: TObject);
    procedure WsMessageSendButtonClick(Sender: TObject);
    procedure WsMessageSendToAllButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WsMessageListBoxDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GeniusTimerTimer(Sender: TObject);
    procedure MarqueeAreaComboBoxChange(Sender: TObject);
    procedure MarqueeFDQueryNewRecord(DataSet: TDataSet);
    procedure MarqueeSendToAllButtonClick(Sender: TObject);
    procedure WsClientDataButtonClick(Sender: TObject);
    procedure IdHTTPServerCommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure HttpServerStartButtonClick(Sender: TObject);
    procedure HttpServerStopButtonClick(Sender: TObject);
  private
    FBirdSocket: TBirdSocket;
    procedure Log(IvStr: string); overload;
    procedure Log(IvFormatStr: string; IvVarRecVector: array of TVarRec); overload;
    procedure LogDb(IvConn: TBirdSocketConnection; IvStr: string); overload;
  //procedure LogDb(IvConn: TBirdSocketConnection; IvFormatStr: string; IvVarRecVector: array of TVarRec); overload;
    function  DstFromSql(IvSql: string): TDataSet; overload;
    procedure DstFromSql(IvSql: string; out IvDst: TDataSet); overload;
    procedure BoxColorsInit;
    function  BoxShapeJson(IvX, IvY: double; IvArea2, IvTitle, IvNote, IvAreaColor: string; IvRowVector: TArray<TRowRec>; IvWidth: double; out IvHeightOut: double): string;
    procedure UserFromIp(IvIp: string; var IvUsername, IvNumber, IvPersonId, IvUserId, IvMemberId: string);
    function  ClientId(IvConn: TBirdSocketConnection): string;
    function  ClientUsername(IvConn: TBirdSocketConnection): string;
    function  ClientUserNumber(IvConn: TBirdSocketConnection): string;
    function  MessageCompile(IvMessage: string): string;
    procedure MessageSendToCurrent(IvMessage: string);
    procedure MessageSendToAll(IvMessage: string);
    procedure MarqueeSendToAll;
    function  MarqueeJson(IvArea9: string = ''): string;
    function  DataCode(IvIdCsv: string; IvParamSl: TStrings): string;
    function  DataHtmlJson(IvIdCsv: string): string;
    function  LegendaHtml: string;
    function  LegendaHtmlJson: string;
    function  AreaListHtml: string;
    function  AreaListHtmlJson: string;
    function  BayMesListHtml(IvArea: string): string;
    function  BayMesListHtmlJson(IvArea: string): string;
    function  BayCadListHtml(IvArea3: string): string;
    function  BayCadListHtmlJson(IvArea3: string): string;
    function  EquipmentShapeJson(IvX, IvY: double; IvArea2, IvAreaColor, IvEquipment, IvState, IvStateColor, IvAlarm, IvNote: string; IvWidth: double; out IvHeightOut: double): string;
    function  EquipmentShapeListJson(IvArea3, IvBayMes, IvBayCad, IvView: string; IvLayoutWidth: integer; var IvLayoutHeight: integer; IvOptionBoxesPerRow: integer): string;
  //function  ViewShapeListJson(IvArea3, IvBayMes, IvView: string; IvLayoutWidth, IvLayoutHeight: integer): string;
    procedure WsGuiUpdate(const IvServerOn: boolean);
    procedure WsRouter(IvMessage: string; IvConn: TBirdSocketConnection);
    procedure HttpGuiUpdate(const IvServerOn: boolean);
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  MainForm: TMainForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    System.StrUtils
  , System.Math
  , System.IOUtils
  , System.RegularExpressions
  , MarkdownProcessor
//  , MarkdownUtils
  ;
{$ENDREGION}

{$REGION 'Const'}
const
  COLOR_WHITE = '#c0c0c0';
  COLOR_BLACK = '#404040';

  MESSAGE_REC_VEC: array[0..4] of TMessageRec = (
    (Many: false; Name: 'yms disconnect'     ; Body: 'YMS DISCONNECT')
  , (Many: false; Name: 'yms yourclientid'   ; Body: 'YMS YOURCLIENTID "%s"')
  , (Many: false; Name: 'yms draw text'      ; Body: 'YMS SCENEDRAW [{"type": "text", "x": 200, "y": 100, "rot": 0, "font": "100px arial", "text": "%s","textFillStyle": "pink", "textLineStyle": "red"}]')
  , (Many: true ; Name: 'yms draw texts     '; Body: 'YMS SCENECLEAR'
                                          + #13#10 + 'YMS SCENEDRAW ['
                                          + #13#10 + '  {"type": "text", "x": 200, "y": 100, "rot": 30, "text": "aaa", "font": "100px arial","textFillStyle": "pink", "textLineStyle": "red"}'
                                          + #13#10 + ', {"type": "text", "x": 200, "y": 200, "rot": 0 , "text": "bbb", "font": "100px arial","textFillStyle": "lime", "textLineStyle": "green"}'
                                          + #13#10 + ', {"type": "text", "x": 200, "y": 300, "rot": 20, "text": "ccc", "font": "100px arial","textFillStyle": "peru", "textLineStyle": "sienna"}'
                                          + #13#10 + ']')
  , (Many: true ; Name: 'yms draw boxes'     ; Body: 'YMS SCENECLEAR'
                                          + #13#10 + 'YMS SCENEDRAW ['
                                          + #13#10 + '  {"type": "box", "x": 175, "y": 100, "w": 100, "h": 80, "fillStyle": "lawngreen", "text": "ETPP5X", "font": "12px arial", "textFillStyle": "forestgreen"}'
                                          + #13#10 + ', {"type": "box", "x": 350, "y": 100, "w": 100, "h": 80, "fillStyle": "lawngreen", "text": "ETSB1X", "font": "12px arial", "textFillStyle": "forestgreen"}'
                                          + #13#10 + ', {"type": "box", "x": 525, "y": 100, "w": 100, "h": 80, "fillStyle": "lawngreen", "text": "ETXP1X", "font": "12px arial", "textFillStyle": "forestgreen"}'
                                          + #13#10 + ', {"type": "box", "x": 175, "y": 250, "w": 100, "h": 80, "fillStyle": "lawngreen", "text": "ETXP2X", "font": "12px arial", "textFillStyle": "forestgreen"}'
                                          + #13#10 + ', {"type": "box", "x": 350, "y": 250, "w": 100, "h": 80, "fillStyle": "lawngreen", "text": "ETXP3X", "font": "12px arial", "textFillStyle": "forestgreen"}'
                                          + #13#10 + ', {"type": "box", "x": 525, "y": 250, "w": 100, "h": 80, "fillStyle": "lawngreen", "text": "ETXP5X", "font": "12px arial", "textFillStyle": "forestgreen"}'
                                          + #13#10 + ']')
  );

var
  COLOR_INFO    : TBoxColorRec;
  COLOR_SUCCESS : TBoxColorRec;
  COLOR_WARNING : TBoxColorRec;
  COLOR_DANGER  : TBoxColorRec;
  COLOR_CRITICAL: TBoxColorRec;
{$ENDREGION}

{$REGION 'Utils'}
function  OleVariantToString(const Value: OleVariant): string;
  var ss: TStringStream;
      Size: integer;
      Data: PByteArray;
begin
  Result:='';
  if Length(Value) = 0 then Exit;
  ss:=TStringStream.Create;
  try
    Size := VarArrayHighBound (Value, 1) - VarArrayLowBound(Value, 1) + 1;
    Data := VarArrayLock(Value);
    try
      ss.Position := 0;
      ss.WriteBuffer(Data^, Size);
      ss.Position := 0;
      Result:=ss.DataString;
    finally
      VarArrayUnlock(Value);
    end;
  finally
    ss.Free;
  end;
end;

function  StringToOleVariant(const Value: string): OleVariant;
  var Data: PByteArray;
      ss: TStringStream;
begin
  Result:=null;
  if Value='' then Exit;
  ss:=TStringStream.Create(Value);
  try
    Result := VarArrayCreate ([0, ss.Size - 1], varByte);
    Data := VarArrayLock(Result);
    try
      ss.Position := 0;
      ss.ReadBuffer(Data^, ss.Size);
    finally
      VarArrayUnlock(Result);
    end;
  finally
    ss.Free;
  end;
end;

function  IncF(var IvFloat: double; IvInc: double): double; overload; // returnandinc
begin
  Result := IvFloat;
  IvFloat := IvFloat + IvInc;
end;

procedure IncF(var IvFloat: double; IvInc: double; var IvFloat2: double; IvInc2: double); overload; // inconly
begin
  IvFloat := IvFloat + IvInc;
  IvFloat2 := IvFloat2 + IvInc2;
end;

function  InRange(Val, Lo, Hi: integer): boolean;
begin
  Result := (Lo <= Val) and (Val <= Hi);
end;

function  ColRnd(const IvMix: TColor = clWhite): TColor;
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

function  ColColor(IvColorHtml: string): TColor; // #rrggbb
begin
//  Result := IntToStr(StrToInt('$' + Copy(IvColor, 1, 2))) + ',' +
//            IntToStr(StrToInt('$' + Copy(IvColor, 3 ,2))) + ',' +
//            IntToStr(StrToInt('$' + Copy(IvColor, 5, 2))) ;
  Result := StrToInt(IvColorHtml.Replace('#', '$'));
end;

function  ColToHtml(IvColor: TColor): string;
var
  rgb: integer;
begin
  rgb := ColorToRGB(IvColor);
  Result := Format('#%.2x%.2x%.2x', [Byte(rgb), Byte(rgb shr 8), Byte(rgb shr 16)]);
  Result := LowerCase(Result);
end;

function  ColContrast(IvColor: TColor): TColor; overload;
begin
  if (GetRValue(IvColor) + GetGValue(IvColor) + GetBValue(IvColor)) > 384 then
    Result := clBlack
  else
    Result := clWhite;
end;

function  ColContrast(IvColorHtml: string): string; overload;
var
  col, coc: TColor;
begin
  if SameText(IvColorHtml, 'white') then IvColorHtml := '#ffffff';
  if SameText(IvColorHtml, 'black') then IvColorHtml := '#000000';

  col := ColColor(IvColorHtml);
  coc := ColContrast(col);
  Result := ColToHtml(coc);
end;

function  ColFromTemp(const IvTemp: double): TColor;
  const
    gamma        =   0.80;
    intensitymax = 255;

  var
    r, g, b:  byte;
    blue   :  double;
    factor :  double;
    green  :  double;
    red    :  double;

  function adjust(const color, factor:  double):  integer;
  begin
    if   color = 0.0
    then result := 0     // don't want 0^x = 1 for x <> 0
    else result := round(intensitymax * power(color * factor, gamma))
  end;

begin
  case trunc(IvTemp) of
    380..439: begin
        red   := -(IvTemp - 440) / (440 - 380);
        green := 0.0;
        blue  := 1.0
    end;
    440..489: begin
        red   := 0.0;
        green := (IvTemp - 440) / (490 - 440);
        blue  := 1.0
    end;
    490..509: begin
        red   := 0.0;
        green := 1.0;
        blue  := -(IvTemp - 510) / (510 - 490)
    end;
    510..579: begin
        red   := (IvTemp - 510) / (580 - 510);
        green := 1.0;
        blue  := 0.0
    end;
    580..644: begin
        red   := 1.0;
        green := -(IvTemp - 645) / (645 - 580);
        blue  := 0.0
    end;
    645..780: begin
        red   := 1.0;
        green := 0.0;
        blue  := 0.0
    end else begin
      red   := 0.0;
      green := 0.0;
      blue  := 0.0
    end;
  end;

  // adjust, let the intensity fall off near the vision limits
  case trunc(IvTemp) of
    380..419:  factor := 0.3 + 0.7*(IvTemp - 380) / (420 - 380);
    420..700:  factor := 1.0;
    701..780:  factor := 0.3 + 0.7*(780 - IvTemp) / (780 - 700)
    else       factor := 0.0
  end;

  r := adjust(red,   factor);
  g := adjust(green, factor);
  b := adjust(blue,  factor);

  // end
  Result := RGB(r, g, b);
end;

function  ColCodeIWD(Iv0To100: double): TBoxColorRec;
begin
  if Iv0To100 < 75 then
    Result := COLOR_INFO

  else if (75 <= Iv0To100) and (Iv0To100 < 90) then
    Result := COLOR_WARNING

  else
    Result := COLOR_DANGER;
end;

function  TimeSecToDHMS(IvSec: int64): string;
const
  SECONDS_IN_A_DAY = 86400{=24*60*60};
var
  d, h, m, s: int64;
begin
  d := IvSec div SECONDS_IN_A_DAY; // number of days
  s := IvSec mod SECONDS_IN_A_DAY; // remaining seconds after days

  h := s div 3600;                 // number of hours
  s := s mod 3600;                 // remaining seconds after hours
  m := s div 60;                   // remaining minutes
  s := s mod 60;                   // remaining seconds after minutes

//Result := Format('%dd %dh %dm %ds', [d, h, m, s]);

  Result := '';
  if d > 0 then Result := Result       + d.ToString + 'd';
  if h > 0 then Result := Result + ' ' + h.ToString + 'h';
  if m > 0 then Result := Result + ' ' + m.ToString + 'm';
  if s > 0 then Result := Result + ' ' + s.ToString + 's';
  Result := Result.Trim;
end;

function  TimeMinToDHMS(IvMin: int64; IvSeconds: int64 = 0): string;
var
  s: int64;
begin
  // toseconds
  s := (IvMin * 60) + IvSeconds;

  Result := TimeSecToDHMS(s);
end;

procedure StrClean(var IvStr: string);
var
  i: integer;
begin
  i := 1;
  while i <= Length(IvStr) do
    if (31 < Ord(IvStr[i])) and (Ord(IvStr[i]) < 127) then
      Inc(i)
    else
      Delete(IvStr, i, 1);
  while IvStr.Contains('  ') do
    IvStr := IvStr.Replace('  ', ' ');
  IvStr := IvStr.Trim;
end;

function  StrClean2(IvStr: string): string;
begin
  Result := IvStr.Replace('.', '').Replace('*', '').Replace(',', '').Replace('?', '').Replace('-', '').Replace('_', ' ').Replace('', ' ');
  while Result.Contains('  ') do
    Result := Result.Replace('  ', ' ');
  Result := Result.Trim;
end;

function  StrOr(IvStr, IvStrAlt: string): string;
begin
  if IvStr.IsEmpty then
    Result := IvStrAlt
  else
    Result := IvStr;
end;

function  StrPrepend(IvStr, IvPrependStr: string): string;
begin
  if IvStr.IsEmpty then
    Result := IvStr
  else
    Result := IvPrependStr + IvStr;
end;

function  StrExpand(IvStr: string): string;
var
  i, idx: integer;
begin
  idx := 0;
  Result := IvStr;
  for i := 1 to Length(IvStr) do begin
    Inc(idx, 1);
    if (Ord(Result[idx]) in [65..90]) and (i > 1) then begin
      Insert(' ', Result, idx);
      Inc(idx);
    end;
  end;
end;

function  StrOverflow(IvStr: string; IvMax: integer = 20): string;
begin
  if IvStr.Length > IvMax then
    Result := IvStr.Remove(IvMax + 1) + '...'
  else
    Result := IvStr;
end;

function  StrWordRnd(const IvLen: integer=8; IvStartWithVowel: boolean= false): string;
const
  svowels: string= 'aeiouy';
  sconson: string= 'bcdfghjklmnpqrstvwxz';
var
  i: integer;
  b: boolean;
begin
  b := IvStartWithVowel;
  SetLength(Result, IvLen);
  for i := 1 to IvLen do begin
    if b then
      Result[i]:= sVowels[Random(Length(sVowels)) + 1]
    else
      Result[i]:= sConson[Random(Length(sConson)) + 1];
    b := not b;
  end;
end;

function  SqlFilter(IvField, IvValue{Filter}: string): string;

  {$REGION 'Help'}
  {
  sintax: SqlFilter('FldAaa', 'complex-filter-str')
  sintax: [RvSqlFilter(FldAaa | complex-filter-str)]

  complex-filter-str can be:

  expression :
    #                   field is null  (= NULL see last in yms code)
    "                   field is empty (= empty = '')
    ^                   field is blank (= spaces|tabs)
    $                   field is valued, not null|empty|blank (remove records where value is null|empty|whitechar)
    value               secco
    value*              like
    value1,value2       in
    value1,value2*      C24A, K22B*    multy secco or like

  negated :
    ^ <expression>      '^ ' at beginning of the expression will negate the all elements (consider using !)

  +nulls :
    <expression> #      ' #' at the end of the expression will also add records with null values

  +empty :
    <expression> "      ' "' at the end of the expression will also add records with empty values

  +blank :
    <expression> ^      ' ^' at the end of the expression will also add records with blank values

  example:                secco          like           multy
    ^ <expression> #    ^ C24A #   ;   ^ C24A* #   ;  ^ C24A, K22B* #   ( negated +nulls )
    ^ <expression> #"   ^ C24A #"  ;   ^ C24A* #"  ;  ^ C24A, K22B* #"  ( negated +nulls +empty )
    ^ <expression> #"^  ^ C24A #"^ ;   ^ C24A* #"^ ;  ^ C24A, K22B* #"^ ( negated +nulls +empty +null )
  }
  {$ENDREGION}

var
  a, b, w, x: string; // field, expression-cleaned, singletoken, final whereexpression
  n, m, o, p: boolean;      // negate, ornull, orempty, orblank
  v: TArray<string>;  // tokens
  i: integer;         // count
begin
  // zip
  a := Trim(IvField);
  b := Trim(StringReplace(IvValue, '*', '%', [rfReplaceAll])); // * --> %
  n := b.StartsWith('^ ');                                     // if start with '^ ' then negate all after '^ ' i.e. ^ aaa,bbb*,ccc  -->  ^ at the beginning means "all" so both aaa and bbb* will be negated
  if n then Delete(b, 1, 2);                                   // remove '^ '
  m := b.EndsWith(' #');                                       // if end with ' #' a " or FldXxx is null" will be added
  o := b.EndsWith(' "');                                       // if end with ' "' a " or FldXxx = ''" will be added
  p := b.EndsWith(' ^');                                       // if end with ' ^' a " or ltrim(rtrin(FldXxx)) = ''" will be added
  if m or o or p then b := LeftStr(b, Length(b)-2);            // remove ' #' or ' "' or ' ^'
  v := TArray<string>(SplitString(b, ','));                    // v[0]='C24A*' , v[1]='K22B*' , ...

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

  // remove 1st   ' or  '   or   ' and '
  Delete(x, 1, 5);

  // eventually add orisnull for the given field
  if m then
    x := x + ' or (' + a + ' is null)';

  // eventually add orempty for the given field
  if o then
    x := x + ' or (' + a + ' = '''')';

  // eventually add orblank for the given field
  if p then
    x := x + ' or (ltrim(rtrin(' + a + ')) = '''')';

  // end
  Result := '(' + x + ')';
end;

function  JsonStrEscape(const IvStr: string): string;

  procedure strAdd(const ivstr: string; var ivdest: string; var ividx: Integer); //inline;
  begin
    System.Delete(ivdest, ividx, 1);
    System.Insert(ivstr, ivdest, ividx);
    Inc(ividx, Length(ivstr)-1);
  end;

const
  JSON_STR_TEST  = 'abc' + #8     // backspace \b
                 + 'def' + #9     // hortab    \t
                 + 'ghi' + #10    // newline   \n
                 + 'lmo' + #12    // vertab    \f
                 + 'pqr' + #13    // return    \r
                 + 'stu' + #13#10
                 + 'vwx' + ' / '
                 + 'yza' + ' \ '
                 + 'bcd' + ' " '
                 + 'efg' + ' '' ';
var
  i, idx: integer;
  cha: char;
begin
  idx := 0;
  Result := IvStr;
  for i := 1 to System.Length(IvStr) do begin
    Inc(idx, 1);
    cha :=  IvStr[i];
    case cha of
      #0..#7:                                               // ctrl
        strAdd('\u' + IntToHex(Word(cha), 4), Result, idx);
        //strAdd('[?]', Result, idx);
      #8:                                                   // backspace \b
        strAdd('\b', Result, idx);
      #9:
        strAdd('\t', Result, idx);
      #10:                                                  // $A
        strAdd('\n', Result, idx);
      #11:                                                  // $B
        strAdd('\u' + IntToHex(Word(cha), 4), Result, idx);
        //strAdd('[?]', Result, idx);
      #12:                                                  // $C
        strAdd('\f', Result, idx);
      #13:                                                  // $D
        strAdd('\r', Result, idx);
      #14..#31:                                             // ctrl
        strAdd('\u' + IntToHex(Word(cha), 4), Result, idx);
        //strAdd('[?]', Result, idx);
      '/', '\', '"': begin
        System.Insert('\', Result, idx);
        Inc(idx, 1);
      end else if Word(cha) > 127 then
        strAdd('\u' + IntToHex(Word(cha), 4), Result, idx);
        //strAdd('[?]', Result, idx);
    end;
  end;
end;

function  JsonStrEscapeValueOnly(const IvStr: string): string;
var
  pattern, matchtxtentire, replacement: string;
//matches: TMatchCollection;
  match: TMatch;
  rex: TRegEx;
  opt: TRegExOptions;
begin
  Result := IvStr;
  pattern := '(\:\s\")(.*?)(\"(\s.,|\s))';
  //pattern := '"[^"]*":\s*"([^"]*)"';
  opt := [];
  Include(opt, TRegExOption.roSingleLine);

  //matches := TRegEx.Matches(Result, pattern);
  rex := TRegEx.Create(pattern, opt); // , roMultiLine
  match := rex.Match(IvStr);
  while match.Success do begin
    // matchentire
    matchtxtentire := match.Value;

    // replacementbuild
    replacement := match.Groups[1].Value                 // keep the first group as-is
                 + JsonStrEscape(match.Groups[2].Value)  // escape the second group
                 + match.Groups[3].Value;                // keep the third group as-is

    // replace current match with replacement
    Result := StringReplace(Result, matchtxtentire, replacement, []);

    // next
    match := match.NextMatch;
  end;

  {matches := rex.Matches(IvStr, pattern);
  for match in matches do begin
    matchtxtentire := match.Value;
//    replacement := match.Groups[1].Value +                // keep the first group as-is
//                   JsonStrEscape(match.Groups[2].Value) + // escape the second group
//                   match.Groups[3].Value;                 // keep the third group as-is
    replacement := '"' + JsonStrEscape(match.Groups[1].Value) + '"';
    // replace current match with replacement
    Result := StringReplace(Result, matchtxtentire, replacement, []);
  end;}
end;

function  JsonArrayFromDs(IvDs: TDataset): TJSONArray;
var                
  jso: TJSOnObject;
  fld: TField;
  fna: string;    
begin         
  // array
  Result := TJSONArray.Create;

  // records
  IvDs.First;
  while not IvDs.Eof do begin
  //Log(IvDs.Fields[0].AsString);

    // record
    jso := TJSOnObject.Create;
    for fld in IvDs.Fields do begin
      fna := fld.FieldName;  
      if fna.StartsWith('Fld') then fna := fna.Substring(3);
      if ansichar(fna[1]) in ['A'..'Z'] then Inc(fna[1], 32);
      case fld.DataType of
        ftBoolean : 
          if fld.Value then
            jso.AddPair(TJSONPair.Create(TJSONString.Create(fna), TJSONTrue.Create))
          else              
            jso.AddPair(TJSONPair.Create(TJSONString.Create(fna), TJSONFalse.Create)); 

        ftInteger, ftFloat{, ftSmallint, ftWord, ftCurrency} :
          //jso.AddPair(TJSONPair.Create(TJSONString.Create(fna), TJSONNumber.Create(fld.Value)));
            jso.AddPair(TJSONPair.Create(fna, fld.AsFloat));

        ftDate, ftDatetime, ftTime :
            jso.AddPair(TJSONPair.Create(TJSONString.Create(fna), TJSONString.Create(fld.AsString)));
          //jso.AddPair(TJSONPair.Create(TJSONString.Create(fna), TJSONString.Create(FormatDateTime('dd/mm/yyyy', fld.Value)));
        else
            jso.AddPair(TJSONPair.Create(TJSONString.Create(fna), TJSONString.Create(VarToStr(fld.Value))));       
      end;
    end;

    // add
    Result.AddElement(jso);

    // next
    IvDs.Next;
  end;
end;

procedure StringListFromSql(IvSl: TStrings; IvSql: string; IvFirstItem: string; IvConn: TADOConnection);
var
  que: TADOQuery; // query
begin
  IvSl.Clear;
  IvSl.Add(IvFirstItem);
  que := TADOQuery.Create(nil);
  que.Connection := IvConn;
  que.SQL.Text := IvSql;
  que.Open;
  que.First;
  try
    while not que.Eof do begin
      IvSl.Add(que.Fields[0].AsString);
      que.Next;
    end;
  finally
    que.Free;
  end;
end;

{procedure FileSave(IvPath, IvText: string);
begin
  TFile.WriteAllText(IvPath, IvText);
  //TFile.AppendAllText('./json.txt', sql)
  end;}
{$ENDREGION}

{$REGION 'Routines'}
function TMainForm.DstFromSql(IvSql: string): TDataSet;
var
  que: TADOQuery;
begin
  que := TADOQuery.Create(nil);
  try
    que.Connection := VfsADOConnection;
    que.SQL.Text := IvSql;
    que.Open;
    Result := que;
  except
    on e: Exception do begin
      que.Free; // clean up in case of an error
      raise Exception.Create('Error executing query: ' + E.Message);
    end;
  end;
  {
var
  dst: TDataSet;
begin
  dst := DstFromSql('select FldXxx from TblXxx'); // assign without create the dataset, creation is already done!
  try
    while not dst.Eof do begin
      ShowMessage(dst.FieldByName('FldXxx').AsString);
      dst.Next;
    end;
  finally
    dst.Free; // free the dataset when done !
  end;
  }
end;

procedure TMainForm.DstFromSql(IvSql: string; out IvDst: TDataSet);
var
  que: TADOQuery;
begin
  que := TADOQuery.Create(nil);
  try
    que.Connection := VfsADOConnection;
    que.SQL.Text := IvSql;
    que.Open;
    IvDst := que; // assign without create the dataset, creation is already done!
  except
    on e: Exception do begin
      que.Free; // clean up in case of an error
      raise Exception.Create('Error executing query: ' + E.Message);
    end;
  end;
  {
var
  dst: TDataSet;
begin
  DstFromSql('select FldXxx from TblXxx', dst);
  try
    while not dst.Eof do begin
      ShowMessage(dst.FieldByName('FldXxx').AsString);
      dst.Next;
    end;
  finally
    dst.Free; // free the dataset when done !
  end;
  }
end;
{$ENDREGION}

{$REGION 'Types'}
{ TRowRec }
function TRowRec.HeightFull: double;
begin
  Result := Height + MarginV;
end;

function TRowRec.HeightHalf: double;
begin
  Result := Height / 2;
end;

{ TVector<T> }
class procedure TVector<T>.Add(var IvVector: TArray<T>; IvItem: T);
begin
  SetLength(IvVector, Length(IvVector)+1);
  IvVector[High(IvVector)] := IvItem;
end;
{$ENDREGION}

{$REGION 'Box'}
procedure TMainForm.BoxColorsInit;
var
  dst: {TDataSet}_Recordset;
  sql: string;
begin
  sql         := 'select'
  + sLineBreak + '    FldColorCode'
  + sLineBreak + '  , FldColorBg'
  + sLineBreak + '  , FldColorFg'
  + sLineBreak + '  , FldColorLine'
  + sLineBreak + '  , FldColorTickness'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaSystem.dbo.TblColorCode'
  ;
  dst := VfsADOConnection.Execute(sql);
  while not dst.Eof do begin
             if dst.Fields['FldColorCode'].Value = 'info'     then begin
      COLOR_INFO.BgColor     := dst.Fields['FldColorBg'].Value;
      COLOR_INFO.FgColor     := dst.Fields['FldColorFg'].Value;

    end else if dst.Fields['FldColorCode'].Value = 'success'  then begin
      COLOR_SUCCESS.BgColor  := dst.Fields['FldColorBg'].Value;
      COLOR_SUCCESS.FgColor  := dst.Fields['FldColorFg'].Value;

    end else if dst.Fields['FldColorCode'].Value = 'warning'  then begin
      COLOR_WARNING.BgColor  := dst.Fields['FldColorBg'].Value;
      COLOR_WARNING.FgColor  := dst.Fields['FldColorFg'].Value;

    end else if dst.Fields['FldColorCode'].Value = 'danger'   then begin
      COLOR_DANGER.BgColor   := dst.Fields['FldColorBg'].Value;
      COLOR_DANGER.FgColor   := dst.Fields['FldColorFg'].Value;

    end else if dst.Fields['FldColorCode'].Value = 'critical' then begin
      COLOR_CRITICAL.BgColor := dst.Fields['FldColorBg'].Value;
      COLOR_CRITICAL.FgColor := dst.Fields['FldColorFg'].Value;
    end;
    dst.MoveNext;
  end;
end;

function  TMainForm.BoxShapeJson(IvX, IvY: double; IvArea2, IvTitle, IvNote, IvAreaColor: string; IvRowVector: TArray<TRowRec>; IvWidth: double; out IvHeightOut: double): string;

  {$REGION 'var'}
const
  IMG_WH           = 16.0; // image width and height
//TEXT_GAP         =  3.0; // text-border gap px
  OUTLINE_TICKNESS =  2.0;
var
  // spare
//i: integer;
  x, y, w, h: double;
  // box
  bow, bw2: double; // width
  // row
  ror: TRowRec;     // record
  // json
  jel: string;
  {$ENDREGION}

begin

  {$REGION 'help'}
  {
    equipment-layout                              X = origin
                                                    __color
     -----                                         /
    | tab |              TITLE (equipment)        /
    X--------------------------------------------/
    | ------------------------------------------ | \
    || T |               ITEM0                  || |  row : 'type,text,bgcolor,fgcolor,linecolor,align,height,margin,border,padding'
    | ------------------------------------------ | |
    | ------------------------------------------ | |
    ||   |               ITEM1                  || |
    | ------------------------------------------ | |
    |                                            | |
    |   --------------------------------------   | |
    |  |   | ITEM2                            |  | |
    |   --------------------------------------   | |
    |   --------------------------------------   | |
eqh |  |   | ITEM3                            |  |  > 1 cell per row
    |   --------------------------------------   | |
    |   ...                                      | |
    |   --------------------------------------   | |
    |  |   | ITEMN                            |  | |
    |   --------------------------------------   | /
    |                                            |
    | ------------------------------------------ | \
    ||   | ITEM0                                || |
    | ------------------------------------------ | |
    | ------------------------------------------ |  > 2 cells per row
    ||   | ITEM2                                || |
    | ------------------------------------------ | /
     --------------------------------------------
     footer
                        eqw
  }
  {$ENDREGION}

  {$REGION 'zip'}
  // box
  bow := IvWidth;
  bw2 := IvWidth/2;
  // working
  x := IvX;
  y := IvY;
//w := 0;
//h := 0;
  {$ENDREGION}

  {$REGION 'image'}
  jel :=          '{"type": "image"'
      //+ Format(', "name": "%s"'                                     , ['areaFlag'])
        + Format(', "x": %f'                                          , [x-bw2+IMG_WH/2])
        + Format(', "y": %f'                                          , [y+IMG_WH/2])
        + Format(', "w": %f'                                          , [IMG_WH])
        + Format(', "h": %f'                                          , [IMG_WH])
        + Format(', "uri": "/Image/F/Foundry/FoundryArea%s_16X16.bmp"', [IvArea2])
        +        '}';
  {$ENDREGION}

  {$REGION 'title'}
  jel := jel   + ',{"type": "text"'
      //+ Format(', "name": "%s"'                                       , ['title'])
        + Format(', "x": %f'                                            , [x])
        + Format(', "y": %f'                                            , [y+IMG_WH/2])
      //+ Format(', "rot": %f'                                          , [30.0])
        + Format(', "text": "%s"'                                       , [IvTitle])
        + Format(', "font": "bold %dpx calibri"'                        , [16])
        + Format(', "textFillStyle": "%s"'                              , [IvAreaColor])
      //+ Format(', "textLineStyle": "%s"'                              , [IvColor])
      //+ Format(', "textLineWidth": %f'                                , [1.0])
        + Format(', "textBaseline": "%s"'                               , ['middle'])
        + Format(', "textAlign": "%s"'                                  , ['center'])
        +        '}';
  {$ENDREGION}

  {$REGION 'rows'}
  IncF(y, IMG_WH);
  for ror in IvRowVector do begin
    IncF(y, ror.MarginV+ror.HeightHalf);
    w := bow-2*ror.MarginH-OUTLINE_TICKNESS;
    h := ror.Height;

    // row
    jel := jel  +        ',{"type": "box"'
              //+ Format(', "name": "%s"'                                       , ['Row'])
                + Format(', "x": %f'                                            , [x])
                + Format(', "y": %f'                                            , [y])
                + Format(', "w": %f'                                            , [w])
                + Format(', "h": %f'                                            , [h])
              //+ Format(', "rot": %f'                                          , [30.0])
              //+ Format(', "radii": %f'                                        , [10.0])
                + Format(', "fillStyle": "%s"'                                  , [ror.BgColor])
              //+ Format(', "fillGap": "%s"'                                    , [0])
              //+ Format(', "lineStyle": "%s"'                                  , [ror.LineColor])
              //+ Format(', "lineWidth": %f'                                    , [3.0])
                + Format(', "text": "%s"'                                       , [ror.Text])
                + Format(', "font": "%dpx calibri"'                             , [Round(ror.TextHeight)])
                + Format(', "textFillStyle": "%s"'                              , [ror.FgColor])
              //+ Format(', "textLineStyle": "%s"'                              , ['blue'])
              //+ Format(', "textLineWidth": %f'                                , [0])
              //+ Format(', "textBaseline": "%s"'                               , ['middle'])
                + Format(', "textAlign": "%s"'                                  , [ror.Align]);
    if ror.TextXPerc <> 0 then
    jel := jel  + Format(', "textXPerc": %f'                                    , [ror.TextXPerc]);
    if ror.TextYPerc <> 0 then
    jel := jel  + Format(', "textYPerc": %f'                                    , [ror.TextYPerc]);
              //+ Format(', "textRot": %f'                                      , [0])
    jel := jel  +        '}';

    // tab
    if (ror.TabWidth > 0) and (not ror.TabBgColor.IsEmpty){ror.TabText.IsEmpty} then begin
    jel := jel  +        ',{"type": "box"'
              //+ Format(', "name": "%s"'                                       , ['Row'])
                + Format(', "x": %f'                                            , [x+w/2 - ror.TabWidth/2])
                + Format(', "y": %f'                                            , [y])
                + Format(', "w": %f'                                            , [ror.TabWidth])
                + Format(', "h": %f'                                            , [h])
              //+ Format(', "rot": %f'                                          , [30.0])
              //+ Format(', "radii": %f'                                        , [10.0])
                + Format(', "fillStyle": "%s"'                                  , [ror.TabBgColor])
              //+ Format(', "fillGap": "%s"'                                    , [0])
              //+ Format(', "lineStyle": "%s"'                                  , [ror.LineColor])
              //+ Format(', "lineWidth": %f'                                    , [3.0])
                + Format(', "text": "%s"'                                       , [ror.TabText])
                + Format(', "font": "%dpx calibri"'                             , [Round(ror.TextHeight)])
                + Format(', "textFillStyle": "%s"'                              , [{ColContrast(ror.FgColor)'black'}ror.TabFgColor])
              //+ Format(', "textLineStyle": "%s"'                              , ['blue'])
              //+ Format(', "textLineWidth": %f'                                , [0])
                + Format(', "textBaseline": "%s"'                               , ['middle'])
                + Format(', "textAlign": "%s"'                                  , [ror.Align]);
    if ror.TextXPerc <> 0 then
    jel := jel  + Format(', "textXPerc": %f'                                    , [ror.TextXPerc]);
    if ror.TextYPerc <> 0 then
    jel := jel  + Format(', "textYPerc": %f'                                    , [ror.TextYPerc]);
              //+ Format(', "textRot": %f'                                      , [0])
    jel := jel  +        '}';
    end;

    IncF(y, ror.HeightHalf);
  end;
  {$ENDREGION}

  {$REGION 'outline'}
  IncF(y, ror.MarginH);
  jel := jel   + ',{"type": "box"'
      //+ Format(', "name": "%s"'                                       , ['Outline'])    (y-IvY+ror.MarginV)/2+IvY+IMG_WH      -IvY+ror.MarginV
        + Format(', "x": %f'                                            , [x])
        + Format(', "y": %f'                                            , [IvY+IMG_WH+(y-IvY-IMG_WH)/2])
        + Format(', "w": %f'                                            , [bow-OUTLINE_TICKNESS])
        + Format(', "h": %f'                                            , [(y-IvY-IMG_WH)])
      //+ Format(', "rot": %f'                                          , [30.0])
      //+ Format(', "radii": %f'                                        , [10.0])
        + Format(', "fillStyle": "%s"'                                  , [''])
      //+ Format(', "fillGap": "%s"'                                    , [0])
        + Format(', "lineStyle": "%s"'                                  , [IvAreaColor])
        + Format(', "lineWidth": %f'                                    , [OUTLINE_TICKNESS])
      //+ Format(', "text": "%s"'                                       , [ror.Text])
      //+ Format(', "font": "%dpx arial"'                               , [Round(ror.Height-2*GAP)])
      //+ Format(', "textFillStyle": "%s"'                              , ['yellow'])
      //+ Format(', "textLineStyle": "%s"'                              , ['blue'])
      //+ Format(', "textLineWidth": %f'                                , [0])
      //+ Format(', "textBaseline": "%s"'                               , ['middle'])
      //+ Format(', "textAlign": "%s"'                                  , ['center'])
      //+ Format(', "textXPerc": %f'                                    , [0])
      //+ Format(', "textYPerc": %f'                                    , [0])
      //+ Format(', "textRot": %f'                                      , [0])
        +        '}';
  {$ENDREGION}

  {$REGION 'note'}
  if not IvNote.IsEmpty then begin
  jel := jel   + ',{"type": "text"'
      //+ Format(', "name": "%s"'                                       , ['note'])
        + Format(', "x": %f'                                            , [x-bw2])
        + Format(', "y": %f'                                            , [y+IMG_WH/4])
      //+ Format(', "rot": %f'                                          , [30.0])
        + Format(', "text": "%s"'                                       , [IvNote])
        + Format(', "font": "%dpx calibri"'                             , [12])      // italic courier
        + Format(', "textFillStyle": "%s"'                              , ['silver']) // IvColor
      //+ Format(', "textLineStyle": "%s"'                              , [IvColor])
      //+ Format(', "textLineWidth": %f'                                , [1.0])
        + Format(', "textBaseline": "%s"'                               , ['top']) // middle
        + Format(', "textAlign": "%s"'                                  , ['left']) // center
        +        '}';
  end;
  {$ENDREGION}

  {$REGION 'end'}
  IvHeightOut := y - IvY;
  Result := jel;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'User'}
procedure TMainForm.UserFromIp(IvIp: string; var IvUsername, IvNumber, IvPersonId, IvUserId, IvMemberId: string);
var
  sql: string;
  dst: _Recordset;
begin
  sql :=  Format('select'
  + sLineBreak + '    a.FldObjectId as FldPersonId'
//+ sLineBreak + '  , a.FldPerson'
//+ sLineBreak + '  , a.FldName'
//+ sLineBreak + '  , a.FldSurname'
//+ sLineBreak + '  , a.FldPhone'
//+ sLineBreak + '  , a.FldMobile'
//+ sLineBreak + '  , a.FldEmail'
//+ sLineBreak + '  , a.FldPicture'
//+ sLineBreak + '  , a.FldGender'
//+ sLineBreak + '  , a.FldLanguage'
//+ sLineBreak + '  , a.FldSsn'
  + sLineBreak + '  , b.FldPersonId as FldUserId'
  + sLineBreak + '  , b.FldUsername'
//+ sLineBreak + '  , b.FldPassword'
//+ sLineBreak + '  , b.FldState'
//+ sLineBreak + '  , b.FldAvatar'
//+ sLineBreak + '  , b.FldOrganization'
//+ sLineBreak + '  , b.FldIp'
  + sLineBreak + '  , c.FldObjectId as FldMemberId'
  + sLineBreak + '  , isnull(c.FldNumber, ''000000'') as FldNumber'
//+ sLineBreak + '  , c.FldMember'
//+ sLineBreak + '  , c.FldEmail'
//+ sLineBreak + '  , c.FldState'
//+ sLineBreak + '  , c.FldOrganization'
//+ sLineBreak + '  , c.FldDepartment'
//+ sLineBreak + '  , c.FldArea'
//+ sLineBreak + '  , c.FldTeam'
//+ sLineBreak + '  , c.FldSite'
//+ sLineBreak + '  , c.FldBuilding'
//+ sLineBreak + '  , c.FldWorkstation'
//+ sLineBreak + '  , c.FldPhone'
//+ sLineBreak + '  , c.FldJobTitle'
//+ sLineBreak + '  , c.FldJobRole'
//+ sLineBreak + '  , c.FldJobLevel'
//+ sLineBreak + '  , c.FldUnit'
//+ sLineBreak + '  , c.FldCostCenter'
//+ sLineBreak + '  , c.FldBadge'
//+ sLineBreak + '  , d.FldObject'
//+ sLineBreak + '  , e.FldObjectId'
//+ sLineBreak + '  , e.FldWww'
//+ sLineBreak + '  , e.FldPhone'
//+ sLineBreak + '  , e.FldEmail'
//+ sLineBreak + '  , e.FldAbout'
//+ sLineBreak + '  , e.FldSlogan'
//+ sLineBreak + '  , e.FldLogo'
//+ sLineBreak + '  , e.FldLogoLong'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaPerson.dbo.TblPerson             a inner join'
  + sLineBreak + '    DbaUser.dbo.TblUser                 b on (b.FldPersonId = a.FldObjectId  ) inner join'
  + sLineBreak + '    DbaMember.dbo.TblMember             c on (c.FldMember = b.FldUsername    ) inner join'
  + sLineBreak + '    DbaOrganization.dbo.TblObject       d on (d.FldObject = c.FldOrganization) inner join'
  + sLineBreak + '    DbaOrganization.dbo.TblOrganization e on (e.FldObjectId = d.FldId)'
  + sLineBreak + 'where'
  + sLineBreak + '    b.FldIp  = ''%s'''
  + sLineBreak + 'and e.FldWww = ''%s'''
  , [IvIp, 'www.wks.cloud']);
  dst := VfsADOConnection.Execute(sql);
  if dst.RecordCount <= 0 then begin
    IvUsername := 'unknown';
    IvNumber := 'unknown';
  end else begin
    IvUsername := dst.Fields['FldUsername'].Value;
    IvNumber   := dst.Fields['FldNumber'  ].Value;
    IvPersonId := dst.Fields['FldPersonId'].Value;
    IvUserId   := dst.Fields['FldUserId'  ].Value;
    IvMemberId := dst.Fields['FldMemberId'].Value;
  end;
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TMainForm.FormCreate(Sender: TObject);
var
  cip: string;         // clientip
  cid: string;         // clientid
  cun: string;         // username
  cuu: string;         // usernumber
  pei: string;         // personid
  usi: string;         // userid
  mei: string;         // memberid
  idx: integer;
  ptr: PMessageRec;
  msg: TMessageRec;
  cdp: PClientDataRec;
begin
  // gui
  TopPanel.Align := alClient;
  TopPageControl.ActivePageIndex := 1;
  BottomPageControl.ActivePageIndex := 0;
  WsMessagesSynEdit.Clear;
  WsMessageEdit.Clear;
  WsMessageCheckBox.Checked := true;

  // db
//VfsADOConnection.Connected := true;

  // colorcodes
  BoxColorsInit;

  // marquee
//MarqueeADOQuery.Active := true;
  MarqueeAreaComboBox.Text := '';
  StringListFromSql(MarqueeAreaComboBox.Items, 'select distinct FldArea from DbaVfs.dbo.TblArea order by 1', '*', VfsADOConnection);

  // html
  DataADOTable.Active := true;

  // messages
  for msg in MESSAGE_REC_VEC do begin
    new(ptr);
    ptr.Many := msg.Many;
    ptr.Name := msg.Name;
    ptr.Body := msg.Body;
    WsMessageListBox.AddItem(ptr.Name, TObject(ptr));
  end;

  // ws server
  FBirdSocket := TBirdSocket.Create(StrToIntDef(WsServerPortEdit.Text, 8080));

  // ws server on successful connected client
  FBirdSocket.AddEventListener(TEventType.CONNECT
  , procedure(const ABird: TBirdSocketConnection)
    begin
      // ip
      cip := ABird.IPAdress;

      // client
      cid := ClientId(ABird);
      UserFromIp(cip, cun, cuu, pei, usi, mei);

      // clientregister *** IMMEDIATELY ***
      new(cdp);
      cdp.Ip           := cip;
      cdp.Username     := cun;
      cdp.UserNumber   := cuu;
      cdp.PersonId     := pei;
      cdp.UserId       := usi;
      cdp.MemberId     := mei;
      cdp.View         := '';
      cdp.Area3        := '';
      cdp.AreaF9       := '';
      cdp.BayMes       := '';
      cdp.BayCad       := '';
      cdp.LayoutWidth  := 1024;
      cdp.LayoutHeight := 768;
      ABird.CustomRec  := cdp;
      idx := WsClientListBox.Items.Add(cid);
      WsClientListBox.ItemIndex := idx;
      LogDb(ABird, 'registered');

      // not working
      //ABird.Send(Format('YMS YOURCLIENTID "%s.%d"', [ABird.IPAdress, ABird.Id]));
    end
  );

  // ws server on message received from a client (PROTOCOL)
  FBirdSocket.AddEventListener(TEventType.EXECUTE
  , procedure(const ABird: TBirdSocketConnection)
    var
      msg: string;
    begin
      cid := ClientId(ABird);
      msg := ABird.WaitMessage;
    //Log('%s %s received', [cid, msg]);
      WsRouter(msg, ABird);
    end);

  // ws server on a client disconnection
  FBirdSocket.AddEventListener(TEventType.DISCONNECT
  , procedure(const ABird: TBirdSocketConnection)
    var
      i: integer;
    begin
      // client
      cid := ClientId(ABird);
      UserFromIp(ABird.IPAdress, cun, cuu, pei, usi, mei);

      // clientunregister
      for i := 0 to Pred(WsClientListBox.Items.Count) do
        if WsClientListBox.Items[i] = cid then begin
          WsClientListBox.Items.Delete(i);
          LogDb(ABird, 'unregistered');
          break;
        end;
    end);

  // gui
  HttpGuiUpdate(false);
  WsGuiUpdate(false);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  // geniusenable
  GeniusTimer.Enabled := true;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  // servers
  HttpServerStopButton.Click;
  WsServerStopButton.Click;

  // wsmessages
  for i := 0 to WsMessageListBox.Items.Count-1 do
    Dispose(PMessageRec(WsMessageListBox.Items.Objects[i]));
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FBirdSocket.Free;
end;
{$ENDREGION}

{$REGION 'Timer'}
procedure TMainForm.GeniusTimerTimer(Sender: TObject);
begin
  // disable
  GeniusTimer.Enabled := false;

  // gui
  BottomPanel.Height := ClientHeight div 4 * 2;

  // button
  HttpServerStartButton.Click;
  WsServerStartButton.Click;
end;
{$ENDREGION}

{$REGION 'Log'}
procedure TMainForm.Log(IvStr: string);
var
  log: string;
begin
  log := Format('%s : %s', [FormatDateTime('dd hh:nn:ss', Now), IvStr.Trim]);
  LogListBox.Items.Add(log);
  LogListBox.ItemIndex := LogListBox.Items.Count - 1; // selects the last item
end;

procedure TMainForm.Log(IvFormatStr: string; IvVarRecVector: array of TVarRec);
begin
  Log(Format(IvFormatStr, IvVarRecVector));
end;

procedure TMainForm.LogDb(IvConn: TBirdSocketConnection; IvStr: string);
var
  sql: string;
begin
  // gui
  Log('%s : %s', [ClientId(IvConn), IvStr]);

  // db
  try
    sql :=         'insert into DbaVfs.dbo.TblLog'
    + sLineBreak + 'values ('
    + sLineBreak +        DateTimeToStr(Now).QuotedString                        // FldDateTime
    + sLineBreak + ', ' + IvConn.IPAdress.QuotedString                           // FldIP
    + sLineBreak + ', ' + PClientDataRec(IvConn.CustomRec).Username.QuotedString // FldUsername
    + sLineBreak + ', ' + IvStr.Trim.QuotedString                                // FldLog
    + sLineBreak + ')'
    ;
    VfsADOConnection.Execute(sql);
  except
    on e: Exception do
      Log(e.Message);
  end;
end;

//procedure TMainForm.LogDb(IvConn: TBirdSocketConnection; IvFormatStr: string; IvVarRecVector: array of TVarRec);
//begin
//  LogDb(IvConn, Format(IvFormatStr, IvVarRecVector));
//end;

procedure TMainForm.LogClearButtonClick(Sender: TObject);
begin
  LogListBox.Clear;
end;
{$ENDREGION}

{$REGION 'TReplyRec'}
procedure TReplyRec.Init(IvCode, IvJson: string);
begin
  Code := IvCode;
  Json := IvJson;
end;

procedure TReplyRec.Init(IvCode, IvJsonFmt: string; IvVarRecVector: array of TVarRec);
begin
  Init(IvCode, Format(IvJsonFmt, IvVarRecVector));
end;
{$ENDREGION}

{$REGION 'WsServer'}
procedure TMainForm.WsGuiUpdate(const IvServerOn: boolean);
begin
  WsClientListBox.Clear;
  WsServerStopButton.Enabled  := IvServerOn;
  WsServerStartButton.Enabled := not(IvServerOn);
  WsServerStartedJvLED.Status := IvServerOn;
end;

procedure TMainForm.WsServerStartButtonClick(Sender: TObject);
begin
  if WsServerStartedJvLED.Status then begin
    Log('ws server already started!');
    Exit;
  end;

  try
    FBirdSocket.Start;
    WsGuiUpdate(true);
    Log('ws server started');
  except
    on e: Exception do
      Log(e.Message);
  end;
end;

procedure TMainForm.WsServerStopButtonClick(Sender: TObject);
begin
  if not WsServerStartedJvLED.Status then begin
    Log('ws server already stopped');
    Exit;
  end;

  try
    if FBirdSocket.Active then begin
      // clients disconnect
      WsClientDisconnectAllButton.Click;
      Sleep(1000);

      // stop
      FBirdSocket.Stop;
      WsGuiUpdate(false);
      Log('ws server stopped');
    end;
  except
    on e: Exception do
      Log('%s', [e.Message]);
  end;
end;

procedure TMainForm.WsRouter(IvMessage: string; IvConn: TBirdSocketConnection);

  {$REGION 'var'}
var
  // spare
  ok: boolean;
  // client
  cip: string;            // clientip
  cid: string;            // clientid
  cun: string;            // username/client giarussi
  cuu: string;            // usernumber      353992
  pei: string;            // personid
  usi: string;            // userid
  mei: string;            // memberid
  cvi: string;            // view
  ca3: string;            // area3
  ca9: string;            // areaf9
  cbm: string;            // bay mes
  cbc: string;            // bay cad
  clw: integer;           // layout width
  clh: integer;           // layout height
  cii: string;            // help id csv
  opt: string;            // option
  ova: string;            // option value
  obr: integer;           // option boxes per row
  // message
  msv: TArray<string>;    // vector
  msg, msu: string;       // messagesingle, uppecase
  rpl: TReplyRec;         // reply
  // command
  pav: TArray<string>;    // parts
  dom, cmd, dat: string;  // domain, command, data
  // json
  jva, jv2: TJSONValue;   // datajson
  wha: string;            // what
  {$ENDREGION}

begin
try
  // client
  cip := PClientDataRec(IvConn.CustomRec).Ip;
  cid := ClientId(IvConn);
  cun := ClientUsername(IvConn);
  cuu := ClientUserNumber(IvConn);
  pei := PClientDataRec(IvConn.CustomRec).PersonId;
  usi := PClientDataRec(IvConn.CustomRec).UserId;
  mei := PClientDataRec(IvConn.CustomRec).MemberId;
//cvi := ;
//ca3 := ;
//ca9 := ;

  // messages
  msv := IvMessage.Split([sLineBreak]);

  // loop
  for msg in msv do begin
    // log
    Log('%s > %s', [cid, msg]);

    // fix
    msu := msg.Trim.ToUpper; // EMPTY, WHITESPACES, PING, HELLO, BYE, CLI CMD DATA

    {$REGION 'COMMON'}
    {EMPTY -> YMS EMPTY}
    if msg.IsEmpty then begin
      rpl.Init('EMPTY', '{"message": "request was empty"}');

    {WHITESPACES -> YMS WHITESPACES}
    end else if msu.IsEmpty then begin
      rpl.Init('WHITESPACES', '{"message": "request was whitespaces"');

    {PING -> YMS PONG}
    end else if msu.Equals('PING') then begin
      rpl.Init('PONG');

    {HELLO -> YMS YOUAREWELCOME}
    end else if msu.Equals('HELLO') then begin
      rpl.Init('YOUAREWELCOME');

    {BYE -> YMS SEEYOUSOON}
    end else if msu.Equals('BYE') then begin
      rpl.Init('SEEYOUSOON');
    {$ENDREGION}

    {$REGION 'CLI'}
    end else if msu.StartsWith('CLI') then begin

      {$REGION 'parts'}
      //
      //       CLI CMD DATA
      //       /    \    \_____
      //      /      \         \
      //   domain   command   data
      //   agent    selector  json       {"what": "CLIENTINFO", ...}
      //                      jsonarray  [{"what": "CLIENTINFO", ...}, ...]

      // parts
      pav := msu.Split([' '], 2);

      // domain
      dom := pav[0];

      // command
      cmd := pav[1]; // GET, SET

      // data
      dat := msg.Substring(Length(Format('%s %s', [dom, cmd])));

      // json
      jva := System.JSON.TJSonObject.ParseJSONValue(dat);

      // what
      if not jva.TryGetValue('what', jv2) then
        raise Exception.Create('please use CLI GET {"what": "...", "key": "value", ...}');
      wha := jva.GetValue<string>('what');
      {$ENDREGION}

      {$REGION 'SET'}
      if cmd.StartsWith('SET') then begin
        try
          // CLI SET {"what": "CLIENTINFO", "username": "GIARUSSI", "layoutWidth": 1024 "layoutHeight": 768} request to set client's info
          if wha = 'CLIENTINFO' then begin                           // server reply also with username... *** move to a separate cmd ***
          //cun := jva.GetValue<string>('username');
            clw := jva.GetValue<integer>('layoutWidth');
            clh := jva.GetValue<integer>('layoutHeight');
            PClientDataRec(IvConn.CustomRec).LayoutWidth := clw;
            PClientDataRec(IvConn.CustomRec).LayoutHeight := clh;
            rpl.Init('CLIENTINFOSTORED', '{"layoutWidth": %d, "layoutHeight": %d, "ip": "%s", "username": "%s", "userNumber": "%s", "personId": "%s", "userId": "%s", "memberId": "%s"}', [clw, clh, cip, cun, cuu, pei, usi, mei]);

          // CLI SET {"what": "CLIENTAREA", "area": "PHO", "areaf9": "F9 PHOTO"} --> request to set client's area
          end else if wha = 'CLIENTAREA' then begin
            ca3 := jva.GetValue<string>('area3');
            ca9 := jva.GetValue<string>('areaf9');
            PClientDataRec(IvConn.CustomRec).Area3 := ca3;
            PClientDataRec(IvConn.CustomRec).AreaF9 := ca9;
            rpl.Init('CLIENTAREASTORED', '{"message": "area %s %s has been set"}', [ca3, ca9]);

          // CLI SET {"what": "CLIENTBAYMES", "bay": "F9 DRY 03"} --> request to set client's bay mes
          end else if wha = 'CLIENTBAYMES' then begin
            cbm := jva.GetValue<string>('bayMes');
            PClientDataRec(IvConn.CustomRec).BayMes := cbm;
            rpl.Init('CLIENTBAYMESSTORED', '{"message": "bay mes %s has been set"}', [cbm]);

          // CLI SET {"what": "CLIENTBAYCAD", "bay": "PHOTO-2 BAY#4"} --> request to set client's bay cad
          end else if wha = 'CLIENTBAYCAD' then begin
            cbc := jva.GetValue<string>('bayCad');
            PClientDataRec(IvConn.CustomRec).BayCad := cbc;
            rpl.Init('CLIENTBAYCADSTORED', '{"message": "bay cad %s has been set"}', [cbc]);

          // CLI SET {"what": "CLIENTVIEW", "view": "ViewEquipmentState"} --> request to set client's current page & view
          end else if wha = 'CLIENTVIEW' then begin
            cvi := jva.GetValue<string>('view');
            PClientDataRec(IvConn.CustomRec).View := cvi;
            rpl.Init('CLIENTVIEWSTORED', '{"message": "view %s has been set"}', [cvi]);

          // CLI SET {"what": "OPTION", "what": "OPTION", "option": "optionBoxesPerRow", "value": "4"} --> request to set a client's option
          end else if wha = 'OPTION' then begin
            opt := jva.GetValue<string>('option');
            ova := jva.GetValue<string>('value');
            if SameText('optionBoxesPerRow', opt) then begin
              PClientDataRec(IvConn.CustomRec).OptionBoxesPerRow := StrToIntDef(ova, 4);
              ok := true;
            end else
              ok := false;
            if ok then
              rpl.Init('OPTIONSTORED', '{"message": "option %s has been set"}', [opt])
            else
              rpl.Init('OPTIONIGNORED', '{"message": "option %s has been ignored"}', [opt]);

          // CLI SET {"what": "???"} unknown request
          end else
            rpl.Init('IGNORED', '{"message": "unknown request ignored"}');

        except
          on e: Exception do
            rpl.Init('ERROR', '{"message": "%s"}', [e.Message]);
        end;
      {$ENDREGION}

      {$REGION 'GET'}
      end else if cmd.StartsWith('GET') then begin
        try
          // CLI GET {"what": "DATAHTML"} request to send back the html about legendas
          if          wha = 'DATAHTML' then begin
            cii := jva.GetValue<string>('idCsv');
            rpl.Init('DATAHTML', DataHtmlJson(cii));

          // CLI GET {"what": "LEGENDAHTML"} request to send back the html about legendas
          end else if wha = 'LEGENDAHTML' then begin
            rpl.Init('LEGENDAHTML', LegendaHtmlJson);

          // CLI GET {"what": "MARQUEELIST"} request to send back the list of marquees
          end else if wha = 'MARQUEELIST' then begin
            MarqueeSendToAll;
            ca9 := PClientDataRec(IvConn.CustomRec).AreaF9;
            rpl.Init('MARQUEEJSON', MarqueeJson(ca9));

          // CLI GET {"what": "AREALIST"} request to send back the areas list
          end else if wha = 'AREALIST' then begin
            MarqueeSendToAll; // *** REMOVE ***
            rpl.Init('AREALISTJSON', AreaListHtmlJson);

          // CLI GET {"what": "BAYMESLIST"} request to send back the bay list
          end else if wha = 'BAYMESLIST' then begin
            ca9 := PClientDataRec(IvConn.CustomRec).AreaF9;
            IvConn.Send('YMS MARQUEEJSON %s', [MarqueeJson(ca9)]); // *** REMOVE ***
            rpl.Init('BAYMESLISTJSON', BayMesListHtmlJson(ca9));

          // CLI GET {"what": "BAYLIST"} request to send back the bay list
          end else if wha = 'BAYCADLIST' then begin
            ca3 := PClientDataRec(IvConn.CustomRec).Area3;
            ca9 := PClientDataRec(IvConn.CustomRec).AreaF9;
            IvConn.Send('YMS MARQUEEJSON %s', [MarqueeJson(ca9)]); // *** REMOVE ***
            rpl.Init('BAYCADLISTJSON', BayCadListHtmlJson(ca3));

          // CLI GET {"what": "VIEWSHAPELIST"} request to send back a list of shapes for a specific view
          end else if wha = 'VIEWSHAPELIST' then begin
            clw := PClientDataRec(IvConn.CustomRec).LayoutWidth;
            clh := PClientDataRec(IvConn.CustomRec).LayoutHeight;
            ca3 := PClientDataRec(IvConn.CustomRec).Area3;
            cbm := PClientDataRec(IvConn.CustomRec).BayMes;
            cbc := PClientDataRec(IvConn.CustomRec).BayCad;
            cvi := PClientDataRec(IvConn.CustomRec).View;
            obr := PClientDataRec(IvConn.CustomRec).OptionBoxesPerRow;
            rpl.Init('VIEWSHAPELISTJSON', EquipmentShapeListJson(ca3, cbm, cbc, cvi, clw, clh, obr));
            // set client w h
            // ...

          // CLI GET {"what": "???"} unknown request
          end else
            rpl.Init('IGNORED', '{"message": "unknown request ignored"}');
        except
          on e: Exception do
            rpl.Init('ERROR', '{"message": "%s"}', [e.Message]);
        end;
      {$ENDREGION}

      {$REGION 'XXX'}
      end else
        rpl.Init('IGNORED', '{"message": "unknown request ignored"}');
      {$ENDREGION}

    {$ENDREGION}

    {$REGION 'YYY'}
    end else
      rpl.Init('IGNORED', '{"message": "unknown request ignored"}');
    {$ENDREGION}

    {$REGION 'SEND'}
    Log('%s < YMS %s%s', [cid, rpl.Code, StrPrepend(rpl.Json, ' ')]);
    IvConn.Send('YMS %s%s', [rpl.Code, StrPrepend(rpl.Json, ' ')]);
    {$ENDREGION}

  end;
except
  on e: Exception do begin
    LogDb(IvConn, e.Message);
  end;
end;
end;
{$ENDREGION}

{$REGION 'HttpServer'}
procedure TMainForm.HttpGuiUpdate(const IvServerOn: boolean);
begin
//HttpClientListBox.Clear;
  HttpServerStopButton.Enabled  := IvServerOn;
  HttpServerStartButton.Enabled := not(IvServerOn);
  HttpServerStartedJvLED.Status := IvServerOn;
end;

procedure TMainForm.HttpServerStartButtonClick(Sender: TObject);
begin
  if HttpServerStartedJvLED.Status then begin
    Log('http server already started!');
    Exit;
  end;

  try
    IdHTTPServer.Active := true;
    IdHTTPServer.StartListening;
    HttpGuiUpdate(true);
    Log('http server started');
  except
    on e: Exception do
      Log(e.Message);
  end;
end;

procedure TMainForm.HttpServerStopButtonClick(Sender: TObject);
begin
  if not WsServerStartedJvLED.Status then begin
    Log('http server already stopped');
    Exit;
  end;

  try
    if IdHTTPServer.Active then begin
      // clients disconnect
      //HttpClientDisconnectAllButton.Click;
      //Sleep(1000);

      // stop
      IdHTTPServer.StopListening;
      IdHTTPServer.Active := false;
      HttpGuiUpdate(false);
      Log('http server stopped');
    end;
  except
    on e: Exception do
      Log('%s', [e.Message]);
  end;
end;

procedure TMainForm.IdHTTPServerCommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  uri, ids, txt: string; // idcsv, replydata
begin
  uri := ARequestInfo.URI;
  ids := ARequestInfo.Params.Values['CoId'];

  // headersforcorsset
  AResponseInfo.CustomHeaders.Values['Access-Control-Allow-Origin']  := '*';                           // replace * with a specific domain if security is a concern
  AResponseInfo.CustomHeaders.Values['Access-Control-Allow-Methods'] := 'GET, POST, OPTIONS';          // methods you want to permit
  AResponseInfo.CustomHeaders.Values['Access-Control-Allow-Headers'] := 'Content-Type, Authorization'; // headers you want to allow in requests

  // handle OPTIONS requests for preflight
  if ARequestInfo.Command = 'OPTIONS' then begin
    AResponseInfo.ResponseNo := 204;  // no Content
    AResponseInfo.ContentText := '';  // no body for OPTIONS
  //AResponseInfo.ContentType := '';
    Exit;
  end;
  // browsers send an OPTIONS request before making actual POST, PUT, or DELETE requests to confirm that the server accepts CORS
  // by responding with a 204 (No Content) for OPTIONS requests, you let the browser know it’s safe to proceed with the actual request

  // router
  if uri = '/Data' then begin
    // dataget
    TThread.Synchronize(nil, procedure begin
        txt := DataCode(ids, ARequestInfo.Params);
        Log('%s < YMSHTTP : %s', [ARequestInfo.RemoteIP, txt.Substring(1, 20)+'...']);
    end);
    // reply
    AResponseInfo.ResponseNo := 200;
    AResponseInfo.ContentText := txt;
    AResponseInfo.ContentType := 'text/html';

  end else begin
    AResponseInfo.ResponseNo := 404;
    AResponseInfo.ContentText := Format('not data for %s %s', [uri, ids]);
    AResponseInfo.ContentType := 'text/html';
  end;
end;
{$ENDREGION}

{$REGION 'Client'}
function TMainForm.ClientId(IvConn: TBirdSocketConnection): string;
var
  una: string;
  uno: string;
  pei: string;         // personid
  usi: string;         // userid
  mei: string;         // memberid
begin
  if not Assigned(IvConn.CustomRec) then
    UserFromIp(IvConn.IPAdress, una, uno, pei, usi, mei)
  else begin
    una := PClientDataRec(IvConn.CustomRec).Username;
    uno := PClientDataRec(IvConn.CustomRec).UserNumber;
  end;

  Result := Format('%s_%s_%d %s %s %s', [IvConn.IPAdress, una, IvConn.Id, pei, usi, mei]);
end;

function TMainForm.ClientUsername(IvConn: TBirdSocketConnection): string;
begin
  if not Assigned(IvConn.CustomRec) then
    Result := 'unknown'
  else
    Result := PClientDataRec(IvConn.CustomRec).Username;
end;

function TMainForm.ClientUserNumber(IvConn: TBirdSocketConnection): string;
begin
  if not Assigned(IvConn.CustomRec) then
    Result := '000000'
  else
    Result := PClientDataRec(IvConn.CustomRec).UserNumber;
end;

procedure TMainForm.WsClientDisconnectButtonClick(Sender: TObject);
begin
  MessageSendToCurrent('YMS DISCONNECT');
end;

procedure TMainForm.WsClientDisconnectAllButtonClick(Sender: TObject);
begin
  MessageSendToAll('YMS DISCONNECT');
end;

procedure TMainForm.WsClientDataButtonClick(Sender: TObject);
var
  cid: string;
  bsc: TBirdSocketConnection;
begin
  if WsClientListBox.ItemIndex < 0 then begin
    ShowMessage('Please select a connected client');
    Exit;
  end;

  for bsc in FBirdSocket.Birds.Items do begin
    if not bsc.Handshaked then
      continue;

    cid := ClientId(bsc);

    if cid = WsClientListBox.Items[WsClientListBox.ItemIndex] then begin
      Log('clientid: %s, username: %s, number: %s, area3: %s, f9: %s, baymes: %s, baycad: %s, view: %s, layoutwidth: %d, height: %d', [
        cid
      , PClientDataRec(bsc.CustomRec).Username
      , PClientDataRec(bsc.CustomRec).UserNumber
      , PClientDataRec(bsc.CustomRec).Area3
      , PClientDataRec(bsc.CustomRec).AreaF9
      , PClientDataRec(bsc.CustomRec).BayMes
      , PClientDataRec(bsc.CustomRec).BayCad
      , PClientDataRec(bsc.CustomRec).View
      , PClientDataRec(bsc.CustomRec).LayoutWidth
      , PClientDataRec(bsc.CustomRec).LayoutHeight
      ]);
      break;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Message'}
function  TMainForm.MessageCompile(IvMessage: string): string;
begin
  Result := IvMessage;

  Result := StringReplace(Result, sLineBreak, '', [rfReplaceAll]);

  Result := StringReplace(Result, 'YMS ', sLineBreak + 'YMS ', [rfReplaceAll]);

  Result := Result.Trim;
end;

procedure TMainForm.MessageSendToCurrent(IvMessage: string);
var
  cid, msg: string;
  bsc: TBirdSocketConnection;
begin
  if WsClientListBox.ItemIndex < 0 then begin
    ShowMessage('Please select a connected client');
    Exit;
  end;

  msg := MessageCompile(IvMessage);

  if msg.IsEmpty then begin
    ShowMessage('message is empty, plese check');
    Exit;
  end;

  for bsc in FBirdSocket.Birds.Items do begin
    if not bsc.Handshaked then
      continue;

    cid := ClientId(bsc);

    if cid = WsClientListBox.Items[WsClientListBox.ItemIndex] then begin
    //Log('sending %s to %s', [msg, cid]);
      bsc.Send(msg);
      break;
    end;
  end;
end;

procedure TMainForm.MessageSendToAll(IvMessage: string);
var
  cid, msg: string;
  bsc: TBirdSocketConnection;
begin
  msg := MessageCompile(IvMessage);

  for bsc in FBirdSocket.Birds.Items do begin
    if not bsc.Handshaked then
      continue;

    cid := ClientId(bsc);

//  try
    //Log('sending %s to %s', [msg, cid]);
      bsc.Send(msg);
//    bsc.Free;
//  except
//    on e: Exception do begin
//      Log('%s', [e.Message]);
//    end;
//  end;
  end;
end;

procedure TMainForm.WsMessageSendButtonClick(Sender: TObject);
var
  msg: string;
begin
  msg := '';

  if WsMessageCheckBox.Checked then
    msg := string(WsMessageEdit.Text).Trim;

  if WsMessagesCheckBox.Checked then
    msg :=             msg
        + sLineBreak + WsMessagesSynEdit.Text.Trim;

  MessageSendToCurrent(msg);
end;

procedure TMainForm.WsMessageSendToAllButtonClick(Sender: TObject);
var
  msg: string;
begin
  msg := '';

  if WsMessageCheckBox.Checked then
    msg := string(WsMessageEdit.Text).Trim;

  if WsMessagesCheckBox.Checked then
    msg :=             msg
        + sLineBreak + WsMessagesSynEdit.Text.Trim;

  MessageSendToAll(msg);
end;

procedure TMainForm.WsMessageListBoxDblClick(Sender: TObject);
var
  cli, msg: string;
  ptr: PMessageRec;
begin
  if WsClientListBox.ItemIndex < 0 then begin
    ShowMessage('Please select a connected client');
    Exit;
  end;

  cli := WsClientListBox.Items[WsClientListBox.ItemIndex];

  ptr := PMessageRec(WsMessageListBox.Items.Objects[WsMessageListBox.ItemIndex]);

  msg := Format(ptr.Body, [cli]);

  if ptr.Many then
    WsMessagesSynEdit.Text := msg
  else
    WsMessageEdit.Text := msg;

  WsMessageCheckBox.Checked := not ptr.Many;
  WsMessagesCheckBox.Checked := not WsMessageCheckBox.Checked;
end;
{$ENDREGION}

{$REGION 'Marquee'}
function  TMainForm.MarqueeJson(IvArea9: string): string;

  {$REGION 'const'}
const
  MARQUEE_SQL  = 'select'
  + sLineBreak + '    a.FldArea'
  + sLineBreak + '  , a.FldType'
  + sLineBreak + '  , a.FldMessage'
  + sLineBreak + '  , a.FldState'
  + sLineBreak + '  , a.FldOrder'
  + sLineBreak + '  , c.FldColorBg'
  + sLineBreak + '  , c.FldColorFg'
  + sLineBreak + '  , c.FldDangerOrder'
  + sLineBreak + '  , isnull(b.FldArea2, ''ALL'') as FldArea2'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaVfs.dbo.TblMarquee      a left join'
  + sLineBreak + '    DbaFoundry.dbo.TblArea b on (b.FldAreaF9 = a.FldArea) left join'
  + sLineBreak + '    DbaSystem.dbo.TblColorCode c on (c.FldColorCode = a.FldType)'
  + sLineBreak + 'where'
  + sLineBreak + '    a.FldArea in (''*'', ''%s'')' // all + specificarea
  + sLineBreak + 'and a.FldState = ''Active'''
  + sLineBreak + 'order by'
  + sLineBreak + '    1, 8';
  {$ENDREGION}

  {$REGION 'var'}
var
  // marquee
  mqu: TADOQuery;
  // jsondata
  jel: string;   // elements
  {$ENDREGION}

begin
  mqu := TADOQuery.Create(nil);
  mqu.Connection := VfsADOConnection;
  mqu.SQL.Text := Format(MARQUEE_SQL, [IvArea9]);
  mqu.Open;
  mqu.First;
  try
    jel := '';
    while not mqu.Eof do begin
      jel := jel + ', '   + Format('{"type": "%s", "message": "%s", "order": %d, "area2": "%s", "colorBg": "%s", "colorFg": "%s"}', [
                            mqu.FieldByName('FldType').AsString
                          , mqu.FieldByName('FldMessage').AsString
                          , mqu.FieldByName('FldOrder').AsInteger
                          , mqu.FieldByName('FldArea2').AsString
                          , mqu.FieldByName('FldColorBg').AsString
                          , mqu.FieldByName('FldColorFg').AsString
                          ]);
      // next
      mqu.Next;
    end;
    Delete(jel, 1, 2);
  finally
    mqu.Free;
  end;

  // end
  Result := MessageCompile(Format('[%s]', [jel]));
end;

procedure TMainForm.MarqueeSendToAll;
var
  str, cid, ca3, ca9, msg: string; // clientid = ipaddr.connid, clientarea39
  bsc: TBirdSocketConnection;
begin
  // connections
  for bsc in FBirdSocket.Birds.Items do begin
    // zip
    cid := ClientId(bsc);

    // notonline
    if not bsc.Handshaked then
      str := 'marquee not sent, client not yet online'

    // online
    else begin
      ca3 := PClientDataRec(bsc.CustomRec).Area3;
      ca9 := PClientDataRec(bsc.CustomRec).AreaF9;
      msg := MarqueeJson(ca9); // allareas + (specific area if car is not empty)
      bsc.Send('YMS MARQUEEJSON %s', [msg]);
      str := Format('marquee sent (all areas + %s)', [ca3]);
    end;

    Log('%s < YMS MARQUEEJSON %s', [cid, str]);
  end;
end;

procedure TMainForm.MarqueeAreaComboBoxChange(Sender: TObject);
begin
  MarqueeADOQuery.Close;
  MarqueeADOQuery.Parameters.Items[0].Value := MarqueeAreaComboBox.Text;
  MarqueeADOQuery.Open;
end;

procedure TMainForm.MarqueeFDQueryNewRecord(DataSet: TDataSet);
begin
  DataSet.Edit;
  DataSet.FieldByName('FldArea').Value := MarqueeAreaComboBox.Text;
  DataSet.FieldByName('FldType').Value := 'Info';
  DataSet.FieldByName('FldState').Value := 'Active';
  DataSet.Post;
end;

procedure TMainForm.MarqueeSendToAllButtonClick(Sender: TObject);
begin
  MarqueeSendToAll;
end;
{$ENDREGION}

{$REGION 'Data'}
function TMainForm.DataCode(IvIdCsv: {TArray<integer>}string; IvParamSl: TStrings): string;
var
  i: integer;
  sql, cod, coe, kin, jki, par, val, ret: string;
  dst: TDataset;
  fld: TField;
  mkd: TMarkdownProcessor;
  jsv: TJSONValue; // TJSONObject [] or TJSONArray {}
//jva: string;     // jsonvalue
  // htmlrepeater
//rsq: string;     // sql
  rds: TDataSet;   // ds
  rhe: string;     // head
  rrt: string;     // repeat template
  rri: string;     // repeat item
  rfo: string;     // footer
begin
  // idin
 {iin := '';
  for i := Low(IvIdVec) to High(IvIdVec) do
    iin := iin + ', ' + IvIdVec[i];
  Delete(iin, 1, 2);}

  // htmls
  sql         := 'select'
  + sLineBreak + '    FldId'
  + sLineBreak + '  , FldKind'
  + sLineBreak + '  , FldData'
  + sLineBreak + '  , FldCode'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaVfs.dbo.TblData'
  + sLineBreak + 'where'
  + sLineBreak + '    FldId in (' + {iin}IvIdCsv + ')'
  + sLineBreak + 'order by'
  + sLineBreak + '    1';
  DstFromSql(sql, dst);
  ret := '';
  while not dst.Eof do begin
    kin := dst.FieldByName('FldKind').AsString;
    cod := dst.FieldByName('FldCode').AsString;

    if          SameText('Md', kin) then begin
      mkd := TMarkdownProcessor.CreateDialect(mdCommonMark);
    //mkd.AllowUnSafe := true;
      ret := ret
      + sLineBreak + mkd.process(cod);

    end else if SameText('Json', kin) then begin
      coe := JsonStrEscapeValueOnly(cod);
      jsv := TJSONObject.ParseJSONValue(coe);
      try
        if not (jsv is TJSONObject) then begin
          ret := 'not a json object';
          Break;
        end;

        // jsonkind
        if not jsv.TryGetValue('kind', jki) then begin
          ret := '"kind" item is missing ... "kind": "htmlRepeater"';
          Break;
        end;

        // selectively
        if SameText('htmlRepeater', jki) then begin
          // data
          jsv.TryGetValue('sql'    , sql);
          jsv.TryGetValue('header' , rhe);
          jsv.TryGetValue('repeat' , rrt);
          jsv.TryGetValue('footer' , rfo);

          // sqlparamreplace
          for i := 0 to IvParamSl.Count-1 do begin
            par := IvParamSl.Names[i];
            val := IvParamSl.ValueFromIndex[i];
            val := val.Replace('*', '%');
            sql := StringReplace(sql, '$'+par+'$', val, [rfReplaceAll]);
          end;

          try
            DstFromSql(sql, rds);

            // head
            ret := ret
            + sLineBreak + rhe;

            // repeat
            while not rds.Eof do begin
              // item
              rri := rrt;

              // fldreplace
              for fld in rds.Fields do
                rri := StringReplace(rri, '$'+fld.FieldName+'$', fld.AsString, [rfReplaceAll]);

              // inreplace
              rri := rri.Replace('$RecordNo$', rds.RecNo.ToString, [rfReplaceAll]);

              // add
              ret := ret
              + sLineBreak + rri;

              // next
              rds.Next;
            end;

            // footer
            ret := ret
            + sLineBreak + rfo;
          except
            on e: Exception do
              ret := e.Message;
          end;

          // postreplace
          ret := ret.Replace('$FieldCount$' , rds.FieldCount.ToString , [rfReplaceAll]);
          ret := ret.Replace('$RecordCount$', rds.RecordCount.ToString, [rfReplaceAll]);
          // replace with last record, in case there are some FldXxxTotal
          for fld in rds.Fields do
            ret := StringReplace(ret, '$'+fld.FieldName+'$', fld.AsString, [rfReplaceAll]);
        end else
          ret := '?';
      finally
        jsv.Free;
      end;

    end else
      ret := ret
      + sLineBreak + cod;

    dst.Next;
  end;

  // end
  Result := ret;
end;

function TMainForm.DataHtmlJson(IvIdCsv: string): string;
var
  htm, jss: string;
begin
  htm := DataCode(IvIdCsv, nil);
  jss := JsonStrEscape(htm);
  Result := Format('{"html": "%s"}', [jss]);
end;
{$ENDREGION}

{$REGION 'Legenda'}
function TMainForm.LegendaHtml: string;
var
  sql, htm: string;
  dst: TDataset;
begin
  // semanticcolors
  sql         := 'select'
  + sLineBreak + '    FldColorCode'
  + sLineBreak + '  , FldColorBg'
//+ sLineBreak + '  , FldColorFg'
//+ sLineBreak + '  , FldDangerOrder'
  + sLineBreak + '  , iif(FldBlink = 1, ''blink'', '''') as FldBlinkClass'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaSystem.dbo.TblColorCode'
  + sLineBreak + 'order by'
  + sLineBreak + '    FldDangerOrder asc';
  DstFromSql(sql, dst);
  htm := htm + sLineBreak + '<h4>Semantic Colors</h4>';
  while not dst.Eof do begin
    htm := htm
    + sLineBreak + '<div>'
    + sLineBreak + Format('<span class="%s" style="display:inline-block; width:100px; padding: 8px;"><div style="background-color:%s;">&nbsp;</div></span><span style="; padding: 8px 16px;">%s</span>'
    , [dst.FieldByName('FldBlinkClass').AsString, dst.FieldByName('FldColorBg').AsString, dst.FieldByName('FldColorCode').AsString])
    + sLineBreak + '</div>';
    dst.Next;
  end;
  htm := htm + '<br><br>';

  // areascolors
  sql         := 'select distinct'
  + sLineBreak + '    a.FldArea'
//+ sLineBreak + '  , isnull(b.FldArea2, ''XX'')        as FldArea2'
  + sLineBreak + '  , isnull(b.FldArea3, ''XXX'')       as FldArea3'
  + sLineBreak + '  , isnull(b.FldColorBg, ''magenta'') as FldColorBg'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaVfs.dbo.TblArea      a left join'
  + sLineBreak + '    DbaFoundry.dbo.TblArea b on (b.FldAreaF9 = a.FldArea)'
  + sLineBreak + 'order by'
  + sLineBreak + '    2';
  DstFromSql(sql, dst);
  htm := htm + sLineBreak + '<h4>Areas Colors</h4>';
  while not dst.Eof do begin
    htm := htm
    + sLineBreak + '<div id="co1">' + #9
    + sLineBreak + Format('<span style="display:inline-block; width:100px; padding: 8px;"><div style="background-color:%s;">&nbsp;</div></span><span style="; padding: 8px 16px;">%s</span>'
    , [dst.FieldByName('FldColorBg').AsString, dst.FieldByName('FldArea3').AsString])
    + sLineBreak + '</div>';
    dst.Next;
  end;
  htm := htm + '<br><br>';

  // lotpriority
  sql         := 'select'
//+ sLineBreak + '    FldType'
  + sLineBreak + '    FldPriority'
  + sLineBreak + '  , FldBgColor'
  + sLineBreak + '  , FldFgColor'
  + sLineBreak + '  , iif(FldBlink = 1, ''blink'', '''') as FldBlinkClass'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaFoundry.dbo.TblPriority'
  + sLineBreak + 'where'
  + sLineBreak + '    FldType = ''Lot'''
  + sLineBreak + 'order by'
  + sLineBreak + '    FldValue';
  DstFromSql(sql, dst);
  htm := htm + sLineBreak + '<h4>Lot Priority</h4>';
  while not dst.Eof do begin
    htm := htm
    + sLineBreak + '<div>'
    + sLineBreak + Format('<span class="%s" style="display:inline-block; width:100px; padding: 8px;"><div style="background-color:%s;">&nbsp;</div></span><span style="; padding: 8px 16px;">%s</span>'
    , [dst.FieldByName('FldBlinkClass').AsString, dst.FieldByName('FldBgColor').AsString, dst.FieldByName('FldPriority').AsString])
    + sLineBreak + '</div>';
    dst.Next;
  end;
  htm := htm + '<br><br>';

  // end
  Result := htm;
end;

function TMainForm.LegendaHtmlJson: string;
var
  htm, jss: string;
begin
  htm := LegendaHtml;
  jss := JsonStrEscape(htm);
  Result := Format('{"html": "%s"}', [jss]);
end;
{$ENDREGION}

{$REGION 'Area'}
function TMainForm.AreaListHtml: string;
var
  sql, htm: string;
  dst: TDataset;
begin
  // ds
  sql :=         'select distinct'
  + sLineBreak + '    ''&nbsp;'' as FldCaption'
  + sLineBreak + '  , '''' as FldValue'
  + sLineBreak + '  , ''white'' as FldColorBg'
  + sLineBreak + 'union'
  + sLineBreak + 'select'
//+ sLineBreak + '  , FldDepartment'
//+ sLineBreak + '  , FldArea'
//+ sLineBreak + '  , FldKind'
//+ sLineBreak + '  , FldDescription'
//+ sLineBreak + '  , FldSet0'
//+ sLineBreak + '  , FldArea1'
//+ sLineBreak + '  , FldArea2'
  + sLineBreak + '    FldArea3 as FldCaption'
  + sLineBreak + '  , FldAreaF9 as FldValue'
//+ sLineBreak + '  , FldAreaEyelit'
  + sLineBreak + '  , FldColorBg as FldColorBg'
//+ sLineBreak + '  , FldColorBg2'
//+ sLineBreak + '  , FldColorBg3'
//+ sLineBreak + '  , FldColorFg'
//+ sLineBreak + '  , FldOwner'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaFoundry.dbo.TblArea'
  + sLineBreak + 'where'
  + sLineBreak + '    FldAreaF9 is not null'
  + sLineBreak + 'order by'
  + sLineBreak + '    1';
  DstFromSql(sql, dst);

  // html
  htm := '';
  while not dst.Eof do begin
    htm := htm
    + sLineBreak + Format('<li><a href="#" onclick="coAreaSummarySet(''%s'', ''%s'')" style="border-left:8px solid %s;">%s</a></li>', [
      dst.FieldByName('FldCaption').AsString     // caption
    , dst.FieldByName('FldValue').AsString       // value
    , dst.FieldByName('FldColorBg').AsString     // bordercolor
    , dst.FieldByName('FldCaption').AsString     // caption
    ]);
    dst.Next;
  end;

  // end
  Result := htm;
end;

function  TMainForm.AreaListHtmlJson: string;
var
  htm, jss: string;
begin
  htm := AreaListHtml;
  jss := JsonStrEscape(htm);
  Result := Format('{"html": "%s"}', [jss]);
end;
{$ENDREGION}

{$REGION 'Bay'}
function TMainForm.BayMesListHtml(IvArea: string): string;
var
  sql, htm: string;
  dst: TDataset;
begin
  // ds
  sql :=         'select distinct'
  + sLineBreak + '    ''&nbsp;'' as FldCaption'
  + sLineBreak + '  , ''*'' as FldValue'
  + sLineBreak + '  , ''white'' as FldColorBg'
  + sLineBreak + 'union'
  + sLineBreak + 'select distinct'
  + sLineBreak + '    c.FldBay as FldCaption'
  + sLineBreak + '  , c.FldBay as FldValue'
  + sLineBreak + '  , d.FldColorBg'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaVfs.dbo.TblArea        a inner join'
  + sLineBreak + '    DbaVfs.dbo.TblWorkstation b on (b.FldWorkstation = a.FldWorkstation) inner join'
  + sLineBreak + '    DbaVfs.dbo.TblBay         c on (c.FldEquipment = b.FldEquipment) left join'
  + sLineBreak + '    DbaFoundry.dbo.TblArea   d on (d.FldAreaF9 = a.FldArea)'
  + sLineBreak + 'where'
  + sLineBreak + '    c.FldBay       not like ''%tbd%'''
  + sLineBreak + 'and b.FldEquipment not like ''%dummy%'''
  + sLineBreak + 'and a.FldArea = ''' + IvArea + ''''
  + sLineBreak + 'order by'
  + sLineBreak + '    1, 2';
  DstFromSql(sql, dst);

  // html
  htm := '';
  while not dst.Eof do begin
    htm := htm
    + sLineBreak + Format('<li><a href="#" onclick="coBayMesSummarySet(''%s'', ''%s'')" style="border-left:8px solid %s;">%s</a></li>', [
      dst.FieldByName('FldCaption').AsString     // caption
    , dst.FieldByName('FldValue').AsString       // value
    , dst.FieldByName('FldColorBg').AsString     // bordercolor
    , dst.FieldByName('FldCaption').AsString     // caption
    ]);
    dst.Next;
  end;

  // end
  Result := htm;
end;

function  TMainForm.BayMesListHtmlJson(IvArea: string): string;
var
  htm, jss: string;
begin
  htm := BayMesListHtml(IvArea);
  jss := JsonStrEscape(htm);
  Result := Format('{"html": "%s"}', [jss]);
end;

function  TMainForm.BayCadListHtml(IvArea3: string): string;
var
  sql, htm: string;
  dst: TDataset;
begin
  // ds
  sql :=         'select distinct'
  + sLineBreak + '    ''&nbsp;'' as FldCaption'
  + sLineBreak + '  , ''*'' as FldValue'
  + sLineBreak + '  , ''white''  as FldColorBg'
  + sLineBreak + 'union'
  + sLineBreak + 'select distinct'
  + sLineBreak + '    FldBay    as FldCaption'
  + sLineBreak + '  , FldBay    as FldValue'
  + sLineBreak + '  , ''white'' as FldColorBg'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaVfs.dbo.TblLayout'
  + sLineBreak + 'where'
  + sLineBreak + '    FldBay is not null'
  + sLineBreak + 'and FldArea = ''' + IvArea3 + ''''
  + sLineBreak + 'order by'
  + sLineBreak + '    1, 2';
  DstFromSql(sql, dst);

  // html
  htm := '';
  while not dst.Eof do begin
    htm := htm
    + sLineBreak + Format('<li><a href="#" onclick="coBayCadSummarySet(''%s'', ''%s'')" style="border-left:8px solid %s;">%s</a></li>', [
      dst.FieldByName('FldCaption').AsString     // caption
    , dst.FieldByName('FldValue').AsString       // value
    , dst.FieldByName('FldColorBg').AsString     // bordercolor
    , dst.FieldByName('FldCaption').AsString     // caption
    ]);
    dst.Next;
  end;

  // end
  Result := htm;
end;

function  TMainForm.BayCadListHtmlJson(IvArea3: string): string;
var
  htm, jss: string;
begin
  htm := BayCadListHtml(IvArea3);
  jss := JsonStrEscape(htm);
  Result := Format('{"html": "%s"}', [jss]);
end;
{$ENDREGION}

{$REGION 'Equipment'}
function TMainForm.EquipmentShapeJson(IvX, IvY: double; IvArea2, IvAreaColor, IvEquipment, IvState, IvStateColor, IvAlarm, IvNote: string; IvWidth: double; out IvHeightOut: double): string;

  {$REGION 'var'}
var
  // spare
//idx: integer;         // index
  fst{, lst}: boolean;  // first, last
  sql: string;          // query
  txt: string;          // text
  ste: int64;           // secondstoend
  tte: string;          // timetoend
  col: TBoxColorRec;    // colorcode
  // rows
  ror: TRowRec;
  rov: TArray<TRowRec>; //'type   ,text  ,bgcolor,fgcolor,linecolor,align,height,margin,border,padding'
  // equipment
//eds: TDataset;
  eno: string;          // note
  // chamber
  cds: TDataset;
  cha: string;
//cma: string;          // material
  ces: string;          // equipmentstate
  cps: string;          // productivestate
  // loader
  lds: TDataset;
  lma: string;          // material
  llo: boolean;         // loaded
  // lotnext
  nds: TDataset;
  // counter/pm
  cou: string;
  mds: TDataset;
//pmr: int64;           // minutesremain
  psr: int64;           // secondsremain
  prc: integer;         // percent
  {$ENDREGION}

begin

  {$REGION 'frame state row'}
  ror.Kind       := 'state';
  ror.Text       := IvState;
  ror.TextHeight := 18;
  ror.TextXPerc  :=  0;
  ror.TextYPerc  :=  0;
  ror.BgColor    := IvStateColor;
  ror.FgColor    := '';
  ror.TabText    := '';
  ror.TabBgColor := '';
  ror.TabFgColor := '';
  ror.TabWidth   :=  0;
  ror.Align      := 'center';
  ror.Height     := 24;
  ror.MarginV    :=  2;
  ror.MarginH    :=  2;
  TVector<TRowRec>.Add(rov, ror);
  {$ENDREGION}

  {$REGION 'alarm row'}
  if not IvAlarm.IsEmpty then begin
  ror.Kind       := 'alarm';
  ror.Text       := 'alarm : ' + {StrOverflow(}StrClean2(IvAlarm.ToLower){, 40)};
  ror.TextHeight := 12;
  ror.BgColor    := 'firebrick';
  ror.FgColor    := 'white';
  ror.TabText    := '';
  ror.TabBgColor := '';
  ror.TabFgColor := '';
  ror.TabWidth   :=  0;
  ror.Align      := 'center';
  ror.Height     := 18;
  ror.MarginV    :=  2;
  ror.MarginH    :=  2;
  TVector<TRowRec>.Add(rov, ror);
  end;
  {$ENDREGION}

  {$REGION 'chamber rows'}
  sql :=  Format('select distinct'
//+ sLineBreak + '  -- chamber'
  + sLineBreak + '    rtrim(e.FldEquipment)                                   as FldEquipment'
  + sLineBreak + '  , e.FldChamber'
  + sLineBreak + '  , e.FldState                                              as FldChamberEquipmentState'
  + sLineBreak + '  , d.FldStateColor                                         as FldChamberEquipmentStateBgColor'
  + sLineBreak + '  , coalesce(d.FldStateFgColor, ''black'')                  as FldChamberEquipmentStateFgColor'
  + sLineBreak + '  , e.FldDateTime'
//+ sLineBreak + '  -- run'
//+ sLineBreak + '--, g.FldRun'
//+ sLineBreak + '--, g.FldEquipment'
//  + sLineBreak + '  , coalesce(g.FldState        , ''NOSTATE'')               as FldEquipmentState'
//+ sLineBreak + '  , g.FldStateDateTime                                      as FldEquipmentStateDateTime'
//  + sLineBreak + '  , coalesce(g.FldMaterial     , ''NOLOT'')                 as FldMaterial'
//+ sLineBreak + '  , coalesce(g.FldMaterialState, ''IDLE'')                  as FldChamberProductiveState'
  + sLineBreak + '  , iif(e.FldState = ''UP_PRODUCT'', g.FldMaterialState, ''IDLE'') as FldChamberProductiveState2'
//+ sLineBreak + '  , g.FldMaterialStateDateTime'
//+ sLineBreak + '  , datediff(second, g.FldMaterialStateDateTime, getdate())     as FldRunElapsedSec'
//  + sLineBreak + '  , g.FldDurationMinAvg                                         as FldRunEndsInSec'
//+ sLineBreak + '  , coalesce(u.FldColorBg, ''#E0E0E0'')                         as FldChamberProductiveStateBgColor'
  + sLineBreak + '  , iif(e.FldState = ''UP_PRODUCT'', u.FldColorBg, ''#E0E0E0'') as FldChamberProductiveStateBgColor2'
//+ sLineBreak + '  , coalesce(u.FldColorFg, ''black'')                           as FldChamberProductiveStateFgColor'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaVfs.dbo.TblChamber      e                                             left join'
  + sLineBreak + '    DbaEquipment.dbo.TblState  d on (d.FldState2       = e.FldState        ) left join'
  + sLineBreak + '    DbaVfs.dbo.TblRun          g on (g.FldEquipment    = e.FldEquipment    ) left join'
  + sLineBreak + '    DbaSystem.dbo.TblColorCode u on (u.FldColorCode    = g.FldMaterialState)'
  + sLineBreak + 'where'
  + sLineBreak + '    e.FldEquipment = ''%s'''
  + sLineBreak + 'order by'
  + sLineBreak + '    e.FldChamber', [IvEquipment]);
//FileSave('./vfs-chambers-sql.txt', sql);
  DstFromSql(sql, cds);
  while not cds.Eof do begin
    // calc
    fst := cds.RecNo = 1;
  //lst := cds.RecNo = cds.RecordCount;
    cha := cds.FieldByName('FldChamber').AsString;
  //cma := cds.FieldByName('FldMaterial').AsString.Split(['.'])[0].Substring(3);
    ces := cds.FieldByName('FldChamberEquipmentState').AsString;
    cps := cds.FieldByName('FldChamberProductiveState2').AsString;

    // text
  //txt := Format('%s: L%s %s %s', [cha, cma, cps, ces]);
  //txt := Format('%s: %s %s', [cha, cps, ces]);
    txt := Format('%s: %s', [cha, ces]);
  //if not SameText('RUNNING', cps) then
    //txt :=  Format('%s (%ds to end)', [txt, cds.FieldByName('FldRunEndsInSec').AsInteger]);

    // row
    ror.Kind       := 'chamber';
    ror.Text       := txt;
    ror.TextHeight := 12;
    ror.TextXPerc  :=  -0.95;
    ror.TextYPerc  :=  0;
    ror.BgColor    := cds.FieldByName('FldChamberEquipmentStateBgColor').AsString;
    ror.FgColor    := cds.FieldByName('FldChamberEquipmentStateFgColor').AsString;
    ror.TabText    := cps;
    ror.TabBgColor := cds.FieldByName('FldChamberProductiveStateBgColor2').AsString;
    ror.TabFgColor := 'black'; //cds.FieldByName('FldChamberProductiveStateFgColor2').AsString;
    ror.TabWidth   := 68.0;
    ror.Align      := 'left';
    ror.Height     := 18;
    ror.MarginV    := ifthen(fst, 8, 1);
    ror.MarginH    :=  8;
    TVector<TRowRec>.Add(rov, ror);

    // next
    cds.Next;
  end;
  {$ENDREGION}

  {$REGION 'loader rows'}
  sql :=  Format('select'
//+ sLineBreak + '  -- loader'
//+ sLineBreak + '    a.FldEquipment'
  + sLineBreak + '    a.FldLoader'
//+ sLineBreak + '  , a.FldMaterial'
  + sLineBreak + '  , coalesce(upper(a.FldMaterial), ''NOLOT'')                              as FldMaterial'
//+ sLineBreak + '  , case when a.FldMaterial is null then ''UNLOADED'' else ''LOADED'' end  as FldState'
//+ sLineBreak + '  , abs(len(replace(a.FldMaterial, '','', '''')) - len(a.FldMaterial)) + 1 as FldTotalLot'
//+ sLineBreak + '  , abs(len(replace(a.FldMaterial, ''W'', '''')) - len(a.FldMaterial))     as FldTotalWLot'
//+ sLineBreak + '  -- run'
//+ sLineBreak + '--, b.FldRun'
//+ sLineBreak + '--, b.FldEquipment'
//+ sLineBreak + '  , coalesce(b.FldState        , ''NOSTATE'')               as FldEquipmentState'
//+ sLineBreak + '  , b.FldStateDateTime                                      as FldEquipmentStateDateTime'
//+ sLineBreak + '  , coalesce(b.FldMaterial     , ''NOLOT'')                 as FldMaterial'
//+ sLineBreak + '  , coalesce(b.FldMaterialState, ''NOSTATE'')               as FldChamberState'
//+ sLineBreak + '  , b.FldMaterialStateDateTime'
//+ sLineBreak + '  , datediff(second, b.FldMaterialStateDateTime, getdate()) as FldRunElapsedSec'
  + sLineBreak + '  , max(b.FldDurationMinAvg)                                as FldRunEndsInSecMax'
  + sLineBreak + '  , d.FldBgColor'
  + sLineBreak + '  , d.FldFgColor'
  + sLineBreak + '  , d.FldPriority'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaVfs.dbo.TblLoader       a left join'
  + sLineBreak + '    DbaVfs.dbo.TblRun          b on (b.FldEquipment = a.FldEquipment) left join'
  + sLineBreak + '    DbaVfs.dbo.TblLot          c on (c.FldLot = a.FldMaterial       ) left join'
  + sLineBreak + '    DbaFoundry.dbo.TblPriority d on (d.FldValue = c.FldPriority     )'
  + sLineBreak + 'where'
  + sLineBreak + '    a.FldEquipment = ''%s'''
  + sLineBreak + 'group by'
//+ sLineBreak + '    a.FldEquipment'
  + sLineBreak + '    a.FldLoader'
  + sLineBreak + '  , a.FldMaterial'
  + sLineBreak + '  , d.FldBgColor'
  + sLineBreak + '  , d.FldFgColor'
  + sLineBreak + '  , d.FldPriority'
  + sLineBreak + 'order by'
  + sLineBreak + '    a.FldLoader', [IvEquipment]);
//FileSave('./vfs-loaders-sql.txt', sql);
  DstFromSql(sql, lds);
  while not lds.Eof do begin
    // calc
    fst := lds.RecNo = 1;
  //lst := lds.RecNo = lds.RecordCount;
    lma := {StrOverflow(}lds.FieldByName('FldMaterial').AsString{, 32)};
    llo := not sameText('NOLOT', lma);
    ste := lds.FieldByName('FldRunEndsInSecMax').AsInteger;

    // text
    txt := Format('L%s: %s', [lds.FieldByName('FldLoader').AsString, lma]);

    // timetoend
    if ste < 0 then begin
      tte := TimeMinToDHMS(-ste);
      if llo and (not tte.IsEmpty) then
        txt :=  Format('%s (%s over avg)', [txt, tte]);
    end else begin
      tte := TimeMinToDHMS(ste);
      if llo and (not tte.IsEmpty) then
        txt :=  Format('%s (%s to end)', [txt, tte]);
    end;

    // row
    ror.Kind       := 'loader';
    ror.Text       := txt;
    ror.TextHeight := 14;
    ror.TextXPerc  :=  -0.95;
    ror.TextYPerc  :=  0;
    ror.BgColor    := ifthen(llo, 'green', ''); // #E0E0E0
    ror.FgColor    := ifthen(llo, 'white', 'orange');
    ror.TabText    := lds.FieldByName('FldPriority').AsString;
    ror.TabBgColor := lds.FieldByName('FldBgColor').AsString;
    ror.TabFgColor := lds.FieldByName('FldFgColor').AsString;
    ror.TabWidth   := 74.0;
    ror.Align      := 'left';
    ror.Height     := 20;
    ror.MarginV    :=  ifthen(fst, 8, 1);
    ror.MarginH    :=  2;
    TVector<TRowRec>.Add(rov, ror);

    // next
    lds.Next;
  end;
  {$ENDREGION}

  {$REGION 'holdlots rows'}
  // see ad hoc report in "Hold" section
  {$ENDREGION}

  {$REGION 'holdtimelots rows'}
  // see ad hoc report in "Hold" section
  {$ENDREGION}

  {$REGION 'nextlots rows'}
  sql :=  Format('select'
  + sLineBreak + '    FldEquipment'
  + sLineBreak + '  , FldMaterial'
  + sLineBreak + '  , FldLocation'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaVfs.dbo.TblSchedule'
  + sLineBreak + 'where'
  + sLineBreak + '    FldEquipment = ''%s'''
  + sLineBreak + 'order by'
  + sLineBreak + '    FldLocation', [IvEquipment]);
//FileSave('./vfs-nextlots-sql.txt', sql);
  DstFromSql(sql, nds);
  while not nds.Eof do begin
    // calc
    fst := lds.RecNo = 1;

    // row
    ror.Kind       := 'lotnext';
    ror.Text       := Format('next: %s @ %s', [nds.FieldByName('FldMaterial').AsString, nds.FieldByName('FldLocation').AsString]);
    ror.TextHeight := 13;
    ror.TextXPerc  :=  -0.95;
    ror.TextYPerc  :=  0;
    ror.BgColor    := 'yellow';
    ror.FgColor    := 'black';
    ror.TabText    := '';
    ror.TabBgColor := '';
    ror.Align      := 'left';
    ror.Height     := 18;
    ror.MarginV    :=  ifthen(fst, 8, 1);
    ror.MarginH    :=  2;
    TVector<TRowRec>.Add(rov, ror);

    // next
    nds.Next;
  end;
  {$ENDREGION}

  {$REGION 'counters rows'}
  sql :=  Format('select'
  + sLineBreak + '    FldTool' // equipment
  + sLineBreak + '  , FldCounter'
  + sLineBreak + '  , FldActual'
  + sLineBreak + '  , FldLimit'
  + sLineBreak + '  , convert(int, FldLimit - FldActual)                               as FldSecondsRemain'
  + sLineBreak + '  , convert(int, (FldLimit - FldActual) / nullif(FldLimit, 0) * 100) as FldPercent'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaVfs.dbo.TblCounter'
  + sLineBreak + 'where'
  + sLineBreak + '    FldTool = ''%s'''
  + sLineBreak + 'order by'
  + sLineBreak + '    FldPercent desc, FldCounter', [IvEquipment]);
//FileSave('./vfs-counters-sql.txt', sql);
  DstFromSql(sql, mds);
  while not mds.Eof do begin
    // calc
    fst := mds.RecNo = 1;
    cou := {StrOverflow(}mds.FieldByName('FldCounter').AsString{, 18)};
    psr := mds.FieldByName('FldSecondsRemain').AsInteger;
    prc := mds.FieldByName('FldPercent').AsInteger;
    col := ColCodeIWD(prc);
  //txt := Format('counter: %d%% %s', [prc, cou]);
    txt := Format('PM: %d%% %s %s', [prc, TimeSecToDHMS(psr), cou]);

    // row
    ror.Kind       := 'counter';
    ror.Text       := txt;
    ror.TextHeight := ifthen(prc >= 75, 14, 10);
    ror.TextXPerc  :=  -0.95;
    ror.TextYPerc  :=  0;
    ror.BgColor    := col.BgColor;
    ror.FgColor    := col.FgColor;
    ror.TabText    := '';
    ror.TabBgColor := '';
    ror.TabFgColor := '';
    ror.TabWidth   :=  0;
    ror.Align      := 'left';
    ror.Height     := ifthen(prc >= 75, 20, 16);
    ror.MarginV    :=  ifthen(fst, 8, 1);
    ror.MarginH    :=  2;
    TVector<TRowRec>.Add(rov, ror);

    // next
    mds.Next;
  end;
  {$ENDREGION}

  {$REGION 'notes'}
  eno := IvNote; //next maintenance tomorrow';
  {$ENDREGION}

  // shapebox
  Result := BoxShapeJson(IvX, IvY, IvArea2, IvEquipment, eno, IvAreaColor, rov, IvWidth, IvHeightOut);
end;

function TMainForm.EquipmentShapeListJson(IvArea3, IvBayMes, IvBayCad, IvView: string; IvLayoutWidth: integer; var IvLayoutHeight: integer; IvOptionBoxesPerRow: integer): string;

  {$REGION 'var'}
const
  EQUIPMENT_LINE_WIDTH    = 0;
  GRID_COLS_SCREEN_NARROW = 2;
  GRID_COLS_SCREEN_WIDE   = 5;
  GRID_GAP_X_EXT          = EQUIPMENT_LINE_WIDTH; // = a
  GRID_GAP_X_INT          = 50;                   // = b
  GRID_GAP_Y_TOP          = 50;                   // = c
  GRID_GAP_Y_INT          = 25;
  GRID_GAP_Y_BOT          = 50;

var
  // spare
  ind: integer;       // integerdiv
  inr: integer;       // integerreminder
//fst: boolean;       // first
  fzo: integer;       // first=0 others=1
  tit: string;        // title
  sql: string;
//wbm, wbc: string;   // where baymes baycad
  // area
  ar2: string;
  ar3: string;
  arw: string;        // area where
  abg: string;        // bg
  afg: string;        // fg
  // bay
  bam: string;        // mes
  bac: string;        // cad
  bmw: string;        // mes where
  bcw: string;        // cad where
  // view
  vie: string;        // type
  // scene
  scw: integer;       // width
  sch: integer;       // height
  // equipment
  eix: integer;       // index
  eds: TDataset;      // ds
  eqz: integer;       // count
  ena: string;        // name
  est: string;        // state
  eno: string;        // note
  esc: string;        // statecolor
  eal: string;        // alarm
  ewi: double;        // width
  ew2: double;        // width/2
  ehe: double;        // boxheight
  ehx: double;        // boxheightmax
  // grid
  gcz{, grz}: integer;  // colscount, rowscount
//glz: integer;       // last row cell count
  gx0, gy0: double;   // origin
  gdx{, gdy}: double;   // deltas
  x, y: double;       // x y working, ymax
  // json
  jel, jes: string;   // json element, json elements
  {$ENDREGION}

begin

  {$REGION 'zip'}
  ar3 := IvArea3;
  bam := IvBayMes;
  bac := IvBayCad;
  vie := IvView{.Substring(2)}; // remove 1st 2 chars (EquipmentStateView -> EquipmentState)
  scw := IvLayoutWidth;
  sch := IvLayoutHeight;
  arw := SqlFilter('f.FldArea3', ar3 + ' #');
  bmw := SqlFilter('b.FldBay'  , bam + ' #');
  bcw := SqlFilter('c.FldBay'  , bac + ' #');
  {$ENDREGION}

  {$REGION 'equipments'}

    {$REGION 'ds'}
  sql :=  Format('declare @xmin float, @xmax float, @ymin float, @ymax float'
  + sLineBreak + 'select  @xmin = min(FldX), @xmax = max(FldX), @ymin = min(FldY), @ymax = max(FldY) from DbaVfs.dbo.TblLayout'
  + sLineBreak + 'declare @aww float = %d, @ahh float = %d'
  + sLineBreak + 'declare @bww float = abs(@xmax - @xmin), @bhh float = abs(@ymax - @ymin)'
  + sLineBreak + 'select distinct'
//+ sLineBreak + '  -- EQUIPMENT'
  + sLineBreak + '    rtrim(a.FldEquipment)                                  as FldEquipment'
//+ sLineBreak + '--, a.FldDescription'
  + sLineBreak + '  , a.FldState                                             as FldEquipmentState'
  + sLineBreak + '  , coalesce(i.FldStateColor, ''#E0E0E0'')                 as FldEquipmentStateColor'
//+ sLineBreak + '  , a.FldStateDateTime'
  + sLineBreak + '  , rtrim(a.FldAlarm)                                      as FldAlarm'
  + sLineBreak + '  , a.FldNote'
//+ sLineBreak + '  -- BAYMES'
//+ sLineBreak + '  , b.FldBay                                               as FldBayMes'
//+ sLineBreak + '--, b.FldEquipment'
//+ sLineBreak + '  -- LAYOUTCAD'
//+ sLineBreak + '--, c.FldId'
//+ sLineBreak + '  , c.FldArea                                              as FldAreaCad'
//+ sLineBreak + '  , c.FldAreaMfg                                           as FldAreaMfgCad'
//+ sLineBreak + '  , c.FldBay                                               as FldBayCad'
//+ sLineBreak + '  , c.FldType                                              as FldEntityType'
//+ sLineBreak + '--, c.FldEntity'
//+ sLineBreak + '  , c.FldType'
//+ sLineBreak + '  , c.FldDescription'
//+ sLineBreak + '  , c.FldVendor'
//+ sLineBreak + '  , c.FldModel'
//+ sLineBreak + '  , c.FldProcess'
//+ sLineBreak + '  , c.FldChamberCount'
//+ sLineBreak + '  , c.FldLayer'
//+ sLineBreak + '--, c.FldX                                                 as FldXCad'
//+ sLineBreak + '--, c.FldY                                                 as FldYCad'
//+ sLineBreak + '--, c.FldW'
//+ sLineBreak + '--, c.FldH'
//+ sLineBreak + '--, c.FldRot'
//+ sLineBreak + '--, c.FldX - @xmin                                         as FldXCad1Q'
//+ sLineBreak + '--, c.FldY - @ymin                                         as FldYCad1Q'
  //+ sLineBreak + '  , round(0 + @aww / @bww * (c.FldX - @xmin), 2) as FldXCanvas'
  //+ sLineBreak + '  , round(0 + @ahh / @bhh * (c.FldY - @ymin), 2) as FldYCanvas'
//+ sLineBreak + '--, @aww as FldCanvasW'
//+ sLineBreak + '--, @ahh as FldCanvasH'
//+ sLineBreak + '--, @bww as FldCadW'
//+ sLineBreak + '--, @bhh as FldCadH'
//+ sLineBreak + '  -- WORKSTATION'
//+ sLineBreak + '--, d.FldWorkstation'
//+ sLineBreak + '--, d.FldEquipment'
//+ sLineBreak + '  -- AREA (via workstation)'
//+ sLineBreak + '  , e.FldArea                                              as FldAreaF9'
//+ sLineBreak + '--, e.FldWorkstation'
//+ sLineBreak + '  -- FOUNDRYAREA'
//+ sLineBreak + '--, f.FldDepartment'
//+ sLineBreak + '--, f.FldArea'
//+ sLineBreak + '--, f.FldKind'
//+ sLineBreak + '--, f.FldDescription'
//+ sLineBreak + '--, f.FldSet0'
//+ sLineBreak + '--, f.FldArea1'
  + sLineBreak + '  , f.FldArea2'
  + sLineBreak + '  , f.FldArea3'
//+ sLineBreak + '--, f.FldAreaF9'
//+ sLineBreak + '--, f.FldAreaEyelit'
  + sLineBreak + '  , f.FldColorBg                                           as FldAreaColorBg'
//+ sLineBreak + '--, f.FldColorBg2'
//+ sLineBreak + '--, f.FldColorBg3'
  + sLineBreak + '  , f.FldColorFg                                           as FldAreaColorFg'
//+ sLineBreak + '--, f.FldOwner'
//+ sLineBreak + '    -- RUN'
//+ sLineBreak + '--, g.FldRun'
//+ sLineBreak + '--, g.FldEquipment'
//+ sLineBreak + '  , coalesce(g.FldState     , ''NOSTATE'')                 as FldChamberState'
//+ sLineBreak + '  , coalesce(h.FldSemi2     , ''NOSTATE'')                 as FldStateSemi'
//+ sLineBreak + '  , coalesce(h.FldStateColor, ''#E0E0E0'')                 as FldChamberStateColor'
//+ sLineBreak + '--, g.FldStateDateTime                                     as FldStateDateTime'
//+ sLineBreak + '--, g.FldMaterial                                          as FldMaterial'
//+ sLineBreak + '--, g.FldMaterialState                                     as FldMaterialState'
//+ sLineBreak + '--, g.FldMaterialStateDateTime                             as FldMaterialStateDateTime'
//+ sLineBreak + '--, g.FldDurationMinAvg                                    as FldDurationSecAvg'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaVfs.dbo.TblEquipment   a left join'
  + sLineBreak + '    DbaVfs.dbo.TblBay         b on (b.FldEquipment   = a.FldEquipment  ) left join'
  + sLineBreak + '    DbaVfs.dbo.TblLayout      c on (c.FldEntity      = a.FldEquipment  ) left join'
  + sLineBreak + '    DbaVfs.dbo.TblWorkstation d on (d.FldEquipment   = a.FldEquipment  ) left join'
  + sLineBreak + '    DbaVfs.dbo.TblArea        e on (e.FldWorkstation = d.FldWorkstation) left join'
  + sLineBreak + '    DbaFoundry.dbo.TblArea    f on (f.FldAreaF9      = e.FldArea       ) left join'
  + sLineBreak + '    DbaVfs.dbo.TblRun         g on (g.FldEquipment   = a.FldEquipment  ) left join'
  + sLineBreak + '    DbaEquipment.dbo.TblState h on (h.FldState2      = g.FldState      ) left join'
  + sLineBreak + '    DbaEquipment.dbo.TblState i on (i.FldState2      = a.FldState      )'
  + sLineBreak + 'where '
  + sLineBreak + '    c.FldType = ''Equipment''' // cadentitytype
  + sLineBreak + 'and %s' // wherearea
  + sLineBreak + 'and %s' // wherebaymes
  + sLineBreak + 'and %s' // wherebaycad
//+ sLineBreak + '    (b.FldBay like ''% s'' or rtrim(b.FldBay) = '''') -- FldBayMes'
//+ sLineBreak + 'and (c.FldBay like ''% s'' or rtrim(c.FldBay) = '''') -- FldBayCad'
  + sLineBreak + 'order by'
  + sLineBreak + '    1'
  , [scw, sch, arw, bmw, bcw]);
//FileSave('./vfs-equipments-sql.txt', sql);
  DstFromSql(sql, eds);
  eqz := eds.RecordCount;
  if eqz = 0 then begin
    Log('no equipments');
  //raise Exception.Create('no equipments, please manage this case');
  end;
    {$ENDREGION}

    {$REGION 'calc'}
  if IvOptionBoxesPerRow > 0 then
    gcz := IvOptionBoxesPerRow
  else
    gcz := ifthen(scw <= 1280+20, GRID_COLS_SCREEN_NARROW, GRID_COLS_SCREEN_WIDE);
//glz := eqz mod gcz;
//grz := eqz div gcz + ifthen(glz > 0, 1, 0);

  ewi := (scw - GRID_GAP_X_EXT - GRID_GAP_X_INT * (gcz - 1) - GRID_GAP_X_EXT) div gcz;
  ew2 := ewi / 2;

  gx0 := GRID_GAP_X_EXT + ew2;
  gy0 := GRID_GAP_Y_TOP + {eh2}0;
  gdx := ewi + GRID_GAP_X_INT;
//gdy := {ehe}0 + GRID_GAP_Y_INT;
    {$ENDREGION}

    {$REGION 'loop'}
  eix := -1;
  ehx := 0;
  jes := '';
  y := gy0;
  while not eds.Eof do begin
    // count
    Inc(eix);
    //if eix >= 14 then
      //break;

    // divmodfirst
    ind := eix div gcz; // intdiv
    inr := eix mod gcz; // intreminder
  //fst := ind = 0;
    fzo := ifthen(ind = 0, 0, 1);

    // data
    ena := eds.FieldByName('FldEquipment').AsString;
    ar2 := eds.FieldByName('FldArea2').AsString;
    abg := eds.FieldByName('FldAreaColorBg').AsString;
    afg := eds.FieldByName('FldAreaColorFg').AsString;
    est := eds.FieldByName('FldEquipmentState').AsString;
    esc := eds.FieldByName('FldEquipmentStateColor').AsString;
    eal := eds.FieldByName('FldAlarm').AsString;
    eno := eds.FieldByName('FldNote').AsString;

    // grid x
    x := gx0 + inr * gdx;

    // grid y
  //y := gy0 + ind * gdy;
    if inr = 0 then begin
      y := y + ehx + GRID_GAP_Y_INT * fzo;
      ehx := 0;
    end;

    // json
    jel := EquipmentShapeJson(x, y, ar2, abg, ena, est, esc, eal, eno, ewi, ehe);
    if jel.Trim.IsEmpty then
      raise Exception.Create('equipment json is empty')
    else begin
      jes := jes + ',' + jel;

      // equheightmax
      if ehe > ehx then
        ehx := ehe;
    end;

    // next
    eds.Next;
  end;
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'assy'}
  // resize
  IvLayoutHeight := round(y + ehx) + GRID_GAP_Y_BOT;
  jes :=             Format('{"type": "resize"'
                        //+ ', "layoutWidth": %d'
                          + ', "layoutHeight": %d'
                          + '}'
                          , [{IvLayoutWidth, }IvLayoutHeight])
  // equipmentsjson
  + jes;

  // image
  jes := jes + ',' + Format('{"type": "image"'
                          + ', "x": 12, "y": 12, "w": 24, "h": 24'
                          + ', "uri": "/Image/F/Foundry/FoundryArea%s_24X24.bmp"'
                          + '}', [StrOr(ar3, 'Noa')]);
  // title
  tit := Format('%d equipments', [eqz]);
  if IvBayMes <> '*' then tit := IvBayMes + '  -  ' + tit;
  if IvBayCad <> '*' then tit := IvBayCad + '  -  ' + tit;
  if IvArea3  <> '*' then tit := IvArea3  + '  -  ' + tit;
  jes := jes + ',' + Format('{"type": "text"'
                          + ', "x": 40, "y": 4'
                          + ', "text": "%s", "font": "bold 20px arial"'
                          + ', "textFillStyle": "%s"'
                          + ', "textBaseline": "top", "textAlign": "left"'
                          + '}', [tit, abg]);
  {$ENDREGION}

  {$REGION 'end'}
//Delete(jel, 1, 1);
//FileSave('./vfs-equipments-json.txt', jes);
  Result := Format('[%s]', [jes]);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Zzz'}
(*
function TMainForm.ViewShapeListJson(IvArea3, IvBayMes, IvView: string; IvLayoutWidth, IvLayoutHeight: integer): string;

  {$REGION 'const'}
const
  EQUIPMENT_SQL1 ='declare @xmin float, @xmax float, @ymin float, @ymax float'
  + sLineBreak + 'select @xmin = min(FldX), @xmax = max(FldX), @ymin = min(FldY), @ymax = max(FldY) from DbaVfs.dbo.TblLayout'
  + sLineBreak + 'declare @aww float = %d, @ahh float = %d'                                 // scene
  + sLineBreak + 'declare @bww float = abs(@xmax - @xmin), @bhh float = abs(@ymax - @ymin)' // cad
  + sLineBreak + 'select'
//+ sLineBreak + '--  a.FldId'
  + sLineBreak + '    a.FldArea'
//+ sLineBreak + '--, a.FldAreaMfg'
//+ sLineBreak + '--, a.FldBay'
  + sLineBreak + '  , a.FldEntity'
//+ sLineBreak + '--, a.FldType'
//+ sLineBreak + '--, a.FldDescription'
//+ sLineBreak + '--, a.FldVendor'
//+ sLineBreak + '--, a.FldModel'
//+ sLineBreak + '--, a.FldProcess'
//+ sLineBreak + '--, a.FldChamberCount'
//+ sLineBreak + '--, a.FldLayer'
//+ sLineBreak + '  , @bww as FldBWw'
//+ sLineBreak + '  , @bhh as FldBHh'
//+ sLineBreak + '  , a.FldX'
//+ sLineBreak + '  , a.FldY'
//+ sLineBreak + '  , a.FldX - @xmin as FldX2'
//+ sLineBreak + '  , a.FldY - @ymin as FldY2'
  + sLineBreak + '  , round(20 + @aww / @bww * (a.FldX - @xmin), 2) as FldX'
  + sLineBreak + '  , round(40 + %d - @ahh / @bhh * (a.FldY - @ymin), 2) as FldY'
//+ sLineBreak + '  , round(40 + @ahh / @bhh * (a.FldY - @ymax), 2) as FldY'
//+ sLineBreak + '--, a.FldW'
//+ sLineBreak + '--, a.FldH'
//+ sLineBreak + '--, a.FldRot'
//+ sLineBreak + '--, b.FldState as FldStateAuto' // automationstate [T | F]
//+ sLineBreak + '  , iif(charindex(CHAR(7), b.FldAlarm) > 0, ''!'', b.FldAlarm) as FldAlarm'
  + sLineBreak + '  , case'
  + sLineBreak + '    when charindex(''alarm'', b.FldAlarm) > 0 then b.FldAlarm'
  + sLineBreak + '    when charindex(''fault'', b.FldAlarm) > 0 then b.FldAlarm'
  + sLineBreak + '    when charindex(''error'', b.FldAlarm) > 0 then b.FldAlarm'
  + sLineBreak + '    else null end as FldAlarm'
//+ sLineBreak + '  , iif(b.FldAlarm <> '''', ''true'', ''false'') as FldAlarmed'
  + sLineBreak + '  , c.FldState'
  + sLineBreak + '  , d.FldColorBg as FldAreaColor'
  + sLineBreak + '  , d.FldColorBg as FldAreaColorBg'
  + sLineBreak + '  , coalesce(e.FldStateColor, '''') as FldStateColor'
//+ sLineBreak + '  , iif(b.FldAlarm <> '''', ''crimson'', '''') as FldAlarmColor'
  + sLineBreak + 'from'                                  // limegreen
  + sLineBreak + '    DbaVfs.dbo.TblLayout      a left join'
  + sLineBreak + '    DbaVfs.dbo.TblEquipment   b on (b.FldEquipment = a.FldEntity) left join'
  + sLineBreak + '    DbaVfs.dbo.TblRun         c on (c.FldEquipment = a.FldEntity) left join'
  + sLineBreak + '    DbaFoundry.dbo.TblArea    d on (d.FldArea3     = a.FldArea  ) left join'
  + sLineBreak + '    DbaEquipment.dbo.TblState e on (e.FldState2    = c.FldState )'
  + sLineBreak + 'where'
//+ sLineBreak + '    a.FldArea != ''Mfg'''
  + sLineBreak + '    %s'
  + sLineBreak + 'and a.FldType = ''Equipment'''
//+ sLineBreak + 'and a.FldChamberCount > 0'
//+ sLineBreak + 'order by'
//+ sLineBreak + '    a.FldEntity'
  ;
  EQUIPMENT_SQL ='select distinct'
  + sLineBreak + '  -- BAY'
  + sLineBreak + '    a.FldBay'
  + sLineBreak + '  -- EQUIPMENT'
  + sLineBreak + '  , rtrim(b.FldEquipment)                  as FldEquipment'
  + sLineBreak + '  , b.FldDescription'
  + sLineBreak + '  , b.FldState                             as FldStateAutomation'
  + sLineBreak + '  , b.FldStateDateTime'
  + sLineBreak + '  , b.FldAlarm'
  + sLineBreak + '--, b.FldNote'
  + sLineBreak + '  -- WORKSTATION'
  + sLineBreak + '  , c.FldWorkstation'
  + sLineBreak + '  -- AREA'
  + sLineBreak + '  , d.FldArea'
  + sLineBreak + '  , i.FldArea2'
  + sLineBreak + '  , i.FldColorBg                           as FldAreaColorBg'
  + sLineBreak + '  , i.FldColorFg                           as FldAreaColorFg'
  + sLineBreak + '  -- RUN'
  + sLineBreak + '--, g.FldRun'
  + sLineBreak + '  , coalesce(g.FldState     , ''NOSTATE'') as FldState'
  + sLineBreak + '  , coalesce(l.FldSemi2     , ''NOSTATE'') as FldStateSemi'
  + sLineBreak + '  , coalesce(l.FldStateColor, ''#E0E0E0'') as FldStateColor'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaVfs.dbo.TblBay         a inner join'
  + sLineBreak + '    DbaVfs.dbo.TblEquipment   b on (b.FldEquipment   = a.FldEquipment  ) inner join'
  + sLineBreak + '    DbaVfs.dbo.TblWorkstation c on (c.FldEquipment   = b.FldEquipment  ) inner join'
  + sLineBreak + '    DbaVfs.dbo.TblArea        d on (d.FldWorkstation = c.FldWorkstation) left join'
  + sLineBreak + '    DbaVfs.dbo.TblRun         g on (g.FldEquipment   = a.FldEquipment  ) left join'
  + sLineBreak + '    DbaFoundry.dbo.TblArea    i on (i.FldAreaF9      = d.FldArea       ) left join'
  + sLineBreak + '    DbaEquipment.dbo.TblState l on (l.FldState2      = g.FldState      )'
  + sLineBreak + 'where'
  + sLineBreak + '    a.FldBay = ''%s'''
  + sLineBreak + 'order by'
  + sLineBreak + '    FldEquipment'
  ;
  EQUIPMENT_LINE_WIDTH = 2;

  CHAMBER_SQL  = 'with TblChamberState as ('
  + sLineBreak + '      select ''COMMITTED'' as FldChamberState, ''DodgerBlue'' as FldColor' // chamber
  + sLineBreak + 'union select ''RUNNING''                     , ''LimeGreen'''              // chamber
  + sLineBreak + 'union select ''PROCESSED''                   , ''Green'''                  // material NOP, should be FREE
  + sLineBreak + ')'
  + sLineBreak + '--select * from TblChamberState'
  + sLineBreak + ''
  + sLineBreak + 'select'
  + sLineBreak + '  -- CHAMBER'
  + sLineBreak + '    e.FldEquipment'
  + sLineBreak + '  , e.FldChamber'
  + sLineBreak + '  -- RUN'
  + sLineBreak + '--, g.FldRun'
  + sLineBreak + '--, g.FldEquipment'
  + sLineBreak + '--, coalesce(g.FldState        , ''UNKNOWN'')               as FldState'
  + sLineBreak + '--, g.FldStateDateTime'
  + sLineBreak + '  , coalesce(g.FldMaterial     , ''NOLOT'')                 as FldMaterial'
  + sLineBreak + '  , coalesce(g.FldMaterialState, ''NOLOT'')                 as FldChamberState'
  + sLineBreak + '  , datediff(second, g.FldMaterialStateDateTime, getdate()) as FldRunMin'
  + sLineBreak + '  , abs(g.FldDurationMinAvg)                                as FldRunMinAvg'
  + sLineBreak + '  , round(convert(float, datediff(minute, g.FldMaterialStateDateTime, getdate())) / abs(g.FldDurationMinAvg) * 100, 2) as FldProgressPerc'
  + sLineBreak + '  , coalesce(u.FldColorBg, ''#FFC107'')                     as FldChamberStateColorBg'
  + sLineBreak + '  , coalesce(u.FldColorFg, ''Black'')                       as FldChamberStateColorFg'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaVfs.dbo.TblChamber      e                                             left join'
  + sLineBreak + '    DbaVfs.dbo.TblRun          g on (g.FldEquipment    = e.FldEquipment    ) left join'
//+ sLineBreak + '    TblChamberState            u on (u.FldChamberState = g.FldMaterialState)'
  + sLineBreak + '    DbaSystem.dbo.TblColorCode u on (u.FldColorCode    = g.FldMaterialState)'
  + sLineBreak + 'where'
  + sLineBreak + '    e.FldEquipment = ''%s'''
  + sLineBreak + 'order by'
  + sLineBreak + '    e.FldChamber'
  + sLineBreak + '  , g.FldMaterial'
  ;
  CHAMBER_HEIGHT = 22;

  LOADER_SQL   = 'select'
  + sLineBreak + '    FldEquipment'
  + sLineBreak + '  , FldLoader'
  + sLineBreak + '  , coalesce(upper(FldMaterial), ''NOLOT'')                             as FldMaterial'
//+ sLineBreak + '  , case when FldMaterial is null then ''UNLOADED'' else ''LOADED'' end as FldState'
  + sLineBreak + '  , abs(len(replace(FldMaterial, '','', '''')) - len(FldMaterial)) + 1  as FldTot'
  + sLineBreak + '  , abs(len(replace(FldMaterial, ''W'', '''')) - len(FldMaterial))      as FldTotW'
  + sLineBreak + 'from'
  + sLineBreak + '    DbaVfs.dbo.TblLoader'
  + sLineBreak + 'where'
  + sLineBreak + '    FldEquipment = ''%s'''
  + sLineBreak + 'order by'
  + sLineBreak + '    2'
  ;
  LOADER_HEIGHT = 44;

  GRID_COLS        = 6;
  GRID_GAP_X_EXT   = EQUIPMENT_LINE_WIDTH; // = a
  GRID_GAP_X_INT   = 25;                   // = b
  GRID_GAP_Y       = 50;                   // = c
  {$ENDREGION}

  {$REGION 'var'}
var
  // spare
  txt: string;       // text
  tem: double;       // temperature
  hmd: string;       // heatmapdata
  // sql
  saf: string;       // whereareafilter
  // grid
  gcz, grz: integer; // colscount, rowscount
  gx0, gy0, gdx, gdy, x, y, ymx: integer;
  // scene
  scw: integer;      // width
  sch: integer;      // height
  // view
//vif: string;       // colorfg
  vie: string;       // view
  // area
  ar2: string;       // area2
  ar3: string;       // area3
  abg: string;       // bgcolor
//arz: integer;      // count
  // bay
  bay: string;       // bay mes
  // entity (equipments or others components like temperature meters)
//eds: TDataset;     // ds
  enz: integer;      // count
//ena: string;       // name
  // equip
  eix: integer;      // index
  eds: TDataset;     // ds
  eqz: integer;      // count
  ezz: integer;      // last row count
  ewi, ew2: integer; // width
  ehe, eh2: integer; // height
  ena: string;       // name
  eac: string;       // areabgcolor
  est: string;       // state
  ess: string;       // state semi
  esc: string;       // state color
  eal: string;       // alarm
  // chamber
  cix: integer;      // index
  cds: TDataset;     // ds
  cna: string;       // name
  cma: string;       // material (wafer)
  cst: string;       // state<-materialstate
  cra: integer;      // rundurationminutesaverage
  crm: integer;      // runminutes
  cpp: string;       // progresspercent
  cbg: string;       // colorbg
  cfg: string;       // colorfg
  cpr: string;       // print
  cwi: integer;      // width
  che: integer;      // height
  // loader
  lix: integer;      // index
  lds: TDataset;     // ds
  lna: string;       // name
  lma: string;       // material (lot+Wlot)
  lmz: integer;      // material (lot+Wlot) count
//llz: integer;      // material (lot) count
//lwz: integer;      // material (Wlot) count
//lst: string;       // state
  lpr: string;       // print
//lpw: string;       // print width (impossible, client is able to do that bue can be evaluated via bmp.canvas)
  lbc: TBoxColorRec; // boxcolors
  loz: integer;      // count
  lwi, lw2: integer; // width
  // jsondata
  jel: string;       // elements
  {$ENDREGION}

  {$REGION 'help'}
  {
    view-layout
     ---------------------------------------------------------------------------
    |                                                                           |
    |                                                                           |
    |                                                                           |
    |                                                                           |
    |                        -------                                            |
    |                       |       |                                           |
    |                       |  x,y  |                                           |
    |                       |       |                                           |
    |                        -------                                            |
sch |                                                                           |
    |                                                                           |
    |                                                                           |
    |                                                                           |
    |                                                                           |
    |                                                                           |
    |                                                                           |
    |                                                                           |
    |                                                                           |
    |                                                                           |
     ---------------------------------------------------------------------------
                                       scw

    view-schematic
     ---------------------------------------------------------------------------
    |          c                                                                |
    |    -------------     -------------     -------------     -------------    |
    |   |            1|   |            2|   |            3|   |            4|   |
    | a |      +      | b |      +      | b |      +      | b |      +      | a |
    |   |   (x0,y0)   |   |    (x,y)    |   |             |   |             |   |
    |    -------------     -------------     -------------     -------------    |
    |          c                                                                |
    |    -------------     -------------     -------------     -------------    |
    |   |            5|   |            6|   |            7|   |            8|   |
sch | a |      +      | b |      +      | b |      +      | b |      +      | a |
    |   |             |   |             |   |             |   |             |   |
    |    -------------     -------------     -------------     -------------    |
    |          c               ewi                                              |
    |    -------------                                                          |
    |   |            9|                                                         |
    |   |      +      | ehe                                                     |
    |   |             |                                                         |
    |    -------------                                                          |
    |          c                                                                |
     ---------------------------------------------------------------------------
                                       scw
  }
  {$ENDREGION}

begin

  {$REGION 'zip'}
  ar3 := IvArea3;
  bay := IvBayMes;
  vie := IvView{.Substring(2)}; // remove 1st 2 chars (EquipmentStateView -> EquipmentState)
  scw := IvLayoutWidth;
  sch := IvLayoutHeight;
//crf := '#fff';
  ymx := -1;
  {$ENDREGION}

  {$REGION 'ds'}
  if bay.IsEmpty then begin
    if Trim(ar3) = ' ' then // #C2A0
      saf := SqlFilter('a.FldArea', '^ MGF')
    else
      saf := SqlFilter('a.FldArea', ar3);
    VfsFDConnection.ExecSql(Format(EQUIPMENT_SQL1, [scw, sch, sch, saf]), eds);
  end else begin
    VfsFDConnection.ExecSql(Format(EQUIPMENT_SQL, [bay]), eds);
  end;
  eqz := eds.RecordCount;
//arz := 0;
  tem := 0.0;
  abg := StrOr(eds.FieldByName('FldAreaColorBg').AsString, 'white');

  // lflogo
  if not bay.IsEmpty then
  jel :=                Format('{"type": "image"'
                             + ', "x": 12, "y": 12, "w": 24, "h": 24'
                             + ', "uri": "/Image/F/Foundry/FoundryArea%s_24X24.bmp"'
                             + '}', [StrOr(ar3, 'Noa')])
  else
  jel :=                Format('{"type": "image"'
                             + ', "x": 16, "y": 16, "w": 24, "h": 24'
                             + ', "uri": "/Organization/F/Foundry/FoundryLogo_48x48.png"}'
                             , []);
  // title
  if not bay.IsEmpty then
  jel := jel + ', '   + Format('{"type": "text"'
                             + ', "x": 40, "y": 4'
                             + ', "text": "%s - %d equipments", "font": "bold 20px arial"'
                             + ', "textFillStyle": "%s"'
                             + ', "textBaseline": "top", "textAlign": "left"'
                             + '}', [bay, eqz, abg])
  else
  jel := jel + ', '   + Format('{"type": "text"'
                             + ', "x": 40, "y": 8'
                             + ', "text": "C/R %s  -  %d entities", "font": "bold 20px arial"'
                             + ', "textFillStyle": "%s"'
                             + ', "textBaseline": "top", "textAlign": "left"}'
                             , [StrExpand(vie){, arz}, enz, COLOR_WHITE]);
  // outline
  if bay.IsEmpty then
  jel := jel + ', '   + Format('{"type": "box"'
                             + ', "x": %f, "y": %f, "w": %d, "h": %d' // , "rot": 30, "radii": 10
                             + ', "fillStyle": "%s", "lineStyle": "%s", "lineWidth": %d'
                           //+ ', "text": "%s", "font": "16px arial"'
                           //+ ', "textFillStyle": "%s", "textLineStyle": "%s", "textLineWidth": %d'
                           //+ ', "textBaseline": "middle", "textAlign": "center"'
                           //+ ', "textXPerc": %2f , "textYPerc": %2f'
                             + '}', [scw / 2, sch / 2, scw, sch
                                  , null, COLOR_WHITE, 1]);
  {$ENDREGION}

  {$REGION 'empty'}
  if eqz = 0 then begin
    Log('no equipments');
  {$ENDREGION}

  {$REGION 'records'}
  end else begin

    {$REGION 'one'}
    if bay.IsEmpty then begin
      // entities
      while not eds.Eof  do begin
        // entity
        ena := eds.FieldByName('FldEntity').AsString;

        // views
                 if SameText('ViewEquipmentName', vie) then begin
          txt := eds.FieldByName('FldEntity').AsString;
          cbg := '';
          cfg := 'white';

        end else if SameText('ViewEquipmentState', vie) then begin
          txt := eds.FieldByName('FldState').AsString;
          cbg := eds.FieldByName('FldStateColor').AsString;
          cfg := 'white';

        end else if SameText('ViewEquipmentAlarm', vie) then begin
          txt := eds.FieldByName('FldAlarm').AsString;
          StrClean(txt);
        //cbg := eds.FieldByName('FldAlarmColor').AsString;
          cbg := ifthen(txt.IsEmpty, '', 'crimson');
          cfg := 'white';

        end else if SameText('ViewEquipmentTemperature', vie) then begin
          Randomize;
          tem := RandomRange(1800, 2700) / 100;
          txt := ''; //Format('%f°', [tem]);
          cbg := ''; //ColToHtml(ColFromTemp(tem));
        //cfg := ColToHtml(ColContrast(ColColor(cbg)));

        end else if SameText('ViewChemicalConsumption', vie) then begin
          txt := 'CH';
          cbg := '';
          cfg := 'white';

        end else if SameText('ViewEnergyConsumption', vie) then begin
          txt := 'EN';
          cbg := '';
          cfg := 'white';

        end else if SameText('ViewRoomTemperature', vie) then begin
          txt := 'TE';
          cbg := '';
          cfg := 'white';

        end else begin
          txt := '?';
          cbg := '';
          cfg := COLOR_WHITE;
        end;

        // entity
        jel := jel + ', ' + Format('{"type": "box"'
                                 + ', "x": %f, "y": %f, "w": %d, "h": %d' // , "rot": 30, "radii": 10
                                 + ', "fillStyle": "%s", "fillGap": 3, "lineStyle": "%s", "lineWidth": %d'
                                 + ', "text": "%s", "font": "9px arial", "textRot": -40'
                                 + ', "textFillStyle": "%s"' //, "textLineStyle": "%s", "textLineWidth": %d
                               //+ ', "textBaseline": "middle", "textAlign": "center"'
                               //+ ', "textXPerc": %2f , "textYPerc": %2f'
                                 + '}', [eds.FieldByName('FldX').AsFloat, eds.FieldByName('FldY').AsFloat, 22, 22
                                      , cbg, eds.FieldByName('FldAreaColor').AsString, 2
                                      , txt
                                      , cfg]);
        // temperature
        hmd := hmd + ', ' + Format('[%f,%f,%f]', [eds.FieldByName('FldX').AsFloat, eds.FieldByName('FldY').AsFloat
                                      , tem]);
        eds.Next;
      end;
    {$ENDREGION}

    {$REGION 'two'}
    end else begin
      // zip
      gcz := ifthen(scw <= 1280, 4, GRID_COLS);
      ezz := eqz mod gcz;
      grz := eqz div gcz + ifthen(ezz > 0, 1, 0);
      ewi := (scw - GRID_GAP_X_EXT - GRID_GAP_X_INT * (gcz - 1) - GRID_GAP_X_EXT) div gcz;
      ew2 := ewi div 2;
      ehe := (sch - GRID_GAP_Y * (grz + 1)) div grz; if ehe > ewi then ehe := ewi;
      eh2 := ehe div 2;
      gx0 := GRID_GAP_X_EXT + ew2;
      gy0 := GRID_GAP_Y + ehe div 2;
      gdx := ewi + GRID_GAP_X_INT;
      gdy := ehe + GRID_GAP_Y;
      eix := -1;

      // loop
      while not eds.Eof do begin
        Inc(eix);

        // grid
        x := gx0 + (eix mod gcz) * gdx;
        y := gy0 + (eix div gcz) * gdy + 25;

        // ymax
        if y > ymx then
          ymx := y;

        {$REGION 'equipment'}
        ar2 := eds.FieldByName('FldArea2').AsString;
        eac := eds.FieldByName('FldAreaColorBg').AsString;
        ena := eds.FieldByName('FldEquipment').AsString;
        est := eds.FieldByName('FldState').AsString;
        ess := eds.FieldByName('FldStateSemi').AsString;
        esc := eds.FieldByName('FldStateColor').AsString;
        eal := eds.FieldByName('FldAlarm').AsString;

        // areaflag
        jel := jel + ', ' + Format('{"type": "image"'
                                 + ', "x": %d, "y": %d, "w": 16, "h": 16'
                                 + ', "uri": "/Image/F/Foundry/FoundryArea%s_16X16.bmp"'
                                 + '}', [x - ew2 + 7, y - ehe div 2 - 7   , ar2]);
        // frame
        jel := jel + ', ' + Format('{"type": "box"'
                                 + ', "x": %d, "y": %d, "w": %d, "h": %d' // , rot: 30, radii: 10
                                 + ', "fillStyle": "%s", "lineStyle": "%s", "lineWidth": %d'
                                 + ', "text": "%s", "font": "16px arial"'
                                 + ', "textFillStyle": "%s", "textLineStyle": "%s", "textLineWidth": %d'
                               //+ ', textBaseline: 'middle', textAlign: 'center''
                                 + ', "textXPerc": %2f , "textYPerc": %2f'
                                 + '}', [x, y, ewi, ehe   , null, eac, 2   , ena   , eac, eac, 1   , 0.0, -1.07]);
        // state
        jel := jel + ', ' + Format('{"type": "box"'
                                 + ', "x": %d, "y": %d, "w": %d, "h": %d'
                                 + ', "fillStyle": "%s", "lineStyle": "%s", "lineWidth": %d'
                                 + ', "text": "%s", "font": "16px arial"'
                                 + '}', [x, y - ehe div 2 + 4 + 22 div 2, ewi - 4 - 4, 22   , esc, esc, 2   , est]);
          {$REGION 'alarms'}
          // ...
          {$ENDREGION}

          {$REGION 'nextlots'}
          // ...
          {$ENDREGION}

        {$ENDREGION}

        {$REGION 'chambers'}
        VfsFDConnection.ExecSQL(Format(CHAMBER_SQL, [ena]), cds);
        cix := -1;
        while not cds.Eof do begin
          Inc(cix);

          {$REGION 'chamber'}
          cna := cds.FieldByName('FldChamber').AsString;
          cma := cds.FieldByName('FldMaterial').AsString;
          cst := cds.FieldByName('FldChamberState').AsString;
          crm := cds.FieldByName('FldRunMin').AsInteger;
          cra := cds.FieldByName('FldRunMinAvg').AsInteger;
          cbg := cds.FieldByName('FldChamberStateColorBg').AsString;
          cfg := cds.FieldByName('FldChamberStateColorFg').AsString;

          if cra = 0 then
            cpp := '?'
          else
          //cpp := Format('%.2f', [crm / cra * 100]);
          //cpp := Format('%.0f', [crm / cra * 100]);
            cpp := Format('%d sec to end', [cra - crm]);

          if sameText('RUNNING', cst) then
          //cpr := Format('%s : %s : %s', [cna, cma, cst])
          //cpr := Format('%s : %s (%s%%)', [cna, cst, cpp])
            cpr := Format('%s : %s (%s)', [cna, cst, cpp])
          else
            cpr := Format('%s : %s', [cna, cst]);

          jel := jel + ', ' + Format('{"type": "box"'
                                 + ', "x": %d, "y": %d, "w": %d, "h": %d'
                                 + ', "fillStyle": "%s", "lineStyle": "%s", "lineWidth": %d'
                                 + ', "text": "%s", "font": "12px arial"'
                                 + ', "textFillStyle": "%s" , "textLineStyle": "%s", "textLineWidth": %d'
                                 + ', "textAlign": "left"'      // left, (center), right
                               //+ ', "textBaseline": "middle"' // top, bottom, (middle), alphabetic, hanging
                                 + ', "textXPerc": -0.95'       // (0)
                               //+ ', "textYPerc": -1'          // (0)
                                 + '}', [x, y - ehe div 2 + 4 + CHAMBER_HEIGHT div 2 + 4*2 + (2+20)*(1+cix), ewi - 4*2 - 4*2, 20
                                      , cbg, cbg, 0
                                      , cpr
                                      , cfg, '', 0]);
    //      jel := jel + ', ' + Format('{"type": "progress"'
    //                             + ', "x": %d, "y": %d, "w": %d, "h": %d'
    //                             + ', "perc": %s, "color1": "%s", "color2": "%s"'
    //                             + '}', [0, 0, 100, 10, cpp, 'green', 'red']);
          {$ENDREGION}

          // next
          cds.Next;
        end;
        {$ENDREGION}

        {$REGION 'loaders'}
        VfsFDConnection.ExecSQL(Format(LOADER_SQL, [ena, ena]), lds);
        loz := lds.RecordCount;
        lwi := ifthen(loz = 0, ewi, ewi div loz);
        lw2 := lwi div 2;
        lix := -1;
        while not lds.Eof do begin
          Inc(lix);

          {$REGION 'loader'}
          lna := lds.FieldByName('FldLoader').AsString;
          lma := lds.FieldByName('FldMaterial').AsString;
          lmz := lds.FieldByName('FldTot').AsInteger;
        //lwz := lds.FieldByName('FldTotW').AsInteger;
        //lst := lds.FieldByName('FldState').AsString;

        //llz := lmz - lwz;
          if lmz > 1 then
            lma := Format('%d LOTS', [lmz]);
          lma := lma.Replace('0 LOTS', 'NOLOT');

          if SameText('NOLOT', lma) then
            lbc := COLOR_WARNING
          else
            lbc := COLOR_SUCCESS;

          if 2 < loz then
            lpr := Format('L%s', [lna])
          else
            lpr := Format('L%s : %s', [lna, lma]);

          jel := jel + ', ' + Format('{"type": "box"'
                                 + ', "x": %f'
                                 + ', "y": %d'
                                 + ', "w": %d'
                                 + ', "h": %d'
                                 + ', "fillStyle": "%s", "lineStyle": "%s", "lineWidth": %d'
                                 + ', "text": "%s", "font": "14px arial"'
                                 + ', "textFillStyle": "%s", "textLineStyle": "%s", "textLineWidth": %d'
                               //+ ', "textAlign": "left"'
                               //+ ', "textBaseline": "middle"'
                               //+ ', "textXPerc": -0.95'
                               //+ ', "textYPerc": -1'
                                 + '}',[x - ew2 + 0.5 + lw2 + lwi * lix
                                      , y + ehe div 2 - 2 - LOADER_HEIGHT div 2
                                      , lwi - 1 * 2
                                      , LOADER_HEIGHT
                                      , lbc.BgColor, lbc.BgColor, 0
                                      , lpr
                                      , lbc.FgColor, '', 0]);
          {$ENDREGION}

          // next
          lds.Next;
        end;
        {$ENDREGION}

        // next
        eds.Next;
      end;
    end;
    {$ENDREGION}

    {$REGION 'post'}
    // temperature
    if SameText('ViewEquipmentTemperature', vie) then begin
      Delete(hmd, 1, 2);
      jel := jel + ', ' + Format('{"type": "heatmap"'
                               + ', "data": [%s]'
                               + ', "radius": 10'
                               + ', "blur": 16'
                               + ', "alphaMin": 0.05'
                               + '}', [hmd]);
    end;
    {$ENDREGION}

  end;
  {$ENDREGION}

  {$REGION 'canvassize'}
  jel :=                Format('{"type": "resize"'
                           //+ ', "layoutWidth": %d'
                             + ', "layoutHeight": %d'
                             + '}'
                             , [{scw,} {sch}ymx+eh2])
   + ', ' + jel;
  {$ENDREGION}

  {$REGION 'end'}
  //Delete(jel, 1, 2);
  Result := Format('[%s]', [jel]);
  {$ENDREGION}

end;
*)
{$ENDREGION}

{$REGION 'Zzz'}
(*
            if TJSONObject(jva).GetValue('view') = nil then
              cvi := PClientDataRec(IvConn.CustomRec).View
            else
              cvi := jva.GetValue<string>('view');

function  TMainForm.AreaJsonStrFromDba: string;
var
  tbl: TFDMemTable;
  mem: TMemoryStream;
begin
  // query
  FDQuery.Disconnect(true);
  FDQuery.SQL.Text := 'select FldArea3 as area3, FldAreaF9 as areaF9 from DbaOrganization.dbo.TblArea where FldAreaF9 is not null';
  FDQuery.Open;
  FDQuery.BeginBatch; // don't update external references until EndBatch;

  // stream
  tbl := TFDMemTable.Create(nil);
  mem := TMemoryStream.Create;
  tbl.CloneCursor(FDQuery, true, true);
  try
    tbl.SaveToStream(mem, sfJSON);
  //SetString(Result, PChar(mem.Memory), mem.Size div SizeOf(char)); // memtostr
    SetString(Result, PAnsiChar(mem.Memory), mem.Size);
  finally
    tbl.Close;
    mem.free;
    tbl.free;
  end;

  // query
  FDQuery.EndBatch;
  FDQuery.Close;
end;
*)
{$ENDREGION}

initialization
  ReportMemoryLeaksOnShutDown := true;

end.
