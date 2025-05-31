object AgentService: TAgentService
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'WKS Agent Service'
  BeforeInstall = ServiceBeforeInstall
  AfterInstall = ServiceAfterInstall
  BeforeUninstall = ServiceBeforeUninstall
  AfterUninstall = ServiceAfterUninstall
  OnContinue = ServiceContinue
  OnExecute = ServiceExecute
  OnPause = ServicePause
  OnShutdown = ServiceShutdown
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 480
  Width = 640
  object ServiceRunningTimer: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = ServiceRunningTimerTimer
    Left = 88
    Top = 56
  end
end
