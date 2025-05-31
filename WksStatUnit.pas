unit WksStatUnit;

interface

{$REGION 'Use'}
uses
    System.Types
  , System.SysUtils
  , System.Math
  , System.Math.Vectors
  , System.Json
  , System.Generics.Defaults
  , System.Generics.Collections
  , ocv.core_c
  , ocv.core.types_c
//  , utypes
//  , umeansd
//  , uqsort
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  //TDoubleVec = array of double;
  TDoubleVec = TArray<double>;
{$ENDREGION}

{$REGION '***Move***'}
procedure QSort(v: TDoubleVec; a: integer = 0; b: integer = 0);  // sorts the elements of vector v in increasing order (quick sort)
procedure DQSort(v: TDoubleVec; a: integer = 0; b: integer = 0); // sorts the elements of vector v in decreasing order (quick sort)
function  QSelect(var v: TDoubleVec; k: integer; a: integer = 0; b: integer = 0): double; // returns the smallest k-th value in the v vector
{$ENDREGION}

{$REGION 'ProbabilityDistributions'}

  {$REGION 'Half Uniform'}
function  StatRndDistributionUniformHalf: double; //  0.0 .. +1.0
function  StatRndDistributionUniformHalfRange(IvR: Double): double; //  0.0 .. +n.0
  {$ENDREGION}

  {$REGION 'Half Normal'}
function  StatRndDistributionNormalHalf(IvSigma: double): double;
  {$ENDREGION}

  {$REGION 'Half Exponential'}
function  StatRndDistributionExponentialHalf(IvLambda: double): double;
  {$ENDREGION}

  {$REGION 'Full Uniform'}
function  StatRndDistributionUniform: double; // -1.0 .. +1.0
function  StatRndDistributionUniformRange(IvR1, IvR2: double): double; // double1 .. double2
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Univariate'}
function  StatMin        (v: TDoubleVec; a: integer = 0; b: integer = 0): double;
function  StatMax        (v: TDoubleVec; a: integer = 0; b: integer = 0): double;
function  StatRange      (v: TDoubleVec; a: integer = 0; b: integer = 0): double;
function  StatCount      (v: TDoubleVec; a: integer = 0; b: integer = 0): double;
function  StatSum        (v: TDoubleVec; a: integer = 0; b: integer = 0): double;
function  StatSumOfSquare(v: TDoubleVec; a: integer = 0; b: integer = 0): double;
function  StatMean       (v: TDoubleVec; a: integer = 0; b: integer = 0): double;
function  StatMedian     (v: TDoubleVec; a: integer = 0; b: integer = 0): double;
function  StatMode       (v: TDoubleVec; a: integer = 0; b: integer = 0): double; // most frequent value
function  StatVariance   (v: TDoubleVec; a: integer = 0; b: integer = 0): double; //  (biased StatVarianceP)
function  StatStdev      (v: TDoubleVec; a: integer = 0; b: integer = 0): double; //  (biased StatStdevP)
function  StatPercentile (v: TDoubleVec; p: double ; a: integer = 0; b: integer = 0): double; // percent  p = 0.0..1.0
function  StatQuantile   (v: TDoubleVec; q: integer; a: integer = 0; b: integer = 0): double; // quantile q = 0, 1, 2, 3, 4
function  StatQ1         (v: TDoubleVec; a: integer = 0; b: integer = 0): double;
function  StatQ3         (v: TDoubleVec; a: integer = 0; b: integer = 0): double;
function  StatIQR        (v: TDoubleVec; a: integer = 0; b: integer = 0): double; // inter quartile range IQR = Q3 - Q1
function  StatFenceLow   (v: TDoubleVec; k: double  = 1.5; a: integer = 0; b: integer = 0): double; // FL = Q1 - 1.5 * IRQ
function  StatFenceUp    (v: TDoubleVec; k: double  = 1.5; a: integer = 0; b: integer = 0): double; // FL = Q3 + 1.5 * IRQ
function  StatOutliers   (v: TDoubleVec; k: double  = 1.5; a: integer = 0; b: integer = 0): TDoubleVec;
function  StatOutliersLow(v: TDoubleVec; k: double  = 1.5; a: integer = 0; b: integer = 0): TDoubleVec;
function  StatOutliersUp (v: TDoubleVec; k: double  = 1.5; a: integer = 0; b: integer = 0): TDoubleVec;
{$ENDREGION}

