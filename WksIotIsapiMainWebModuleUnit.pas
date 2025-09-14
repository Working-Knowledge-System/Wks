unit WksIotIsapiMainWebModuleUnit;

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

  Iot module
  ==========
  Channel (Topic)              a datapoints accumulator label
    |__Datalog   or Pointlot   a single measurement data with: value, uom, note, ruletoapply, sendersensorid and timestamp
}
{$ENDREGION}

{$REGION 'Use'}
uses
    System.SysUtils
  , System.Classes
  , System.Diagnostics
//, System.NetEncoding
//, Web.ReqMulti // this fix the no mapping for the Unicode character exists in the target multi-byte code page
//, Web.Win.ISAPIApp
//, Web.HTTPProd
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
    procedure MainWebModuleDatalogSelectWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleDatalogInsertWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleDatalogDeleteWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
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

{$REGION 'Const'}
const

  {$REGION 'UrlBase'}
  IOT_DATALOG_BASE_URL =
//  'http://www.iothub.it'                           // * the Iothub website
    '/WksIotIsapiProject.dll'                        // * the IOT webservice
  ;
  IOT_DATALOG_CREDENTIALS_URL =
    '?CoApikey=327D31DB-1DDD-424E-B647-AC44105DA677' // * the application key of your Organization                         \
  + '&CoOrganization=Localhost'                      // * the Organization                                                  |--credentials
  + '&CoOwner=unknown'                               // * the username of the person responsible of the logged measurement /
  ;
  {$ENDREGION}

  {$REGION 'UrlSelect'}
  IOT_DATALOGSELECT_URL = IOT_DATALOG_BASE_URL
  + '/DatalogSelect'                                 // * the "select" command
  + IOT_DATALOG_CREDENTIALS_URL
  + '&CoPId=42'                                      // * the measurement's "ParentId" = the Id of the "Channel" where you whant to accumulate measurements: 123 | Organization/Site/Plant/Room/Station/Chamber/Sensor/Datalog
  + '&CoLastDays=30'                                 // * the time range filter, return data in the last 30 days
  ;
  {$ENDREGION}

  {$REGION 'UrlInsert'}
  IOT_DATALOGINSERT_URL = IOT_DATALOG_BASE_URL
  + '/DatalogInsert'                                 // * the "insert" command
  + IOT_DATALOG_CREDENTIALS_URL
  + '&CoPId=42'
//+ '&CoDatalog=Test'                                // * the name of the measurement or the sensorid: empty | SEN0123 | Test
  + '&CoUom=C'                                       // * the unit of measure(s): empty | C,%,...
  + '&CoValue=12.3'                                  // * the measurement value(s): 1.2 | 12.3,41,... (CoX,CoY,CoZ,...)
  + '&CoRuleId=41'                                   // * the id(s) of the rule(s) to test and check the measurement value(s): | 41,42,...
  + '&CoNote='                                       // * a note(s) that the sensor might send
  ;
  {$ENDREGION}

  {$REGION 'DatalogDelete'}
  IOT_DATALOGDELETE_URL = IOT_DATALOG_BASE_URL
  + '/DatalogDelete'                                 // * the "delete" command
  + IOT_DATALOG_CREDENTIALS_URL
  + '&CoPId=42'
  + '&CoId=12345'                                    // optional instead of CoPId, if present delete a single point, if not present delete all points with given CoPId
  ;
  //&CoPId=43 *** the measurement's "ParentId" = the Id of the "Channel" where you have accumulated the measurements NOTE: all measurements with ParentId=43 will be deleted
  {$ENDREGION}

  {$REGION 'Template'}
  IOT_OK_EMAIL_TEMPLATE = ''
  + sLineBreak + '<h1 style="text-align: center;">In Spec</h1>'
  + sLineBreak + '<div style="padding: 15px;color: white;background-color: #00C851;border-radius: 4px;text-align: center;">'
  + sLineBreak + '&nbsp;<br>'
  + sLineBreak + '&nbsp;<strong>Success</strong> In spec: <strong>%s</strong>&nbsp;<br>'
  + sLineBreak + '&nbsp;<br>'
  + sLineBreak + '</div>'
  + sLineBreak + '<br>'
  + sLineBreak + '<ul>'
