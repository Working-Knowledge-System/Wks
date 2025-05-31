unit WksLangUnit;

interface

{$REGION 'Help'}
{
  process wks language (simple language!)
}
{$ENDREGION}

{$REGION 'Use'}
uses
    ocv.core_c
  , ocv.core.types_c
  , Winapi.Windows
  , System.Types
  , System.Classes
  , System.SysUtils
  , System.Json
  , System.Rtti
  , System.Bindings.EvalProtocol
  , System.Bindings.Evaluator
  , System.Bindings.EvalSys
  , System.Bindings.Methods
  , System.Bindings.Consts
  , System.Bindings.ObjEval
  , System.RegularExpressions
  , Vcl.Graphics
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TLangCmdRec = record
    Cmd: string;                      // Ocv.Close:1,2,...   full command row
    DomOpe: string;                   // Ocv.Close           domain.oper
    OpePar: string;                   //     Close:1,2,...   no domain
    ParCsv: string;                   //           1,2,...   params csv
    Dom: string;                      // Ocv                 domain (Lang, Math, Stat, Ocv, ...)
    Ope: string;                      // Close           oper
    ParamCaptionVec: TArray<string>; // ['Abb', 'Bbb'] \
    ParamValueVec  : TArray<string>; // ['1'  , '2.3']  |__ rio get
    ParamDefaultVec: TArray<string>; // ['0'  , '1.0']  |
    ParamHelpVec   : TArray<string>; // ['...', '...'] /
    Description    : string;
    function  Create(IvCmdStr: string; var IvFbk: string; IvRioDo: boolean = false): integer;
    function  IsCommented: boolean;
  end;
  TLangStepRec = record
    Step: integer;
    Cmd : string;
    Data: string; // kvsimple
    Json: string;
    Bmp : TBitmap;
  end;
  TLangStepRecVec = array of TLangStepRec;
  TLangStepRecMtx = array of TLangStepRecVec;
{$ENDREGION}

{$REGION 'Routine'}
{$ENDREGION}

{$REGION 'Lang'}
function  LangParamDef(IvString, IvDefault: string): string;
function  LangCodeCompile(IvCode: string): string;
function  LangCodeProcess(var IvStepRecVec: TLangStepRecVec; IvCvCode: string; IvJson: TJSONObject; var IvHasFinding: boolean; var IvDefect: string): boolean;
function  LangCmdCompile(IvCommand: string; IvJson: TJSONObject): string;
procedure LangCmdProcess(const IvStep: integer; IvCmd: string; IvSrc: pIplImage; var IvDest: pIplImage; var IvJson: TJSONObject);
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    REST.Json
  , WksMathUnit
  , WksStatUnit
  , WksOcvUnit
  ;
{$ENDREGION}

{$REGION 'TLangCmdRec'}
function  TLangCmdRec.Create(IvCmdStr: string; var IvFbk: string; IvRioDo: boolean): integer;
const
  REX_PATTERN = '(\w*[.]?\w*):(.*(,|;))*'; // InlineIf:1,2;  or  Ocv.Erode:1,2;
var
  i: integer;
  v: TArray<string>;
  va: variant;
  js: string;
  jv: TJSONValue; // jsonvalue
  ja: TJSONArray; // jsonarray
  je: TJSonValue; // jsonarrayelement
begin
  // cmd
  Cmd := IvCmdStr.Trim;
  IvFbk := 'Ok';
  Result := 0;                            // ok - green

  // exit
  if IsCommented and (not TRegEx.IsMatch(Cmd{.Remove(0, 2)}, REX_PATTERN)) then begin
    Result := -1;                         // close - mute
    Exit;
  end;

  // commented
  if IsCommented then begin
    IvFbk := 'commented';
    Result := 1;                          // info - gray
  //cmd := cmd.Remove(0, 2).Trim;
  end;

  // notend ;
  if (not IsCommented) and (not cmd.EndsWith(';')) then begin
    IvFbk := 'the command should ends with ";"';
    Result := 2;                          // warning - orange
    cmd := cmd + ';';
  end;

  // invalid
  if (not IsCommented) and (not TRegEx.IsMatch(cmd, REX_PATTERN)) then begin
    DomOpe := '';
    Description := '';
    IvFbk  := 'Invalid command, use: <Domain>.<Operation>:<param1>,<param2>,<...>;';
    Result := 3;                          // exception - red
    Exit;
  end;

  // 1stsplit            //     ope, a, b, ...
  v := Cmd.Split([':']); // dom.ope, a, b, ...
  DomOpe := v[0];
  ParCsv := v[1]; Delete(ParCsv, Length(v[1]), 1);

  // 2ndsplit
  if DomOpe.Contains('.') then begin
    Dom := DomOpe.Split(['.'])[0];
    Ope := DomOpe.Split(['.'])[1];
  end else begin
    Dom := 'Lang';
    Ope := v[0];
    DomOpe := Dom + '.' + Ope;
    Cmd    := Dom + '.' + Cmd;
  end;

  OpePar := Ope + ':' + ParCsv;

  // descr
  Description := 'description not available';

  // paramvals
  ParamValueVec := ParCsv.Split([',']);

  // completewithrio
  if IvRioDo then begin
  //Screen.Cursor := crHourGlass;
  //try