{$REGION 'Stat'}
procedure StatCmdProcess(const IvStep: integer; IvCmd: string; IvSrc: pIplImage; var IvDest: pIplImage; var IvJson: TJSONObject);
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    WksLangUnit
;
{$ENDREGION}

{$REGION '***Move***'}
procedure QSort(v: TDoubleVec; a, b: integer);

  procedure Sort(L, R: integer);
  var
    I, J: integer;
    U, W: double;
  begin
    I := L;
    J := R;
    U := v[(L + R) div 2];
    repeat
      while v[I] < U do I := I + 1;
      while U < v[J] do J := J - 1;
      if I <= J then begin
        W := v[I]; v[I] := v[J]; v[J] := W;
        I := I + 1; J := J - 1;
      end;
    until I > J;
    if L < J then Sort(L, J);
    if I < R then Sort(I, R);
  end;

begin
  Sort(a, b);
end;

procedure DQSort(v: TDoubleVec; a, b: integer);

  procedure Sort(L, R: integer);
  var
    I, J: integer;
    U, W: double;
  begin
    I := L;
    J := R;
    U := v[(L + R) div 2];
    repeat
      while v[I] > U do I := I + 1;
      while U > v[J] do J := J - 1;
      if I <= J then begin
        W := v[I]; v[I] := v[J]; v[J] := W;
        I := I + 1; J := J - 1;
      end;
    until I > J;
    if L < J then Sort(L, J);
    if I < R then Sort(I, R);
  end;

begin
  Sort(a, b);
end;

function  QSelect(var v: TDoubleVec; k, a, b: integer): double;
  {
   AUTHOR: Hans Lohninger (www.lohninger.com SDL)

   ENTRY:  v     data array
           a, b  range of data to be processed
           k     k-th order statistic

   EXIT:   function  returns the value of the k-th smallest element of the data array
   }
var
  stop   : boolean;
  ixSplit: integer;
  ixPiv  : integer;

  function  Partition(a, b, ixPiv: integer): integer;
  var
    i      : integer;
    iy     : integer;
    pivot  : double;
    adouble: double;
  begin
    pivot := v[ixPiv];
    v[ixPiv] := v[a];
    v[a] := pivot;
    iy := a + 1;
    while (iy < b) and (v[iy] < pivot) do
      inc (iy);
    for i := iy+1 to b do
      if (v[i] <= pivot) then begin
        adouble := v[i];
        v[i] := v[iy];
        v[iy] := adouble;
        inc(iy);
      end;
    Result := iy - 1;
    v[a] := v[Result];
    v[Result] := pivot;
  //Result := Result;
  end;
begin
  stop := false;
  while not stop do begin
    ixPiv := (a + b) div 2;
    ixSplit := partition(a, b, ixPiv);
    if k < ixSplit then
      b := ixSplit
    else if k > ixSplit then
      a := ixSplit + 1
    else begin
      stop := true;
      Result := v[k];
    end;
  end;
end;
{$ENDREGION}

{$REGION 'ProbabilityDistributions'}

  {$REGION 'Half Uniform'}
function  StatRndDistributionUniformHalf: double; // real random 0..1
begin
  Result := Random(1000000000) / 1000000000;
end;

function  StatRndDistributionUniformHalfRange(IvR: Double): double;
begin
  Result := IvR * StatRndDistributionUniformHalf;
end;
  {$ENDREGION}

  {$REGION 'Half Normal'}
function  StatRndDistributionNormalHalf(IvSigma: double): double;
var
  r1, r2, z: double;
begin
  r1 := StatRndDistributionUniformHalf;
  r2 := StatRndDistributionUniformHalf;
  try
    z := Sqrt(-2.0 * Ln(r1)) * Cos(2 * Pi * r2);
  except
    z := 0;
  end;
  Result := IvSigma * z;
end;
  {$ENDREGION}

  {$REGION 'Half Exponential'}
