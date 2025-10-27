unit WksIsapiLoaderDirsUnit;

interface

uses
    System.SysUtils
  , WksIsapiLoaderUtilsUnit
  ;

type
  TAppDirectories = class
  private
    FBaseDir: string;
    FAppRoot: string;
  public
    constructor Create;
    function  GetBase: string;
    function  AppRoot: string;
    function  Web: string;
    function  Unsecure: string;
    function  Settings: string;
    function  Temp: string;
    function  Stats: string;
    function  UserState: string;
    function  Database: string;
    function  DebugLog: string;
    function  Documents: string;
    function  Processing: string;
    procedure BuildDirectories;
    class function  GlobalInstance: TAppDirectories;
  end;

function  GAppDir: TAppDirectories;

implementation

var
  GInst: TAppDirectories = nil;

function  GAppDir: TAppDirectories;
begin
  Result := TAppDirectories.GlobalInstance;
end;

{ TAppDirectories }

function  TAppDirectories.AppRoot: string;
begin
  Result:= FAppRoot;
end;

constructor TAppDirectories.Create;
var
  Colon: integer;
begin
  inherited Create;

  FAppRoot:= ExtractFilePath(GetModuleFName);

  // replace any /?/ stuff before drive path
  Colon:= Pos(':', FAppRoot);
  if Colon > 0 then
    FAppRoot:= Copy(FAppRoot, Colon-1, High(integer));

  FBaseDir:= ChangeFileExt(GetModuleFName, '') + '\';

  // replace any /?/ stuff before drive path
  Colon:= Pos(':', FBaseDir);
  if Colon > 0 then
    FBaseDir:= Copy(FBaseDir, Colon-1, High(integer));
end;

class function  TAppDirectories.GlobalInstance: TAppDirectories;
begin
  if GInst = nil then
    GInst:= TAppDirectories.Create;
  Result:= GInst;
end;

procedure TAppDirectories.BuildDirectories;
begin
  ForceDirectories(GetBase);
  CreateDir(Web);
  CreateDir(Unsecure);
  CreateDir(Settings);
  CreateDir(Temp);
  CreateDir(Stats);
  CreateDir(UserState);
  CreateDir(Database);
  CreateDir(Documents);
  CreateDir(DebugLog);
  CreateDir(Processing);
end;

function  TAppDirectories.GetBase: string;
begin
  Result := FBaseDir;
end;

function  TAppDirectories.Database: string;
begin
  Result := FBaseDir + 'Database\';
end;

function  TAppDirectories.DebugLog: string;
begin
  Result := FBaseDir + 'DebugLog\';
end;

function  TAppDirectories.Documents: string;
begin
  Result := FBaseDir + 'Documents\';
end;

function  TAppDirectories.Processing: string;
begin
  Result := FBaseDir + 'Processing\';
end;

function  TAppDirectories.Settings: string;
begin
  Result := FBaseDir + 'Settings\';
end;

function  TAppDirectories.Stats: string;
begin
  Result := FBaseDir + 'Stats\';
end;

function  TAppDirectories.Temp: string;
begin
  Result := FBaseDir + 'Temp\';
end;

function  TAppDirectories.Unsecure: string;
begin
  Result := FBaseDir + 'Unsecure\';
end;

function  TAppDirectories.UserState: string;
begin
  Result := FBaseDir + 'UserState\';
end;

function  TAppDirectories.Web: string;
begin
  Result := FBaseDir + 'Web\';
end;

initialization

finalization
  FreeAndNil(GInst);

end.
