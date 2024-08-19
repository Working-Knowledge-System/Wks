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
      Name = 'SelectWebAction'
      PathInfo = '/Select'
      OnAction = MainWebModuleSelectWebActionAction
    end
    item
      Name = 'InsertWebAction'
      PathInfo = '/Insert'
      OnAction = MainWebModuleInsertWebActionAction
    end
    item
      Name = 'UpdateWebAction'
      PathInfo = '/Update'
      OnAction = MainWebModuleUpdateWebActionAction
    end
    item
      Name = 'DeleteWebAction'
      PathInfo = '/Delete'
      OnAction = MainWebModuleDeleteWebActionAction
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  AfterDispatch = WebModuleAfterDispatch
  OnException = WebModuleException
  Height = 230
  Width = 415
end
