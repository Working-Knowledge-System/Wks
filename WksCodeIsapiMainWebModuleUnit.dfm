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
      Name = 'CodeWebAction'
      PathInfo = '/Code'
      OnAction = MainWebModuleCodeWebActionAction
    end
    item
      Name = 'LibraryWebAction'
      PathInfo = '/Library'
      OnAction = MainWebModuleLibraryWebActionAction
    end
    item
      Name = 'VolatileWebAction'
      PathInfo = '/Volatile'
      OnAction = MainWebModuleVolatileWebActionAction
    end
    item
      Name = 'CssWebAction'
      PathInfo = '/Css'
      OnAction = MainWebModuleCssWebActionAction
    end
    item
      Name = 'JsWebAction'
      PathInfo = '/Js'
      OnAction = MainWebModuleJsWebActionAction
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  AfterDispatch = WebModuleAfterDispatch
  OnException = WebModuleException
  Height = 230
  Width = 415
end
