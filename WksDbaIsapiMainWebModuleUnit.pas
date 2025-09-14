unit WksDbaIsapiMainWebModuleUnit;

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

  Dba module
  ==========
  
  here we can implement all dbrelated functionalities like
  selecting inserting, updating, deleting
  also make something to replicate a system, cloning a remote already working system (may be the head)
  here locally in a underconstruction new system
  for nuw it just updates a single field with a single value
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
  MODULE_USE_ON_METHODS = true;

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
  SetLength(FWmoRec.CmdRecVec, 4);
  FWmoRec.CmdRecVec[0].Cmd         := '/';
  FWmoRec.CmdRecVec[0].Description := 'Default handler';

  FWmoRec.CmdRecVec[1].Cmd         := '/Info';
  FWmoRec.CmdRecVec[1].Description := 'Describe module''s info and capabilities (this page)';

  FWmoRec.CmdRecVec[2].Cmd         := '/Dba';
  FWmoRec.CmdRecVec[2].Description := 'Dba main handler doing noting for now';

  FWmoRec.CmdRecVec[3].Cmd         := '/Update';
  FWmoRec.CmdRecVec[3].Description := 'Update a field in a record';
  {$ENDREGION}

  {$REGION 'Objects'}
//FWmoRec.Run := 0;
//FIni := TIniCls.Create;
  {$ENDREGION}

  {$REGION 'Events'}
  if MODULE_USE_ON_METHODS then
    FWmoRec.OnWebModuleCreate
//else
  //glog.Log('DBAISAPI.WebModuleCreate')
  ;
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleDestroy(Sender: TObject);
begin

  {$REGION 'Objects'}
//FIni.Free;
  {$ENDREGION}

  {$REGION 'Events'}
  if MODULE_USE_ON_METHODS then
    FWmoRec.OnWebModuleDestroy
//else
  //glog.Log('DBAISAPI.WebModuleDestroy')
  ;
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleException(Sender: TObject; E: Exception; var Handled: boolean);
begin
  glog.Log('DBAISAPI.WebModuleException', E);

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
  //glog.Log('DBAISAPI.WebModuleBeforeDispatch');

    FTic.Init;

    gwrq.WebRequestOrig := Request; // cagnolina

    // organization
    if not gorg.InitByWww(Request.Host, fbk) then
      gwrq.Error := fbk;

    // theme
    if not gthe.InitDba(gorg.ObjectId, fbk) then
      gwrq.Error := fbk;
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
//TMainWebModule(Sender).Actions.Items[2].Enabled := false; // /Dba   Dba main handler
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  if MODULE_USE_ON_METHODS then
    FWmoRec.AfterDispatch(Request, Response, FWrq, FTic)
  else begin
  //glog.Log('DBAISAPI.WebModuleAfterDispatch');
    Response.Content := StringReplace(Response.Content, '$RvElapsedMs$', FTic.ElapsedMs.ToString, [rfReplaceAll]);
  end;
end;
  {$ENDREGION}

  {$REGION 'Actions'}

    {$REGION 'Standard'}
procedure TMainWebModule.MainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
//  TWrsRec.ResponseSet(Response, THtmRec.PageDefault);
  Response.Content :=
    '<html>'
  + '<head><title>Web Server Application</title></head>'
  + '<body>'
  + Format('Wks Dba Web Application Server - %s - elapsed ms $RvElapsedMs$', [FormatDateTime('yyyy/mm/dd hh:nn:ss.zzz', Now)])
  + '</body>'
  + '</html>';
end;

procedure TMainWebModule.MainWebModuleInfoWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  vec: TArray<string>;
  i: integer;
