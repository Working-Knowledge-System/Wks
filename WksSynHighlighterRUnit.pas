unit WksSynHighlighterRUnit;

{.$I SynEdit.inc}

interface

{$REGION 'Use'}
uses
    Classes
  , SysUtils
  , Graphics
  , SynEditTypes
  , SynEditHighlighter
//, SynUnicode
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TtkTokenKind = (
    tkComment
  , tkIdentifier
  , tkKey
  , tkNull
  , tkSpace
  , tkString
  , tkSymbol
  , tkTest
  , tkUnknown
  );

  TRangeState = (rsUnKnown, rsBraceComment, rsCStyleComment, rsString);

  TProcTableProc = procedure of object;

  PIdentFuncTableFunc = ^TIdentFuncTableFunc;

  TIdentFuncTableFunc = function (Index: Integer): TtkTokenKind of object;

  TSynRSyn = class(TSynCustomHighlighter)
  private
    FRange: TRangeState;
    FTokenID: TtkTokenKind;
    FIdentFuncTable: array[0..2] of TIdentFuncTableFunc;
    FCommentAttri: TSynHighlighterAttributes;
    FIdentifierAttri: TSynHighlighterAttributes;
    FKeyAttri: TSynHighlighterAttributes;
    FSpaceAttri: TSynHighlighterAttributes;
    FStringAttri: TSynHighlighterAttributes;
    FTestAttri: TSynHighlighterAttributes;
    function  HashKey(Str: PWideChar): Cardinal;
    function  FuncHello(Index: Integer): TtkTokenKind;
    function  FuncSynedit(Index: Integer): TtkTokenKind;
    function  FuncWorld(Index: Integer): TtkTokenKind;
    procedure InitIdent;
    function  IdentKind(MayBe: PWideChar): TtkTokenKind;
    procedure IdentifierProc;
    procedure UnknownProc;
    function  AltFunc(Index: Integer): TtkTokenKind;
    procedure NullProc;
    procedure SpaceProc;
    procedure CRProc;
    procedure LFProc;
  //procedure CommentProc;           // #
    procedure BraceCommentOpenProc;  // {
    procedure BraceCommentProc;      // }
    procedure CStyleCommentOpenProc; // /*
    procedure CStyleCommentProc;     // */
    procedure StringOpenProc;
    procedure StringProc;
  protected
    function GetSampleSource: UnicodeString; override;
    function IsFilterStored: boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    class function GetFriendlyLanguageName: UnicodeString; override;
    class function GetLanguageName: string; override;
    function  GetRange: Pointer; override;
    procedure ResetRange; override;
    procedure SetRange(Value: Pointer); override;
    function  GetDefaultAttribute(Index: Integer): TSynHighlighterAttributes; override;
    function  GetEol: boolean; override;
    function  GetKeyWords(TokenKind: Integer): UnicodeString; override;
    function  GetTokenID: TtkTokenKind;
    function  GetTokenAttribute: TSynHighlighterAttributes; override;
    function  GetTokenKind: Integer; override;
    function  IsIdentChar(AChar: WideChar): boolean; override;
    procedure Next; override;
  published
    property CommentAttri   : TSynHighlighterAttributes read FCommentAttri    write FCommentAttri;
    property IdentifierAttri: TSynHighlighterAttributes read FIdentifierAttri write FIdentifierAttri;
    property KeyAttri       : TSynHighlighterAttributes read FKeyAttri        write FKeyAttri;
    property SpaceAttri     : TSynHighlighterAttributes read FSpaceAttri      write FSpaceAttri;
    property StringAttri    : TSynHighlighterAttributes read FStringAttri     write FStringAttri;
    property TestAttri      : TSynHighlighterAttributes read FTestAttri       write FTestAttri;
  end;
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
  SynEditStrConst;

resourcestring
  SYNS_FilterTest       = 'All files (*.*)|*.*';
  SYNS_LangTest         = 'R lang';
  SYNS_FriendlyLangTest = 'R';
  SYNS_AttrTest         = 'Test';
  SYNS_FriendlyAttrTest = 'Test';
{$ENDREGION}

