unit WksImageIsapiMainWebModuleUnit;

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

  Image module
  ============
  
  serves images from db or syntetich
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
    procedure MainWebModuleOrganizationWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleImageWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModulePersonWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleUserWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleMemberWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
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

const
  MODULE_USE_ON_METHODS = false;

implementation

{$REGION 'Use'}
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
    Vcl.Graphics
  , Data.DB
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

  FWmoRec.CmdRecVec[2].Cmd         := '/Object';
  FWmoRec.CmdRecVec[2].Description := 'Serve Object''s image stored in the Image field';

  FWmoRec.CmdRecVec[3].Cmd         := '/Person';
  FWmoRec.CmdRecVec[3].Description := 'Serve Person''s images stored in ...';

  FWmoRec.CmdRecVec[4].Cmd         := '/User';
  FWmoRec.CmdRecVec[4].Description := 'Serve User''s images stored in ...';

  FWmoRec.CmdRecVec[5].Cmd         := '/Member';
  FWmoRec.CmdRecVec[5].Description := 'Serve Member''s images stored in ...';

  FWmoRec.CmdRecVec[6].Cmd         := '/Organization';
  FWmoRec.CmdRecVec[6].Description := 'Serve Organization''s images stored in ...';
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
//TMainWebModule(Sender).Actions.Items[2].Enabled := false; // /Image Image main handler
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

  TWrsRec.ResponseSet(Response, TJteRec.ServerInfo('Serves dynamic web Image''s', 'Web Broker Isapi', vec), TCtyRec.CTY_APP_JSON);
end;
    {$ENDREGION}

    {$REGION 'Image'}
procedure TMainWebModule.MainWebModuleImageWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  bol: boolean;
  oty: string;
  oid: integer;
  sql: string;
  dst: TDataSet;
  fld: TField; // blobfield
  mem: TMemoryStream;
  blob: TStream;
begin
  // usage: /WksImageIsapiProject.dll/Image?CoObjType=Page&CoObjId=415'

  // objecttype
  oty := Request.QueryFields.Values['CoObjType'];
  if oty.IsEmpty then begin
    Response.Content := 'CoObjType is missed';
    Response.StatusCode := 400; // badrequest
    Handled := true;
    Exit;
  end;

  // objectid
  oid := StrTOIntDef(Request.QueryFields.Values['CoObjId'], 0);
  if oid <= 0 then begin
    Response.Content := 'CoObjId is missed';
    Response.StatusCode := 400; // badrequest
    Handled := true;
    Exit;
  end;

  // dst
  sql := Format('select FldImage from Dba%s.dbo.TblObject where FldId = %d', [oty, oid]);
  bol := TDbaRec.DsFromSql(sql, dst);
  if not bol then begin
    Response.Content := 'Image not found';
    Response.StatusCode := 404; // notfound
    Handled := true;
    Exit;
  end;

  // field
  fld := dst.FieldByName('FldImage');

  // stream
  mem := TMemoryStream.Create;
//try
    // fieldread
    blob := dst.CreateBlobStream(fld, bmRead{Write}); // if s.Size = 0 then ...

    // mem use e (to avoid hint)
    try
      mem.CopyFrom(blob, blob.Size);
    finally
      blob.Free;
    end;

    // response
    bol := mem.Size > 0;
    if not bol then begin // *** here potentially create a syntetic image, may be random ***
      Response.Content := 'Image is empty';
      Response.StatusCode := 404; // notfound
      Handled := true;
      Exit;
    end;

    // test
  //mem.LoadFromFile('C:\$\Organization\W\Wks\WksLogo.png');

    // contentstreamset
    mem.Position := 0;
    Response.ContentStream := mem;

    // codes
    Response.ContentType := 'image/png';
    Response.StatusCode := 200; // ok

    // send
    //Response.SendResponse; // not really needed, va' dopo l'except, alla fine
//finally
  //mem.Free; // we don't need to free ms, it is taken care of for you in the TWebResponse destructor
//end;
end;
    {$ENDREGION}

    {$REGION 'Person'}
procedure TMainWebModule.MainWebModulePersonWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  bol: boolean;
  oid: integer;
  sql: string;
  dst: TDataSet;
  fld: TField; // blobfield
  mem: TMemoryStream;
  blob: TStream;
begin
  // usage: /WksImageIsapiProject.dll/Person?CoObjId=102'
  // note:  /WksImageIsapiProject.dll/Image?CoObjType=Person&CoObjId=102'  will get the image in the TblObject

  // objectid
  oid := StrTOIntDef(Request.QueryFields.Values['CoObjId'], 0);
  if oid <= 0 then begin
    Response.Content := 'CoObjId is missed';
    Response.StatusCode := 400; // badrequest
    Handled := true;
    Exit;
  end;

  // dst
  sql := Format('select FldPicture from DbaPerson.dbo.TblPerson where FldObjectId = %d', [oid]);
  bol := TDbaRec.DsFromSql(sql, dst);
  if not bol then begin
    Response.Content := 'Image not found';
    Response.StatusCode := 404; // notfound
    Handled := true;
    Exit;
  end;

  // field
  fld := dst.FieldByName('FldPicture');

  // stream
  mem := TMemoryStream.Create;

  // fieldread
  blob := dst.CreateBlobStream(fld, bmRead{Write}); // if s.Size = 0 then ...

  // mem use (to avoid hint)
  try
    mem.CopyFrom(blob, blob.Size);
  finally
    blob.Free;
  end;

  // response
  bol := mem.Size > 0;
  if not bol then begin // *** here potentially create a syntetic image, may be random ***
    Response.Content := 'Image is empty';
    Response.StatusCode := 404; // notfound
    Handled := true;
    Exit;
  end;

  // contentstreamset
  mem.Position := 0;
  Response.ContentStream := mem;

  // codes
  Response.ContentType := 'image/png';
  Response.StatusCode := 200; // ok
end;
    {$ENDREGION}

    {$REGION 'User'}
procedure TMainWebModule.MainWebModuleUserWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := 'Not Implemented';
  Response.StatusCode := 501; // notimplemented
end;
    {$ENDREGION}

    {$REGION 'Member'}
procedure TMainWebModule.MainWebModuleMemberWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := 'Not Implemented';
  Response.StatusCode := 501; // notimplemented
end;
    {$ENDREGION}

    {$REGION 'Organization'}
procedure TMainWebModule.MainWebModuleOrganizationWebActionAction( Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := 'Not Implemented';
  Response.StatusCode := 501; // notimplemented
end;
    {$ENDREGION}

  {$ENDREGION}

{$ENDREGION}

end.
