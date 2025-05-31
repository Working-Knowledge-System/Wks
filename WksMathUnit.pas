unit WksMathUnit;

interface

{$REGION 'Use'}
uses
    ocv.core_c
  , ocv.core.types_c
  , Winapi.Windows
  , System.Types
  , System.Classes
  , System.SysUtils
  , System.Json
;
{$ENDREGION}

{$REGION 'Type'}
type

  TMathClass = class
  end;
{$ENDREGION}

{$REGION 'Routine'}
{$ENDREGION}

{$REGION 'Math'}
procedure MathCmdProcess(const IvStep: integer; IvCmd: string; IvSrc: pIplImage; var IvDest: pIplImage; var IvJson: TJSONObject);
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    WksLangUnit
;
{$ENDREGION}

{$REGION 'Routine'}
{$ENDREGION}

{$REGION 'Math'}
procedure MathCmdProcess(const IvStep: integer; IvCmd: string; IvSrc: pIplImage; var IvDest: pIplImage; var IvJson: TJSONObject);

  {$REGION 'var'}
var
  // GENERAL
  cmr: TLangCmdRec;               // cmdrec
  c, k: string;                   // cmd
  p  : TArray<string>;            // params
  o  : string;                    // oper = p[0]
  // JSON
  jo0: TJSONObject;               // jasonobject
  {$ENDREGION}

begin

  {$REGION 'json'}
  jo0 := TJSONObject.Create;
  {$ENDREGION}

  {$REGION 'cmd'}
  cmr.Create(IvCmd, k);
  jo0.AddPair('cmd', cmr.Cmd);
  if cmr.Cmd.Contains('Json.') then begin
    c := LangCmdCompile(cmr.Cmd, IvJson);
    jo0.AddPair('cmdCompiled', c);
  end else
    c := cmr.Cmd;
  {$ENDREGION}

  {$REGION 'params'}
  p := cmr.ParamValueVec;
//  if not (Length(p) >= 2) then begin
//    jo0.AddPair('warning', 'command has no parameters');
//    Exit;
//  end;
  {$ENDREGION}

  {$REGION 'process'}
  IvDest := cvCloneImage(IvSrc); // do nothing with this

  o := cmr.Ope.Trim.ToLower; // oper

    {$REGION 'Summ'}
           if 'summ'.Contains(o) then begin

    {$ENDREGION}

    {$REGION 'Invalid'}
  end else
    jo0.AddPair('warning', 'invalid command: ' + o);
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'json'}
  IvJson.AddPair(Format('step%d', [IvStep]), jo0);
//jo0.Free;
  {$ENDREGION}

end;
{$ENDREGION}

end.
