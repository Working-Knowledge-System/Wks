unit WksMqttUtilsUnit;

interface

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , WksMqttTypesUnit
  ;
{$ENDREGION}

{$REGION 'Routines'}
function  VarLenFieldLength(AString: string): integer; // 2bytes + stringlength
function  StrFromStreamRead(AStream: TStream): string; // read UTF8 encoded string
function  BytesFromHex(const AHex: string): TBytes;
function  AsciiFromStream(AStream: TStream): string;   // 192 126  32   0 ...
function  HexFromStream(AStream: TStream): string;     //  C0  7F  20  00 ...
function  HexFromBytes(ABytes: TBytes): string;
function  CharFromStream(AStream: TStream): string;    //   À   ~   _   .
function  DumpFromStream(AStream: TStream): string;    // *** da rivedere ***
{$ENDREGION}

implementation

{$REGION 'Routines'}
function  VarLenFieldLength(AString: string): integer;
begin
  if AString.IsEmpty then
    Result := 0
  else
    Result := 2 + Length(AString);
end;

function  StrFromStreamRead(AStream: TStream): string;
var
  len: word;
  bytes: TBytes; // buffer
begin
  // attempts to read exactly 2 bytes from the stream, starting at the current position
  // then advances the current position in the stream by the number of bytes actually read
  // in fact this will be the number of chars to read next to form the string
  AStream.ReadBuffer(len, 2);

  // exchanges the high-order byte with the low-order byte of a 16-bit word, why?
  len := Swap(len);

  // dimension the receiving buffer
  SetLength(bytes, len);

  // fill the buffer reading len chars that form the string
  AStream.ReadBuffer(bytes[0], len);

  // return the encoded bytes as a UTF8 string
  try
    Result := TEncoding.UTF8.GetString(bytes);
  except
    on e: Exception do
      Result := Format('ERROR: %e (%s)', [e.Message,  HexFromBytes(bytes)]);
  end;
end;

function  BytesFromHex(const AHex: string): TBytes;
var
  i: integer;
  s: string;
begin
  s := AHex.Trim;
  SetLength(Result, Length(s) div 3 + 1);
  for i := 0 to High(Result) do
    Result[i] := StrToInt('$' + Copy(s, i * 3 + 1, 2));
end;

function  AsciiFromStream(AStream: TStream): string;
var
  oldpos: int64;
  byt: Byte;
begin
  if (not Assigned(AStream)) or (AStream.Size = 0) then
    Exit('');

  // save current position
  oldpos := AStream.Position;

  try
    Result := '';
    AStream.Position := 0;
    while AStream.Position < AStream.Size do begin
      AStream.Read(byt, SizeOf(Byte));
      Result := Result + Format(' %3d', [byt]);
    end;
    Delete(Result, 1, 1);
  finally
    AStream.Position := oldpos;
  end;
end;

function  HexFromStream(AStream: TStream): string;
const
  HEX_CHARS: array[0..15] of Char = '0123456789ABCDEF';
var
  oldpos: int64;
  byt: Byte;
begin
  if (not Assigned(AStream)) or (AStream.Size = 0) then
    Exit('');

  // save current position
  oldpos := AStream.Position;

  try
    Result := '';
    AStream.Position := 0;
    while AStream.Position < AStream.Size do begin
      AStream.Read(byt, SizeOf(Byte));
      Result := Result + '  ' + HEX_CHARS[byt shr 4] + HEX_CHARS[byt and $0F];
    end;
    Delete(Result, 1, 1);
  finally
    AStream.Position := oldpos;
  end;
end;

function  HexFromBytes(ABytes: TBytes): string;
const
  HEX_SYMBOLS = '0123456789ABCDEF';
var
  i: integer;
begin
  SetLength(Result, 2 * Length(ABytes));
  for i :=  0 to Length(ABytes) - 1 do begin
    Result[1 + 2*i + 0] := HEX_SYMBOLS[1 + ABytes[i] shr 4];
    Result[1 + 2*i + 1] := HEX_SYMBOLS[1 + ABytes[i] and $0F];
  end;
end;

function  CharFromStream(AStream: TStream): string;
const
  CHAR_ASCII_CODE_PRINTABLE = [32..126 , 161..255];
var
  oldpos, bytecount: int64;
  bytes: TBytes;
begin
  // exit
  if not Assigned(AStream) or (AStream.Size = 0) then
    Exit('');

  // save current position
  oldpos := AStream.Position;

  try
    // init
    Result := '';
    AStream.Position := 0;
    bytecount := AStream.Size;
    SetLength(bytes, bytecount);

    // read
    AStream.ReadBuffer(bytes[0], bytecount);

    // only keep ASCII characters (code 32..126), others replaced with '.'
    for var b in bytes do
      if b in CHAR_ASCII_CODE_PRINTABLE then
        Result := Result + '   ' + Chr(b)
      else
        Result := Result + '   .';
    Delete(Result, 1, 1);
  finally
    AStream.Position := oldpos;
  end;
end;

function  DumpFromStream(AStream: TStream): string;
const
  PRINTABLE_ASCII = [' '..'~', '¡'..'ÿ']; // ascii 32..126 , 161..255 are printable
  BYTES_PER_LINE = 16;
  showoffset = true;
  showhex    = true;
  showascii  = true;
var
  i, bytecount, oldpos: int64;
  b: byte;
  linestr: string;
begin
  // init
  Result := '';

  // exit
  if not Assigned(AStream) or (AStream.Size = 0) then
    Exit;

  // save current position
  oldpos := AStream.Position;
  try
    AStream.Position := 0;
    bytecount := AStream.Size;

    // read stream byte by byte
    for i := 0 to bytecount - 1 do begin
      AStream.Read(b, SizeOf(Byte));

      // start new line every BYTES_PER_LINE bytes
      if (i mod BYTES_PER_LINE = 0) then begin
        if (i > 0) then
          Result := Result + sLineBreak;

        if ShowOffset then
          Result := Result + Format('%.8x: ', [i]);
      end;

      // show hex representation if requested
      if ShowHex then begin
        Result := Result + IntToHex(b, 2) + ' ';
        // align ASCII section
        if (i mod BYTES_PER_LINE = BYTES_PER_LINE - 1) or (i = ByteCount - 1) then begin
          // pad last line if needed
          if (i mod BYTES_PER_LINE <> BYTES_PER_LINE - 1) then
            Result := Result + StringOfChar(' ', 3 * (BYTES_PER_LINE - 1 - (i mod BYTES_PER_LINE)));
        end;
      end;

      // show ASCII representation if requested
      if ShowASCII and ((i mod BYTES_PER_LINE = 0) or not ShowHex) then begin
        if (i mod BYTES_PER_LINE = 0) then
          LineStr := '';

        if Char(b) in PRINTABLE_ASCII then
          LineStr := LineStr + Char(b)
        // show unprintable as dots
        else
          LineStr := LineStr + '.';

        // add ascii section after hex for complete lines
        //if (i mod BYTES_PER_LINE = BYTES_PER_LINE - 1) or (i = bytecount - 1) then begin
          if ShowHex then
            Result := Result + '  '; // Separator between hex and ASCII
          Result := Result + LineStr;
        //end;
      end;
    end;
  finally
    AStream.Position := oldpos;
  end;
end;
{$ENDREGION}

end.
