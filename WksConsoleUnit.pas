unit WksConsoleUnit;

interface

procedure WaitAnyKey(const TextMessage: string = ''); overload; inline;
procedure WaitAnyKey(TimeDelay: cardinal; const TextMessage: string = ''); overload; inline;
procedure WaitForKey(KeyCode: word; const TextMessage: string = ''); overload; inline;
procedure WaitForKey(KeyCode: word; TimeDelay: cardinal; const TextMessage: string = ''); overload;

implementation

uses
    System.SysUtils
  , WinAPI.Windows
  ;

type
  TTimer = record
    Started: TLargeInteger;
    Frequency: Cardinal;
  end;

var
  IsElapsed: function(const Timer: TTimer; Interval: cardinal): boolean;
  StartTimer: procedure(var Timer: TTimer);

procedure WaitAnyKey(const TextMessage: string);
begin
  WaitForKey(0, 0, TextMessage)
end;

procedure WaitAnyKey(TimeDelay: cardinal; const TextMessage: string);
begin
  WaitForKey(0, TimeDelay, TextMessage)
end;

procedure WaitForKey(KeyCode: word; const TextMessage: string);
begin
  WaitForKey(KeyCode, 0, TextMessage)
end;

procedure WaitForKey(KeyCode: word; TimeDelay: cardinal; const TextMessage: string);
var
  Handle: THandle;
  Buffer: TInputRecord;
  Counter: Cardinal;
  Timer: TTimer;
begin
  Handle := GetStdHandle(STD_INPUT_HANDLE);
  if Handle = 0 then
    RaiseLastOSError;
  if not (TextMessage = '') then
    Write(TextMessage);
  if not (TimeDelay = 0) then
    StartTimer(Timer);
  while True do begin
    Sleep(0);
    if not GetNumberOfConsoleInputEvents(Handle, Counter) then
      RaiseLastOSError;
    if not (Counter = 0) then begin
      if not ReadConsoleInput(Handle, Buffer, 1, Counter) then
        RaiseLastOSError;
      if (Buffer.EventType = KEY_EVENT) and Buffer.Event.KeyEvent.bKeyDown then
        if (KeyCode = 0) or (KeyCode = Buffer.Event.KeyEvent.wVirtualKeyCode) then
          break
    end;
    if not (TimeDelay = 0) and IsElapsed(Timer, TimeDelay) then
      break
  end
end;

function  HardwareIsElapsed(const Timer: TTimer; Interval: cardinal): boolean;
var
  Passed: TLargeInteger;
begin
  QueryPerformanceCounter(Passed);
  Result := (Passed - Timer.Started) div Timer.Frequency > Interval
end;

procedure HardwareStartTimer(var Timer: TTimer);
var
  Frequency: TLargeInteger;
begin
  QueryPerformanceCounter(Timer.Started);
  QueryPerformanceFrequency(Frequency);
  Timer.Frequency := Frequency div 1000
end;

function  SoftwareIsElapsed(const Timer: TTimer; Interval: Cardinal): boolean;
begin
  Result := (GetCurrentTime - Cardinal(Timer.Started)) > Interval
end;

procedure SoftwareStartTimer(var Timer: TTimer);
begin
  PCardinal(@Timer.Started)^ := GetCurrentTime
end;

initialization
  if QueryPerformanceCounter(PLargeInteger(@@IsElapsed)^) and QueryPerformanceFrequency(PLargeInteger(@@IsElapsed)^) then begin
    StartTimer := HardwareStartTimer;
    IsElapsed := HardwareIsElapsed
  end else begin
    StartTimer := SoftwareStartTimer;
    IsElapsed := SoftwareIsElapsed
  end

end.
