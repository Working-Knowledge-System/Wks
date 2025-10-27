unit WksIsapiLoaderLogUnit;

interface

{$IFDEF DEBUGLOG}
uses
  AppDirectories;
{$ENDIF}

var
  Counter: integer = 0;
  LastTickCount: LongWord = 0;

procedure AddToLog(Msg: string;const Params: array of const); overload;
procedure AddToLog(Msg: string); overload;

implementation
{$IFDEF DEBUGLOG}
uses
  SyncObjs, Classes, SysUtils, Windows;

var
  GStarted: boolean = false;
  GShutdown: boolean = false;
  Gate: TCriticalSection;
  GNoWrite: TStringList;
  FBaseLogDir: string = '';
  FName: string = '';
  FDay: integer = -1;
{$ENDIF}

procedure AddToLog(Msg: string); overload;
begin
{$IFDEF DEBUGLOG}
  AddToLog(Msg, []);
{$ENDIF}
end;

{$IFDEF DEBUGLOG}
procedure EraseOldFiles;
var
  S: TSearchRec;
  D, Today: TDateTime;
begin
  if FindFirst(FBaseLogDir + '????_??_??_LOG.txt', faAnyFile, S) = 0 then
  try
    Today:= Now();
    repeat
      D := EncodeDate(
        StrToInt(Copy(S.Name, 1, 4)),
        StrToInt(Copy(S.Name, 6, 2)),
        StrToInt(Copy(S.Name, 9, 2))
      );
      if (Today - D) > 30 then
        SysUtils.DeleteFile(FBaseLogDir + S.Name);
    until FindNext(S) <> 0;
  finally
    SysUtils.FindClose(S);
  end;
end;
{$ENDIF}

procedure AddToLog(Msg: string;const Params: array of const);
{$IFDEF DEBUGLOG}
const
  HrToTime  = 1/24;
  MinToHour = 1/60;
  SecToMin  = 1/60;
  MsToSec   = 1/1000;
 
  MsToTime = MsToSec * SecToMin * MinToHour * HrToTime;

  function  ThisUser: string;
  var
    L: LongWord;
  begin
    L := 100;
    SetLength(Result, L);
    GetUsername(PChar(Result), L);
    SetLength(Result, L-1);
  end;

  function  StripStart0(TimeText: string): string;
  var
    i: integer;
  begin
    Result := TimeText;
    for i:= 1 to Length(Result) do
      if Result[i = '0' then
        Result[i]:= ' '
      else if Result[i] in ['1'..'9'] then
        Break;
  end;

var
  F: TFileStream;
  procedure WriteTextLine(T: string);
  var
    TC: LongWord;
    RestartText: string;
    ThreadID: DWORD;
  begin
    ThreadID:= GetCurrentThreadId;
    if GNoWrite.Count > 0 then
      T := GNoWrite.Text + #13#10 + T;
    TC := GetTickCount;
    if Counter = 0 then
      RestartText:= #13#10'------RESTART '+FormatDateTime('dddd, mmmm d, yyyy:  t', Now)+'------'#13#10#13#10
    else
      RestartText := '';
    T := RestartText + Format('***%5d %s %s>(Thread:%x) %s'#13#10, [Counter, StripStart0(FormatDateTime('hh:nn:ss.zzz', (TC-LastTickCount)*MsToTime)), FormatDateTime('ddd hh:nn:ss.zzz A/P', Now()), ThreadID, T]);
  //T := '***'+IntToStr(Counter)+'-'+IntToStr(TC)+'-'+IntToStr(TC-LastTickCount)+'['+FormatDateTime('ddd hh:nn:ss.zzz', Now())+']'+'> '+T+#13#10;
    F.WriteBuffer(Pointer(T)^, Length(T));
    Inc(Counter);
    LastTickCount := TC;
    GNoWrite.Clear;
  end;

  procedure AdjustLogFileName;
  var
    D, M, Y: Word;
    ThisTime: TDateTime;
  begin
    ThisTime := Now();
    DecodeDate(ThisTime, Y, M, D);
    if D <> FDay then
      FName := FBaseLogDir + Format('%d_%.2d_%.2d_LOG.txt', [Y, M, D]);
  end;
{$ENDIF}
begin
  {$IFDEF DEBUGLOG}
  if GShutdown then
    Exit;
  Gate.Enter;
  try
    try
      AdjustLogFileName;

      if not GStarted then begin
        EraseOldFiles;
        GStarted:= true;
      end;

      Msg := ThisUser + ': ' + Msg;
      if FileExists(FName) then
        F := TFileStream.Create(FName, fmOpenReadWrite or fmShareDenyWrite)
      else
        F := TFileStream.Create(FName, fmCreate or fmShareDenyWrite);

      try
        F.Seek(0, soFromEnd);
        if Length(Params) = 0 then
          WriteTextLine(Msg)
        else
          WriteTextLine(Format(Msg, Params));
      finally
        F.Free;
      end;
    except
      on E: Exception do begin
        GNoWrite.Add(E.ClassName + '=' + E.Message + '; WinErr=' + SysErrorMessage(GetLastError) +'; Msg=' + Format(Msg, Params) + ';');
      //raise;
      end;
    end;
  finally
    Gate.Leave;
  end;
  {$ENDIF}
end;

initialization
{$IFDEF DEBUGLOG}
  GNoWrite := TStringList.Create;
  Gate := TCriticalSection.Create;
  with TAppDirectories.Create do
  try
    FBaseLogDir := DebugLog;
  finally
    Free;
  end;
{$ENDIF}

finalization
{$IFDEF DEBUGLOG}
  GShutdown := true;
  try
    Gate.Free;
    GNoWrite.Free;
  except
  end;
{$ENDIF}

end.
