unit WksIsapiLoaderTimerUnit;

interface

uses
    Winapi.Windows
  , System.Classes
  , System.SysUtils
  , System.SyncObjs
  , WksIsapiLoaderLogUnit
  , WksIsapiLoaderThreadImpersonateUnit
  ;

type
  TIntervalCallback = procedure of object;

  TIntervalTimer = class(TThreadImpersonate)
  private
    FIntervalCallback: TIntervalCallback;
    FActive, FResetDelay: boolean;
    FInterval: LongWord;
    FLock: TMultiReadExclusiveWriteSynchronizer;
    FActiveEvent: TSimpleEvent;
    FDone: boolean;
    function  GetActive: boolean;
    function  GetInterval: LongWord;
    function  GetResetDelay: boolean;
    procedure SetResetDelay(const Value: boolean);
    procedure SetActive(const Value: boolean);
    procedure SetInterval(const Value: LongWord);
  protected
    procedure Execute; override;
  public
    procedure Synchronize(Method: TThreadMethod);
    constructor Create(AIntervalCallback: TIntervalCallback; ALogDesc: string);
    destructor Destroy; override;
    property Active: boolean read GetActive write SetActive;
    property Interval: LongWord read GetInterval write SetInterval;
  end;

implementation

const
  MaxSleepInterval = 100;

{ TIntervalTimer }

constructor TIntervalTimer.Create(AIntervalCallback: TIntervalCallback; ALogDesc: string);
var
  ErrIndex: integer;
begin
  ErrIndex:= 0;
  AddToLog('TIntervalTimer(%p).Create: %s', [Pointer(Self), ALogDesc]);
  try
    FInterval:= 1000;
    FLock:= TMultiReadExclusiveWriteSynchronizer.Create;
    FActive:= False;
    FActiveEvent:= TSimpleEvent.Create;
    FActiveEvent.ResetEvent;
    FIntervalCallback:= AIntervalCallback;
    inherited Create(False);
  except
    on E: Exception do begin
      AddToLog('TIntervalTimer exception in create; ErrIndex=%d; %s:"%s"', [ErrIndex, E.ClassName, E.Message]);
      raise;
    end;
  end;
end;

destructor TIntervalTimer.Destroy;
begin
  AddToLog('BEGIN TIntervalTimer(%p).Destroy', [Pointer(Self)]);
  Terminate;
  FActiveEvent.SetEvent;
  while not FDone do begin
    AddToLog('Waiting to finish...');
    Sleep(100);
  end;
  inherited;
  FLock.Free;
  FActiveEvent.Free;
  AddToLog('END TIntervalTimer.Destroy');
end;

procedure TIntervalTimer.Execute;
var
  SleepRemain, TimeToSleep: LongInt;
  DropOut: boolean;
begin
  Impersonate;
  AddToLog('Start TIntervalTimer(%p).Execute', [Pointer(Self)]);
  while not Terminated do begin
    try
      if FActiveEvent.WaitFor(MaxSleepInterval) = wrSignaled then begin
        if Terminated then
          Break;

        SetResetDelay(False);
        DropOut:= False;
        SleepRemain:= GetInterval;
        while SleepRemain > 0 do begin
          if SleepRemain > MaxSleepInterval then
            TimeToSleep:= MaxSleepInterval
          else
            TimeToSleep:= SleepRemain;
          Dec(SleepRemain, TimeToSleep);
          Sleep(TimeToSleep);
          DropOut:= (not GetActive) or GetResetDelay or Terminated;
          if DropOut then
            Break;
        end;
        if not DropOut then
          FIntervalCallback;
      end;
    except
      on E: Exception do begin
        AddToLog('Thread Exception %s:%s', [E.ClassName, E.Message]);
      end;
//      raise;
      // Nothing - if it is raised then the app terminates
    end;
  end;
  AddToLog('END TIntervalTimer(%p).Execute', [Pointer(Self)]);
  FDone := true;
end;

function  TIntervalTimer.GetActive: boolean;
begin
  FLock.BeginRead;
  try
    Result:= FActive;
  finally
    FLock.EndRead;
  end;
end;

function  TIntervalTimer.GetInterval: LongWord;
begin
  FLock.BeginRead;
  try
    Result:= FInterval;
  finally
    FLock.EndRead;
  end;
end;

function  TIntervalTimer.GetResetDelay: boolean;
begin
  FLock.BeginRead;
  try
    Result:= FResetDelay;
  finally
    FLock.EndRead;
  end;
end;

procedure TIntervalTimer.SetActive(const Value: boolean);
begin
  FLock.BeginWrite;
  try
    FActive:= Value;
    if not FActive then
      FResetDelay:= true;
    if FActive then
      FActiveEvent.SetEvent
    else
      FActiveEvent.ResetEvent;
  finally
    FLock.EndWrite;
  end;
end;

procedure TIntervalTimer.SetInterval(const Value: LongWord);
begin
  FLock.BeginWrite;
  try
    if FInterval <> Value then begin
      FInterval:= Value;
      FResetDelay:= true;
    end;
  finally
    FLock.EndWrite;
  end;
end;

procedure TIntervalTimer.SetResetDelay(const Value: boolean);
begin
  FLock.BeginWrite;
  try
    FResetDelay:= Value;
  finally
    FLock.EndWrite;
  end;
end;

procedure TIntervalTimer.Synchronize(Method: TThreadMethod);
begin
  inherited Synchronize(Method);
end;

end.