{$REGION 'Const'}
const
  // as this language is case-insensitive keywords *must* be in lowercase
  KeyWords: array[0..18] of UnicodeString = (
    'if'
  , 'else'
  , 'while'
  , 'repeat'
  , 'for'
  , 'function'
  , 'in'
  , 'next'
  , 'break'
  , 'TRUE'
  , 'FALSE'
  , 'NULL'
  , 'Inf'
  , 'NaN'
  , 'NA'
  , 'NA_integer'
  , 'NA_real'
  , 'NA_complex_'
  , 'NA_character_'
  );

  KeyIndices: array[0..2] of integer = (
    0, 2, 1
  );
{$ENDREGION}

{$REGION 'TSynRSyn'}
constructor TSynRSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FCaseSensitive           := false;

  FCommentAttri            := TSynHighLighterAttributes.Create(SYNS_AttrComment, SYNS_FriendlyAttrComment);
  FCommentAttri.Style      := [fsItalic];
  FCommentAttri.Foreground := clNavy;
  AddAttribute(FCommentAttri);

  FIdentifierAttri         := TSynHighLighterAttributes.Create(SYNS_AttrIdentifier, SYNS_FriendlyAttrIdentifier);
  AddAttribute(FIdentifierAttri);

  FKeyAttri                := TSynHighLighterAttributes.Create(SYNS_AttrReservedWord, SYNS_FriendlyAttrReservedWord);
  FKeyAttri.Style          := [fsBold];
  AddAttribute(FKeyAttri);

  FSpaceAttri              := TSynHighLighterAttributes.Create(SYNS_AttrSpace, SYNS_FriendlyAttrSpace);
  AddAttribute(FSpaceAttri);

  FStringAttri             := TSynHighLighterAttributes.Create(SYNS_AttrString, SYNS_FriendlyAttrString);
  FStringAttri.Foreground  := clRed;
  AddAttribute(FStringAttri);

  FTestAttri               := TSynHighLighterAttributes.Create(SYNS_AttrTest, SYNS_FriendlyAttrTest);
  FTestAttri.Style         := [fsUnderline, fsItalic];
  FTestAttri.Foreground    := clBlue;
  FTestAttri.Background    := clSilver;
  AddAttribute(FTestAttri);

  SetAttributesOnChange(DefHighlightChange);
  InitIdent;
  FDefaultFilter := SYNS_FilterTest;
  FRange := rsUnknown;
end;

class function TSynRSyn.GetFriendlyLanguageName: UnicodeString;
begin
  Result := SYNS_FriendlyLangTest;
end;

class function TSynRSyn.GetLanguageName: string;
begin
  Result := SYNS_LangTest;
end;

procedure TSynRSyn.InitIdent;
var
  i: integer;
begin
  for i := Low(FIdentFuncTable) to High(FIdentFuncTable) do
    if KeyIndices[i] = -1 then
      FIdentFuncTable[i] := AltFunc;
  FIdentFuncTable[0] := FuncHello;
  FIdentFuncTable[2] := FuncSynedit;
  FIdentFuncTable[1] := FuncWorld;
end;

{$Q-}
function  TSynRSyn.HashKey(Str: PWideChar): Cardinal;
begin
  Result := 0;
  while IsIdentChar(Str^) do begin
    Result := Result * 3 + Ord(Str^);
    inc(Str);
  end;
  Result := Result mod 3;
  FStringLen := Str - FToIdent;
end;
{$Q+}

