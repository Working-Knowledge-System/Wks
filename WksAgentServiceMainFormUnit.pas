unit WksAgentServiceMainFormUnit;

interface

{$REGION 'Help'}
{
  TService Properties
  ===================
  AllowPause (boolean)          : Indicates whether the service can be paused and resumed
                                  If set to True, the service can respond to pause and continue requests
  AllowStop (boolean)           : Indicates whether the service can be stopped
                                  If set to True, the service can respond to stop requests
  Dependencies                  : ?
  DisplayName (string)          : The display name of the service
                                  This is the name shown in the Windows Services Manager
  ErrorSeverity                 : ?
  Interactive (boolean)         : Indicates whether the service can interact with the user by displaying a user interface
                                  Setting this property to True allows the service to interact with the desktop,
                                  although this is generally not recommended for security reasons and may not work on newer versions of Windows
  LoadGroup                     : ?
  Name (string)                 : The internal name of the service
                                  This is the unique name used to identify the service within the app
  Password                      : password for the user account specified in the ServiceStartName
  ServiceStartname              : This is the account under which the service will execute (format: MyDomain\MyAccount)
  ServiceType (TServiceType)    : Indicates the type of service
                                  TServiceType is an enumerated type with possible values such as:
                                  - stWin32             (default)
                                  - stDevice
                                  - stFileSystem
                                  - stWin32OwnProcess
                                  - stWin32ShareProcess
                                  which specify the nature of the service
  StartType (TServiceStartType) : Specifies the start mode of the service
                                  TServiceStartType is an enumerated type with possible values such as:
                                  - stAuto
                                  - stBoot
                                  - stDemand
                                  - stManual
                                  - stDisabled
                                  - stSystem
                                  This determines how and when the service starts
  Tag (NativeInt)               : extra custom data
  TagID (NativeInt)             : is the unique tag value for this service in its LoadGroup
                                  If no tag is requested, this property is 0
                                  Tags are only evaluated when the ServiceType is not stWin32 and the StartType is stBoot or stSystem
  WaitHint (integer)            : ?

  Methods ???
  =======
  Install:     Installs the service on the system
  Uninstall:   Uninstalls the service from the system
  Start:       Starts the service
  Stop:        Stops the service
  Pause:       Pauses the service
  Continue:    Resumes a paused service
}
{$ENDREGION}

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.Classes
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.SvcMgr
  , Vcl.Dialogs
  , Vcl.ExtCtrls
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TAgentService = class(TService)
    ServiceRunningTimer: TTimer;
    procedure ServiceBeforeInstall(Sender: TService);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceBeforeUninstall(Sender: TService);
    procedure ServiceAfterUninstall(Sender: TService);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceDestroy(Sender: TObject);
    procedure ServiceShutdown(Sender: TService);
    procedure ServicePause(Sender: TService; var Paused: boolean);
    procedure ServiceContinue(Sender: TService; var Continued: boolean);
    procedure ServiceStart(Sender: TService; var Started: boolean);
    procedure ServiceStop(Sender: TService; var Stopped: boolean);
    procedure ServiceExecute(Sender: TService);
    procedure ServiceRunningTimerTimer(Sender: TObject);
  private
    { Private declarations }
    procedure ServiceDescriptionSet;
  public
    { Public declarations }
    function GetServiceController: TServiceController; override;
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  AgentService: TAgentService;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    System.Win.Registry
  , ujachLogAuto
  , ujachLogMgr
  ;
{$ENDREGION}

{$REGION 'Controller'}
procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  AgentService.Controller(CtrlCode);
end;

function TAgentService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;
{$ENDREGION}

{$REGION 'Routine'}
procedure TAgentService.ServiceDescriptionSet;
var
  reg: TRegistry;
begin
  try
    reg := TRegistry.Create(KEY_READ or KEY_WRITE);
    try
      reg.RootKey := HKEY_LOCAL_MACHINE;
      if reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, false) then
        reg.WriteString('Description', 'Wks Agent Service continuosly starts agents at specific scheduled time');
    finally
      reg.Free;
    end;
  except
    on e: Exception do
      jachLog.LogError('Could not set Wks Agent service description, error:', e);
  end;
end;
{$ENDREGION}

{$REGION 'Timer'}
procedure TAgentService.ServiceRunningTimerTimer(Sender: TObject); // execute when the service is active and the ServiceExecute() routine is executed in a while loop
begin
  jachLog.LogInfo('"%s" service is still running', [DisplayName]);