//+ sLineBreak + '<li>Id          : %s</li>'
//+ sLineBreak + '<li>PId         : %s</li>'
  + sLineBreak + '<li>Organization: %s</li>'
  + sLineBreak + '<li>Owner       : %s</li>'
  + sLineBreak + '<li>Datalog     : %s</li>'
  + sLineBreak + '<li>Uom         : %s</li>'
  + sLineBreak + '<li>Value       : %f</li>'
  + sLineBreak + '<li>RuleId      : %d</li>'
  + sLineBreak + '<li>Timestamp   : %s</li>'
  + sLineBreak + '<li>Note        : %s</li>'
  + sLineBreak + '</ul>'
  ;
  IOT_OOC_EMAIL_TEMPLATE = ''
  + sLineBreak + '<h1 style="text-align: center;">Out of Control Limits</h1>'
  + sLineBreak + '<div style="padding: 15px;color: white;background-color: #ffbb33;border-radius: 4px;text-align: center;">'
  + sLineBreak + '&nbsp;<br>'
  + sLineBreak + '&nbsp;<strong>Warning!</strong> Violation: <strong>%s</strong>&nbsp;<br>'
  + sLineBreak + '&nbsp;<br>'
  + sLineBreak + '</div>'
  + sLineBreak + '<br>'
  + sLineBreak + '<ul>'
//+ sLineBreak + '<li>Id          : %s</li>'
//+ sLineBreak + '<li>PId         : %s</li>'
  + sLineBreak + '<li>Organization: %s</li>'
  + sLineBreak + '<li>Owner       : %s</li>'
  + sLineBreak + '<li>Datalog     : %s</li>'
  + sLineBreak + '<li>Uom         : %s</li>'
  + sLineBreak + '<li>Value       : %f</li>'
  + sLineBreak + '<li>RuleId      : %d</li>'
  + sLineBreak + '<li>Timestamp   : %s</li>'
  + sLineBreak + '<li>Note        : %s</li>'
  + sLineBreak + '</ul>'
  ;
  IOT_OOS_EMAIL_TEMPLATE = ''
  + sLineBreak + '<h1 style="text-align: center;">Out of Spec Limit</h1>'
  + sLineBreak + '<div style="padding: 15px;color: white;background-color: #ff4444;border-radius: 4px;text-align: center;">'
  + sLineBreak + '&nbsp;<br>'
  + sLineBreak + '&nbsp;<strong>Danger!</strong> Violation: <strong>%s</strong>&nbsp;<br>'
  + sLineBreak + '&nbsp;<br>'
  + sLineBreak + '</div>'
  + sLineBreak + '<br>'
  + sLineBreak + '<ul>'
//+ sLineBreak + '<li>Id          : %s</li>'
//+ sLineBreak + '<li>PId         : %s</li>'
  + sLineBreak + '<li>Organization: %s</li>'
  + sLineBreak + '<li>Owner       : %s</li>'
  + sLineBreak + '<li>Datalog     : %s</li>'
  + sLineBreak + '<li>Uom         : %s</li>'
  + sLineBreak + '<li>Value       : %f</li>'
  + sLineBreak + '<li>RuleId      : %d</li>'
  + sLineBreak + '<li>Timestamp   : %s</li>'
  + sLineBreak + '<li>Note        : %s</li>'
  + sLineBreak + '</ul>'
  ;
  {$ENDREGION}

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
  , System.DateUtils
  , Web.WebBroker
  , Web.Win.ISAPIHTTP
//, Data.DB
//, superobject
//, xsuperobject
//, XMLDom
//, XMLDoc
  , WksIotUnit
  ;
{$ENDREGION}

