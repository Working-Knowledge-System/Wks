unit WksCodeIsapiMainWebModuleUnit;

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

  Code module
  ============
  
  supply CODE (css, csv, html, js, sql, ...) as a single block suitable for web application
  execute volatile (temporary) code
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
  EInvalidURL = class(Exception);
  EInsufficientInfo = class(Exception);

  TMainWebModule = class(TWebModule)
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
    procedure WebModuleException(Sender: TObject; E: Exception; var Handled: boolean);
    procedure WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure WebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleInfoWebActionAction(Sender: TObject;  Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleCodeWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleLibraryWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleVolatileWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleCssWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleJsWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
  private
    { Private declarations }
  //FIni: TIniCls;
    FTic: TTicRec;
  //FWrq: TWrqRec;
    FWmoRec: TWmoRec;
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  WebModuleClass: TComponentClass = TMainWebModule;
{$ENDREGION}

const
  MODULE_USE_ON_METHODS = false;

implementation

{$REGION 'Use'}
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
    Winapi.Windows
  , System.Variants
  , Web.WebBroker
  , Web.Win.ISAPIHTTP
  , Data.DB
  , System.JSON
//, System.Diagnostics
//, System.NetEncoding
//, Web.ReqMulti // this fix the no mapping for the Unicode character exists in the target multi-byte code page
//, Web.Win.ISAPIApp
//, Web.HTTPProd
//, superobject
//, xsuperobject
//, XMLDom
//, XMLDoc
  ;
{$ENDREGION}

{$REGION 'TMainWebModule'}

  {$REGION 'Events'}
procedure TMainWebModule.WebModuleCreate(Sender: TObject);
begin

  {$REGION 'Commands'}
  SetLength(FWmoRec.CmdRecVec, 7);
  FWmoRec.CmdRecVec[0].Cmd         := '/';
  FWmoRec.CmdRecVec[0].Description := 'Default handler';
  
  FWmoRec.CmdRecVec[1].Cmd         := '/Info';
  FWmoRec.CmdRecVec[1].Description := 'Describe module''s info and capabilities (this page)';

  FWmoRec.CmdRecVec[2].Cmd         := '/Code';
  FWmoRec.CmdRecVec[2].Description := 'Serve a block of code or the result of the code execution';

  FWmoRec.CmdRecVec[3].Cmd         := '/Library';
  FWmoRec.CmdRecVec[3].Description := 'Serve an entire library, for example a js or css library, assembling sub-objects';

  FWmoRec.CmdRecVec[4].Cmd         := '/Volatile';
  FWmoRec.CmdRecVec[4].Description := 'Serve temporary code written for a specific event and has a short time to live';

  FWmoRec.CmdRecVec[5].Cmd         := '/Css';
  FWmoRec.CmdRecVec[5].Description := 'Serve a css code, obsolete';

  FWmoRec.CmdRecVec[6].Cmd         := '/Js';
  FWmoRec.CmdRecVec[6].Description := 'Serve a js code, obsolete';
  {$ENDREGION}

  {$REGION 'Objects'}
//FWmoRec.Run := 0;
//FIni := TIniCls.Create;
  {$ENDREGION}

  {$REGION 'Events'}
  if MODULE_USE_ON_METHODS then
    FWmoRec.OnWebModuleCreate;
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleDestroy(Sender: TObject);
begin

  {$REGION 'Objects'}
//FIni.Free;
  {$ENDREGION}

  {$REGION 'Events'}
  if MODULE_USE_ON_METHODS then
    FWmoRec.OnWebModuleDestroy;
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleException(Sender: TObject; E: Exception; var Handled: boolean);
begin
  FWmoRec.OnWebModuleException(Response, E);
  Handled := true;
end;

procedure TMainWebModule.WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  fbk: string;
begin
//Inc(FWmoRec.Run); // comment if useless

  // bo initialization via standard method
  if MODULE_USE_ON_METHODS then
    FWmoRec.BeforeDispatch(Request, Response{, FWrq}, FTic)

  // bo initialization made locally (repeated in every module)
  else begin
    FTic.Init;

    gwrq.WebRequestOrig := Request; // cagnolina

    // organization
    if not gorg.InitByWww(Request.Host, fbk) then
      raise Exception.CreateFmt('Unable to initialize TOrgRec by www "%s", it does not exists in the database', [Request.Host]);

    // theme
    gthe.InitDba(gorg.ObjectId, fbk);
  end;

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
  if MODULE_USE_ON_METHODS then
    FWmoRec.AfterDispatch(Request, Response{, FWrq}, FTic)
  else
    Response.Content := StringReplace(Response.Content, '$RvElapsedMs$', FTic.ElapsedMs.ToString, [rfReplaceAll]);
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

  TWrsRec.ResponseSet(Response, TJteRec.ServerInfo('Serves dynamic web Code''s', 'Web Broker Isapi', vec), TCtyRec.CTY_APP_JSON);
end;
    {$ENDREGION}

    {$REGION 'Code'}
procedure TMainWebModule.MainWebModuleCodeWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  ids, mim, ock, oco, res, qfn, qfv, ras, ra2, rmt, fbk: string; // oidstr, mimetype, objcontkind, objcontent, result, queryfieldnane, qfvalue, returnas, returnmimetype
  oid, aff, i: integer;
  cod: TCodRec;
  dst: TDataset;
  sts: TStringStream;

  function html_repater(): string;
  var
    bdy, hea, foo, def: string; // body, header, foother, defaultisdsisempty
    jso: TJSONObject;
  begin
    jso := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(cod.Obj.Data), 0) as TJSONObject;
    bdy := jso.GetValue<string>('body');
    hea := jso.GetValue<string>('header');
    foo := jso.GetValue<string>('foother');
    def := jso.GetValue<string>('default');
    Result := THtmRec.RepeatFromDs(dst, bdy, hea, foo, def);
  end;

  function sse_event: string;
  begin
    Result :=      'event: datastar-fragment'
    + sLineBreak + 'id: 129618219840307262'
    + sLineBreak + 'data: selector #CoOutput'
    + sLineBreak + 'data: fragment <div id="CoId">' + FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + '</div>'
    + sLineBreak + sLineBreak;
  end;

