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
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  AfterDispatch = WebModuleAfterDispatch
  OnException = WebModuleException
  Height = 230
  Width = 415
end
