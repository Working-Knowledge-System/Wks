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
      Name = 'DatalogSelectWebAction'
      PathInfo = '/DatalogSelect'
      OnAction = MainWebModuleDatalogSelectWebActionAction
    end
    item
      Name = 'DatalogInsertWebAction'
      PathInfo = '/DatalogInsert'
      OnAction = MainWebModuleDatalogInsertWebActionAction
    end
    item
      Name = 'DatalogDeleteWebAction'
      PathInfo = '/DatalogDelete'
      OnAction = MainWebModuleDatalogDeleteWebActionAction
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  AfterDispatch = WebModuleAfterDispatch
  OnException = WebModuleException
  Height = 230
  Width = 415
end