{$REGION 'Routines'}
function  WebDatalogSelectInput(var IvApikey, IvOrganization, IvOwner, IvPId, IvDatalog, IvLastDays, IvFbk: string): boolean;
begin
  // organization
  Result := gwrq.FieldGet('CoOrganization', IvOrganization, ''{gorg.Obj.Object});
  if not Result then begin
    IvFbk := '"CoOrganization" not found';
    Exit;
  end;

  // apikey
  Result := gwrq.FieldGet('CoApikey'      , IvApikey      , '');
  if not Result then begin
    IvFbk := '"CoApiKey" not found';
    Exit;
  end;

  // validate
//Result := gorg.ApiKey = IvApikey;
//if not Result then begin
//  IvFbk := '"CoApiKey" is invalid';
//  Exit;
//end;

  // owner
  Result := gwrq.FieldGet('CoOwner'       , IvOwner       , '');
  if not Result then begin
    IvFbk := '"CoOwner" not found';
    Exit;
  end;

  // datalog
  Result := gwrq.FieldGet('CoDatalog'     , IvDatalog     , 'Datalog');
  if not Result then begin
    IvFbk := '"CoDatalog" not found';
    Exit;
  end;

  // pid
  Result := gwrq.FieldGet('CoPId'         , IvPId         , '');
  if not Result then begin
    IvFbk := '"CoPId" not found';
    Exit;
  end;

  // lastdays
  Result := gwrq.FieldGet('CoLastDays'    , IvLastDays    , '1');
  if not Result then begin
    IvFbk := '"LastDays" not found';
    Exit;
  end;

  // success
  IvFbk := 'Datalog inputs for select are valid';
end;

function  WebDatalogInsertInput(var IvApikey, IvOrganization, IvOwner, IvPId, IvDatalog, IvUom, IvValue, IvRuleId, IvNote, IvFbk: string): boolean;
begin
  // organization
  Result := gwrq.FieldGet('CoOrganization', IvOrganization, ''{gorg.Obj.Object});
  if not Result then begin
    IvFbk := '"CoOrganization" not found';
    Exit;
  end;

  // apikey
  Result := gwrq.FieldGet('CoApikey'      , IvApikey      , '');
  if not Result then begin
    IvFbk := '"CoApiKey" not found';
    Exit;
  end;

  // validate
//Result := gorg.ApiKey = IvApikey;
//if not Result then begin
//  IvFbk := '"CoApiKey" is invalid';
//  Exit;
//end;

  // owner
  Result := gwrq.FieldGet('CoOwner'       , IvOwner       , '');
  if not Result then begin
    IvFbk := '"CoOwner" not found';
    Exit;
  end;

  // datalog
  Result := gwrq.FieldGet('CoDatalog'     , IvDatalog     , 'Datalog');
  if not Result then begin
    IvFbk := '"CoDatalog" not found';
    Exit;
  end;

  // pid
  Result := gwrq.FieldGet('CoPId'         , IvPId         , '');
  if not Result then begin
    IvFbk := '"CoPId" not found';
    Exit;
  end;

  Result := gwrq.FieldGet('CoUom'         , IvUom         , '');

  Result := gwrq.FieldGet('CoValue'       , IvValue       , '');

  Result := gwrq.FieldGet('CoRuleId'      , IvRuleId      , '');

  Result := gwrq.FieldGet('CoNote'        , IvNote        , '');

  // success
  IvFbk := 'Datalog inputs for insert are valid';
end;
{$ENDREGION}

{$REGION 'TMainWebModule'}

  {$REGION 'Events'}
