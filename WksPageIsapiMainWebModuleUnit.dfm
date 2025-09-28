object MainWebModule: TMainWebModule
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = MainWebModuleDefaultHandlerAction
    end
    item
      Name = 'InfoWebAction'
      PathInfo = '/Info'
      OnAction = MainWebModuleInfoWebActionAction
    end
    item
      Name = 'InitWebAction'
      PathInfo = '/Init'
      OnAction = MainWebModuleInitWebActionAction
    end
    item
      Name = 'TestWebAction'
      PathInfo = '/Test'
      OnAction = MainWebModuleTestWebActionAction
    end
    item
      Name = 'ThemeWebAction'
      PathInfo = '/Theme'
      OnAction = MainWebModuleThemeWebActionAction
    end
    item
      Name = 'ViewWebAction'
      PathInfo = '/View'
      OnAction = MainWebModuleViewWebActionAction
    end
    item
      Name = 'LoginWebAction'
      PathInfo = '/Login'
      OnAction = MainWebModuleLoginWebActionAction
    end
    item
      Name = 'LoginTryWebAction'
      PathInfo = '/LoginTry'
      OnAction = MainWebModuleLoginTryWebActionAction
    end
    item
      Name = 'LogoutWebAction'
      PathInfo = '/Logout'
      OnAction = MainWebModuleLogoutWebActionAction
    end
    item
      Name = 'AccountCreateWebAction'
      PathInfo = '/AccountCreate'
      OnAction = MainWebModuleAccountCreateWebActionAction
    end
    item
      Name = 'AccountRecoverWebAction'
      PathInfo = '/AccountRecover'
      OnAction = MainWebModuleAccountRecoverWebActionAction
    end
    item
      Name = 'AccountDeleteWebAction'
      PathInfo = '/AccountDelete'
      OnAction = MainWebModuleAccountDeleteWebActionAction
    end
    item
      Name = 'ReportWebAction'
      PathInfo = '/Report'
      OnAction = MainWebModuleReportWebActionAction
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  AfterDispatch = WebModuleAfterDispatch
  OnException = WebModuleException
  Height = 230
  Width = 415
end
