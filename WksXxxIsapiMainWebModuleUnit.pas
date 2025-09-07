unit WksXxxIsapiMainWebModuleUnit;

interface

{$REGION 'Help'}
{                                request
                                    |
                                    V
  -----------------------------------------------------------------------------------
 |                           BeforeDispatch                                          |
 |  - here the event can enable or disable the actionitems suitable to the response  |
 |  - can begin filling out the response object                                      |
 |  - can provide any other necessary preprocessing objects                          |
 |  If the event finishes filling out the response object,                           |
 |  it should change the Handled parameter to True so the dispatcher                 |
 |  will not send the request on to any of the actionitems                           |
 |  If the BeforeDispatch event handler sends the response message,                  |
 |  the dispatcher will not pass the request on to any of the action items,          |
 |  even if the Handled parameter is left as False                                   |
 |  If the BeforeDispatch event handler sets the Handled parameter to True but does  |
 |  not send the response, the Web dispatcher will generate an AfterDispatch event   |
  -----------------------------------------------------------------------------------
 |                             Dispatcher                                            |
 |  the dispatcher tries to match the HTTP request                                   |
 |  PathInfo with any PathInfo of the action items                                   |
 |                                                                                   |
 |                       /  webaction1/PathInfo1                                     |
 |  request/PathInfo--->|   webaction1/PathInfo2                                     |
 |                       \  webaction1/PathInfo...                                   |
 |                                                                                   |
 |  here the dispatcher/actionitem process the request and fill out the response obj |
  -----------------------------------------------------------------------------------
 |                            AfterDispatch                                          |
 |  It is used to perform any necessary cleanup or logging                           |
  -----------------------------------------------------------------------------------
 |                             BeforeSend (non trovo nulla!)                         |
 |  The OnBeforeSend event occurs just before sending a response back to the client  |
 |  It is used to modify or add headers to a response                                |
  -----------------------------------------------------------------------------------
                                    |
                                    V
                                 response
}
{$ENDREGION}

{$REGION 'Use'}
uses
    System.SysUtils
  , System.Classes
  , Web.HTTPApp
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TMainWebModule = class(TWebModule)
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
    procedure WebModuleException(Sender: TObject; E: Exception; var Handled: boolean);
    procedure WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure WebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleInfoWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
  private
    { Private declarations }
  //FIni: TIniCls;
    FTic: TTicRec;
    FWrq: TWrqRec;
    FWmoRec: TWmoRec;
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  WebModuleClass: TComponentClass = TMainWebModule;
{$ENDREGION}

implementation

{$REGION 'Use'}
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

//uses
//    Data.DB
//  ;
{$ENDREGION}

{$REGION 'TMainWebModule'}

  {$REGION 'Events'}
procedure TMainWebModule.WebModuleCreate(Sender: TObject);
begin

  {$REGION 'Commands'}
  SetLength(FWmoRec.CmdRecVec, 3);
  FWmoRec.CmdRecVec[0].Cmd         := '/';
  FWmoRec.CmdRecVec[0].Description := 'Default handler';
  
  FWmoRec.CmdRecVec[1].Cmd         := '/Info';
  FWmoRec.CmdRecVec[1].Description := 'Describe module''s info and capabilities (this page)';

  FWmoRec.CmdRecVec[2].Cmd         := '/Xxx';
  FWmoRec.CmdRecVec[2].Description := 'Xxx main handler';
  {$ENDREGION}

  {$REGION 'Objects'}
  FWmoRec.Run := 0;
//FIni := TIniCls.Create;
  {$ENDREGION}

  {$REGION 'Events'}
  FWmoRec.OnWebModuleCreate;
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleDestroy(Sender: TObject);
begin

  {$REGION 'Objects'}
//FIni.Free;
  {$ENDREGION}

  {$REGION 'Events'}
  FWmoRec.OnWebModuleDestroy;
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleException(Sender: TObject; E: Exception; var Handled: boolean);
begin
  FWmoRec.OnWebModuleException(Response, E);
  Handled := true;
end;

procedure TMainWebModule.WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  Inc(FWmoRec.Run);                                      // comment if useless
  FWmoRec.BeforeDispatch(Request, Response, FWrq, FTic); // comment to skip session/request flow
//gwrq.WebRequestOrig := Request; // cagnolina           // uncomment if revious is commented


  {$REGION 'CustomHeader'}
  // handle here specific CustomHeader for all webactions or at beginning of each specific webaction
  // standard ones like "Expires" and "Access-Control-Allow-Origin" are already handled in TWmoRec.BeforeDispatch

  // client no page cache (date in the past for not caching, date in the future a little bit for chaching in the client)
  //Response.SetCustomHeader('???', '???');
  {$ENDREGION}

  {$REGION 'ActionAvailabilityLogic'}
//TMainWebModule(Sender).Actions.Items[0].Enabled := false; // /      DefaultHandler
//TMainWebModule(Sender).Actions.Items[1].Enabled := false; // /Info  InfoWebAction
//TMainWebModule(Sender).Actions.Items[2].Enabled := false; // /Xxx   Xxx main handler
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  FWmoRec.AfterDispatch(Request, Response, FWrq, FTic); // comment to skip session/request flow
end;
  {$ENDREGION}

  {$REGION 'Actions'}

    {$REGION 'Standard'}
procedure TMainWebModule.MainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageDefault);
end;

procedure TMainWebModule.MainWebModuleInfoWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  vec: TArray<string>;
  i: integer;
begin
  SetLength(vec, Length(FWmoRec.CmdRecVec));
  for i := 0 to High(FWmoRec.CmdRecVec) do
    vec[i] := FWmoRec.CmdRecVec[i].Cmd;

  TWrsRec.ResponseSet(Response, TJteRec.ServerInfo('Serves dynamic web Xxx''s', 'Web Broker Isapi', vec), TCtyRec.CTY_APP_JSON);
end;
    {$ENDREGION}

    {$REGION 'Xxx'}
    {$ENDREGION}

  {$ENDREGION}

{$ENDREGION}

end.
