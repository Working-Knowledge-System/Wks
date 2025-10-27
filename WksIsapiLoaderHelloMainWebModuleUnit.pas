unit WksIsapiLoaderHelloMainWebModuleUnit;

interface

uses
    SysUtils
  , Classes
  , HTTPApp
  , Windows
  ;

type
  TMainWebModule = class(TWebModule)
    procedure MainWebModuleCreate(Sender: TObject);
    procedure MainWebModuleDestroy(Sender: TObject);
    procedure MainWebModuleItem1WebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
  private
    { Private declarations }
    procedure Log(const IvString: string);
  public
    { Public declarations }
  end;

var
  MainWebModule: TMainWebModule;

implementation

{$R *.DFM}

procedure TMainWebModule.Log(const IvString: string);
  function GetModuleFName: string;
  var
    f: array[0..MAX_PATH] of char; // filename
    p: integer;
  begin
    FillChar(f, SizeOf(f), #0);
    GetModuleFileName(HInstance, f, SizeOf(f));
    p := Pos('\\?\', f);
    if p = 1 then
      Result:= Copy(f, 5, High(integer))
    else
      Result:= f;
  end;
var
  l: string; // logfilename
  s: TFileStream;
begin
  l := ChangeFileExt(GetModuleFName, '.txt');
  s := nil;
  try
    if FileExists(l) then
      s := TFileStream.Create(l, fmOpenReadWrite)
    else
      s := TFileStream.Create(l, fmCreate);
    s.Seek(0, soFromEnd);
    s.Write(IvString[1], Length(IvString));
    s.Write(#13#10, 2);
  finally
    s.Free;
  end;
end;

procedure TMainWebModule.MainWebModuleCreate(Sender: TObject);
begin
  Log('Web Module Create: ' + FormatDateTime('c', Now())); // c = Use ShortDateFormat + LongTimeFormat
end;

procedure TMainWebModule.MainWebModuleDestroy(Sender: TObject);
begin
  Log('Web Module Destroy: ' + FormatDateTime('c', Now()));
end;

procedure TMainWebModule.MainWebModuleItem1WebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  Response.Content := 'Hello';
end;

end.
