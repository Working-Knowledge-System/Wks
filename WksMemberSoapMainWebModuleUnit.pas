unit WksMemberSoapMainWebModuleUnit;

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
  TMemberMainWebModule = class(TWebModule)
    HTTPSoapDispatcher1: THTTPSoapDispatcher;
    HTTPSoapPascalInvoker1: THTTPSoapPascalInvoker;
    WSDLHTMLPublish1: TWSDLHTMLPublish;
    procedure MemberMainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  WebModuleClass: TComponentClass = TMemberMainWebModule;
{$ENDREGION}

implementation

{$REGION 'Use'}
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
{$ENDREGION}

{$REGION 'Pages'}
procedure TMemberMainWebModule.MemberMainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  WSDLHTMLPublish1.ServiceInfo(Sender, Request, Response, Handled);
end;
{$ENDREGION}

end.