function  StatRndDistributionExponentialHalf(IvLambda: double): double;
begin
  Result := (-Ln(1.0 - StatRndDistributionUniformHalf) / IvLambda);
end;
  {$ENDREGION}

  {$REGION 'Full Uniform'}
function  StatRndDistributionUniform: double;
begin
  if Random(2) = 0 then
    Result := StatRndDistributionUniformHalf
  else
    Result := -1 * StatRndDistributionUniformHalf;
end;

function  StatRndDistributionUniformRange(IvR1, IvR2: double): double;
begin
  Result := IvR1 + (IvR2 - IvR1) * StatRndDistributionUniformHalf;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Univariate'}
function  StatMin(v: TDoubleVec; a, b: integer): double;
var
  i: integer;
begin
  if b = 0 then b := Length(v) - 1;
  Result := v[a];

  for i := Succ(a) to b do
    if v[i] < Result then Result := v[i];
end;

function  StatMax(v: TDoubleVec; a, b: integer): double;
var
  i: integer;
begin
  if b = 0 then b := Length(v) - 1;
  Result := v[a];

  for i := Succ(a) to b do
    if v[i] > Result then Result := v[i];
end;

function  StatRange(v: TDoubleVec; a, b: integer): double;
begin
  Result := StatMax(v, a, b) - StatMin(v, a, b);
end;

function  StatCount(v: TDoubleVec; a: integer = 0; b: integer = 0): double;
begin
  if b = 0 then b := Length(v) - 1;
  Result := b + 1 - a;
end;

function  StatSum(v: TDoubleVec; a: integer = 0; b: integer = 0): double;
var
  i: integer;
begin
  if b = 0 then b := Length(v) - 1;
  Result := 0.0;

  for i := a to b do
    Result := Result + v[i];
end;

function  StatSumOfSquare(v: TDoubleVec; a: integer = 0; b: integer = 0): double;
var
  i: integer;
begin
  if b = 0 then b := Length(v) - 1;
  Result := 0.0;

  for i := a to b do
    Result := Result + IntPower(v[i], 2);
end;

function  StatMean(v: TDoubleVec; a, b: integer): double;
var
  i: integer;
begin
  if b = 0 then b := Length(v) - 1;
  Result := 0.0;

  for i := a to b do
    Result := Result + v[i];

  Result := Result / (Abs(a - b) + 1);
end;

function  StatMedian(v: TDoubleVec; a, b: integer): double;
var
  n, m : integer; // number, medium
begin
  if b = 0 then b := Length(v) - 1;

  n := Abs(a - b) + 1;
  m := (a - 1) + n div 2;

  QSort(v, a, b);

  if Odd(n) then
    Result := v[m + 1]
  else
    Result := 0.5 * (v[m] + v[m + 1]);
end;

function  StatMode(v: TDoubleVec; a, b: integer): double;
type
  TAccDic = TDictionary<double, integer>;
var
  i, n, m: integer; // max
  x, k: double; // item, key
  c: TAccDic; // accumulator
  r: TDoubleVec; // rounded version of v
begin
  // def
  if b = 0 then b := Length(v) - 1;

  // discretize
  n := b-a+1;
  SetLength(r, n);
  for i := Low(r) to High(r) do
    r[i] := Round(v[a+i]);

  // accum
  c := TAccDic.Create;
  try
    for x in r do
      if c.ContainsKey(x) then
        c[x] := c[x] + 1
      else
        c.Add(x, 1);

    // freqmax
    m := 0;
    for k in c.Keys do
      if c[k] > m then begin
        m := c[k];
        Result := k;
      end;
  finally
    c.Free;
  end;
end;

function  StatVariance(v: TDoubleVec; a, b: integer): double;
var
  i, n: integer;
  m, sd, sd2, dv : double; // mean, sum of deviations (used to reduce roundoff error), sum of squared deviations, deviation from the mean
begin
  if b = 0 then b := Length(v) - 1;

  n := Abs(a - b) + 1;
  sd  := 0.0;
  sd2 := 0.0;
  m := StatMean(v, a, b);

  for i := a to b do begin
    dv  := v[i] - m;
    sd  := sd + dv;
    sd2 := sd2 + sqr(dv);
  end;

  Result := (sd2 - sqr(sd) / n) / (n - 1);
