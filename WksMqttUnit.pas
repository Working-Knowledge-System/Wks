unit WksMqttUnit;

interface

{$REGION 'Help'}
{
  CONNECTION FLAGS
  ================
  ...


  TOPICS
  ======

  Topic can be anyting, altough this is the common practice

  - try to use only small leters

  - avoid a Leading Forward Slash
    it introduces an unnecessary topic level with a zero character: /myhome/groundfloor/livingroom

  - avoid Spaces and Special Chars, use only printable ASCII chars (32..196)

  System Topics
  -------------
  Topics that start with a $ symbol are reserved for internal MQTT server statistics exposed to clients as information
  These topics are not included in the subscription when using the multi-level wildcard (#)
  Publishing messages to topics starting with $ is not permitted

  examples:

  $/broker/clients/connected      number of clients currently connected to the MQTT broker

  $/broker/clients/disconnected   number of clients that have disconnected from the MQTT broker

  $/broker/clients/total          total number of clients (connected and disconnected) that have interacted with the MQTT broker

  $/broker/messages/sent          count of messages sent by the MQTT broker

  $/broker/uptime                 duration the MQTT broker has been running (in minutes?)

  Normal Topics
  -------------
  Any string of ASCII chars not starting with / and with / as separators for each level

  example:

  myhome/groundfloor/livingroom/temperature
  myhome/groundfloor/livingroom/humidity
  myhome/groundfloor/livingroom/brightness
  myhome/groundfloor/kitchen/temperature
  myhome/groundfloor/kitchen/humidity
  myhome/groundfloor/kitchen/brightness
  myhome/groundfloor/kitchen/refrigerator/temperature


  NOTES
  =====

  the MQTT protocol specifies that the server is supposed to monitor the client’s keep-alive PINGREQ and disconnect it if it doesn’t send the PINGREQ within that period
  but we can implement the server explicitly and periodically send a PINGREQ to ALL connected clients and expect a PINGRESP in return
  if a client fails to respond the server can register the event and close the connection with that client


  This design provides a solid foundation for a complete MQTT 3.1.1 implementation in Delphi

  Indy TCP server automatically handles connections in separate threads
  The server implementation should handle multiple concurrent clients. Consider thread safety in session management

  Session Management: The server should maintain sessions for clients that connect with CleanSession=False
  Retained Messages: The server should store retained messages and deliver them to new subscribers

  Will Message: The client should support specifying a will message in the CONNECT packet
  Keep Alive: Both client and server should monitor connection activity and disconnect inactive clients.

  WordRead and WordWrite handle network byte order (big-endian) conversion using Swap
  MQTT protocol requires all multi-byte values to be big-endian

  Strings are properly encoded/decoded using UTF-8
  Length prefixes are correctly written as 2-byte values
}
{$ENDREGION}

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , Vcl.StdCtrls
  , Vcl.ComCtrls
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TMqttClass = class
  protected
    FLogRichEdit: TRichEdit;                                        // here logs normally
    FRequestHexRichEdit: TRichEdit;                                 // here logs request packet raw string
    FResponseHexRichEdit: TRichEdit;                                // here logs response packet raw string
    FLogLast: string;                                               // hold the last logged message (to avoid logging same stuff)
    FLogVerbose: boolean;
    FLogRawAscii: boolean;
    FLogRawHex: boolean;
    FLogRawChar: boolean;
  protected
    procedure Log(const AStr: string; AWithTime: boolean = true); overload;
    procedure Log(const AFmt: string; AVarRecVec: array of TVarRec; AWithTime: boolean = true); overload;
    procedure Dmp(const AStr: string);
  public
    constructor Create(ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit: TRichEdit); virtual;

    property LogVerbose : boolean read FLogVerbose  write FLogVerbose ;
    property LogRawAscii: boolean read FLogRawAscii write FLogRawAscii;
    property LogRawHex  : boolean read FLogRawHex   write FLogRawHex  ;
    property LogRawChar : boolean read FLogRawChar  write FLogRawChar ;
  end;
{$ENDREGION}

implementation

{$REGION 'TMqttClass'}
constructor TMqttClass.Create(ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit: TRichEdit);
begin
  FLogRichEdit         := ALogRichEdit;
  FRequestHexRichEdit  := ARequestHexRichEdit;
  FResponseHexRichEdit := AResponseHexRichEdit;
  FLogVerbose          := false;
  FLogRawAscii         := false;
  FLogRawHex           := false;
  FLogRawChar          := true;
end;

procedure TMqttClass.Log(const AStr: string; AWithTime: boolean);
var
  str{, str2}: string;
begin
  if Assigned(FLogRichEdit) then begin
    // times
//    if SameText(FLogLast, AStr) then
//      FLogRichEdit.Tag := FLogRichEdit.Tag + 1;
//    if FLogRichEdit.Tag > 0 then
//      str2 := Format(' (%d)', [FLogRichEdit.Tag])
//    else
//      str2 := '';

    // last
    FLogLast := AStr;

    // i
    TThread.Synchronize(nil
    , procedure
      begin
        if AWithTime then
          str := FormatDateTime('dd hh:nn:ss zzz : ', Now) + AStr {+ str2}
        else
          str := AStr {+ str2};
        FLogRichEdit.Lines.Add(str);
      end
    );

    // ii
//  TThread.Queue(TThread.CurrentThread
//  , procedure
//    begin
//      str := FormatDateTime('dd hh:nn:ss zzz : ', Now) + AStr;
//      FLogRichEdit.Lines.Add(str);
//    end
//  );
  end;
end;

procedure TMqttClass.Log(const AFmt: string; AVarRecVec: array of TVarRec; AWithTime: boolean);
begin
  Log(Format(AFmt, AVarRecVec), AWithTime);
end;

procedure TMqttClass.Dmp(const AStr: string);
begin
  Log(AStr, false);
end;
{$ENDREGION}

{$REGION 'Zzz'}
(*
  TMqttClass = class
  protected
    procedure LogRequest(const AStr: string); overload;
    procedure LogRequest(const AIdBytes: TIdBytes); overload;
    procedure LogResponse(const AStr: string); overload;
    procedure LogResponse(const AIdBytes: TIdBytes); overload;
    procedure LogWithRequest(const AStr: string; const ARequest: TIdBytes);
    procedure LogWithResponse(const AStr: string; const AResponse: TIdBytes);
    procedure BytAdd(const AByte: byte; var APacket: TIdBytes; var AIndex: integer);
    procedure StrAdd(const AStr: ansistring; var APacket: TIdBytes; var AIndex: integer);
    function  StrRead(AContext: TIdContext): string;
    function  IntEat(var AIdBytes: TIdBytes; ACount: integer; ADefault: integer = 0): integer;
    function  StrEat(var AIdBytes: TIdBytes; ACount: integer; ADefault: string = ''): string;
    function  StrPrintable(const AStr: string): string;
    function  StrDebugable(const AStr: string; IvHex: boolean = true): string; overload;
    function  StrDebugable(const AIdBytes: TIdBytes; IvHex: boolean = true): string; overload;
  end;

implementation

procedure TMqttClass.LogRequest(const AStr: string);
begin
  if Assigned(FLogRequestRichEdit) then begin
    TThread.Synchronize(nil,
      procedure
      begin
        FLogRequestRichEdit.Lines.Add(AStr);
      end
    );
  end;
end;

procedure TMqttClass.LogRequest(const AIdBytes: TIdBytes);
begin
  if Assigned(FLogRequestRichEdit) then begin
    TThread.Synchronize(nil,
      procedure
      begin
        FLogRequestRichEdit.Lines.Add(
        //BytesToStringRaw(AIdBytes)
          StrDebugable(AIdBytes)
        );
      end
    );
  end;
end;

procedure TMqttClass.LogResponse(const AStr: string);
begin
  if Assigned(FLogResponseRichEdit) then begin
    TThread.Synchronize(nil,
      procedure
      begin
        FLogResponseRichEdit.Lines.Add(AStr);
      end
    );
  end;
end;

procedure TMqttClass.LogResponse(const AIdBytes: TIdBytes);
begin
  if Assigned(FLogResponseRichEdit) then begin
    TThread.Synchronize(nil,
      procedure
      begin
        FLogResponseRichEdit.Lines.Add(
        //BytesToStringRaw(AIdBytes)
          StrDebugable(AIdBytes)
        );
      end
    );
  end;
end;

procedure TMqttClass.LogWithRequest(const AStr: string; const ARequest: TIdBytes);
begin
  Log(AStr);
  LogRequest(ARequest);
end;

procedure TMqttClass.LogWithResponse(const AStr: string; const AResponse: TIdBytes);
begin
  Log(AStr);
  LogResponse(AResponse);
end;

function  TMQTTClass.StrDebugable(const AStr: string; IvHex: boolean): string;
var
  i: integer;
  b: byte;
  c: char;
begin
  Result := '';

  for i := 1 to Length(AStr) do begin // strings are 1 indexed
    c := AStr[i];
    b := Ord(c);

    if IvHex then begin
      Result := Result + ' ' + IntToHex(b, 2);

    end else begin
      case b of
      32..255: Result := Result + ' ' + c;
      else     Result := Result + ' ' + IntToHex(b, 2); // Format('{%d}', [c])
      end;
    end;
  end;
  Delete(Result, 1, 1);
end;

function  TMQTTClass.StrDebugable(const AIdBytes: TIdBytes; IvHex: boolean): string;
var
  i: integer;
  b: byte;
begin
  Result := '';

  for i := 0 to Length(AIdBytes) -1 do begin // array are 0 indexed
    b := AIdBytes[i];

    if IvHex then begin
      Result := Result + ' ' + IntToHex(b, 2);

    end else begin
      case b of
      32..255: Result := Result + ' ' + Chr(b);
      else     Result := Result + ' ' + IntToHex(b, 2); // Format('{%d}', [c])
      end;
    end;
  end;
  Delete(Result, 1, 1);
end;

function  TMQTTClass.StrPrintable(const AStr: string): string;
var
  i, len: integer;
  c: char;
begin
  len := Length(AStr);
  if Len = 0 then
    Exit('');

  Result := AStr;
  i := 1;

  while i <= Len do begin
    // a char
    c := AStr[i];

    // 1) preserve tabs (#9), line feeds (#10), and carriage returns (#13)
    if (C = #9) or (C = #10) or (C = #13) then begin // #10#13 is a ctrl-string
      Inc(i);

    // 2) keep ASCII/extended-ASCII (#32..#255) as is
    end else if ((Ord(C) >= 32) and (Ord(C) <= 255)) then begin
      Inc(i);

    // 3) convert other whitespace to an ASCII space
    end else if c.IsWhiteSpace then begin
      Result[i] := '_';
      Inc(i);

    // 4) otherwise, skip it
    end else begin
      Result[i] := '!';
      Inc(i);
      //Delete(Result, i, 1);
      //Dec(len);
    end;
  end;
end;

procedure TMqttClass.BytAdd(const AByte: byte; var APacket: TIdBytes; var AIndex: integer);
begin
  APacket[AIndex] := AByte;
  Inc(AIndex);
end;

procedure TMqttClass.StrAdd(const AStr: ansistring; var APacket: TIdBytes; var AIndex: integer);
var
  len: word;
begin
  len := Length(AStr);
  APacket[AIndex] := Hi(len);
  Inc(AIndex);
  APacket[AIndex] := Lo(len);
  Inc(AIndex);
  Move(AStr[1], APacket[AIndex], len);
  Inc(AIndex, len);
end;

function  TMQTTClass.StrRead(AContext: TIdContext): string;
var
  rbu: TIdBytes; // lengthbytes
  stz: word; // strlen
begin
  // 2-bytes read for length
  AContext.Connection.IOHandler.ReadBytes(rbu, 2, false);
  stz := {(rbu[0] shl 8) or} rbu[1];
  // string actual read
  Result := AContext.Connection.IOHandler.ReadString(stz, IndyTextEncoding_UTF8);
end;

function  TMqttClass.IntEat(var AIdBytes: TIdBytes; ACount, ADefault: integer): integer;
var
  {i, }remaining: integer;
begin
  // init
  Result := ADefault;
  if ACount <= 0 then
    Exit;

  // adjust
  if ACount > Length(AIdBytes) then
    ACount := Length(AIdBytes);
  if ACount <= 0 then
    Exit;

  // resultload
       if ACount = 1 then
    Result := AIdBytes[0]
  else if ACount = 2 then
    Result := (AIdBytes[0] shl  8) or AIdBytes[1]
  else if ACount = 3 then
    Result := (AIdBytes[0] shl 16) or (AIdBytes[1] shl  8) or AIdBytes[2]
  else if ACount = 4 then
    Result := (AIdBytes[0] shl 24) or (AIdBytes[1] shl 16) or (AIdBytes[2] shl 8) or AIdBytes[3]
  else
    raise Exception.Create('4 bytes max can be eated');

  // remove extracted bytes from the original array
  Remaining := Length(AIdBytes) - ACount;
  if Remaining > 0 then
    Move(AIdBytes[ACount], AIdBytes[0], Remaining);
  SetLength(AIdBytes, Remaining);
end;

function  TMqttClass.StrEat(var AIdBytes: TIdBytes; ACount: integer; ADefault: string): string;
var
  i, remaining: integer;
begin
  // init
  Result := '';
  if ACount <= 0 then
    Exit;

  // adjust
  if ACount > Length(AIdBytes) then
    ACount := Length(AIdBytes);
  if ACount <= 0 then
    Exit;

  // resultload
  SetLength(Result, ACount);
  for i := 0 to ACount - 1 do
    Result[i + 1] := Char(AIdBytes[i]);

  // remove extracted bytes from the original array
  Remaining := Length(AIdBytes) - ACount;
  if Remaining > 0 then
    Move(AIdBytes[ACount], AIdBytes[0], Remaining);
  SetLength(AIdBytes, Remaining);
end;
*)
{$ENDREGION}

{$REGION 'Zzz'}
{
  procedure BytesSplitAtNullChar(const fullpacket: TIdBytes; var AIdBytesVec: TBytesVec);
  var
    i: int64;
    bts: TIdBytes;
  begin
    SetLength(AIdBytesVec, 0);
    SetLength(bts, 0);
    for i := Low(fullpacket) to High(fullpacket) do begin
      if (fullpacket[i] <> $0) and (i <= High(fullpacket)) then begin
        SetLength(bts, Length(bts) + 1);
        bts[High(bts)] := fullpacket[i];
      end else begin
        SetLength(bts, Length(bts) + 1);
        bts[High(bts)] := $0;
        SetLength(AIdBytesVec, Length(AIdBytesVec) + 1);
        AIdBytesVec[High(AIdBytesVec)] := bts;
        SetLength(bts, 0);
      end;
    end;
  end;
}
{$ENDREGION}

end.
