unit WksIotUnit;

interface

{$REGION 'Use'}
uses
    System.SysUtils
  , Soap.InvokeRegistry
  , Winapi.ActiveX
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TIotRec = record // device
    Id          : integer;
    PId         : integer;
    Organization: string ; // \___organization
    Owner       : string ; // /
    Device      : string ;
    Ssid        : string ; // ???
    Ip          : string ; 
    State       : string ;
    Note        : string ;
  //Installed   : TDateTime; // installation datetime
  //Expire      : TDateTime; // next preventive maintenance datetime
  end;

  TPlanRec = record // a plan for a set of measures recorded in a datalog set
    Id          : integer;
    PId         : integer;
    Organization: string ; // \___organization
    Owner       : string ; // /
    Plan        : string ;
    TraceCsv    : string ; // Temp,--Humi, ...  (prepending '--' will remove the trace from the chart)
    UomCsv      : string ; // C,%,...           temperature,HRel,...
    ValueCsv    : string ; // %f,%d,...         123.4,41,...
    RuleIdCsv   : string ; // 41,42,...
    ChartJson   : string ; // {}
    TraceJson   : string ; // [{}, {}, ...]
    State       : string ;
    Note        : string ;
  end;

  TDatalogRec = record
    Id          : integer  ; //
    PId         : integer  ; //
    Organization: string   ; // \___organization        Localhost
    Owner       : string   ; // /                       puppadrillo
    Datalog     : string   ; // \
    Uom{Csv}    : string   ; //  |  ***REMOVE***        C,%,...
    Value{Csv}  : string   ; //  |--measure(s)          123.45,41.5,...
    RuleId{Csv} : string   ; //  |  ***REMOVE***        41,42,... rule(s) to apply for violation verification to each correspondig measure
    Timestamp   : TDateTime; // /                       2018-02-11 11:00:00
    Note        : string   ; //                         note from sensor(s) or violation message(s) after verification(s)
  //State       : string   ;
  public
    function  HasKey(var IvFbk: string): boolean;
    function  IsValid(var IvFbk: string): boolean;
    procedure Init(IvOrganization, IvOwner: string);
    function  DbaExists(var IvFbk: string): boolean; // record exists, not dba exists!
    function  DbaSelect(var IvFbk: string; IvInsertIfNotExist: boolean = false): boolean;
    function  DbaInsert(var IvFbk: string): boolean;
    function  DbaUpdate(var IvFbk: string; IvInsertIfNotExist: boolean = false): boolean;
    function  DbaDelete(var IvFbk: string): boolean; // delete by FldPId
  end;

  TRuleRec = record
    Id                : integer;
    PId               : integer;
    Organization      : string ; // \___organization
    Owner             : string ; // /
    Rule              : string ; // \
    Uom               : string ; //  |
    Nominal           : double ; //  |
    Lsl               : double ; //  |--rule
    Lcl               : double ; //  |
    Ucl               : double ; //  |
    Usl               : double ; // /
    ToleranceSec      : integer; // ???
    OkEmail           : string ; // \___info
    OkText            : string ; // /
    CtrlViolationEmail: string ; // \___OOC violations
    CtrlViolationText : string ; // /
    SpecViolationEmail: string ; // \___OOS violations
    SpecViolationText : string ; // /
    State             : string ;
    Note              : string ;
  public
    function  HasKey(var IvFbk: string): boolean;
    function  IsValid(var IvFbk: string): boolean;
    procedure Init(IvOrganization, IvOwner: string);
    function  DbaExists(var IvFbk: string): boolean; // record exists, not dba exists!
    function  DbaSelect(var IvFbk: string; IvInsertIfNotExist: boolean = false): boolean;
    function  DbaInsert(var IvFbk: string): boolean;
    function  DbaDelete(var IvFbk: string): boolean; // delete by FldId
  end;

  TTraceRec = record
    Organization      : string   ; // \___organization
    Owner             : string   ; // /
    PId               : string   ;
    TimestampBegin    : TDateTime;
    TimestampEnd      : TDateTime;
  public
    function  IsValid(var IvFbk: string): boolean;
    function  DbaSelectCsv(var IvCsv: string; var IvFbk: string): boolean;
    function  DbaSelectJson(var IvJson: string; var IvFbk: string): boolean; // can return one or more traces: data = [trace1, trace2, trace3]
  end;
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    System.Classes
  , Data.DB
  , Superobject
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Const'}
const
  SELECT_MAX = 10000;
{$ENDREGION}