end;
{$ENDREGION}

{$REGION 'Create/Destroy/Shutdown'}
procedure TAgentService.ServiceCreate(Sender: TObject);
begin
  //jachLog.LogAlert('"%s" service created', [DisplayName]);
end;

procedure TAgentService.ServiceDestroy(Sender: TObject);
begin
  //jachLog.LogAlert('"%s" service destroyed', [DisplayName]);
end;

procedure TAgentService.ServiceShutdown(Sender: TService);
begin
  jachLog.LogAlert('"%s" service shutdown', [DisplayName]);
end;
{$ENDREGION}

{$REGION 'Install/Uninstall'}

  {$REGION 'installs the service on the operating system'}
procedure TAgentService.ServiceBeforeInstall(Sender: TService);
begin
  jachLog.LogInfo('"%s" service is being installed', [DisplayName]);
end;

procedure TAgentService.ServiceAfterInstall(Sender: TService);
begin
  ServiceDescriptionSet;
  jachLog.LogInfo('"%s" service installed succesfully', [DisplayName]);
end;
  {$ENDREGION}

  {$REGION 'disinstalls the service from the operating system'}
procedure TAgentService.ServiceBeforeUninstall(Sender: TService);
begin
  jachLog.LogAlert('"%s" service is being uninstalled', [DisplayName]);
end;

procedure TAgentService.ServiceAfterUninstall(Sender: TService);
begin
  jachLog.LogAlert('"%s" service uninstalled succesfully', [DisplayName]);
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Pause/Continue'}
procedure TAgentService.ServicePause(Sender: TService; var Paused: boolean); // occurs when the service is paused
begin
  try
    jachLog.LogAlert('"%s" service is pausing', [DisplayName]);
    ServiceRunningTimer.Enabled := false;
    Paused := True;
    jachLog.LogInfo('"%s" service is paused succesfully', [DisplayName]);
  except
    on E: Exception do
    begin
      Paused := False;
      jachLog.LogError('Error pausing the "%s" service', [DisplayName], E);
    end;
  end;
end;

procedure TAgentService.ServiceContinue(Sender: TService; var Continued: boolean); // occurs when a paused service is resumed
begin
  try
    jachLog.LogAlert('"%s" service is continuing', [DisplayName]);
    ServiceRunningTimer.Enabled := true;
    Continued := True;
    jachLog.LogInfo('"%s" service continued succesfully', [DisplayName]);
  except
    on E: Exception do
    begin
      Continued := False;
      jachLog.LogError('Error while continuing the "%s" service', [DisplayName], E);
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Start/Stop'}
procedure TAgentService.ServiceStart(Sender: TService; var Started: boolean); // occurs when the service starts
begin
  try
    jachLog.LogInfo('"%s" service starting', [DisplayName]);
    ServiceRunningTimer.Enabled := true;
    Started := true;
    jachLog.LogInfo('"%s" service started succesfully', [DisplayName]);
  except
    on E: Exception do
    begin
      Started := false;
      jachLog.LogCritical('Error starting the "%s" service', [DisplayName], E);
    end;
  end;
end;

procedure TAgentService.ServiceStop(Sender: TService; var Stopped: boolean); // occurs when the service stops
begin
  try
    jachLog.LogAlert('"%s" service stoping', [DisplayName]);
    ServiceRunningTimer.Enabled := False;
    Stopped := true;
    jachLog.LogAlert('"%s" service stopped succesfully', [DisplayName]);
  except
    on E: Exception do
    begin
      Stopped := false;
      jachLog.LogCritical('Error stopping the "%s" service', [DisplayName], E);
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Execute'}
procedure TAgentService.ServiceExecute(Sender: TService); // occurs when the service executes
begin
  jachLog.LogAlert('"%s" service is executing', [DisplayName]);

  // this is typically where the main functionality of the service is implemented
  while not Self.Terminated do begin

    {$REGION 'MainTask'}
    // query db for active agents
    // ...

    // create thread for each agent
    // ...

    // start each of them
    {$ENDREGION}

    // ensures the service can respond to control requests from the Service Control Manager
    Self.ServiceThread.ProcessRequests(false);

    // sleep/trottle
    sleep(100);
  end;

  // methods
end;
{$ENDREGION}

end.