//      {o :=} (rio.HttpRio as ISystemSoapMainService).SystemLicenseSoap(Result, k);
  //finally
  //  Screen.Cursor := crDefault;
  //end;
  //js := obj.RioContentGet('Ocv', '124', '', k); // Root/Help/Ocv/Erode
    {
    if obj.RioFieldGet('Ocv', 'Root/Help/Ocv/' + Ope, 'FldJson', va, '') then begin;
      js := va;
      if js.IsEmpty then begin
        DomOpe := '';
        Description := '';
        IvFbk  := 'No command definition found on server !';
        Result := 3;                          // exception - red
      end else begin
        // json
        jv := TJSONObject.ParseJSONValue(js); // TEncoding.UTF8.GetBytes(js)

        // descr
        Description     := jv.GetValue<string>('description');

        // vector
      //ja := jv.FindValue('paramVec') as TJSONArray;
        ja := jv.GetValue<TJSONArray>('paramVec');

        // prepare
        SetLength(ParamCaptionVec, ja.Count);
        SetLength(ParamDefaultVec, ja.Count);
        SetLength(ParamHelpVec   , ja.Count);

        // iterate
        i := -1;
        for je in ja do begin
          Inc(i);
          if not Assigned(je) then begin
            ParamCaptionVec[i] := '?';
            ParamDefaultVec[i] := '!';
            ParamHelpVec[i]    := '?';
          end else begin
            ParamCaptionVec[i] := je.GetValue<string>('caption');
            ParamDefaultVec[i] := je.GetValue<string>('default');
            ParamHelpVec[i]    := je.GetValue<string>('desc');
          end;
        end;

        // json
      //je.Free;
      //ja.Free;
        jv.Free;
      end;
    end;
    }
  end;
end;

function TLangCmdRec.IsCommented: boolean;
begin
  Result := Cmd.Trim.StartsWith('--') or Cmd.Trim.StartsWith('//'); //  str.IsComment(Cmd)
end;
{$ENDREGION}

{$REGION 'Lang'}
function  LangParamDef(IvString, IvDefault: string): string;
begin
  if IvString.IsEmpty or IvString.StartsWith('!') then
    Result := IvDefault
  else
    Result := IvString;
end;

function  LangCodeCompile(IvCode: string): string;
const
  PAS_COMM = '[ \t]*(--|\/\/).*[ \t]*';
  CPP_COMM = '(?<!\/)\/\*((?:(?!\*\/).|\s)*)\*\/';
begin
  Result := IvCode.Trim;
  Result := TRegEx.Replace(Result, PAS_COMM + '|' + CPP_COMM, '');
  Result := StringReplace(Result, ' '       , ''        , [rfReplaceAll]);
  Result := StringReplace(Result, sLineBreak, ''        , [rfReplaceAll]);
  Result := StringReplace(Result, ';'       , sLineBreak, [rfReplaceAll]);
end;

function  LangCodeProcess(var IvStepRecVec: TLangStepRecVec; IvCvCode: string; IvJson: TJSONObject; var IvHasFinding: boolean; var IvDefect: string): boolean;

  {$REGION 'var'}
var
  i, x, z: integer; // count, processcount
  cc, cr, k: string; // codecomp, coderow
  co: TStrings;  // codecompsl
  i0: PIplImage;
  i1: PIplImage;
  {$ENDREGION}