{$REGION 'TDatalogRec'}
function  TDatalogRec.HasKey(var IvFbk: string): boolean;
begin
  Result := Id > 0;
  if Result then
    IvFbk := Format('Datalog has key %d', [Id])
  else
    IvFbk := 'Datalog has no valid key';
end;

function  TDatalogRec.IsValid(var IvFbk: string): boolean;
begin
  Result := (PId > 0) and (Organization <> '') and (Owner <> '');
  if Result then
    IvFbk := 'Datalog is valid'
  else
    IvFbk := 'Datalog is invalid';
end;

procedure TDatalogRec.Init(IvOrganization, IvOwner: string);
begin
  Id           := -1; // the real one will be set once saved into db
  PId          := OBJ_ROOT_TEMP_ID;
  Organization := IvOrganization;
  Owner        := IvOwner;
  Datalog      := TNamRec.Rnd();
  Uom          := '';
  Value        := '';
  RuleId       := '';
  Timestamp    := 0.0;
  Note         := '';
//State        := '';
end;

function  TDatalogRec.DbaExists(var IvFbk: string): boolean;
var
  wer: string;
begin

  {$REGION 'Check'}
  Result := HasKey(IvFbk);
  if not Result then
    Exit;
  {$ENDREGION}

  {$REGION 'Dba'}
  wer := Format('FldOrganization = ''%s'' and FldOwner = ''%s'' and FldId = %d', [Organization, Owner, Id]);
  Result := TDbaRec.RecExists('DbaIot.dbo.TblDatalog', wer, IvFbk);
  {$ENDREGION}

end;

function  TDatalogRec.DbaSelect(var IvFbk: string; IvInsertIfNotExist: boolean): boolean;
var
  sql: string;
  dst: TDataSet;
begin

  {$REGION 'Check'}
  Result := HasKey(IvFbk);
  if not Result then
    Exit;
  {$ENDREGION}

  {$REGION 'Dba'}
  try
    // ds
    sql := Format('select * from DbaIot.dbo.TblDatalog where FldId = %d', [Id]);
    Result := TDbaRec.DsFromSql(sql, dst, IvFbk);
    if not Result then
      Exit;

    // set
    Id           := dst.FieldByName('FldId'          ).AsInteger ;
    PId          := dst.FieldByName('FldPId'         ).AsInteger ;
    Organization := dst.FieldByName('FldOrganization').AsString  ;
    Owner        := dst.FieldByName('FldOwner'       ).AsString  ;
    Datalog      := dst.FieldByName('FldDatalog'     ).AsString  ;
    Uom          := dst.FieldByName('FldUom'         ).AsString  ;
    Value        := dst.FieldByName('FldValue'       ).AsString  ;
    RuleId       := dst.FieldByName('FldRuleId'      ).AsString  ;
    Timestamp    := dst.FieldByName('FldTimestamp'   ).AsDateTime;
    Note         := dst.FieldByName('FldNote'        ).AsString  ;

    // end
    IvFbk  := Format('Datalog selected for: %d', [Id]);
  finally
    dst.Free;
  end;
  {$ENDREGION}

end;

function  TDatalogRec.DbaInsert(var IvFbk: string): boolean;
var
  sql: string;
  aff: integer;