procedure TMainWebModule.WebModuleCreate(Sender: TObject);
begin

  {$REGION 'Commands'}
  SetLength(FWmoRec.CmdRecVec, 5);
  FWmoRec.CmdRecVec[0].Cmd         := '/';
  FWmoRec.CmdRecVec[0].Description := 'Default handler';
  
  FWmoRec.CmdRecVec[1].Cmd         := '/Info';
  FWmoRec.CmdRecVec[1].Description := 'Describe module''s info and capabilities (this page)';
  
  FWmoRec.CmdRecVec[2].Cmd         := IOT_DATALOGSELECT_URL;
  FWmoRec.CmdRecVec[2].Description := '(datalog select) Read a sensor''s measures sequence from the datalog, a valid combination of organization/apikey and selectors are needed';
  
  FWmoRec.CmdRecVec[3].Cmd         := IOT_DATALOGINSERT_URL;
  FWmoRec.CmdRecVec[3].Description := '(datalog insert) Write a sensor measure into the datalog, a valid combination of organization/apikey is needed and selectors are needed';
  
  FWmoRec.CmdRecVec[4].Cmd         := IOT_DATALOGDELETE_URL;
  FWmoRec.CmdRecVec[4].Description := '(datalog delete) Delete a sensor measure sequence from the datalog, a valid combination of organization/apikey and selectors are needed';
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
    FWmoRec.BeforeDispatch(Request, Response, FWrq, FTic)

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
//TMainWebModule(Sender).Actions.Items[2].Enabled := false; // /Iot   Iot main handler
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  if MODULE_USE_ON_METHODS then
    FWmoRec.AfterDispatch(Request, Response, FWrq, FTic)
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

  TWrsRec.ResponseSet(Response, TJteRec.ServerInfo('Serves dynamic web IoT''s', 'Web Broker Isapi', vec), TCtyRec.CTY_APP_JSON);
end;
    {$ENDREGION}

    {$REGION 'Iot'}
procedure TMainWebModule.MainWebModuleDatalogSelectWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  apk, org, own, pid, dlg, lds, jsn, fbk: string; // apikey, organization, owner, pid|path, datalog, lastdays, json;
  tra: TTraceRec;
begin
  // http://www.wks.cloud/WksIotIsapiProject.dll/DatalogSelect?CoApikey=8B3FF39C-E0FC-4F60-92DE-30D6147422E6&CoOrganization=Wks&CoOwner=puppadrillo&CoPId=43&CoLastDays=15

  // webrequest
  gwrq.WebRequestOrig := Request;

  {$REGION 'Input'}
  if not WebDatalogSelectInput(apk, org, own, pid, dlg, lds, fbk) then begin
    Response.StatusCode := THttRec.HTTP_STATUS_400_BAD_REQUEST;
    Response.Content := fbk;
    Handled := true;
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'Trace'}
  tra.Organization   := org;
  tra.Owner          := own;
  tra.PId            := pid;
//tra.TimestampBegin := RecodeYear(Now, 2018) - StrToIntDef(lds, 1);
//tra.TimestampEnd   := RecodeYear(Now, 2018);
  tra.TimestampBegin := Now - StrToIntDef(lds, 1);
  tra.TimestampEnd   := Now;
  {$ENDREGION}

  {$REGION 'Response'}
  if not tra.DbaSelectJson(jsn, fbk) then begin
    Response.StatusCode := THttRec.HTTP_STATUS_400_BAD_REQUEST;
    Response.Content := fbk;
    Handled := true;
    Exit;
  end;

  Response.StatusCode := THttRec.HTTP_STATUS_200_OK;
  Response.ContentType := 'application/json'; // application/javascript if jsonp
  Response.Content := jsn;
  {$ENDREGION}

end;

procedure TMainWebModule.MainWebModuleDatalogInsertWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
const
  INSERT_MAX = 1000;
var
  ak, og, ow, pi, dl, uo, va, ru, no, v, w, c, fbk: string; // apikey, organization, owner, pid|path, datalog, uom, value-y, ruleid, note, violation, warning, content;
  usv, vsv, rsv: TStringVector; vfv: TDoubleVector; riv: TIntegerVector; // unitstrvec, valuestrvec, ruleidstrvec, valuefloatvec, ruleidintvec
  vf: double;  // valuefloat
  i, l1, l2, l3, ri: integer; // ruleinteger
  r: TRuleRec;
  l: TDatalogRec;