begin
  SetLength(vec, Length(FWmoRec.CmdRecVec));
  for i := 0 to High(FWmoRec.CmdRecVec) do
    vec[i] := FWmoRec.CmdRecVec[i].Cmd;

  TWrsRec.ResponseSet(Response, TJteRec.ServerInfo('Server that change ONE thing in the database', 'Web Broker Isapi', vec), TCtyRec.CTY_APP_JSON);
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
  jso: TJSONObject;                                        // jsonobj
  usr, usr2, tbl, tbl2, fls, flv, flv2, whe, whe2: string; // username, table, fldtoset, fldvaluenew, wherestr
  oks, sta, jss, fbk, msg, sql: string;                    // okstr, state, jsonstr
  aff, sco: integer;                                       // affected, statuscode
  ndt: TDateTime; ndt2: string;                            // nowdatatime

  procedure audit;
  begin
    tbl := Copy(tbl, 1, 64);
    fls := Copy(fls, 1, 64);
    sql := 'insert into DbaSystem.dbo.TblAudit '
         + 'select'
         + '  ' + TSqlRec.Val(ndt)            // FldDateTime
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
  // init
  tic.Init;
  ndt := Now();
  usr := 'unknown';
  jso := TJSONObject.ParseJSONValue(Request.Content) as TJSONObject;
  tbl := jso.GetValue<string>('dbaTable'   , ''); // DbaXxx.dbo.TblXxx
  fls := jso.GetValue<string>('fldToSet'   , '');
  flv := jso.GetValue<string>('fldValueNew', '');
  whe := jso.GetValue<string>('where'      , '');
  jso.Free;
  sql := '';

  // usersessionNOTvalid, usernotloggedin
  if not gses.IsValid(fbk) then begin
    oks := 'false';
    sta := 'FAIL';
    fbk := 'User not logged in';
    msg := 'Unable to update record (Please log in to make changes)';
    sco := 200; // 400 Bad Request

  // usersessionvalid, userloggedin
  end else begin
    // getdata
    usr := TStrRec.StrCoalesce([{gusr}gses.Username], 'unknown');

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

    // wheremalformed
    // ...

    // allvalid
    end else begin
      // newvaluefix
      // ...

      if false then begin
        // temp
        ndt2 := TSqlRec.Val(ndt).Replace('''', '``');
        usr2 := TSqlRec.Val(usr).Replace('''', '``');
        tbl2 := TRegEx.Split(tbl, '\.')[2]; // TblXxx
        flv2 := TSqlRec.Val(flv).Replace('''', '``');
        whe2 := whe.Replace('''', '``'); // whe arrive already formatted like FldXxx = ''aaa''

        // update target field            declare @sql nvarchar(max) = `update DbaSystem.dbo.TblState set FldStatus = ``Accepted-1```
        sql :=                    Format('declare @sql nvarchar(max) = `update %s set %s = %s`', [tbl, fls, flv2]);

        // update FldWho if exists        if exists (select 1 from information_schema.columns where table_name = `DbaSystem.dbo.TblState` and column_name = `FldWho`) set @sql += `, FldWho = ``giarussi```
        sql := sql + sLineBreak + Format('if exists (select 1 from information_schema.columns where table_name = `%s` and column_name = `FldWho`) set @sql += `, FldWho = %s`;'  , [tbl2, usr2]);

        // update FldWhen if exists       if exists (select 1 from information_schema.columns where table_name = `DbaSystem.dbo.TblState` and column_name = `FldWhen`) set @sql += `, FldWhen = ``2025-09-14 01:20:50.975```
        sql := sql + sLineBreak + Format('if exists (select 1 from information_schema.columns where table_name = `%s` and column_name = `FldWhen`) set @sql += `, FldWhen = %s`;', [tbl2, ndt2]);

        // add where clause               set @sql += ` where FldState = ``Accepted```
        sql := sql + sLineBreak + Format('set @sql += ` where %s`;', [whe2]);

        // execute the dynamic sql
      //sql := sql + sLineBreak +        'print @sql';
        sql := sql + sLineBreak +        'exec sp_executesql @sql;';

        sql := sql.Replace('`', '''');

      end else begin
        // update target field
        sql := Format('update %s set %s = %s', [tbl, fls, TSqlRec.Val(flv)]);

        if TDbaRec.FldExists(tbl, 'FldWho', fbk) then
          sql := sql + Format(', FldWho = ''%s''', [usr]);

        if TDbaRec.FldExists(tbl, 'FldWhen', fbk) then
          sql := sql + Format(', FldWhen = %s', [TSqlRec.Val(ndt)]);

        sql   := sql + Format(' where %s;', [whe]);
      end;

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