begin

  {$REGION 'Check'}
  Result := IsValid(IvFbk);
  if not Result then
    Exit;
  {$ENDREGION}

  {$REGION 'Dba'}
  // id
  Id := TDbaRec.TblIdNext('DbaIot.dbo.TblDatalog');

  // sql
  sql :=         'insert into DbaIot.dbo.TblDatalog'
  + sLineBreak + 'select'
  + sLineBreak + '    ' + TSqlRec.Val(Id          )
  + sLineBreak + '  , ' + TSqlRec.Val(PId         )
  + sLineBreak + '  , ' + TSqlRec.Val(Organization)
  + sLineBreak + '  , ' + TSqlRec.Val(Owner       )
  + sLineBreak + '  , ' + TSqlRec.Val(Datalog     )
  + sLineBreak + '  , ' + TSqlRec.Val(Uom         )
  + sLineBreak + '  , ' + TSqlRec.Val(Value       )
  + sLineBreak + '  , ' + TSqlRec.Val(RuleId      )
  + sLineBreak + '  , ' + TSqlRec.Val(Timestamp   )
  + sLineBreak + '  , ' + TSqlRec.Val(Note        );

  // insert
  Result := TDbaRec.CmdExec(sql, aff, IvFbk);
  if not Result then
    Exit;

  // end
  IvFbk  := Format('Datalog inserted for: %d', [Id]);
  {$ENDREGION}

end;

function  TDatalogRec.DbaUpdate(var IvFbk: string; IvInsertIfNotExist: boolean): boolean;
begin
  IvFbk := NOT_IMPLEMENTED_STR;
  Result := false;
end;

function  TDatalogRec.DbaDelete(var IvFbk: string): boolean;
var
  sql: string;
  aff: integer;
begin
    sql := Format( 'delete from'
    + sLineBreak + '    DbaIot.dbo.TblDatalog'
    + sLineBreak + 'where'
    + sLineBreak + '    FldPId = %d'
    , [PId]
    );
    Result := TDbaRec.CmdExec(sql, aff, IvFbk);
end;
{$ENDREGION}

{$REGION 'TRuleRec'}
function  TRuleRec.HasKey(var IvFbk: string): boolean;
begin
  Result := Id > 0;
  if Result then
    IvFbk := Format('Rule has key %d', [Id])
  else
    IvFbk := 'Rule has no valid key';
end;

function  TRuleRec.IsValid(var IvFbk: string): boolean;
begin
  Result := (Id > 0) and (PId > 0) and (Organization <> '') and (Rule <> '');
  if Result then
    IvFbk := 'Rule is valid'
  else
    IvFbk := 'Rule is invalid';
end;

procedure TRuleRec.Init(IvOrganization, IvOwner: string);
begin
  Id                 := -1; // the real one will be set once saved into db
  PId                := OBJ_ROOT_TEMP_ID;
  Organization       := IvOrganization;
  Owner              := IvOwner;
  Rule               := TNamRec.Rnd;
  Uom                := '';
  Nominal            := 0.0;
  Lsl                := 0.0;
  Lcl                := 0.0;
  Ucl                := 0.0;
  Usl                := 0.0;
  ToleranceSec       := 0;
  OkEmail            := '';
  OkText             := '';
  CtrlViolationEmail := '';
  CtrlViolationText  := '';
  SpecViolationEmail := '';
  SpecViolationText  := '';
  State              := TStaRec.ACTIVE.Name;
  Note               := '';
end;

function  TRuleRec.DbaExists(var IvFbk: string): boolean;
var
  wer: string;
begin

  {$REGION 'Check'}
  Result := HasKey(IvFbk);
  if not Result then
    Exit;
  {$ENDREGION}

  {$REGION 'Dba'}
  wer := Format('FldOrganization = ''%s'' and FldOwner = ''%s'' and FldRule = ''%s''', [Organization, Owner, Rule]);
  Result := TDbaRec.RecExists('DbaIot.dbo.TblRule', wer, IvFbk);
  {$ENDREGION}

