unit WksCodeIsapiMainWebModuleUnit;

interface

{$REGION 'Help'}
(*
  supply CODE (css, csv, html, js, sql, ...) as a single block suitable for web application
  execute volatile (temporary) code
*)
{$ENDREGION}

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , Web.HTTPApp
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  EInvalidURL = class(Exception);
  EInsufficientInfo = class(Exception);

  TMainWebModule = class(TWebModule)
    procedure MainWebModuleCreate(Sender: TObject);
    procedure MainWebModuleDestroy(Sender: TObject);
    procedure MainWebModuleException(Sender: TObject; E: Exception; var Handled: boolean);
    procedure MainWebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleInfoWebActionAction(Sender: TObject;  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure MainWebModuleCodeWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleLibraryWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleVolatileWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleCssWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleJsWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
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
procedure TMainWebModule.MainWebModuleCreate(Sender: TObject);
begin
  TWmoRec.OnWebModuleCreate;
end;

procedure TMainWebModule.MainWebModuleDestroy(Sender: TObject);
begin
  TWmoRec.OnWebModuleDestroy;
end;

procedure TMainWebModule.MainWebModuleException(Sender: TObject; E: Exception; var Handled: boolean);
begin
  TWmoRec.OnWebModuleException(Response, E);
end;

procedure TMainWebModule.MainWebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  TWmoRec.BeforeDispatch(Request, Response, FWrq, FTic);
end;

procedure TMainWebModule.MainWebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  TWmoRec.AfterDispatch(Request, Response, FWrq, FTic);
end;
  {$ENDREGION}

  {$REGION 'Actions'}
procedure TMainWebModule.MainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.PageDefault);
end;

procedure TMainWebModule.MainWebModuleInfoWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  TWrsRec.ResponseSet(Response, TJteRec.ServerInfo('Server that supply code (css, html, js, json, text, xml, ...) upon a request', 'Web Broker Isapi', [
    '/', '/Info'
  , '/Code', '/Library', '/Volatile', '/Css', '/Js'
  ]), TCtyRec.CTY_APP_JSON);
end;

procedure TMainWebModule.MainWebModuleCodeWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  ids, mim, ock, oco, res, qfn, qfv, ras, rmt, fbk: string; // oidstr, mimetype, objcontkind, objcontent, result, queryfieldnane, qfvalue, returnas, returnmimetype
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
  ras := cod.ReturnAs;
  rmt := cod.ReturnMimeType; // mimetype=contenttype

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
    res := oco; // TPytRec.Exec(oco);

  end else if ock = TCodRec.SQL.Kind then begin
         if not TDbaRec.DsFromSql(oco, dst, aff, fbk) then begin
      mim := giif.NxD(rmt, TCtyRec.CTY_TXT_HTML);
      res := fbk;
    end else if SameText(ras, 'AsCsv') then begin
      mim := giif.NxD(rmt, TCtyRec.CTY_TXT_CSV);
      TDstRec.DstToCsv(dst, res);
    end else if SameText(ras, 'AsJson') then begin
      mim := giif.NxD(rmt, TCtyRec.CTY_APP_JSON);
      TDstRec.DstToJson(dst, res);
    end else if SameText(ras, 'AsHtml') then begin
      mim := giif.NxD(rmt, TCtyRec.CTY_TXT_HTML);
  //  TDstRec.DstToHtml(dst, res);
      res := html_repater();
    end else if SameText(ras, 'AsXml') then begin
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
//
//  // response (send an initial SSE event)
//  sts := TStringStream.Create; // no need to free it
//  sts.WriteString(res);
//  sts.Position := 0;
//  TWrsRec.ResponseCustomHeaderAdd(Response, ['Cache-Control', 'no-cache', 'Connection', 'keep-alive']);
//  TWrsRec.ResponseSet(Response, sts, mim, THttRec.HTTP_STATUS_200_OK);
//  Response.SendResponse;

  // Set the SSE headers
  Response.ContentType := 'text/event-stream';
  Response.CustomHeaders.Values['Cache-Control'] := 'no-cache';
  Response.CustomHeaders.Values['Connection'] := 'keep-alive';

  // Send an initial SSE event
  Response.Content := 'data: ' + FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + sLineBreak + sLineBreak;
  Response.SendResponse;

  // Continue sending SSE events
  while not Request.RemoteAddr.IsEmpty do begin
    Sleep(1000); // Delay for 1 second
    Response.Content := 'data: ' + FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + sLineBreak + sLineBreak;
    Response.SendResponse;
  end;

  Handled := True;
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

end.
