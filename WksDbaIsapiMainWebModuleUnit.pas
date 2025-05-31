unit WksDbaIsapiMainWebModuleUnit;

interface

{$REGION 'Help'}
{
  save single value into databases tables
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
    procedure MainWebModuleSelectWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleInsertWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleUpdateWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleDeleteWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
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
    System.JSON
  , System.RegularExpressions
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
  
  FWmoRec.CmdRecVec[2].Cmd         := '/Update';
  FWmoRec.CmdRecVec[2].Description := 'Update a field in a record';
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
  TWrsRec.ResponseSet(Response, TJteRec.ServerInfo('Server that change ONE thing in the database', 'Web Broker Isapi', [
    '/'
  , '/Info'
  , '/Select', '/Insert', '/Update', '/Delete'
  ]), TCtyRec.CTY_APP_JSON);
end;
    {$ENDREGION}

    {$REGION 'Dba'}
procedure TMainWebModule.MainWebModuleSelectWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageInfo(TStdRec.StdNotImplemented('MainWebModuleSelectWebActionAction')));
end;

procedure TMainWebModule.MainWebModuleInsertWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageInfo(TStdRec.StdNotImplemented('MainWebModuleInsertWebActionAction')));
end;

procedure TMainWebModule.MainWebModuleUpdateWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);

  {$REGION 'var'}
var
  tic: TTicRec;
  jso: TJSONObject;                     // jsonobj
  usr, tbl, fls, flv, whe: string;      // username, table, fldtoset, fldvaluenew, wherestr
  oks, sta, fbk, msg, sql, jss: string; // okstr, state, jsonstr
  aff, sco: integer;                    // affected, statuscode

  procedure audit;
  begin
    tbl := Copy(tbl, 1, 64);
    fls := Copy(fls, 1, 64);
    sql := 'insert into DbaSystem.dbo.TblAudit '
         + 'select'
         + '  ' + TSqlRec.Val(Now)            // FldDateTime
         + ', ' + TSqlRec.Val(usr)            // FldUsername
         + ', ' + TSqlRec.Val(tbl)            // FldTable
         + ', ' + TSqlRec.Val(fls)            // FldField
         + ', ' + TSqlRec.Val(flv)            // FldValue
         + ', ' + TSqlRec.Val(whe)            // FldWhere
         + ', ' + TSqlRec.Val(sql)            // FldQuery
         + ', ' + TSqlRec.Val(sta)            // FldState
         + ', ' + TSqlRec.Val(msg)            // FldMessage
         + ', ' + TSqlRec.Val(tic.ElapsedMs); // FldInMs

    if not TDbaRec.CmdExec(sql, aff, fbk) then
      glog.Log('Unable to insert the event into Audit database (%s)', [fbk])
   {else
      glog.Log('Event has been logged into Audit database')};
  end;
  {$ENDREGION}

begin
  tic.Init;

  // data
  usr := TStrRec.StrCoalesce([gusr.Username], 'unknown');
  jso := TJSONObject.ParseJSONValue(Request.Content) as TJSONObject;
  tbl := jso.GetValue<string>('dbaTable'   , '');
  fls := jso.GetValue<string>('fldToSet'   , '');
  flv := jso.GetValue<string>('fldValueNew', '');
  whe := jso.GetValue<string>('where'      , '');
  jso.Free;

  // tablemalformed
  if not TRegEx.IsMatch(tbl, '^Dba\w+\.dbo\.Tbl\w+$') then begin // Dba*.dbo.Tbl*
    oks := 'false';
    sta := 'FAIL';
    fbk := Format('Malformed name of table to update "%s"', [tbl]);
    msg := 'Unable to update record (Please check the table name to update)';
    sco := 200; // 400 Bad Request

  // fieldtosetmalformed
  end else if not fls.StartsWith('Fld') or fls.Contains(' ') then begin
    oks := 'false';
    sta := 'FAIL';
    fbk := Format('Malformed name of field to set "%s"', [fls]);
    msg := 'Unable to update record (Please check the field name to set)';
    sco := 200; // 400 Bad Request

  // keyfieldmalformed
  // ...

  // notloggedin
  end else if usr.Equals('unknown') then begin
    oks := 'false';
    sta := 'FAIL';
    fbk := 'User not logged in';
    msg := 'Unable to update record (Please log in to make changes)';
    sco := 200; // 400 Bad Request

  // loggedin
  end else begin
    // update
    sql := Format('update %s set %s = %s where %s', [tbl, fls, TSqlRec.Val(flv), whe]);

    // fail
    if not TDbaRec.CmdExec(sql, aff, fbk) then begin
      oks := 'false';
      sta := 'FAIL';
      msg := 'Unable to update record ('+fbk+')';
      sco := 200; // 400 Bad Request

    // success
    end else begin
      oks := 'true';
      sta := 'SUCCESS';
      msg := 'Record updated ('+fbk+')';
      sco := 200;
    end;
  end;

  // audit
  audit;

  // response
  jss := Format('{"ok": %s, "state": "%s", "message": "%s", "elapsedMs": %d}', [oks, sta, msg, tic.ElapsedMs]);
  TWrsRec.ResponseSet(Response, jss, TCtyRec.CTY_APP_JSON, sco);
end;

procedure TMainWebModule.MainWebModuleDeleteWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageInfo(TStdRec.StdNotImplemented('MainWebModuleDeleteWebActionAction')));
end;
    {$ENDREGION}

  {$ENDREGION}

{$ENDREGION}

end.