end;

function  TRuleRec.DbaSelect(var IvFbk: string; IvInsertIfNotExist: boolean): boolean;
var
  sql: string;
  dst: TDataSet;
begin

  {$REGION 'Check'}
  Result := HasKey(IvFbk);
  if not Result then
    Exit;
  {$ENDREGION}

  {$REGION 'Dba'}
  try
    // ds
    sql := Format('select * from DbaIot.dbo.TblRule where FldId = %d', [Id]);
    Result := TDbaRec.DsFromSql(sql, dst, IvFbk);
    if not Result then
      Exit;

    // set
    Id                 := dst.FieldByName('FldId'                ).AsInteger ;
    PId                := dst.FieldByName('FldPId'               ).AsInteger ;
    Organization       := dst.FieldByName('FldOrganization'      ).AsString  ;
    Owner              := dst.FieldByName('FldOwner'             ).AsString  ;
    Rule               := dst.FieldByName('FldRule'              ).AsString  ;
    Uom                := dst.FieldByName('FldUom'               ).AsString  ;
    Nominal            := dst.FieldByName('FldNominal'           ).AsFloat   ;
    Lsl                := dst.FieldByName('FldLsl'               ).AsFloat   ;
    Lcl                := dst.FieldByName('FldLcl'               ).AsFloat   ;
    Ucl                := dst.FieldByName('FldUcl'               ).AsFloat   ;
    Usl                := dst.FieldByName('FldUsl'               ).AsFloat   ;
    ToleranceSec       := dst.FieldByName('FldToleranceSec'      ).AsInteger ;
    OkEmail            := dst.FieldByName('FldOkEmail'           ).AsString  ;
    OkText             := dst.FieldByName('FldOkText'            ).AsString  ;
    CtrlViolationEmail := dst.FieldByName('FldCtrlViolationEmail').AsString  ;
    CtrlViolationText  := dst.FieldByName('FldCtrlViolationText' ).AsString  ;
    SpecViolationEmail := dst.FieldByName('FldSpecViolationEmail').AsString  ;
    SpecViolationText  := dst.FieldByName('FldSpecViolationText' ).AsString  ;
    State              := dst.FieldByName('FldState'             ).AsString  ;
    Note               := dst.FieldByName('FldNote'              ).AsString  ;

    // end
    IvFbk  := Format('Rule selected for: %d', [Id]);
  finally
    dst.Free;
  end;
  {$ENDREGION}

end;

function  TRuleRec.DbaInsert(var IvFbk: string): boolean;
var
  sql: string;
  aff: integer;
begin

  {$REGION 'Check'}
  Result := IsValid(IvFbk);
  if not Result then
    Exit;
  {$ENDREGION}

  {$REGION 'Dba'}
  // id
  Id := TDbaRec.TblIdNext('DbaIot.dbo.TblRule');

  // sql
  sql :=         'insert into DbaIot.dbo.TblRule'
  + sLineBreak + 'select'
  + sLineBreak + '    ' + TSqlRec.Val(Id)
  + sLineBreak + '  , ' + TSqlRec.Val(PId)
  + sLineBreak + '  , ' + TSqlRec.Val(Organization)
  + sLineBreak + '  , ' + TSqlRec.Val(Owner)
  + sLineBreak + '  , ' + TSqlRec.Val(Rule)
  + sLineBreak + '  , ' + TSqlRec.Val(Uom)
  + sLineBreak + '  , ' + TSqlRec.Val(Nominal)
  + sLineBreak + '  , ' + TSqlRec.Val(Lsl)
  + sLineBreak + '  , ' + TSqlRec.Val(Lcl)
  + sLineBreak + '  , ' + TSqlRec.Val(Ucl)
  + sLineBreak + '  , ' + TSqlRec.Val(Usl)
  + sLineBreak + '  , ' + TSqlRec.Val(ToleranceSec)
  + sLineBreak + '  , ' + TSqlRec.Val(OkEmail)
  + sLineBreak + '  , ' + TSqlRec.Val(OkText)
  + sLineBreak + '  , ' + TSqlRec.Val(CtrlViolationEmail)
  + sLineBreak + '  , ' + TSqlRec.Val(CtrlViolationText)
  + sLineBreak + '  , ' + TSqlRec.Val(SpecViolationEmail)
  + sLineBreak + '  , ' + TSqlRec.Val(SpecViolationText)
  + sLineBreak + '  , ' + TSqlRec.Val(State)
  + sLineBreak + '  , ' + TSqlRec.Val(Note);

  // insert
  Result := TDbaRec.CmdExec(sql, aff, IvFbk);
  if not Result then
    Exit;

  // end
  IvFbk  := Format('Rule inserted for: %d', [Id]);
  {$ENDREGION}

