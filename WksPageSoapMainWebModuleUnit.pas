unit WksPageSoapMainWebModuleUnit;

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
  TPageMainWebModule = class(TWebModule)
    HTTPSoapDispatcher1: THTTPSoapDispatcher;
    HTTPSoapPascalInvoker1: THTTPSoapPascalInvoker;
    WSDLHTMLPublish1: TWSDLHTMLPublish;
    procedure PageMainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  WebModuleClass: TComponentClass = TPageMainWebModule;
{$ENDREGION}

implementation

{$REGION 'Use'}
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
{$ENDREGION}

{$REGION 'Pages'}
procedure TPageMainWebModule.PageMainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WSDLHTMLPublish1.ServiceInfo(Sender, Request, Response, Handled);
end;
{$ENDREGION}

end.
