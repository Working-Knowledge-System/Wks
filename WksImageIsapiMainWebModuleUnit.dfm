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
      Name = 'ImageWebAction'
      PathInfo = '/Image'
      OnAction = MainWebModuleImageWebActionAction
    end
    item
      Name = 'PersonWebAction'
      PathInfo = '/Person'
      OnAction = MainWebModulePersonWebActionAction
    end
    item
      Name = 'UserWebAction'
      PathInfo = '/User'
      OnAction = MainWebModuleUserWebActionAction
    end
    item
      Name = 'MemberWebAction'
      PathInfo = '/Member'
      OnAction = MainWebModuleMemberWebActionAction
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  AfterDispatch = WebModuleAfterDispatch
  OnException = WebModuleException
  Height = 230
  Width = 415
end