end;

function  StatStdev(v: TDoubleVec; a, b: integer): double;
begin
  Result := Sqrt(StatVariance(v, a, b));
end;

function  StatPercentile(v: TDoubleVec; p: double; a, b: integer): double;
var
  k: integer;
begin
  k := Trunc(Length(v) * p);
  QSort(v, a, b);
  Result := v[k];
end;

function  StatQuantile(v: TDoubleVec; q: integer; a, b: integer): double;
begin
  case q of
  0: Result := StatMin(v, a, b);
  1: Result := StatPercentile(v, 0.25, a, b);
  2: Result := StatMedian(v, a, b);
  3: Result := StatPercentile(v, 0.75, a, b);
  4: Result := StatMax(v, a, b);
  end;
end;

function  StatQ1(v: TDoubleVec; a, b: integer): double;
begin
  Result := StatQuantile(v, 1, a, b);
end;

function  StatQ3(v: TDoubleVec; a, b: integer): double;
begin
  Result := StatQuantile(v, 3, a, b);
end;

function  StatIQR(v: TDoubleVec; a, b: integer): double;
begin
  Result := StatQ3(v, a, b) - StatQ1(v, a, b);
end;

function  StatFenceLow(v: TDoubleVec; k: double; a, b: integer): double;
var
  q1, q3: double;
begin
  q1 := StatQ1(v, a, b);
  q3 := StatQ3(v, a, b);
  Result := q1 - {1.5}k * (q3 - q1);
end;

function  StatFenceUp(v: TDoubleVec; k: double; a, b: integer): double;
var
  q1, q3: double;
begin
  q1 := StatQ1(v, a, b);
  q3 := StatQ3(v, a, b);
  Result := q3 + {1.5}k * (q3 - q1);
end;

function  StatOutliers(v: TDoubleVec; k: double; a, b: integer): TDoubleVec;
var
  z: integer;
  fl, fu, x: double;
begin
  fl := StatFenceLow(v, k, a, b);
  fu := StatFenceUp(v, k, a, b);
  for x in v do
    if (x < fl) or (x > fu) then begin
      z := Length(Result);
      SetLength(Result, z+1);
      Result[z] := x;
    end;
end;

function  StatOutliersLow(v: TDoubleVec; k: double; a, b: integer): TDoubleVec;
var
  z: integer;
  fl, x: double;
begin
  fl := StatFenceLow(v, k, a, b);
  for x in v do
    if x < fl then begin
      z := Length(Result);
      SetLength(Result, z+1);
      Result[z] := x;
    end;
end;

function  StatOutliersUp(v: TDoubleVec; k: double; a, b: integer): TDoubleVec;
var
  z: integer;
  fu, x: double;
begin
  fu := StatFenceUp(v, k, a, b);
  for x in v do
    if x > fu then begin
      z := Length(Result);
      SetLength(Result, z+1);
      Result[z] := x;
    end;
end;
{$ENDREGION}

{$REGION 'Stat'}
procedure StatCmdProcess(const IvStep: integer; IvCmd: string; IvSrc: pIplImage; var IvDest: pIplImage; var IvJson: TJSONObject);

  {$REGION 'var'}
var
  // GENERAL
  cmr: TLangCmdRec;               // cmdrec
  c, k: string;                   // cmd
  p  : TArray<string>;            // params
  o  : string;                    // oper = p[0]
  s: string;
  z: integer;
  d: double;
  // JSON
  jo0: TJSONObject;               // jasonobject
  ja0, ja1: TJSONArray;           // jsonvector
  jv0: TJsonValue;                // jsonvalue
  je0: TJSONValue;                // jsonvectelement
  jp0: string;                    // jsonpath
  // UVA
  x  : double;                    // value of an item in explicative X var/set
  xv : TDoubleVec;                // uva floats vector (explicative X var/set)
  olv: TDoubleVec;                // outlierslowvec
  ouv: TDoubleVec;                // outliersupvec
  {$ENDREGION}

