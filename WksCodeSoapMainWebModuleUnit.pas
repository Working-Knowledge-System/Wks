unit WksCodeSoapMainWebModuleUnit;

interface

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , System.TypInfo
  , Soap.InvokeRegistry
  , Soap.SOAPHTTPDisp
  , Soap.SOAPHTTPPasInv
  , Soap.SOAPPasInv
  , Soap.WSDLBind
  , Soap.WSDLIntf
  , Soap.WSDLPub
  , Soap.WebBrokerSOAP
  , Soap.WebServExp
  , Web.HTTPApp
  , Xml.XMLSchema
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TCodeMainWebModule = class(TWebModule)
    HTTPSoapDispatcher1: THTTPSoapDispatcher;
    HTTPSoapPascalInvoker1: THTTPSoapPascalInvoker;
    WSDLHTMLPublish1: TWSDLHTMLPublish;
    procedure CodeMainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  WebModuleClass: TComponentClass = TCodeMainWebModule;
{$ENDREGION}

implementation

{$REGION 'Use'}
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
{$ENDREGION}

{$REGION 'Pages'}
procedure TCodeMainWebModule.CodeMainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  WSDLHTMLPublish1.ServiceInfo(Sender, Request, Response, Handled);
end;
{$ENDREGION}

end.
