object MainWebModule: TMainWebModule
  OnCreate = MainWebModuleCreate
  OnDestroy = MainWebModuleDestroy
  Actions = <
    item
      Default = True
      Name = 'Item1WebAction'
      OnAction = MainWebModuleItem1WebActionAction
    end>
  Height = 150
  Width = 215
end
