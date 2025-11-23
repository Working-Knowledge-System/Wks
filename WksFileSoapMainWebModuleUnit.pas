unit WksFileSoapMainWebModuleUnit;

interface

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , System.TypInfo
  , Soap.InvokeRegistry
  , Soap.SOAPHTTPDisp
  , Soap.SOAPHTTPPasInv
  , Soap.SOAPPasInv
  , Soap.WSDLBind
  , Soap.WSDLIntf
  , Soap.WSDLPub
  , Soap.WebBrokerSOAP
  , Soap.WebServExp
  , Web.HTTPApp
  , Xml.XMLSchema
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TFileMainWebModule = class(TWebModule)
    HTTPSoapDispatcher1: THTTPSoapDispatcher;
    HTTPSoapPascalInvoker1: THTTPSoapPascalInvoker;
    WSDLHTMLPublish1: TWSDLHTMLPublish;
    procedure FileMainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure FileMainWebModuleFileListWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure FileMainWebModuleFileGetWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure FileMainWebModuleFileSaveWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  WebModuleClass: TComponentClass = TFileMainWebModule;
{$ENDREGION}

implementation

{$REGION 'Use'}
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
    Winapi.Windows
  , System.IOUtils
  , System.NetEncoding
  ;
{$ENDREGION}

{$REGION 'TFileMainWebModule'}

  {$REGION 'Events'}
  {$ENDREGION}

  {$REGION 'DefaultActions'}
procedure TFileMainWebModule.FileMainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  WSDLHTMLPublish1.ServiceInfo(Sender, Request, Response, Handled);
end;
  {$ENDREGION}

  {$REGION 'FileActions'}
function  PathNormalize(const IvWebPath, IvBasePath: string): string;
var
  CleanPath, FullPath: string;