begin
  // http://www.wks.cloud/WksIotIsapiProject.dll/DatalogInsert?CoApikey=8B3FF39C-E0FC-4F60-92DE-30D6147422E6&CoOrganization=Wks&CoOwner=puppadrillo&CoPId=43&CoLastDays=15
  // http://www.wks.cloud/WksIotIsapiProject.dll/DatalogInsert?CoApikey=8B3FF39C-E0FC-4F60-92DE-30D6147422E6&CoOrganization=Wks&CoOwner=puppadrillo&CoPId=43&CoDatalog=DS18B20&CoUom=C&CoRuleId=43&CoValue=23.81&CoNote=40227

  // webrequest
  gwrq.WebRequestOrig := Request;

  {$REGION 'Input'}
  if not WebDatalogInsertInput(ak, og, ow, pi, dl, uo, va, ru, no, fbk) then begin
    Response.StatusCode := THttRec.HTTP_STATUS_400_BAD_REQUEST;
    Response.Content := fbk;
    Handled := true;
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'Vectors i'}
  usv := TLstRec.LstToVector(uo); l1 := Length(usv);
  vsv := TLstRec.LstToVector(va); l2 := Length(vsv);
  rsv := TLstRec.LstToVector(ru); l3 := Length(rsv);

  if (l1 <> l2) or (l1 <> l3) or (l2 <> l3) then
    raise Exception.Create('UomCsv, ValueCsv and RuleCsv need to have the same number of elements');
  {$ENDREGION}

  {$REGION 'Vectors ii'}
  SetLength(vfv, Length(vsv));
  for i := Low(vsv) to High(vsv) do
    vfv[i] := StrToFloat(vsv[i]); // StrToFloatDef(sv[i], -1.0)

  SetLength(riv, Length(rsv));
  for i := Low(rsv) to High(rsv) do
    riv[i] := StrToInt(rsv[i]);   // StrToIntDef(sv[i], 41)
  {$ENDREGION}

  {$REGION 'Datalog'}
  l.PId          := StrToInt(pi);
  l.Organization := og;
  l.Owner        := ow;
  l.Datalog      := dl;
  l.Uom          := uo;
  l.Value        := va;
  l.RuleId       := ru;
  l.Timestamp    := Now;
  l.Note         := no;
  if not l.DbaInsert(fbk) then begin
    Response.StatusCode := THttRec.HTTP_STATUS_500_SERVER_ERROR;
    Response.Content := fbk;
    Handled := true;
    Exit;
  end else begin
    Response.StatusCode := THttRec.HTTP_STATUS_200_OK;
    Response.Content := 'OK';
  end;
  {$ENDREGION}

  {$REGION 'Rule'}
  for i := Low(vfv) to High(vfv) do begin

    {$REGION 'Zip'}
    uo := usv[i];
    vf := vfv[i];
    ri := riv[i];
    {$ENDREGION}

    {$REGION 'Rule'}
    r.Id := ri;
    if not r.DbaSelect(fbk) then begin
      fbk := Format('Rule %d does not exists', [r.Id]);
    //Response.StatusCode := THttRec.HTTP_STATUS_200_OK;
      Response.Content := Response.Content + ', ' + fbk;
    //Handled := true;
    //Exit;
      Continue;
    end;
    {$ENDREGION}

    {$REGION 'Violations'}
    //       sms                email                                                                   email              sms
    // --------------LSL--------------------LCL--------------------NOMINAL--------------------UCL--------------------USL---------->
    v := '';
    w := '';
    if      (vf <= r.Lsl)                                                                                                      then begin v := 'SPEC'   ; w := Format('%.2f <= %.2f'        , [vf, r.Lsl                                                    ]); end
    else if       (r.Lsl < vf) and (vf <= r.Lcl)                                                                               then begin v := 'CTRL'   ; w := Format('%.2f < %.2f <= %.2f' , [    r.Lsl, vf, r.Lcl                                         ]); end
    else if                              (r.Lcl < vf) and (vf <  r.Nominal)                                                    then begin v := 'OK'     ; w := Format('%.2f < %.2f <= %.2f' , [               r.Lcl, vf, r.Nominal                          ]); end
    else if                                               (vf  = r.Nominal)                                                    then begin v := 'NOMINAL'; w := Format('%.2f = %.2f'         , [                      vf, r.Nominal                          ]); end
    else if                                                     (r.Nominal < vf) and (vf <= r.Ucl)                             then begin v := 'OK'     ; w := Format('%.2f < %.2f <= %.2f' , [                          r.Nominal, vf, r.Ucl               ]); end
    else if                                                                                (r.Ucl < vf) and (vf <= r.Usl)      then begin v := 'CTRL'   ; w := Format('%.2f < %.2f <= %.2f' , [                                         r.Ucl, vf, r.Usl    ]); end
    else if                                                                                                       (r.Usl < vf) then begin v := 'SPEC'   ; w := Format('%.2f < %.2f'         , [                                                    r.Usl, vf]); end
    else                                                                                                                            begin v := '!'      ; w := '!'; end;
    {$ENDREGION}

    {$REGION 'Alerts'}
    // in ctrl alerts
    if giis.Ex(r.OkEmail) and ((v = 'OK') or (v = 'NOMINAL')) then begin
      c := r.OkText;
      if giis.Nx(c) then c := Format(IOT_OK_EMAIL_TEMPLATE, [w, og, ow, dl, uo, vf, ri, DateTimeToStr(Now), no]);
      //                fbk, to                  , cc, bc, sub             , tit                      , content, orgaLogoShow, sysLogoShow, saveToDba
      if not geml.SendS(fbk, r.OkEmail           , '', '', gorg.Obj.&Object, 'DatalogInsert OK INSPEC', c) then
        glog.Log(fbk);
    end;

    // ctrl violation alerts
    if giis.Ex(r.CtrlViolationEmail) and (v = 'CTRL') then begin
      c := r.CtrlViolationText;
      if giis.Nx(c) then c := Format(IOT_OOC_EMAIL_TEMPLATE, [w, og, ow, dl, uo, vf, ri, DateTimeToStr(Now), no]);
      if not geml.SendW(fbk, r.CtrlViolationEmail, '', '', gorg.Obj.&Object, 'DatalogInsert Warning OOC', c) then
        glog.Log(fbk);
    end;

    // spec violation alerts
    if giis.Ex(r.SpecViolationEmail) and (v = 'SPEC') then begin
      c := r.SpecViolationText;
      if giis.Nx(c) then c := Format(IOT_OOS_EMAIL_TEMPLATE, [w, og, ow, dl, uo, vf, ri, DateTimeToStr(Now), no]);
      if not geml.SendD(fbk, r.SpecViolationEmail, '', '', gorg.Obj.&Object, ' DatalogInsert DANGER OOS', c) then
        glog.Log(fbk);
    end;
    {$ENDREGION}

  end;
  {$ENDREGION}

end;

procedure TMainWebModule.MainWebModuleDatalogDeleteWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  apk, org, own, pid, dlg, lds, fbk: string; // apikey, organization, owner, pid|path, datalog, lastdays;
  dlr: TDatalogRec;
begin
  // webrequest
  gwrq.WebRequestOrig := Request;

  {$REGION 'Input'}
  if not WebDatalogSelectInput(apk, org, own, pid, dlg, lds, fbk) then begin
    Response.StatusCode := THttRec.HTTP_STATUS_400_BAD_REQUEST;
    Response.Content := fbk;
    Handled := true;
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'Datalog'}
  dlr.PId := StrToInt(pid);
  if not dlr.DbaDelete(fbk) then begin
    Response.StatusCode := THttRec.HTTP_STATUS_500_SERVER_ERROR;
    Response.Content := 'WARNING: ' + fbk;
    Handled := true;
    Exit;
  end else begin
    Response.StatusCode := THttRec.HTTP_STATUS_200_OK;
    Response.Content := 'OK';
    glog.Log('IOT.MainWebModuleDatalogDeleteWebActionAction', 'OK');
  end;
  {$ENDREGION}

end;
    {$ENDREGION}

  {$ENDREGION}

{$ENDREGION}

end.
