unit WksImageIsapiMainWebModuleUnit;

interface

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
    procedure MainWebModuleImageWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModulePersonWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
  private
    { Private declarations }
  //FTic: TTicRec;
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
  SetLength(FWmoRec.CmdRecVec, 3);
  FWmoRec.CmdRecVec[0].Cmd         := '/';
  FWmoRec.CmdRecVec[0].Description := 'Default handler';
  
  FWmoRec.CmdRecVec[1].Cmd         := '/Info';
  FWmoRec.CmdRecVec[1].Description := 'Describe module''s info and capabilities (this page)';
  
  FWmoRec.CmdRecVec[2].Cmd         := '/Image';
  FWmoRec.CmdRecVec[2].Description := 'Serve an image';
  {$ENDREGION}

  {$REGION 'Objects'}
  FWmoRec.Run := 0;
//FIni := TIniCls.Create;
  {$ENDREGION}

  {$REGION 'Events'}
//FWmoRec.OnWebModuleCreate;
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleDestroy(Sender: TObject);
begin

  {$REGION 'Objects'}
//FIni.Free;
  {$ENDREGION}

  {$REGION 'Events'}
//FWmoRec.OnWebModuleDestroy;
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleException(Sender: TObject; E: Exception; var Handled: boolean);
begin
  FWmoRec.OnWebModuleException(Response, E);
  Handled := true;
end;

procedure TMainWebModule.WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  Inc(FWmoRec.Run);
//TWmoRec.BeforeDispatch(Request, Response, FWrq, FTic);

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
//TWmoRec.AfterDispatch(Request, Response, FWrq, FTic);
end;
  {$ENDREGION}

  {$REGION 'Actions'}

    {$REGION 'Standard'}
procedure TMainWebModule.MainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageDefault);
end;

procedure TMainWebModule.MainWebModuleInfoWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
 {TWrsRec.ResponseSet(Response, TJteRec.ServerInfo('Serves a dynamic web pages', 'Web Broker Isapi', [
    '/'
  , '/Info'
  , '/View'
  , '/Init', '/Theme', '/Test'
  , '/Login', '/LoginTry', '/Logout'
  , '/AccountCreate', '/AccountRecover', '/AccountDelete'
  ]), TCtyRec.CTY_APP_JSON);}
end;
    {$ENDREGION}

    {$REGION 'Image'}
procedure TMainWebModule.MainWebModuleImageWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  mem: TStream;
  dst: TDataSet;
  fld: TField; // blobfield
  oty: string;
  oid: integer;
  sql: string;
  bol: boolean;
begin
  // usage: /WksImageIsapiProject.dll/Image?CoObjType=Page&CoObjId=415'

  // objecttype
  oty := Request.QueryFields.Values['CoObjType'];
  if oty.IsEmpty then
    Exit;

  // objectid
  oid := StrTOIntDef(Request.QueryFields.Values['CoObjId'], 0);
  if oid <= 0 then
    Exit;

  // query
  sql := Format('select FldImage from Dba%s.dbo.TblObject where FldId = %d', [oty, oid]);

  // dst
  bol := TDbaRec.DsFromSql(sql, dst);
  if not bol then
    Exit;

  // field
  fld := dst.FieldByName('FldImage');

  // stream
  mem := TMemoryStream.Create;
//try
    // fieldread
    mem := dst.CreateBlobStream(fld, bmRead{Write}); // if s.Size = 0 then ...
    bol := mem.Size > 0;
    if not bol then
      Exit;

    // test
  //mem.LoadFromFile('C:\$Img\M\Mongodb\MongoDb_200x200.png');

    // contentstreamset
    mem.Position := 0;
    Response.ContentStream := mem;

    // mimeset
    Response.ContentType := 'image/png';

    // send
    //Response.SendResponse; // not really needed, va' dopo l'except, alla fine
//finally
  //mem.Free; // we don't need to free ms, it is taken care of for you in the TWebResponse destructor
//end;
end;
    {$ENDREGION}

    {$REGION 'Person'}
procedure TMainWebModule.MainWebModulePersonWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  mem: TStream;
  dst: TDataSet;
  fld: TField; // blobfield
  oid: integer; //oty: string;
  sql: string;
  bol: boolean;
begin
  // usage: /WksImageIsapiProject.dll/Person?CoObjId=102'

  // objectid
  oid := StrTOIntDef(Request.QueryFields.Values['CoObjId'], 0);
  if oid <= 0 then
    Exit;

  // query
  sql := Format('select FldPicture from DbaPerson.dbo.TblPerson where FldObjectId = %d', [oid]);

  // dst
  bol := TDbaRec.DsFromSql(sql, dst);
  if not bol then
    Exit;

  // field
  fld := dst.FieldByName('FldPicture');

  // stream
  mem := TMemoryStream.Create;

  // fieldread
  mem := dst.CreateBlobStream(fld, bmRead);
  bol := mem.Size > 0;
  if not bol then
    Exit;

  // contentstreamset
  mem.Position := 0;
  Response.ContentStream := mem;

  // mimeset
  Response.ContentType := 'image/png';
end;
    {$ENDREGION}

    {$REGION 'User'}
    {$ENDREGION}

    {$REGION 'Member'}
    {$ENDREGION}

  {$ENDREGION}

{$ENDREGION}

end.