end;

function  TRuleRec.DbaDelete(var IvFbk: string): boolean;
var
  sql: string;
  aff: integer;
begin
    sql := Format( 'delete from'
    + sLineBreak + '    DbaIot.dbo.TblRule'
    + sLineBreak + 'where'
    + sLineBreak + '    FldId = %d'
    , [PId]
    );
    Result := TDbaRec.CmdExec(sql, aff, IvFbk);
end;
{$ENDREGION}

{$REGION 'TTraceRec'}
function  TTraceRec.IsValid(var IvFbk: string): boolean;
begin
  // check
  Result := (PId <> '') and (Organization <> '') and (Owner <> '');
  if not Result then begin
    IvFbk := 'TraceRec is valid. PId, Organization, Owner, TimestampBegin, TimestampEnd have to be not empty and valid';
    Exit;
  end;

  // end
  IvFbk := 'TraceRec is valid';
end;

function  TTraceRec.DbaSelectCsv(var IvCsv, IvFbk: string): boolean;
var
  x, y, n, sql: string; // datetime, yvalues, note
  dst: TDataSet;
  sli: TStrings;
begin

  {$REGION 'Check'}
  Result := IsValid(IvFbk);
  if not Result then begin
    IvCsv := '';
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'Dba'}
  sli := TStringList.Create;
  try
    // sql
    sql := Format( 'select * from ('
    + sLineBreak + 'select top(%d)'
    + sLineBreak + '    FldId'
    + sLineBreak + '  , FldPId'
    + sLineBreak + '  , FldOrganization'
    + sLineBreak + '  , FldOwner'
    + sLineBreak + '  , FldDatalog'
    + sLineBreak + '  , FldUom'
    + sLineBreak + '  , FldValue'
    + sLineBreak + '  , FldRuleId'
    + sLineBreak + '  , convert(varchar, FldTimestamp, 120) as FldTimestamp'
    + sLineBreak + '  , FldNote'
    + sLineBreak + 'from'
    + sLineBreak + '    DbaIot.dbo.TblDatalog'
    + sLineBreak + 'where'
    + sLineBreak + '    FldOrganization = ''%s'''
    + sLineBreak + 'and FldOwner = ''%s'''
    + sLineBreak + 'and FldPId = %s'
    + sLineBreak + 'and FldTimestamp between ''%s'' and ''%s'''
    + sLineBreak + 'order by'
    + sLineBreak + '    FldTimestamp desc'
    + sLineBreak + ') T'
    + sLineBreak + 'order by'
    + sLineBreak + '    FldTimestamp'
    , [SELECT_MAX, Organization, Owner, PId, DateTimeToStr(TimestampBegin), DateTimeToStr(TimestampEnd)]
    );

    // ds
    Result := TDbaRec.DsFromSql(sql, dst, IvFbk);
    if not Result then
      Exit;

    // walk
    while not dst.Eof do begin
      x := dst.FieldByName('FldTimestamp').AsString;
      y := dst.FieldByName('FldValue'    ).AsString;
      n := dst.FieldByName('FldNote'     ).AsString;

      sli.Add(Format('%s,%s,%s', [x, y, n]));
      dst.Next;
    end;

    // csv
    IvCsv := sli.Text;
  finally
    dst.Free;
    sli.Free;
  end;
  {$ENDREGION}