function  TSynRSyn.FuncHello(Index: integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function  TSynRSyn.FuncSynedit(Index: integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkTest
  else
    Result := tkIdentifier;
end;

function  TSynRSyn.FuncWorld(Index: integer): TtkTokenKind;
begin
  if IsCurrentToken(KeyWords[Index]) then
    Result := tkKey
  else
    Result := tkIdentifier;
end;

function  TSynRSyn.AltFunc(Index: integer): TtkTokenKind;
begin
  Result := tkIdentifier;
end;

function  TSynRSyn.IdentKind(MayBe: PWideChar): TtkTokenKind;
var
  key: cardinal;
begin
  FToIdent := MayBe;
  key := HashKey(MayBe);
  if key <= High(FIdentFuncTable) then
    Result := FIdentFuncTable[key](KeyIndices[key])
  else
    Result := tkIdentifier;
end;

procedure TSynRSyn.SpaceProc;
begin
  Inc(Run);
  FTokenID := tkSpace;
  while (FLine[Run] <= #32) and not IsLineEnd(Run) do
    Inc(Run);
end;

procedure TSynRSyn.NullProc;
begin
  FTokenID := tkNull;
  Inc(Run);
end;

procedure TSynRSyn.CRProc;
begin
  FTokenID := tkSpace;
  Inc(Run);
  if FLine[Run] = #10 then
    Inc(Run);
end;

procedure TSynRSyn.LFProc;
begin
  FTokenID := tkSpace;
  Inc(Run);
end;

//procedure TSynRSyn.CommentProc;
//begin
//  FTokenID := tkComment;
//  Inc(Run);
//  while (Run <= LineEnd) do
//    Inc(Run);
//end;

procedure TSynRSyn.BraceCommentOpenProc;
begin
  Inc(Run);
  FRange := rsBraceComment;
  FTokenID := tkComment;
end;

procedure TSynRSyn.BraceCommentProc;
begin
  case FLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else begin
      FTokenID := tkComment;
      repeat
        if (FLine[Run] = '}') then begin
          Inc(Run, 1);
          FRange := rsUnKnown;
          Break;
        end;
        if not IsLineEnd(Run) then
          Inc(Run);
      until IsLineEnd(Run);
    end;
  end;
end;

procedure TSynRSyn.CStyleCommentOpenProc;
begin
  Inc(Run);
  if (FLine[Run] = '*') then begin
    Inc(Run, 1);
    FRange := rsCStyleComment;
    FTokenID := tkComment;
  end else
    FTokenID := tkIdentifier;
end;

procedure TSynRSyn.CStyleCommentProc;
begin
  case FLine[Run] of
     #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    begin
      FTokenID := tkComment;
      repeat
        if (FLine[Run] = '*') and (FLine[Run + 1] = '/') then begin
          Inc(Run, 2);
          FRange := rsUnKnown;
          Break;
        end;
        if not IsLineEnd(Run) then
          Inc(Run);
      until IsLineEnd(Run);
    end;
  end;
end;

procedure TSynRSyn.StringOpenProc;
begin
  Inc(Run);
  FRange := rsString;
  StringProc;
  FTokenID := tkString;
end;

procedure TSynRSyn.StringProc;
begin
  FTokenID := tkString;
  repeat
    if (FLine[Run] = '"') then begin
      Inc(Run, 1);
      FRange := rsUnKnown;
      Break;
    end;
    if not IsLineEnd(Run) then
      Inc(Run);
  until IsLineEnd(Run);
end;

procedure TSynRSyn.IdentifierProc;
begin
  FTokenID := IdentKind(FLine + Run);
  Inc(Run, FStringLen);
  while IsIdentChar(FLine[Run]) do
    Inc(Run);
end;

procedure TSynRSyn.UnknownProc;
begin
  Inc(Run);
  FTokenID := tkUnknown;
end;

procedure TSynRSyn.Next;
begin
  FTokenPos := Run;
  case FRange of
    rsBraceComment: BraceCommentProc;
    rsCStyleComment: CStyleCommentProc;
  else
    case FLine[Run] of
      #0                        : NullProc;
      #10                       : LFProc;
      #13                       : CRProc;
    //'#'                       : CommentProc;
      '{'                       : BraceCommentOpenProc;
      '/'                       : CStyleCommentOpenProc;
      '"'                       : StringOpenProc;
    //'"', ''''                 : SymbolProc;
      #1..#9, #11, #12, #14..#32: SpaceProc;
      'A'..'Z', 'a'..'z', '_'   : IdentifierProc;
    //'0'..'9', '.'             : SymbolProc;
    else
      UnknownProc;
    end;
  end;
  inherited;
end;

function  TSynRSyn.GetDefaultAttribute(Index: integer): TSynHighLighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT: Result    := FCommentAttri;
    SYN_ATTR_IDENTIFIER: Result := FIdentifierAttri;
    SYN_ATTR_KEYWORD: Result    := FKeyAttri;
    SYN_ATTR_STRING: Result     := FStringAttri;
    SYN_ATTR_WHITESPACE: Result := FSpaceAttri;
  else
    Result := nil;
  end;
end;

function  TSynRSyn.GetEol: boolean;
begin
  Result := Run = fLineLen + 1;
end;

function  TSynRSyn.GetKeyWords(TokenKind: integer): UnicodeString;
begin
  Result := 'if,else,while,repeat,for,function,in,next,break,TRUE,FALSE,NULL,Inf,NaN,NA,NA_integer,NA_real,NA_complex_,NA_character_';
end;

function  TSynRSyn.GetTokenID: TtkTokenKind;
begin
  Result := FTokenId;
end;

function  TSynRSyn.GetTokenAttribute: TSynHighLighterAttributes;
begin
  case GetTokenID of
    tkComment   : Result := fCommentAttri;
    tkIdentifier: Result := fIdentifierAttri;
    tkKey       : Result := fKeyAttri;
    tkSpace     : Result := fSpaceAttri;
    tkString    : Result := fStringAttri;
    tkTest      : Result := fTestAttri;
    tkUnknown   : Result := fIdentifierAttri;
  else
    Result := nil;
  end;
end;

function  TSynRSyn.GetTokenKind: Integer;
begin
  Result := Ord(fTokenId);
end;

function  TSynRSyn.IsIdentChar(AChar: WideChar): boolean;
begin
  case AChar of
    '_', '0'..'9', 'a'..'z', 'A'..'Z':
      Result := true;
    else
      Result := false;
  end;
end;

function  TSynRSyn.GetSampleSource: UnicodeString;
begin
  Result      := 'This highlighter will recognize the following keywords:'
  + sLineBreak + ''
  + sLineBreak + 'if'
  + sLineBreak + 'else'
  + sLineBreak + 'while'
  + sLineBreak + 'repeat'
  + sLineBreak + 'for'
  + sLineBreak + 'function'
  + sLineBreak + 'in'
  + sLineBreak + 'next'
  + sLineBreak + 'break'
  + sLineBreak + 'TRUE'
  + sLineBreak + 'FALSE'
  + sLineBreak + 'NULL'
  + sLineBreak + 'Inf'
  + sLineBreak + 'NaN'
  + sLineBreak + 'NA'
  + sLineBreak + 'NA_integer'
  + sLineBreak + 'NA_real'
  + sLineBreak + 'NA_complex_'
  + sLineBreak + 'NA_character_'
  + sLineBreak + ''
  + sLineBreak + '{ this style of comments is NOT highlighted }'
  + sLineBreak + '/* this style of comments is also highlighted */'
  + sLineBreak + ''
  + sLineBreak + 'example'
  + sLineBreak + 'if (x > 0) {'
  + sLineBreak + '  print("Hello, world!");'
  + sLineBreak + '}';
end;

function  TSynRSyn.IsFilterStored: boolean;
begin
  Result := FDefaultFilter <> SYNS_FilterTest;
end;

procedure TSynRSyn.ResetRange;
begin
  FRange := rsUnknown;
end;

procedure TSynRSyn.SetRange(Value: pointer);
begin
  FRange := TRangeState(Value);
end;

function  TSynRSyn.GetRange: pointer;
begin
  Result := Pointer(FRange);
end;
{$ENDREGION}

initialization
  RegisterPlaceableHighlighter(TSynRSyn);

end.

