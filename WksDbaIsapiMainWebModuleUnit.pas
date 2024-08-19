unit WksDbaIsapiMainWebModuleUnit;

interface

{$REGION 'Help'}
(*
  save single value into databases tables
*)
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
    procedure WebModuleException(Sender: TObject; E: Exception; var Handled: Boolean);
    procedure WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure MainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure MainWebModuleInfoWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure MainWebModuleSelectWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure MainWebModuleInsertWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure MainWebModuleUpdateWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure MainWebModuleDeleteWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
    FTic: TTicRec;
    FWrq: TWrqRec;
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
  TWmoRec.OnWebModuleCreate;
end;

procedure TMainWebModule.WebModuleDestroy(Sender: TObject);
begin
  TWmoRec.OnWebModuleDestroy;
end;

procedure TMainWebModule.WebModuleException(Sender: TObject; E: Exception; var Handled: Boolean);
begin
  TWmoRec.OnWebModuleException(Response, E);
end;

procedure TMainWebModule.WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  TWmoRec.BeforeDispatch(Request, Response, FWrq, FTic);
end;

procedure TMainWebModule.WebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  TWmoRec.AfterDispatch(Request, Response, FWrq, FTic);
end;
  {$ENDREGION}

  {$REGION 'Actions'}
procedure TMainWebModule.MainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageDefault);
end;

procedure TMainWebModule.MainWebModuleInfoWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  TWrsRec.ResponseSet(Response, TJteRec.ServerInfo('Server that change ONE thing in the database', 'Web Broker Isapi', [
    '/'
  , '/Info'
  , '/Select', '/Insert', '/Update', '/Delete'
  ]), TCtyRec.CTY_APP_JSON);
end;

procedure TMainWebModule.MainWebModuleSelectWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageInfo(TStdRec.StdNotImplemented('MainWebModuleSelectWebActionAction')));
end;

procedure TMainWebModule.MainWebModuleInsertWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageInfo(TStdRec.StdNotImplemented('MainWebModuleInsertWebActionAction')));
end;

procedure TMainWebModule.MainWebModuleUpdateWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);

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

procedure TMainWebModule.MainWebModuleDeleteWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageInfo(TStdRec.StdNotImplemented('MainWebModuleDeleteWebActionAction')));
end;
  {$ENDREGION}

{$ENDREGION}

end.