begin
  // exit
  cc := LangCodeCompile(IvCvCode);
  Result := not cc.Trim.IsEmpty;
  if not Result then begin
    IvJson.AddPair('warning', 'code is empty');
    Exit;
  end;

  // process
  x := 0;
  co := TStringList.Create;
  co.Text := cc.Trim;
  try
    for i := 0 to co.Count-1 do begin
      // cmd
      cr := co[i].Trim;
      if cr.IsEmpty then
        Continue;

      // src
      if x = 0 then
        BitmapToIplImage4(IvStepRecVec[0].Bmp, i0)
      else
        i0 := cvCloneImage(i1);

      // dest
      Inc(x);
               if cr.StartsWith('Math.') then begin
        MathCmdProcess(x, cr{.Remove(0, 5)}, i0, i1, IvJson);

      end else if cr.StartsWith('Stat.') then begin
        StatCmdProcess(x, cr{.Remove(0, 5)}, i0, i1, IvJson);

      end else if cr.StartsWith('Ocv.') then begin
        OcvCmdProcess(x, cr{.Remove(0, 4)}, i0, i1, IvJson, false);

      end else begin // presuppose optional 'Lang.' suffix (core language)
        LangCmdProcess(x, cr, i0, i1, IvJson);
      end;

      // step+
      z := Length(IvStepRecVec);
      SetLength(IvStepRecVec, z + 1);
      // info+
      IvStepRecVec[z].Step := x;
      IvStepRecVec[z].Cmd  := cr;
      IvStepRecVec[z].Data  := '';
      IvStepRecVec[z].Json  := TJson.Format(IvJson.GetValue('step' + x.ToString));
      // bmp+
      IvStepRecVec[z].Bmp := TBitmap.Create;
      IplImageToBitmap(i1, IvStepRecVec[z].Bmp, k);
    end;
  finally
    cvReleaseImage(&i0);
    cvReleaseImage(&i1);
    co.Free;
  end;
end;

function  LangCmdCompile(IvCommand: string; IvJson: TJSONObject): string;
const
  P = '\bJson\b[.](step\d[.]\w*)';
var
  i : integer;
  rx: TRegEx;
  mc: TMatchCollection;
  ma: TMatch;
  gr: TGroup;
  jv: TJSONValue;
  m0, m1: string;
begin
  Result := IvCommand;
  mc := rx.Matches(IvCommand, P);
  for ma in mc do begin
    m0 := ma.Value;

    for gr in ma.Groups do begin
    //jv := IvJson.FindValue(gr.Value);
      jv := IvJson.GetValue(gr.Value);
      if Assigned(jv) then
        Result := rx.Replace(Result, m0, jv.Value);
    end;
  end;
end;

procedure LangCmdProcess(const IvStep: integer; IvCmd: string; IvSrc: pIplImage; var IvDest: pIplImage; var IvJson: TJSONObject);

  {$REGION 'var'}
var
  // GENERAL
  cmr: TLangCmdRec;               // cmdrec
  c, k: string;                   // cmd
  p  : TArray<string>;            // params
  o  : string;                    // oper = p[0]
  // JSON
  jo0: TJSONObject;               // jasonobject
  // EXPEVAL
  s0, s1, s2, s3: string;
  ees: IScope;                    // container
  eec: ICompiledBinding;          // compiledexpr
  eer: TValue;                    // result
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

    {$REGION 'Exec'}
           if 'exec'.Contains(o) then begin
    s0 := p[0].Replace('|', ','); // expressiontoexecute
    {$ENDREGION}

    {$REGION 'Expreval'}
  end else if 'expreval'.Contains(o) then begin
    s0 := p[0]; // expressiontoevaluate

    // epreval (basic scope)
    ees := TNestedScope.Create(BasicOperators, BasicConstants);
    eec := System.Bindings.Evaluator.Compile(s0, ees);
    eer := eec.Evaluate(ees, nil, nil).GetValue;
    if eer.IsEmpty then
      jo0.AddPair('warning', 'expression: ' + s0 + ' returned an empty value')
    else
      jo0.AddPair('result', eer.ToString);
    {$ENDREGION}

    {$REGION 'InlineIf'}
  end else if 'inlineif'.Contains(o) then begin
    s0 := p[0]; // expressiontoevaluate
    s1 := p[1]; // truepart
    s2 := p[2]; // falsepart

    // epreval (basic scope)
    ees := BasicOperators;
    eec := System.Bindings.Evaluator.Compile(s0, ees);
    eer := eec.Evaluate(ees, nil, nil).GetValue.AsBoolean;

    if eer.AsBoolean then
      s3 := s1
    else
      s3 := s2;

    if eer.IsEmpty then
      jo0.AddPair('warning', 'expression: ' + s0 + ' returned an empty value')
    else begin
      jo0.AddPair('expression', s0);
      jo0.AddPair('truePart'  , s1);
      jo0.AddPair('falsePart' , s2);
      jo0.AddPair('result'    , s3);
    end;
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
