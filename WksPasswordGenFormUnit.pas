unit WksPasswordGenFormUnit;

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
  , Vcl.ExtCtrls
  , Vcl.StdCtrls
  , Vcl.ComCtrls
  , Vcl.Samples.Spin
  , SDLargeDivision
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TPasswordGenForm = class(TForm)
    CancelButton: TButton;
    CharactersGroupBox: TGroupBox;
    EntropyEdit: TEdit;
    EntropyLabel: TLabel;
    GenerateButton: TButton;
    OptionConstraintsLabel: TLabel;
    OkButton: TButton;
    OptionCharsetsNoConstrainLabel2: TLabel;
    OptionCharsetsNoConstrainLabel: TLabel;
    OptionCharsetsNoConstrainRadioButton: TRadioButton;
    OptionCopyToClipboardCheckBox: TCheckBox;
    OptionCopyToClipboardWarnCheckBox: TCheckBox;
    OptionOneFromEachCharsetExceptSpaceLabel: TLabel;
    OptionOneFromEachCharsetExceptSpaceRadioButton: TRadioButton;
    OptionOneFromEachCharsetLabel: TLabel;
    OptionOneFromEachCharsetRadioButton: TRadioButton;
    OptionSpaceNoStartOrEndCheckBox: TCheckBox;
    OptionSpaceNoStartOrEndLabel: TLabel;
    OptionTabSheet: TTabSheet;
    PasswordEdit: TEdit;
    PasswordPageControl: TPageControl;
    PasswordTabSheet: TTabSheet;
    PrintButton: TButton;
    PrintDialog: TPrintDialog;
    PrintRichEdit: TRichEdit;
    RngGroupBox: TRadioGroup;
    EntropyGroupBox: TGroupBox;
    SizeByLengthLabel: TLabel;
    SizeByLengthRadioButton: TRadioButton;
    SizeByLengthSpinEdit: TSpinEdit;
    SizeByStrengthLabel: TLabel;
    SizeByStrengthRadioButton: TRadioButton;
    SizeByStrengthSpinEdit: TSpinEdit;
    SpokenRichEdit: TRichEdit;
    SpokenLabel: TLabel;
    UseLowercaseCheckBox: TCheckBox;
    UseDigitCheckBox: TCheckBox;
    UsePunctuationCheckBox: TCheckBox;
    UsePunctuationEdit: TEdit;
    UsePunctuationResetButton: TButton;
    UseSpaceCheckBox: TCheckBox;
    UseUppercaseCheckBox: TCheckBox;
    procedure GenerateButtonClick(Sender: TObject);
    procedure UsePunctuationResetButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OptionCopyToClipboardCheckBoxClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  //procedure StringOverwrite(var IvString: string);
    function  HugeIntToRandom(IvStrengthInBits: integer; var IvRandomData: TSDLargeNum): boolean;
    procedure RandomToPassword(var IvCharSet: string; IvRandomData: TSDLargeNum; var IvPassword: string);
    function  CharSetDetermine(var IvCharSet: string): boolean;
    function  CharSetBitsPerChar(var IvCharSet: string): double;
    function  PasswordEntropyMax{Strength}(): integer;
    function  PasswordEntropy{Strength}(var IvCharSet: string; var IvPassword: string): double;
    function  PasswordIsValid(var IvPassword: string): boolean;
    procedure PasswordDisplay(var IvCharSet: string; var IvPassword: string);
    function  PasswordGenerateByLength(IvCharSet: string; IvSizeByLength: integer; var IvPassword: string): boolean;
    function  PasswordGenerateByStrength(IvCharSet: string; IvSizeByStrengthInBits: integer; var IvPassword: string): boolean;
    procedure ControlsEnable();
  public
    { Public declarations }
    class function  Execute(var IvPassword: string): boolean;
  end;
{$ENDREGION}

{$REGION 'Var'}
//var
//  PasswordGenForm: TPasswordGenForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    System.Math    // log2
  , System.UITypes // Dialogs expand
  , Clipbrd
  , wcrypt2 // required for the Microsoft RNG; part of the JEDI project
  , Wks000Unit
  , WksRandomGeneratorFormUnit
  ;
{$ENDREGION}