begin
  // idorpath
  if not gwrq.FieldGet('CoCodeId', ids, '') then begin
    TWrsRec.ResponseSet(Response, 'Unable to serve code, CoCodeId is empty', TCtyRec.CTY_TXT_HTML, THttRec.HTTP_STATUS_200_OK);
    Exit;
  end;
  oid := TDbaRec.ObjIdFromIdOrPath('Code', ids);

  // coderec
  cod.InitDba(oid, fbk);

  // zip
  ock := cod.Obj.ContentKind;
  oco := cod.Obj.Content;
  ras := cod.ReturnAs;       // Csv, Json, ...
  rmt := cod.ReturnMimeType; // mimetype=contenttype

  // override
  if gwrq.FieldGet('CoReturnAs', ra2, '') then
    ras := ra2;

  // $replace$
    // $*$ params with queryfields values
  for i := 0 to gwrq.WebRequestOrig.QueryFields.Count-1 do begin
    qfn := gwrq.WebRequestOrig.QueryFields.Names[i];
    qfv := gwrq.WebRequestOrig.QueryFields.ValueFromIndex[i];
    qfv := StringReplace(qfv, '*', '%', [rfReplaceAll]);
    qfv := StringReplace(qfv, '''', '''''', [rfReplaceAll]);
    qfn := TNamRec.CoRemove(qfn);
    oco := StringReplace(oco, '$' + qfn + '$', qfv, [rfReplaceAll]);
  end;

  // result
           if ock = TCodRec.CSS.Kind then begin
    mim := giif.NxD(rmt, TCtyRec.CTY_TXT_CSS);
    res := oco;

  end else if ock = TCodRec.CSV.Kind then begin
    mim := giif.NxD(rmt, TCtyRec.CTY_TXT_CSV);
    res := oco;

  end else if ock = TCodRec.HTML.Kind then begin
    mim := giif.NxD(rmt, TCtyRec.CTY_TXT_HTML);
    res := oco;

  end else if ock = TCodRec.JS.Kind then begin
    mim := giif.NxD(rmt, TCtyRec.CTY_APP_JS);
    res := oco;

  end else if ock = TCodRec.JSON.Kind then begin
    mim := giif.NxD(rmt, TCtyRec.CTY_APP_JSON);
    res := oco;

  end else if ock = TCodRec.MD.Kind then begin
    mim := giif.NxD(rmt, TCtyRec.CTY_TXT_HTML);
    res := TMkdRec.Process(oco);

  end else if ock = TCodRec.PY.Kind then begin
    mim := giif.NxD(rmt, TCtyRec.CTY_TXT_CSS);
    res := oco; // TPythonRec.Exec(oco);

  end else if ock = TCodRec.SQL.Kind then begin
         if not TDbaRec.DsFromSql(oco, dst, aff, fbk) then begin
      mim := giif.NxD(rmt, TCtyRec.CTY_TXT_HTML);
      res := '[{"FldItem":"Error", "FldDescription":"' + fbk + '"}]';
    end else if SameText(ras, 'Csv') then begin
      mim := giif.NxD(rmt, TCtyRec.CTY_TXT_CSV);
      TDstRec.DstToCsv(dst, res);
    end else if SameText(ras, 'Json') then begin
      mim := giif.NxD(rmt, TCtyRec.CTY_APP_JSON);
      TDstRec.DstToJson(dst, res);
    end else if SameText(ras, 'Html') then begin
      mim := giif.NxD(rmt, TCtyRec.CTY_TXT_HTML);
  //  TDstRec.DstToHtml(dst, res);
      res := html_repater();
    end else if SameText(ras, 'Xml') then begin
      mim := giif.NxD(rmt, TCtyRec.CTY_TXT_XML);
      TDstRec.DstToXml(dst, res);
    end else begin
      mim := giif.NxD(rmt, TCtyRec.CTY_TXT_HTML);
      TDstRec.DstToTxt(dst, res);
    end;

  end else begin
    mim := giif.NxD(rmt, TCtyRec.CTY_TXT_HTML);
    res := oco;
  end;

//  res := sse_event;

  // response (send an initial SSE event)
  sts := TStringStream.Create; // no need to free it
  sts.WriteString(res);
  sts.Position := 0;
  TWrsRec.ResponseCustomHeaderAdd(Response, ['Cache-Control', 'no-cache', 'Connection', 'keep-alive']);
  TWrsRec.ResponseSet(Response, sts, mim, THttRec.HTTP_STATUS_200_OK);
  Response.SendResponse;

  // set the SSE headers
//  Response.ContentType := 'text/event-stream';
//  Response.CustomHeaders.Values['Cache-Control'] := 'no-cache';
//  Response.CustomHeaders.Values['Connection'] := 'keep-alive';

  // send an initial SSE event
//  Response.Content := 'data: ' + FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + sLineBreak + sLineBreak;
//  Response.SendResponse;

  // continue sending SSE events
//  while not Request.RemoteAddr.IsEmpty do begin
//    Sleep(1000); // delay for 1 second
//    Response.Content := 'data: ' + FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + sLineBreak + sLineBreak;
//    Response.SendResponse;
//  end;

//  Handled := true;
end;

procedure TMainWebModule.MainWebModuleLibraryWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageInfo(TStdRec.StdNotImplemented('MainWebModuleLibraryWebActionAction')));
end;

procedure TMainWebModule.MainWebModuleCssWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageInfo(TStdRec.StdNotImplemented('MainWebModuleCssWebActionAction')));
end;

procedure TMainWebModule.MainWebModuleJsWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageInfo(TStdRec.StdNotImplemented('MainWebModuleJsWebActionAction')));
end;

procedure TMainWebModule.MainWebModuleVolatileWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageInfo(TStdRec.StdNotImplemented('MainWebModuleVolatileWebActionAction')));
end;
    {$ENDREGION}

  {$ENDREGION}

{$ENDREGION}

end.