begin

  {$REGION 'json'}
  jo0 := TJSONObject.Create;
  {$ENDREGION}

  {$REGION 'cmd'}
  // exit
  if IvCmd.IsEmpty then begin
    jo0.AddPair('warning', 'command is empty');
    Exit;
  end;

  // complile
  if IvCmd.Contains('Json.') then begin
    IvCmd := LangCmdCompile(IvCmd, IvJson);
    jo0.AddPair('cmdCompiled', IvCmd);
  end;

  // cmdrec
  cmr.Create(IvCmd, k);
  jo0.AddPair('cmd', cmr.Cmd);
  {$ENDREGION}

  {$REGION 'params'}
  p := cmr.ParamValueVec;
//jo0.AddPair('params', TJSONArray.Create(p));
//  if not (Length(p) >= 2) then begin
//    jo0.AddPair('warning', 'command has no parameters');
//    Exit;
//  end;
  {$ENDREGION}

  {$REGION 'process'}
  IvDest := cvCloneImage(IvSrc); // do nothing with this

  o := cmr.Ope.Trim.ToLower; // oper

    {$REGION 'UVA'}
  if 'uva'.Contains(o) then begin
    jp0 :=               p[0].Remove(0, 5); // jsonpath  Replace('|', ',')
    d   := StrToFloatDef(p[1], 1.5);        // k param used to calculate outliers fences

    {$IF CompilerVersion <= 31}
    ja0 := IvJson.Value(jp0) as TJSONArray;
    ja0 := IvJson.GetValue(jp0) as TJSONArray;
    {$ELSE}
    ja0 := IvJson.FindValue(jp0) as TJSONArray;
    {$ENDIF};
    if not Assigned(ja0) then
      raise Exception.Create('Invalid JSON array');

    for jv0 in ja0 do begin
      z := Length(xv);
      SetLength(xv, z+1);
      xv[z] := jv0.GetValue<double>;
    end;
    jo0.AddPair('uvaMin'             , TJSONNumber.Create(StatMin(xv)));
    jo0.AddPair('uvaMax'             , TJSONNumber.Create(StatMax(xv)));
    jo0.AddPair('uvaRange'           , TJSONNumber.Create(StatRange(xv)));

    jo0.AddPair('uvaMean'            , TJSONNumber.Create(StatMean(xv)));
    jo0.AddPair('uvaMedian'          , TJSONNumber.Create(StatMedian(xv)));
    jo0.AddPair('uvaMode'            , TJSONNumber.Create(StatMode(xv)));

    jo0.AddPair('uvaVariance'        , TJSONNumber.Create(StatVariance(xv)));
    jo0.AddPair('uvaStdev'           , TJSONNumber.Create(StatStdev(xv)));

    jo0.AddPair('uvaQ1'              , TJSONNumber.Create(StatQ1(xv)));
    jo0.AddPair('uvaQ3'              , TJSONNumber.Create(StatQ3(xv)));
    jo0.AddPair('uvaIQR'             , TJSONNumber.Create(StatIQR(xv)));
    jo0.AddPair('uvaFenceLow'        , TJSONNumber.Create(StatFenceLow(xv, d)));
    jo0.AddPair('uvaFenceUp'         , TJSONNumber.Create(StatFenceUp(xv, d)));

    olv := StatOutliersLow(xv, d);
    jo0.AddPair('uvaOutliersLowCount', TJSONNumber.Create(Length(olv)));

    ja0 := TJsonArray.Create();
    for x in olv do ja0.Add(x);
    jo0.AddPair('uvaOutliersLowVec'  , ja0);

    ouv := StatOutliersUp(xv, d);
    jo0.AddPair('uvaOutliersUpCount' , TJSONNumber.Create(Length(ouv)));

    ja1 := TJsonArray.Create();
    for x in ouv do ja1.Add(x);
    jo0.AddPair('uvaOutliersUpVec'   , ja1);
    {$ENDREGION}

    {$REGION 'BVA'}
  end else if 'bva'.Contains(o) then begin

    {$ENDREGION}

    {$REGION 'MVA'}
  end else if 'mva'.Contains(o) then begin

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