{$REGION 'Routine'}
class function  TPasswordGenForm.Execute(var IvPassword: string): boolean;
begin
  with TPasswordGenForm.Create(nil) do
    try
      Result := ShowModal = mrOk;
      if not Result then
        IvPassword := ''
      else
        IvPassword := PasswordEdit.Text;
    finally
      Free;
    end;
end;

{procedure TPasswordGenForm.StringOverwrite(var IvString: string);
begin
  // overwrite past existing string length
  IvString := StringOfChar(#0, Length(IvString) + 5); // +5 just for the hell of it
end;}

function  TPasswordGenForm.HugeIntToRandom(IvStrengthInBits: integer; var IvRandomData: TSDLargeNum): boolean;
// populate IvRandomData with IvStrengthInBits bits of random data !!! WARNING !!! IvStrengthInBits MUST BE a multiple of 8
var
  hProvider: HCRYPTPROV;
  f: TRandomGeneratorForm;
//allOK: boolean;
begin
  // init
  Result := false;

  if RngGroupBox.ItemIndex = 0 {RNGMouse} then begin

    f := TRandomGeneratorForm.Create(nil);
    try
      f.RequiredBits := IvStrengthInBits;
      f.BitsAlreadyGot := 0;
      if f.ShowModal() = mrOK then begin
        f.GetBitsCollected(IvStrengthInBits, IvRandomData);
        Result := true;
      end;
    finally
      f.Free();
    end;

  end else if RngGroupBox.ItemIndex = 1 {RNGMicrosoft} then begin

    if not(CryptAcquireContext(@hProvider, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT)) then begin
      Result := false;
      MessageDlg('Unable to obtain random-number-generator context from Microsoft RNG', mtError, [mbOK], 0);

    end else begin
      Result := CryptGenRandom(hProvider, (IvStrengthInBits div 8), @IvRandomData[0]);
      if not Result then
        MessageDlg('Unable to obtain random data from Microsoft RNG', mtError, [mbOK], 0);

      // debug: set all bits to 1
    //for i := 1 to {9} (IvStrengthInBits div 8) - 1 do
    //  IvRandomData[i - 1] := $ff;

      // when this next one is tried with the HugeInt library, it fails to generate the correct output with a 17 char-long charset
    //SD_Large_zero(IvRandomData);
    //IvRandomData[0] := $0f;
    //IvRandomData[1] := $2E;
    //IvRandomData[2] := $4C;
    //IvRandomData[3] := $6A;
    //IvRandomData[4] := $88;
    //IvRandomData[5] := $A6;
    //IvRandomData[6] := $C4;
    //IvRandomData[7] := $E2;

      // release
      CryptReleaseContext(hProvider, 0);
    end;

  end;
end;

procedure TPasswordGenForm.RandomToPassword(var IvCharSet: string; IvRandomData: TSDLargeNum; var IvPassword: string);
var
  baseN: integer;
  divValue: TSDLargeNum;
  modValue: byte;
begin
  baseN := length(IvCharSet);

  modValue := 0;
  while (SD_Large_compare(IvRandomData, baseN) >= 0) do begin
    SD_Large_divide(IvRandomData, baseN, divValue, modValue);

    // convert the remaining value in IvRandomData to it's integer representation
    IvPassword := IvCharSet[modValue+1] + IvPassword; // note: +1 because the IvCharSet string indexes from 1
    SD_Large_copy(divValue, IvRandomData);
  end;

  // at this point, the value of randData is greater than baseN
  // we do a divide to transfer randData into modValue
  // convert the remaining value in randData to it's integer representation
  SD_Large_divide(IvRandomData, baseN, divValue, modValue);

  IvPassword := IvCharSet[modValue+1] + IvPassword; // note: +1 because the IvCharSet string indexes from 1

  {$REGION 'Zzz'}
{
procedure TfrmPasswordGen.ConvertRandomToPassword(var IvCharSet: string; randData: HugeInt; var password: string);
var
  hiBaseN: HugeInt;
  baseN: integer;
  tmpStr: string;
  divValue: HugeInt;
  modValue: HugeInt;
  charIdx: integer;
  i: integer;
  s: string;
  a: HugeInt;
  z: HugeInt;
begin
  baseN := length(IvCharSet);
  Integer2HugeInt(baseN, hiBaseN);

  while (HugeInt_Comp(randData, hiBaseN) >= 0) do
    begin
    reReport.lines.add('');
    s:='';
    for i:=10 downto 1 do
      begin
      s := s + inttohex(randData[i-1], 2);
      end;
   reReport.lines.add('randata  = '+s);


//    HugeInt_Div(randData, hiBaseN, divValue);
a := randData;
    HugeInt_Div(a, hiBaseN, divValue);

    s:='';
    for i:=10 downto 1 do
      begin
      s := s + inttohex(divValue[i-1], 2);
      end;
   reReport.lines.add('divValue = '+s);

//    HugeInt_Mod(randData, hiBaseN, modValue);
a := randData;
    HugeInt_Mod(a, hiBaseN, modValue);

    Integer2HugeInt(0, z);
    HugeInt_Mul(divValue, hiBaseN, z);
    HugeInt_Add(z, modValue, z);
    s:='';
    for i:=10 downto 1 do
      begin
      s := s + inttohex(z[i-1], 2);
      end;
   reReport.lines.add('z             = '+s);

    // Convert the remaining value in randData to it's integer representation
    // Note: This will *never* set charIdx to a value which it can't store
    //        - unless the number of chars in IvCharSet are greater than the
    //          max number it can store! (i.e. this isn't ever going to happen)
    HugeInt2String(modValue, tmpStr);
    charIdx := strtoint(tmpStr);

    // Note: +1 because the IvCharSet string indexes from 1
    password := IvCharSet[charIdx+1] + password;

    HugeInt_Copy(divValue, randData);
//    randData := divValue;
    end;

  // Convert the remaining value in randData to it's integer representation
  // Note: This will *never* set charIdx to a value which it can't store
  //        - unless the number of chars in IvCharSet are greater than the
  //          max number it can store! (i.e. this isn't ever going to happen)
  HugeInt2String(randData, tmpStr);
  charIdx := strtoint(tmpStr);

  // Note: +1 because the IvCharSet string indexes from 1
  password := IvCharSet[charIdx+1] + password;
end;

// old version - uses recursion and can cause stack overflows when generating passwords with large amounts of entropy
procedure TfrmPasswordGen.ConvertRandomToPassword(var IvCharSet: string; randData: HugeInt; var password: string);
var
  hiBaseN: HugeInt;
  baseN: integer;
  tmpStr: string;
  divValue: HugeInt;
  modValue: HugeInt;
  charIdx: integer;
begin
  baseN := length(IvCharSet);
  Integer2HugeInt(baseN, hiBaseN);

  if (HugeInt_Comp(randData, hiBaseN) = -1) then
    begin
    // Convert the remaining value in randData to it's integer representation
    // Note: This will *never* set charIdx to a value which it can't store
    //        - unless the number of chars in IvCharSet are greater than the
    //          max number it can store! (i.e. this isn't ever going to happen)
    HugeInt2String(randData, tmpStr);
    charIdx := strtoint(tmpStr);

    // Note: +1 because the IvCharSet string indexes from 1
    password := password + IvCharSet[charIdx+1];
    end
  else
    begin
    HugeInt_Div(randData, hiBaseN, divValue);
    HugeInt_Mod(randData, hiBaseN, modValue);

    ConvertRandomToPassword(IvCharSet, divValue, password);

    // Convert the remaining value in randData to it's integer representation
    // Note: This will *never* set charIdx to a value which it can't store
    //        - unless the number of chars in IvCharSet are greater than the
    //          max number it can store! (i.e. this isn't ever going to happen)
    HugeInt2String(modValue, tmpStr);
    charIdx := strtoint(tmpStr);

    // Note: +1 because the IvCharSet string indexes from 1
    password := password + IvCharSet[charIdx+1];
    end;
end;
}
  {$ENDREGION}

end;

function  TPasswordGenForm.CharSetDetermine(var IvCharSet: string): boolean;
var
  z: integer; // setsused
begin
  z := 0;
  IvCharSet := '';

  if UseLowercaseCheckBox.Checked   then begin IvCharSet := IvCharSet + TChaRec.CHAR_LOWERCASE_SET;                            Inc(z); end;
  if UseUppercaseCheckBox.Checked   then begin IvCharSet := IvCharSet + TChaRec.CHAR_UPPERCASE_SET;                            Inc(z); end;
  if UseDigitCheckBox.Checked       then begin IvCharSet := IvCharSet + TChaRec.CHAR_DIGIT_SET;                                Inc(z); end;
  if UsePunctuationCheckBox.Checked then begin IvCharSet := IvCharSet +{TChaRec.CHAR_PUNCTUATION_SET} UsePunctuationEdit.Text; Inc(z); end;
  if UseSpaceCheckBox.Checked       then begin IvCharSet := IvCharSet + TChaRec.CHAR_WHITESPACE_SET;                           Inc(z); end;

  if      z = 0 then
    ShowMessage(   'Please select one or more chacter sets from which passwords should be generated')
  else if z = 1 then
    ShowMessage(   'A password generated using only a single character-set is not very secure...'
    + sLineBreak
    + sLineBreak + 'Please select more character-sets from which passwords should be generated');

  // charsetissecure?
  Result := z > 1;
end;

function  TPasswordGenForm.CharSetBitsPerChar(var IvCharSet: string): double;
// calculate the amount of bits of entropy each character in IvCharSet represents
begin
  // <bits per char> = log2(<count of chars in CharSet>)
  Result := Log2(Length(IvCharSet));
end;

function  TPasswordGenForm.PasswordEntropyMax: integer;
// calculate the max amount of password entropy which can be achieved with the current data type
begin
  // HugeInt stores numbers as "n" 8-bit bytes, including the MSB sign bit
  // we'll ignore the last byte (as it includes the sign bit, which we really want nothing to do with), and multiply by 8
  Result := ((SizeOf(TSDLargeNum) - 1) * 8);
end;

function  TPasswordGenForm.PasswordEntropy(var IvCharSet, IvPassword: string): double;
var
  x: double; // bitsPerChar
begin
  // estimate the amount of entropy the IvPassword has
  x := CharsetBitsPerChar(IvCharSet);
  Result := x * Length(IvPassword);
end;

function  TPasswordGenForm.PasswordIsValid(var IvPassword: string): boolean;
var
  i: integer;
  l, u, d, p, s: boolean; // lowercase, uppercase, digits, punctuation, space
begin
  // init
  l := false;
  u := false;
  d := false;
  p := false;
  s := false;
  Result := true;

  // see if the user specified that all charsets must be represented in the password
  if OptionOneFromEachCharsetRadioButton.Checked
  or OptionOneFromEachCharsetExceptSpaceRadioButton.Checked then begin
    for i := 1 to Length(IvPassword) do begin
      l := Pos(IvPassword[i], TChaRec.CHAR_LOWERCASE_SET) > 0;
      if l then Break;
    end;

    for i := 1 to Length(IvPassword) do begin
      u := Pos(IvPassword[i], TChaRec.CHAR_UPPERCASE_SET) > 0;
      if u then Break;
    end;

    for i := 1 to Length(IvPassword) do begin
      d := Pos(IvPassword[i], TChaRec.CHAR_DIGIT_SET) > 0;
      if d then Break;
    end;

    for i := 1 to Length(IvPassword) do begin
      p := Pos(IvPassword[i],{TChaRec.CHAR_PUNCTUATION_SET} UsePunctuationEdit.Text) > 0;
      if p then Break;
    end;

    for i := 1 to Length(IvPassword) do begin
      s := Pos(IvPassword[i], TChaRec.CHAR_WHITESPACE_SET) > 0;
      if s then Break;
    end;

    if OptionOneFromEachCharsetRadioButton.Checked then begin
      if (UseLowercaseCheckBox.Checked   and not(l))
      or (UseUppercaseCheckBox.Checked   and not(u))
      or (UseDigitCheckBox.Checked       and not(d))
      or (UsePunctuationCheckBox.Checked and not(p))
      or (UseSpaceCheckBox.Checked       and not(s)) then
        Result := false;
    end else if OptionOneFromEachCharsetExceptSpaceRadioButton.Checked then begin
      if (UseLowercaseCheckBox.Checked   and not(l))
      or (UseUppercaseCheckBox.Checked   and not(u))
      or (UseDigitCheckBox.Checked       and not(d))
      or (UsePunctuationCheckBox.Checked and not(p)) then
        Result := false;
    end;
  end;

  // see if user pemits starting/ending with space
  if OptionSpaceNoStartOrEndCheckBox.Checked and ( (IvPassword[1] = ' ') or (IvPassword[Length(IvPassword)] = ' ') ) then
    Result := false;
end;

procedure TPasswordGenForm.PasswordDisplay(var IvCharSet, IvPassword: string);
var
  i: integer; //
  k: string; // charspokenstr
  //s: double; // passwordstrength
  //charToSpoken: TCharToSpoken;
begin
  // password
  PasswordEdit.Text := IvPassword;
  EntropyEdit.Text := FormatFloat('##########.####', PasswordEntropy(IvCharSet, IvPassword));

  // warning
  if IvPassword = '' then
    SpokenRichEdit.Clear()
  else if IvPassword[1] = ' ' then
    MessageDlg('WARNING: Password starts with whitespace', mtWarning, [mbOK], 0);
  if IvPassword[Length(IvPassword)] = ' ' then
    MessageDlg('WARNING: Password ends with whitespace', mtWarning, [mbOK], 0);

  // spoken
  for i := 1 to Length(IvPassword) do begin
    k := TChaRec.CharToSpoken(IvPassword[i]);
    SpokenRichEdit.Lines.add(k);
  end;

  ControlsEnable;
end;

function  TPasswordGenForm.PasswordGenerateByLength(IvCharSet: string; IvSizeByLength: integer; var IvPassword: string): boolean;
var
  b: integer; // bitsrequired
//o: boolean; // allok
  x: double; // bitsperchar
begin
  // init
  IvPassword := '';

  // calculate the number of bits of entropy that a password of length IvSizeByLength (using the chars in "IvCharSet") must have: <number of chars> to the power of <length>
  x := CharsetBitsPerChar(IvCharSet);
  b := trunc(x * IvSizeByLength);
  if b < (x * IvSizeByLength) then // roundup
    b := b + 1;

  // usebyentropy
  Result := PasswordGenerateByStrength(IvCharSet, b, IvPassword);

  // If the password generated was longer than required (e.g. because the RNG only generates
  // random data 8 bits at a time), truncate the password to the required length
  // We delete characters from the START of the password; the char with the MSB may not have as much entropy as the other chars
  // If it still has too many chars, we delete from the END of the password e.g. if the
  // alphabet has only 3 chars; A, B and C - and the amount of entropy is 3 bits, then:
  // 000 -> AAA
  // 001 -> AAB
  // 010 -> AAC
  // 011 -> ABA
  // 100 -> ABB
  // 101 -> ABC
  // 110 -> BAA
  // 111 -> BAB
  // - note that the MSB is more likely to be "A". If we've generated too many chars for the password, then we must
  //   have generated a password with more entropy than required; the password needs to be trimmed down to the correct size
  // - also note that the LSB is most likely to be A/B. This is OK since the amount of entropy in the password doesn't change
  while Length(IvPassword) > IvSizeByLength do begin
    Delete(IvPassword, 1, 1);
    // if we still have too man chars, trim from the other end
    if Length(IvPassword) > IvSizeByLength then
      Delete(IvPassword, Length(IvPassword), 1);
  end;
end;

function  TPasswordGenForm.PasswordGenerateByStrength(IvCharSet: string; IvSizeByStrengthInBits: integer; var IvPassword: string): boolean;
var
  randData: TSDLargeNum;
  tmpInt: integer;
  generateRandomBits: integer;
begin
  // init
  IvPassword := '';
  SD_Large_zero(randData); // generate the random data (initialize first)

  // round "IvSizeByStrengthInBits" up to the nearest multiple of 8
  generateRandomBits := IvSizeByStrengthInBits;
  tmpInt := generateRandomBits mod 8;
  if tmpInt <> 0 then
    generateRandomBits := generateRandomBits + (8 - tmpInt);

  Result := HugeIntToRandom(generateRandomBits, randData);

  // convert the random data into base-n, where "n" is the length of the IvCharSet; thereby converting it into a password
  if Result then begin
    RandomToPassword(IvCharSet, randData, IvPassword);

    // at this point, the password generated may not reflect the randData
    // accurately (e.g. if the password strength was 128, but randData was
    // randomly set to int(1), then the password will only have 1 char
    // The password should then be padded out with the base-n "0" char
    while PasswordEntropy(IvCharSet, IvPassword) < IvSizeByStrengthInBits do
      IvPassword := IvCharSet[1] + IvPassword; // note: +1 because the IvCharSet string indexes from 1
  end;
end;

procedure TPasswordGenForm.ControlsEnable;
var
  s: string; // charset
  b, l: integer; // maxbits, maxlength
  x, y: double; // charsetbitsperchar, maxlengthaccurate
begin
  // ctrls
  PrintButton.enabled := (SpokenRichEdit.Text <> '');
  OptionCopyToClipboardWarnCheckBox.Enabled := OptionCopyToClipboardCheckBox.checked;

  // spins
  CharSetDetermine(s);
  b := PasswordEntropyMax();
  x := CharSetBitsPerChar(s);
  y := b / x;
  l := trunc(y); // max length of a password
//StringOverwrite(s); ???
  SizeByStrengthSpinEdit.MaxValue := b;
  SizeByLengthSpinEdit.MaxValue   := l;
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TPasswordGenForm.FormCreate(Sender: TObject);
begin
  // clean
  PasswordEdit.Text := '';
  EntropyEdit.Text  := '';

  // charset
  UseLowercaseCheckBox.Checked                           := gini.BooGet('PasswordGen/UseLowercase'                 , true                        );
  UseUppercaseCheckBox.Checked                           := gini.BooGet('PasswordGen/UseUppercase'                 , true                        );
  UseDigitCheckBox.Checked                               := gini.BooGet('PasswordGen/UseDigit'                     , true                        );
  UsePunctuationCheckBox.Checked                         := gini.BooGet('PasswordGen/UsePunctuation'               , false                       );
  UsePunctuationEdit.Text                                := gini.StrGet('PasswordGen/UsePunctuationEdit'           , TChaRec.CHAR_PUNCTUATION_SET);
  UseSpaceCheckBox.Checked                               := gini.BooGet('PasswordGen/UseSpace'                     , false                       );

  // security
  SizeByStrengthRadioButton.Checked                      := gini.BooGet('PasswordGen/SizeByStrength'               , false                       );
  SizeByStrengthSpinEdit.Value                           := gini.IntGet('PasswordGen/SizeByStrengthSpinEdit'       , 128                         );
  SizeByLengthRadioButton.Checked                        := gini.BooGet('PasswordGen/SizeByLength'                 , true                        );
  SizeByLengthSpinEdit.Value                             := gini.IntGet('PasswordGen/SizeByLengthSpinEdit'         , 8                           );

  // rng
  RngGroupBox.ItemIndex                                  := gini.IntGet('PasswordGen/RngGroupBoxItemIndex'         , 1                           );

  // Options
  OptionSpaceNoStartOrEndCheckBox.Checked                := gini.BooGet('PasswordGen/SpaceNoStartOrEnd'            , true                        );
  OptionCopyToClipboardCheckBox.Checked                  := gini.BooGet('PasswordGen/CopyToClipboard'              , true                        );
  OptionCopyToClipboardWarnCheckBox.Checked              := gini.BooGet('PasswordGen/CopyToClipboardWarn'          , true                        );
  OptionOneFromEachCharsetRadioButton.Checked            := gini.BooGet('PasswordGen/OneFromEachCharset'           , false                       );
  OptionOneFromEachCharsetExceptSpaceRadioButton.Checked := gini.BooGet('PasswordGen/OneFromEachCharsetExceptSpace', true                        );
  OptionCharsetsNoConstrainRadioButton.Checked           := gini.BooGet('PasswordGen/CharsetsNoConstrain'          , false                       );
end;

procedure TPasswordGenForm.FormShow(Sender: TObject);
begin
  ControlsEnable;
end;

procedure TPasswordGenForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // charset
  gini.BooSet('PasswordGen/UseLowercase'                 , UseLowercaseCheckBox.Checked                          );
  gini.BooSet('PasswordGen/UseUppercase'                 , UseUppercaseCheckBox.Checked                          );
  gini.BooSet('PasswordGen/UseDigit'                     , UseDigitCheckBox.Checked                              );
  gini.BooSet('PasswordGen/UsePunctuation'               , UsePunctuationCheckBox.Checked                        );
  gini.StrSet('PasswordGen/UsePunctuationEdit'           , UsePunctuationEdit.Text                               );
  gini.BooSet('PasswordGen/UseSpace'                     , UseSpaceCheckBox.Checked                              );

  // security
  gini.BooSet('PasswordGen/SizeByStrength'               , SizeByStrengthRadioButton.Checked                     );
  gini.IntSet('PasswordGen/SizeByStrengthSpinEdit'       , SizeByStrengthSpinEdit.Value                          );
  gini.BooSet('PasswordGen/SizeByLength'                 , SizeByLengthRadioButton.Checked                       );
  gini.IntSet('PasswordGen/SizeByLengthSpinEdit'         , SizeByLengthSpinEdit.Value                            );

  // rng
  gini.IntSet('PasswordGen/RngGroupBoxItemIndex'         , RngGroupBox.ItemIndex                                 );

  // Options
  gini.BooSet('PasswordGen/SpaceNoStartOrEnd'            , OptionSpaceNoStartOrEndCheckBox.Checked               );
  gini.BooSet('PasswordGen/CopyToClipboard'              , OptionCopyToClipboardCheckBox.Checked                 );
  gini.BooSet('PasswordGen/CopyToClipboardWarn'          , OptionCopyToClipboardWarnCheckBox.Checked             );
  gini.BooSet('PasswordGen/OneFromEachCharset'           , OptionOneFromEachCharsetRadioButton.Checked           );
  gini.BooSet('PasswordGen/OneFromEachCharsetExceptSpace', OptionOneFromEachCharsetExceptSpaceRadioButton.Checked);
  gini.BooSet('PasswordGen/CharsetsNoConstrain'          , OptionCharsetsNoConstrainRadioButton.Checked          );
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TPasswordGenForm.UsePunctuationResetButtonClick(Sender: TObject);
begin
  UsePunctuationEdit.text := TChaRec.CHAR_PUNCTUATION_SET;
end;

procedure TPasswordGenForm.GenerateButtonClick(Sender: TObject);
var
  v: boolean;   // passwordisvalid
  a: integer;   // attempts
  s, p: string; // charset, password
  r: word;      // msgdlgreply
begin

  {$REGION 'init'}
  ControlsEnable;
  PasswordEdit.Text := 'generating';
  EntropyEdit.Clear;
  SpokenRichEdit.Clear;
  Application.ProcessMessages;
  {$ENDREGION}

  {$REGION 'wks'}
//p := pwd.Generate(
//  SizeByLengthSpinEdit.Value
//, UseLowercaseCheckBox.Checked
//, UseUppercaseCheckBox.Checked
//, UseNumberCheckBox.Checked
//, UsePunctuationCheckBox.Checked
//, UseSpaceCheckBox.Checked
//);
  {$ENDREGION}

  {$REGION 'sara'}
  // init
  a := 0;
  CharSetDetermine(s);

  // charset restriction because:
  // - we use "char" (8 bits datatype) to handle password characters
  // - the large integer functions operate on an array of "byte" (8 bit numbers)
  if Length(s) > 256 then begin
   {r :=} MessageDlg('This password generator can operate only with a character-set of 256 symbols or less.'
    + sLineBreak
    + sLineBreak   + 'Please change your character-set options to reduce the number of possible symbols.', mtError, [mbOK], 0);
    Exit;
  end;

  // generate passwords, until we have a valid one
//v := false;
  repeat
    // attempts
    Inc(a);

    // generate
    if SizeByLengthRadioButton.checked then
      v := PasswordGenerateByLength(s, SizeByLengthSpinEdit.Value, p)
    else
      v := PasswordGenerateByStrength(s, SizeByStrengthSpinEdit.Value, p);

    // user cancelled, or other error preventing the system from generating a valid random password
    if not(v) then
      break;  // exit the repeat loop

    // valid?
    v := PasswordIsValid(p);

    // retryorexit
    if not(v) {and (RngGroupBox.ItemIndex = 0)} then begin
      r := MessageDlg('Attempt #' + IntToStr(a)
      + sLineBreak
      + sLineBreak    + 'The password generated is not valid according to the options you have selected.'
      + sLineBreak    + 'You may wish to revise your options to remove one or more constraints'
      + sLineBreak
      + sLineBreak    + 'Try again?', mtWarning, [mbYes, mbNo], 0);
      if r = mrNo then
        v := true; // --> pwd is considered ok, loopexit
    end;
  until v;
  {$ENDREGION}

  {$REGION 'end'}
  // togui
  PasswordDisplay(s, p);

  // toclipboard
  if (p <> '') and OptionCopyToClipboardCheckBox.Checked then begin
    Clipboard.AsText := p;
    if OptionCopyToClipboardWarnCheckBox.Checked then
      MessageDlg('The generated password has been copied to the clipboard.', mtInformation, [mbOK], 0);
  end;

//StringOverwrite(p);
//StringOverwrite(s);
  {$ENDREGION}

end;

procedure TPasswordGenForm.PrintButtonClick(Sender: TObject);
begin
  if not PrintDialog.Execute() then
    Exit;

  // init
  PrintRichEdit.Lines.Clear();
  PrintRichEdit.WordWrap := false;

  // password
  PrintRichEdit.Lines.Add('Password generated: ' + PasswordEdit.text);
  PrintRichEdit.SelStart  := Length(PrintRichEdit.Lines[0]) - Length(PasswordEdit.text);
  PrintRichEdit.SelLength := Length(PasswordEdit.Text);
  PrintRichEdit.SelAttributes.color := clred;
  PrintRichEdit.SelAttributes.Name  := 'Courier New';
  PrintRichEdit.SelAttributes.Pitch := fpFixed;
  PrintRichEdit.SelAttributes.Style := [fsBold];

  // entropy
  PrintRichEdit.Lines.Add('Password entropy  : ' + EntropyEdit.text + ' bits.');

  // warnings
  if (PasswordEdit.text[1] = ' ') then
  PrintRichEdit.Lines.Add('WARNING           : Password starts with whitespace');
  if (PasswordEdit.text[length(PasswordEdit.text)] = ' ') then
  PrintRichEdit.Lines.Add('WARNING           : Password ends with whitespace');

  // spoken
  PrintRichEdit.Lines.Add('');
  PrintRichEdit.Lines.Add('Spoken Representation:');
  PrintRichEdit.Paragraph.FirstIndent := 8;
  PrintRichEdit.Lines.AddStrings(SpokenRichEdit.Lines);
  PrintRichEdit.Paragraph.FirstIndent := 0;

  // print
  PrintRichEdit.Print('Password Generated...');

  // ???
//PrintRichEdit.Text := StringOfChar('Z', Length(PrintRichEdit.Text));
end;
{$ENDREGION}

{$REGION 'Option'}
procedure TPasswordGenForm.OptionCopyToClipboardCheckBoxClick(Sender: TObject);
begin
  ControlsEnable();
end;
{$ENDREGION}

end.
