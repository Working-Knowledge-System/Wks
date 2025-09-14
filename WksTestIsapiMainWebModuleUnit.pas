unit WksTestIsapiMainWebModuleUnit;

interface

uses
  System.SysUtils, System.Classes, System.DateUtils, Web.HTTPApp;

type
  TMainWebModule = class(TWebModule)
    procedure MainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TMainWebModule;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TMainWebModule.MainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>'
  + '<head><title>Web Server Application</title></head>'
  + '<body>'
  + Format('Wks Test Web Application Server - %s', [FormatDateTime('yyyy/mm/dd hh:nn:ss.zzz', Now)])
  + '</body>'
  + '</html>';
end;

end.