end;

function  TTraceRec.DbaSelectJson(var IvJson, IvFbk: string): boolean;
var
  i: integer;
  dlg, nte, pli, pla, x, n, t: string;              // datalog, note, planid, plan
  ucs, vcs, rcs, tcs, chj{, trj}, sql: string;      // uomcsv, valuecsv, ruleidcsv, tracecsv, chartjson, tracesjsonpsv
  tve, tjv, uve, vve, rve, ove, yve: TStringVector; // tracevec, tracejsonvec, uomcsvvec, valuecsvvec, ruleidcsvvec, ordinatevec, valuevec
  dst: TDataSet;
  plj: ISuperObject; // planidjson
begin

  {$REGION 'Check'}
  Result := IsValid(IvFbk);
  if not Result then begin
    IvJson := '{}';
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'Dba'}
  try

    {$REGION 'Datalog'}
    // sql
    sql := 'select * from DbaIot.dbo.TblDatalog where FldId = ' + PId;

    // ds
    Result := TDbaRec.DsFromSql(sql, dst, IvFbk);
    if not Result then begin
      IvJson := '{"error": "' + IvFbk + '"}';
      Exit;
    end;

    dlg := dst.FieldByName('FldDatalog').AsString;
    nte := dst.FieldByName('FldNote'   ).AsString;
    {$ENDREGION}

    {$REGION 'Plan'}
    // planid
    plj := SO(nte);
    pli := plj.S['PlanId'];
    Result := TStrRec.StrIsNumeric(pid);
    if not Result then begin
      IvJson := '{"eror": "Iot PlanId not an integer, please use like this {"PlanId": 123}"}';
      Exit;
    end;

    // sql
    sql := 'select * from DbaIot.dbo.TblPlan where FldId = ' + pli;

    // ds
    Result := TDbaRec.DsFromSql(sql, dst, IvFbk);
    if not Result then begin
      IvJson := '{"error": "' + IvFbk + '"}';
      Exit;
    end;

    // csv
    pla := dst.FieldByName('FldPlan').AsString;
    tcs := dst.FieldByName('FldTraceCsv').AsString;
    ucs := dst.FieldByName('FldUomCsv').AsString;
    vcs := dst.FieldByName('FldValueCsv').AsString;
    rcs := dst.FieldByName('FldRuleIdCsv').AsString;

    // vec
    tve := TLstRec.LstToVector(tcs);
    uve := TLstRec.LstToVector(ucs);
    vve := TLstRec.LstToVector(vcs);
    rve := TLstRec.LstToVector(rcs);
    Result := ((Length(tve) + Length(uve) + Length(uve)) / Length(uve)) = 3;
    if not Result then begin
      IvJson := '{"error": "Iot Plan definition is incorrect, csv lists need to have the same numbers of values"}';
      Exit;
    end;

    // json
    chj := dst.FieldByName('FldChartJson').AsString;
    tjv := TLstRec.LstToVector(dst.FieldByName('FldTraceJson').AsString, '|');
    {$ENDREGION}

    {$REGION 'Data'}
    // sql
    sql := Format( 'select * from ('
    + sLineBreak + 'select top(%d)'
    + sLineBreak + '    FldId'
    + sLineBreak + '  , FldPId'
    + sLineBreak + '  , FldOrganization'
    + sLineBreak + '  , FldOwner'
    + sLineBreak + '  , FldDatalog'
  //+ sLineBreak + '  , FldUom'
    + sLineBreak + '  , FldValue'
  //+ sLineBreak + '  , FldRuleId'
    + sLineBreak + '  , convert(varchar, FldTimestamp, 120) as FldTimestamp'
    + sLineBreak + '  , FldNote'
    + sLineBreak + 'from'
    + sLineBreak + '    DbaIot.dbo.TblDatalog'
    + sLineBreak + 'where'
    + sLineBreak + '    FldOrganization = ''%s'''
    + sLineBreak + 'and FldOwner = ''%s'''
    + sLineBreak + 'and FldPId = %s'
    + sLineBreak + 'and FldTimestamp between ''%s'' and ''%s'''
    + sLineBreak + 'order by'
    + sLineBreak + '    FldTimestamp desc'
    + sLineBreak + ') T'
    + sLineBreak + 'order by'
    + sLineBreak + '    FldTimestamp'
    , [SELECT_MAX, Organization, Owner, PId, DateTimeToStr(TimestampBegin), DateTimeToStr(TimestampEnd)]
    );

    // ds
    Result := TDbaRec.DsFromSql(sql, dst, IvFbk);
    if not Result then begin
      IvJson := '{"error": "' + IvFbk + '"}';
      Exit;
    end;

    x := '';
    n := '';
    SetLength(yve, Length(uve)); // y, y2, ...
    while not dst.Eof do begin
      // ascissa
      x := x + ',"' + dst.FieldByName('FldTimestamp').AsString + '"';

      // ordinates
      ove := TLstRec.LstToVector(dst.FieldByName('FldValue').AsString);
      for i := Low(uve) to High(uve) do
        yve[i] := yve[i] + ','  + ove[i];

      // note
      n := n + ',"' + dst.FieldByName('FldNote').AsString.Replace('"', '`') + '"';

      // next
      dst.Next;
    end;
    Delete(x, 1, 1);
    for i := Low(uve) to High(uve) do
      Delete(yve[i], 1, 1);
    Delete(n, 1, 1);
    {$ENDREGION}

  finally
    dst.Free;
  end;
  {$ENDREGION}

  {$REGION 'Json'}
  t := '';
  for i := Low(uve) to High(uve) do begin
    // skip
    if tve[i][1] = '-' then
      continue;

    // traceadd
    t := t       + ','
    + sLineBreak + '    {'
    + sLineBreak + '      "x":[' + x + ']'
    + sLineBreak + '    , "y":[' + yve[i] + ']'
    + sLineBreak + tjv[i]

  //+ sLineBreak + '    , "type": "scatter"'
  //+ sLineBreak + '    , "mode": "lines+markers"'                           // markers | lines+markers | lines+markers+text
  //+ sLineBreak + '    , "name": "' + Format('%d %s %s', [i, l, uv[i]]) + '"'
  //+ sLineBreak + '    , "line": {"color": "' + BS_COLOR_INFO + '", "width": 1, "dash": "solid", "shape": "spline"}'
  //+ sLineBreak + '    , "marker": {"symbol": "circle", "size": 3, "color": "' + BS_COLOR_INFO_DARK + '"}'

  //+ sLineBreak + '    , "text": [' + n + ']'
  //+ sLineBreak + '    , "textposition": "top center"'
  //+ sLineBreak + '    , "textfont": {"family": "Calibri"}'
  //+ sLineBreak + '    , "organization": "'   + Organization                  + '"'
  //+ sLineBreak + '    , "owner": "'          + Owner                         + '"'
  //+ sLineBreak + '    , "pid": "'            + PId                           + '"'
  //+ sLineBreak + '    , "timestampBegin": "' + DateTimeToStr(TimestampBegin) + '"'
  //+ sLineBreak + '    , "timestampEnd": "'   + DateTimeToStr(TimestampEnd)   + '"'
    + sLineBreak + '    }'
  end;
  Delete(t, 1, 1);

  IvJson      := '{'
  + sLineBreak + '  "data": ['
               +      t
  + sLineBreak + '  ]'
  + sLineBreak + '}'
  ;
  {$ENDREGION}

end;
{$ENDREGION}

end.