begin
  // replace / with \ to make it Windows-compatible
  CleanPath := StringReplace(IvWebPath, '/', '\', [rfReplaceAll]);

  // remove leading backslashes if any (so we don't break the base path)
  while (Length(CleanPath) > 0) and (CleanPath[1] in ['\', '/']) do
    Delete(CleanPath, 1, 1);

  // combine with base directory safely
  FullPath := TPath.Combine(IvBasePath, CleanPath);

  // normalize to absolute path (resolves '..' and '.')
  FullPath := TPath.GetFullPath(FullPath);

  // ensure it stays within BasePath
  if not FullPath.ToLower.StartsWith(TPath.GetFullPath(IvBasePath).ToLower) then // Compare case-insensitive because Windows paths are case-insensitive
    raise Exception.CreateFmt('Access denied: %s is outside of base directory', [FullPath]);

  // end
  Result := FullPath;
end;

function  FilePathFix(const IvPath: string): string;
begin
  // replace / with \ to make it Windows-compatible
  Result := StringReplace(IvPath, '/', '\', [rfReplaceAll]);
end;

procedure TFileMainWebModule.FileMainWebModuleFileListWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  pat, dir, jso: string;
  ser: TSearchRec;
  fil: TStringList;
begin
  // path
  pat := Request.QueryFields.Values['CoPath'];
  pat := FilePathFix(pat);
  if pat.Trim.IsEmpty then begin
    Response.StatusCode := 400;
    Response.ContentType := 'application/json';
    Response.Content := '{"error":"Missing path"}';
    Exit
  end else if pat = 'wks' then begin // base directory
    pat := 'C:\$\I\Wks'
  end else if not TDirectory.Exists(pat) then begin
    //Response.StatusCode := 400;
    Response.ContentType := 'application/json';
    Response.Content := '{"error":"Wrong path"}';
    Exit;
  end;

  // do
  fil := TStringList.Create;
  try
    jso := '{"items":[';
    if FindFirst(pat + '\*.*', faAnyFile, ser) = 0 then
    repeat
           if ser.Name = '.' then
        // nothing
      else if ser.Name = '..' then
        // nothing
      else if (ser.Attr and faDirectory) <> 0 then
        jso := jso + Format('{"name":"%s","type":"dir"},', [ser.Name])
      else
        jso := jso + Format('{"name":"%s","type":"file"},', [ser.Name]);
    until FindNext(ser) <> 0;
    System.SysUtils.FindClose(ser); // free
    if jso.EndsWith(',') then
      Delete(jso, Length(jso), 1);
    jso := jso + ']}';
    Response.StatusCode := 200;
    Response.ContentType := 'application/json';
    Response.Content := jso;
  finally
    fil.Free;
  end
end;

procedure TFileMainWebModule.FileMainWebModuleFileGetWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  spe: string; // filespec
  stl: TStringList;
begin
  // spec
  spe := Request.QueryFields.Values['CoSpec'];
  spe := FilePathFix(spe);
  if spe.Trim.IsEmpty then begin
    Response.StatusCode := 400;
    Response.ContentType := 'application/json';
    Response.Content := '{"error":"Missing file spec"}';
    Exit;
  end else if not TFIle.Exists(spe) then begin
    Response.StatusCode := 400;
    Response.ContentType := 'application/json';
    Response.Content := '{"error":"File does not exist"}';
    Exit;
  end;

  stl := TStringList.Create;
  try
    // Use UTF8 encoding if your files are stored as UTF-8 (typical for web files)
    stl.LoadFromFile(spe{, TEncoding.UTF8});
    Response.ContentType := 'text/plain'; // ; charset=utf-8
    Response.Content := stl.Text;
  finally
    stl.Free;
  end;

  // do
//  Response.StatusCode := 200;
//  Response.ContentType := 'text/plain; charset=utf-8';
//  Response.Content := TFile.ReadAllText(spe, TEncoding.UTF8);
end;

procedure TFileMainWebModule.FileMainWebModuleFileSaveWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  raw: TBytes;
  std, spe, spk, cnt: string; // stringdecodedutf8, cofilespec, filespecbakup, cocontent
  psl: TStrings; // params
begin
  // *** WARNING ***
  // spe := Request.ContentFields.Values['CoSpec'];
  // cnt := Request.ContentFields.Values['CoContent'];
  // by default, TWebRequest.ContentFields.Values uses ANSI decoding, so UTF-8 characters like © are misinterpreted, resulting in Â©*)
  // this is why we are using the code below to get spe and cnt

  // get raw POST body
  raw := Request.RawContent;

  // decode percent-encoding (CoSpec and CoContent are URL encoded)
  std := TEncoding.UTF8.GetString(raw);

  // parse as URL-encoded form data
  psl := TStringList.Create;
  try
    // params
    psl.Delimiter := '&';
    psl.DelimitedText := StringReplace(std, '&', sLineBreak, [rfReplaceAll]);

    // spec decode key/value pairs
    spe := '';
    if psl.Values['CoSpec'] <> '' then
      spe := TNetEncoding.URL.Decode(psl.Values['CoSpec']);
    // fix
    spe := FilePathFix(spe);
    // exit
    if spe.Trim.IsEmpty then begin
      Response.StatusCode := 400;
      Response.ContentType := 'application/json';
      Response.Content := '{"error":"Missing file spec"}';
      Exit
    end;

    // content decode key/value pairs
    cnt := '';
    if psl.Values['CoContent'] <> '' then
      cnt := TNetEncoding.URL.Decode(psl.Values['CoContent']);

    // backup old file with a new name
    spk := ChangeFileExt(spe, FormatDateTime('_yyyymmdd_hhnnss".bak"', Now));
    TFile.Move(spe, spk);

    // save with proper UTF-8 encoding (without BOM)
    TFile.WriteAllText(spe, cnt, TEncoding.UTF8);
  //Response.StatusCode := 200;
    Response.ContentType := 'application/json';
    Response.Content := '{"result":"ok"}';
  finally
    psl.Free;
  end;
end;
  {$ENDREGION}

{$ENDREGION}

end.
