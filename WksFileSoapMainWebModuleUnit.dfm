object FileMainWebModule: TFileMainWebModule
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = FileMainWebModuleDefaultHandlerAction
    end
    item
      Name = 'FileListWebAction'
      PathInfo = '/FileList'
      OnAction = FileMainWebModuleFileListWebActionAction
    end
    item
      Name = 'FileGetWebAction'
      PathInfo = '/FileGet'
      OnAction = FileMainWebModuleFileGetWebActionAction
    end
    item
      Name = 'FileSaveWebAction'
      PathInfo = '/FileSave'
      OnAction = FileMainWebModuleFileSaveWebActionAction
    end>
  Height = 230
  Width = 415
  object HTTPSoapDispatcher1: THTTPSoapDispatcher
    Dispatcher = HTTPSoapPascalInvoker1
    WebDispatch.PathInfo = 'soap*'
    Left = 60
    Top = 11
  end
  object HTTPSoapPascalInvoker1: THTTPSoapPascalInvoker
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soUTF8InHeader]
    Left = 60
    Top = 67
  end
  object WSDLHTMLPublish1: TWSDLHTMLPublish
    WebDispatch.MethodType = mtAny
    WebDispatch.PathInfo = 'wsdl*'
    TargetNamespace = 'http://tempuri.org/'
    PublishOptions = [poUTF8ContentType]
    Left = 60
    Top = 123
  end
end
