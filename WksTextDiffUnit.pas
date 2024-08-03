unit WksTextDiffUnit;

{
  original author: Angus Johnson www.angusj.com/delphi/textdiff.html angusj@myrealbox.com
  original editor: Rickard Johansson www.rj-texted.se (RJ TextEd)
  embedded in wks: Puppadrillo www.wks.cloud
}

interface

uses
    Generics.Collections
  , Winapi.Windows
  , System.Classes
  , System.SysUtils
  , Vcl.Forms
  ;

const
  MAX_DIAGONAL   = $FFFFFF; // ~16 million
  ADDED_COLOR    = $FFAAAA; // paleblue
  MODIFIED_COLOR = $AAFFAA; // palegreen
  DELETED_COLOR  = $AAAAFF; // palered
                //  bbggrr
type
  P8Bits = PByte;
  PDiagonalMtx = ^TDiagonalMtx;
  TDiagonalMtx = array[-MAX_DIAGONAL..MAX_DIAGONAL] of integer;
  TChangeKind = (ckNone, ckAdd, ckDelete, ckModify);
  PCompareRec = ^TCompareRec;
  
  TCompareRec = record
    Kind      : TChangeKind;
    OldIndex1 : integer;
    OldIndex2 : integer;
    case boolean of
      false   : (Chr1, Chr2: char);
      true    : (Int1, Int2: cardinal);
  end;
  
  PTextDiffRec = ^TTextDiffRec;
  TTextDiffRec = record // vars
    Offset1 : integer;
    Offset2 : integer;
    Len1    : integer;
    Len2    : integer;
  end;
  
  TTextDiffStatsRec = record
    Matches  : integer;
    Adds     : integer;
    Deletes  : integer;
    Modifies : integer;
  end;
  
  TTextDiff = class(TComponent)
  private
    FCompareList   : TList;
    FDiffList      : TList;   // this TList circumvents the need for recursion
    FCancelled     : boolean;
    FExecuting     : boolean;
    FCompareInts   : boolean; // ie are we comparing integer arrays or char arrays
    DiagBufferF    : pointer;
    DiagBufferB    : pointer;
    DiagF          : PDiagonalMtx;
    DiagB          : PDiagonalMtx;
    FDiffStats     : TTextDiffStatsRec;
    FLastCompareRec: TCompareRec;
    FList1         : TList<cardinal>;
    FList2         : TList<cardinal>;
    FStr1          : string;
    FStr2          : string;
    procedure InitDiagArrays(Len1, Len2: integer);
    procedure PushDiff(Offset1, Offset2, Len1, Len2: integer);
    function  PopDiff: boolean;
    procedure DiffInt(Offset1, Offset2, Len1, Len2: integer);
    procedure DiffChr(Offset1, Offset2, Len1, Len2: integer);
    function  SnakeChrF(k, Offset1, Offset2, Len1, Len2: integer): boolean;
    function  SnakeChrB(k, Offset1, Offset2, Len1, Len2: integer): boolean;
    function  SnakeIntF(k, Offset1, Offset2, Len1, Len2: integer): boolean;
    function  SnakeIntB(k, Offset1, Offset2, Len1, Len2: integer): boolean;
    procedure AddChangeChr(Offset1, range: integer; ChangeKind: TChangeKind);
    procedure AddChangeInt(Offset1, range: integer; ChangeKind: TChangeKind);
    function  GetCompareCount: integer;
    function  GetCompare(index: integer): TCompareRec;
  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;
    function  Execute(const alist1, alist2: TList<cardinal>): boolean; overload; // compare strings or list of cardinals
    function  Execute(const s1, s2: string): boolean; overload;
    procedure Cancel; // allows interrupting excessively prolonged comparisons
    procedure Clear;
    property  Cancelled: boolean read FCancelled;
    property  Count: integer read GetCompareCount;
    property  Compares[index: integer]: TCompareRec read GetCompare; default;
    property  DiffStats: TTextDiffStatsRec read FDiffStats;
  end;
  
implementation

procedure Register;
begin
  RegisterComponents('Wks', [TTextDiff]);
end;

constructor TTextDiff.Create(aOwner: TComponent);
begin
  inherited;
  FCompareList := TList.create;
  FDiffList    := TList.Create;
end;

destructor TTextDiff.Destroy;
begin
  Clear;
  FCompareList.free;
  FDiffList.Free;
  inherited;
end;

function  TTextDiff.Execute(const alist1, alist2: TList<cardinal>): boolean;
var
  i, Len1Minus1: integer;
  Len1, Len2: integer;
begin
  Result := not FExecuting;
  if not Result then exit;
  FCancelled := false;
  FExecuting := true;
  try
    FList1 := alist1;
    FList2 := alist2;
    Len1 := FList1.Count;
    Len2 := FList2.Count;
    Clear;
    Len1Minus1 := Len1 -1;
    FCompareList.Capacity := Len1 + Len2;
    FCompareInts := true;
    GetMem(DiagBufferF, sizeof(integer)*(Len1+Len2+3));
    GetMem(DiagBufferB, sizeof(integer)*(Len1+Len2+3));
    try
      PushDiff(0, 0, Len1, Len2);
      while PopDiff do;
    finally
      freeMem(DiagBufferF);
      freeMem(DiagBufferB);
    end;
    if FCancelled then begin
      Result := false;
      Clear;
      exit;
    end;
    // correct the occasional missed match ...
    for i := 1 to count -1 do
      with PCompareRec(FCompareList[i])^ do
        if (Kind = ckModify) and (int1 = int2) then
        begin
          Kind := ckNone;
          Dec(FDiffStats.Modifies);
          Inc(FDiffStats.Matches);
        end;
        
    // finally, append any trailing Matches onto compareList ...
    with FLastCompareRec do
      AddChangeInt(OldIndex1, Len1Minus1-OldIndex1, ckNone);
  finally
    FExecuting := false;
  end;
end;

function  TTextDiff.Execute(const s1, s2: string): boolean;
var
  i, Len1Minus1: integer;
  Len1, Len2: integer;
begin
  Result := not FExecuting;
  if not Result then exit;
  FCancelled := false;
  FExecuting := true;
  try
    Clear;
    Len1 := Length(s1);
    Len2 := Length(s2);
    Len1Minus1 := Len1 -1;
    FCompareList.Capacity := Len1 + Len2;
    FDiffList.Capacity := 1024;
    FCompareInts := false;
    GetMem(DiagBufferF, sizeof(integer)*(Len1+Len2+3));
    GetMem(DiagBufferB, sizeof(integer)*(Len1+Len2+3));
    FStr1 := s1;
    FStr2 := s2;
    try
      PushDiff(1, 1, Len1, Len2);
      while PopDiff do;
    finally
      freeMem(DiagBufferF);
      freeMem(DiagBufferB);
    end;
    if FCancelled then begin
      Result := false;
      Clear;
      exit;
    end;
    // correct the occasional missed match ...
    for i := 1 to count -1 do
      with PCompareRec(FCompareList[i])^ do
        if (Kind = ckModify) and (chr1 = chr2) then
        begin
          Kind := ckNone;
          Dec(FDiffStats.Modifies);
          Inc(FDiffStats.Matches);
        end;
    // finally, append any trailing Matches onto compareList ...
    with FLastCompareRec do begin
      AddChangeChr(OldIndex1, Len1Minus1-OldIndex1, ckNone);
    end;
  finally
    FExecuting := false;
  end;
end;

procedure TTextDiff.PushDiff(Offset1, Offset2, Len1, Len2: integer);
var
  r: PTextDiffRec; // diffvars
begin
  new(r);
  r.Offset1 := Offset1;
  r.Offset2 := Offset2;
  r.Len1 := Len1;
  r.Len2 := Len2;
  FDiffList.Add(r);
end;
function  TTextDiff.PopDiff: boolean;
var
  r: PTextDiffRec; // diffvars
  idx: integer;
begin
  idx := FDiffList.Count -1;
  Result := idx >= 0;
  if not Result then exit;
  r := PTextDiffRec(FDiffList[idx]);
  with r^ do
    if FCompareInts then
      DiffInt(Offset1, Offset2, Len1, Len2) else
      DiffChr(Offset1, Offset2, Len1, Len2);
  Dispose(r);
  FDiffList.Delete(idx);
end;

procedure TTextDiff.InitDiagArrays(Len1, Len2: integer);
var
  i: integer;
begin
  // assumes that top and bottom Matches have been excluded
  P8Bits(DiagF) := P8Bits(DiagBufferF) - sizeof(integer)*(MAX_DIAGONAL-(Len1+1));
  for i := - (Len1+1) to (Len2+1) do
    DiagF^[i] := -MAXINT;
  DiagF^[1] := -1;
  P8Bits(DiagB) := P8Bits(DiagBufferB) - sizeof(integer)*(MAX_DIAGONAL-(Len1+1));
  for i := - (Len1+1) to (Len2+1) do
    DiagB^[i] := MAXINT;
  DiagB^[Len2-Len1+1] := Len2;
end;

procedure TTextDiff.DiffInt(Offset1, Offset2, Len1, Len2: integer);
var
  p, k, delta: integer;
begin
  if Offset1+Len1 > FList1.Count then Len1 := FList1.Count - Offset1;
  if Offset2+Len2 > FList2.Count then Len2 := FList2.Count - Offset2;
  // trim matching bottoms ...
  while (Len1 > 0) and (Len2 > 0) and (FList1[Offset1] = FList2[Offset2]) do begin
    inc(Offset1); inc(Offset2); dec(Len1); dec(Len2);
  end;
  // trim matching tops ...
  while (Len1 > 0) and (Len2 > 0) and (FList1[Offset1+Len1-1] = FList2[Offset2+Len2-1]) do begin
    dec(Len1); dec(Len2);
  end;
  // stop diff'ing if minimal conditions reached ...
  if (Len1 = 0) then begin
    AddChangeInt(Offset1 , Len2, ckAdd);
    exit;
  end else if (Len2 = 0) then begin
    AddChangeInt(Offset1 , Len1, ckDelete);
    exit;
  end else if (Len1 = 1) and (Len2 = 1) then begin
    AddChangeInt(Offset1, 1, ckDelete);
    AddChangeInt(Offset1, 1, ckAdd);
    exit;
  end;
  p := -1;
  delta := Len2 - Len1;
  InitDiagArrays(Len1, Len2);
  if delta < 0 then begin
    repeat
      inc(p);
      if (p mod 1024) = 1023 then begin
        Application.ProcessMessages;
        if FCancelled then exit;
      end;
      // the Snake order is important here
      for k := p downto delta +1 do
        if SnakeIntF(k, Offset1, Offset2, Len1, Len2) then exit;
      for k := -p + delta to delta-1 do
        if SnakeIntF(k, Offset1, Offset2, Len1, Len2) then exit;
      for k := delta -p to -1 do
        if SnakeIntB(k, Offset1, Offset2, Len1, Len2) then exit;
      for k := p downto 1 do
        if SnakeIntB(k, Offset1, Offset2, Len1, Len2) then exit;
      if SnakeIntF(delta, Offset1, Offset2, Len1, Len2) then exit;
      if SnakeIntB(0, Offset1, Offset2, Len1, Len2) then exit;
    until(false);
  end else begin
    repeat
      inc(p);
      if (p mod 1024) = 1023 then begin
        Application.ProcessMessages;
        if FCancelled then exit;
      end;
      // the Snake order is important here
      for k := -p to delta -1 do
        if SnakeIntF(k, Offset1, Offset2, Len1, Len2) then exit;
      for k := p + delta downto delta +1 do
        if SnakeIntF(k, Offset1, Offset2, Len1, Len2) then exit;
      for k := delta + p downto 1 do
        if SnakeIntB(k, Offset1, Offset2, Len1, Len2) then exit;
      for k := -p to -1 do
        if SnakeIntB(k, Offset1, Offset2, Len1, Len2) then exit;
      if SnakeIntF(delta, Offset1, Offset2, Len1, Len2) then exit;
      if SnakeIntB(0, Offset1, Offset2, Len1, Len2) then exit;
    until(false);
  end;
end;

procedure TTextDiff.DiffChr(Offset1, Offset2, Len1, Len2: integer);
var
  p, k, delta: integer;
begin
  // trim matching bottoms ...
  while (Len1 > 0) and (Len2 > 0) and (FStr1[Offset1] = FStr2[Offset2]) do
  begin
    inc(Offset1); inc(Offset2); dec(Len1); dec(Len2);
  end;
  // trim matching tops ...
  while (Len1 > 0) and (Len2 > 0) and (FStr1[Offset1+Len1-1] = FStr2[Offset2+Len2-1]) do
  begin
    dec(Len1); dec(Len2);
  end;
  // stop diff'ing if minimal conditions reached ...
  if (Len1 = 0) then
  begin
    AddChangeChr(Offset1 , Len2, ckAdd);
    exit;
  end
  else if (Len2 = 0) then
  begin
    AddChangeChr(Offset1, Len1, ckDelete);
    exit;
  end
  else if (Len1 = 1) and (Len2 = 1) then
  begin
    AddChangeChr(Offset1, 1, ckDelete);
    AddChangeChr(Offset1, 1, ckAdd);
    exit;
  end;
  p := -1;
  delta := Len2 - Len1;
  InitDiagArrays(Len1, Len2);
  if delta < 0 then
  begin
    repeat
      inc(p);
      if (p mod 1024 = 1023) then
      begin
        Application.ProcessMessages;
        if FCancelled then exit;
      end;
      // the Snake order is important here
      for k := p downto delta +1 do
        if SnakeChrF(k, Offset1, Offset2, Len1, Len2) then exit;
      for k := -p + delta to delta-1 do
        if SnakeChrF(k, Offset1, Offset2, Len1, Len2) then exit;
      for k := delta -p to -1 do
        if SnakeChrB(k, Offset1, Offset2, Len1, Len2) then exit;
      for k := p downto 1 do
        if SnakeChrB(k, Offset1, Offset2, Len1, Len2) then exit;
      if SnakeChrF(delta, Offset1, Offset2, Len1, Len2) then exit;
      if SnakeChrB(0, Offset1, Offset2, Len1, Len2) then exit;
    until(false);
  end else
  begin
    repeat
      inc(p);
      if (p mod 1024 = 1023) then
      begin
        Application.ProcessMessages;
        if FCancelled then exit;
      end;
      // the Snake order is important here
      for k := -p to delta -1 do
        if SnakeChrF(k, Offset1, Offset2, Len1, Len2) then exit;
      for k := p + delta downto delta +1 do
        if SnakeChrF(k, Offset1, Offset2, Len1, Len2) then exit;
      for k := delta + p downto 1 do
        if SnakeChrB(k, Offset1, Offset2, Len1, Len2) then exit;
      for k := -p to -1 do
        if SnakeChrB(k, Offset1, Offset2, Len1, Len2) then exit;
      if SnakeChrF(delta, Offset1, Offset2, Len1, Len2) then exit;
      if SnakeChrB(0, Offset1, Offset2, Len1, Len2) then exit;
    until(false);
  end;
end;

function  TTextDiff.SnakeChrF(k, Offset1, Offset2, Len1, Len2: integer): boolean;
var
  x, y: integer;
begin
  if DiagF[k+1] > DiagF[k-1] then
    y := DiagF[k+1] else
    y := DiagF[k-1]+1;
  x := y - k;
  while (x < Len1-1) and (y < Len2-1) and (FStr1[Offset1+x+1] = FStr2[Offset2+y+1]) do
  begin
    inc(x); inc(y);
  end;
  DiagF[k] := y;
  Result := (DiagF[k] >= DiagB[k]);
  if not Result then exit;
  inc(x); inc(y);
  PushDiff(Offset1+x, Offset2+y, Len1-x, Len2-y);
  PushDiff(Offset1, Offset2, x, y);
end;

function  TTextDiff.SnakeChrB(k, Offset1, Offset2, Len1, Len2: integer): boolean;
var
  x, y: integer;
begin
  if DiagB[k-1] < DiagB[k+1] then
    y := DiagB[k-1]
  else
    y := DiagB[k+1]-1;
  x := y - k;
  while (x >= 0) and (y >= 0) and (FStr1[Offset1+x] = FStr2[Offset2+y]) do
  begin
    dec(x); dec(y);
  end;
  DiagB[k] := y;
  Result := DiagB[k] <= DiagF[k];
  if not Result then exit;
  inc(x); inc(y);
  PushDiff(Offset1+x, Offset2+y, Len1-x, Len2-y);
  PushDiff(Offset1, Offset2, x, y);
end;

function  TTextDiff.SnakeIntF(k, Offset1, Offset2, Len1, Len2: integer): boolean;
var
  x, y: integer;
begin
  if DiagF^[k+1] > DiagF^[k-1] then
    y := DiagF^[k+1]
  else
    y := DiagF^[k-1]+1;
  x := y - k;
  while (x < Len1-1) and (y < Len2-1) and (FList1[Offset1+x+1] = FList2[Offset2+y+1]) do
  begin
    inc(x); inc(y);
  end;
  DiagF^[k] := y;
  Result := (DiagF^[k] >= DiagB^[k]);
  if not Result then exit;
  inc(x); inc(y);
  PushDiff(Offset1+x, Offset2+y, Len1-x, Len2-y);
  PushDiff(Offset1, Offset2, x, y);
end;

function  TTextDiff.SnakeIntB(k, Offset1, Offset2, Len1, Len2: integer): boolean;
var
  x, y: integer;
begin
  if DiagB^[k-1] < DiagB^[k+1] then
    y := DiagB^[k-1]
  else
    y := DiagB^[k+1]-1;
  x := y - k;
  while (x >= 0) and (y >= 0) and (FList1[Offset1+x] = FList2[Offset2+y]) do
  begin
    dec(x); dec(y);
  end;
  DiagB^[k] := y;
  Result := DiagB^[k] <= DiagF^[k];
  if not Result then exit;
  inc(x); inc(y);
  PushDiff(Offset1+x, Offset2+y, Len1-x, Len2-y);
  PushDiff(Offset1, Offset2, x, y);
end;

procedure TTextDiff.AddChangeChr(Offset1, range: integer; ChangeKind: TChangeKind);
var
  i, j: integer;
  compareRec: PCompareRec;
begin
  // first, add any unchanged items into this list ...
  while (FLastCompareRec.OldIndex1 < Offset1 -1) do
  begin
    with FLastCompareRec do
    begin
      chr1 := #0;
      chr2 := #0;
      Kind := ckNone;
      inc(OldIndex1);
      inc(OldIndex2);
      if (OldIndex1 > 0) and (OldIndex1 <= Length(FStr1)) then
        chr1 := FStr1[OldIndex1];
      if (OldIndex2 > 0) and (OldIndex2 <= Length(FStr2)) then
        chr2 := FStr2[OldIndex2];
    end;
    New(compareRec);
    compareRec^ := FLastCompareRec;
    FCompareList.Add(compareRec);
    inc(FDiffStats.Matches);
  end;
  case ChangeKind of
    ckNone:
      for i := 1 to range do
      begin
        with FLastCompareRec do
        begin
          Kind := ckNone;
          inc(OldIndex1);
          inc(OldIndex2);
          chr1 := FStr1[OldIndex1];
          chr2 := FStr2[OldIndex2];
        end;
        New(compareRec);
        compareRec^ := FLastCompareRec;
        FCompareList.Add(compareRec);
        inc(FDiffStats.Matches);
      end;
    ckAdd :
      begin
        for i := 1 to range do
        begin
          with FLastCompareRec do
          begin
            // check if a range of Adds are following a range of Deletes and convert them to Modifies ...
            if Kind = ckDelete then
            begin
              j := FCompareList.Count -1;
              while (j > 0) and (PCompareRec(FCompareList[j-1]).Kind = ckDelete) do
                dec(j);
              PCompareRec(FCompareList[j]).Kind := ckModify;
              dec(FDiffStats.Deletes);
              inc(FDiffStats.Modifies);
              inc(FLastCompareRec.OldIndex2);
              PCompareRec(FCompareList[j]).OldIndex2 := FLastCompareRec.OldIndex2;
              PCompareRec(FCompareList[j]).chr2 := FStr2[OldIndex2];
              if j = FCompareList.Count-1 then
                FLastCompareRec.Kind := ckModify;
              continue;
            end;
            Kind := ckAdd;
            chr1 := #0;
            inc(OldIndex2);
            chr2 := FStr2[OldIndex2]; //ie what we added
          end;
          New(compareRec);
          compareRec^ := FLastCompareRec;
          FCompareList.Add(compareRec);
          inc(FDiffStats.Adds);
        end;
      end;
    ckDelete :
      begin
        for i := 1 to range do
        begin
          with FLastCompareRec do
          begin
            // check if a range of Deletes are following a range of Adds and convert them to Modifies ...
            if Kind = ckAdd then
            begin
              j := FCompareList.Count -1;
              while (j > 0) and (PCompareRec(FCompareList[j-1]).Kind = ckAdd) do
                dec(j);
              PCompareRec(FCompareList[j]).Kind := ckModify;
              dec(FDiffStats.Adds);
              inc(FDiffStats.Modifies);
              inc(FLastCompareRec.OldIndex1);
              PCompareRec(FCompareList[j]).OldIndex1 := FLastCompareRec.OldIndex1;
              PCompareRec(FCompareList[j]).chr1 := FStr1[OldIndex1];
              if j = FCompareList.Count-1 then
                FLastCompareRec.Kind := ckModify;
              continue;
            end;
            Kind := ckDelete;
            chr2 := #0;
            inc(OldIndex1);
            chr1 := FStr1[OldIndex1]; //ie what we deleted
          end;
          New(compareRec);
          compareRec^ := FLastCompareRec;
          FCompareList.Add(compareRec);
          inc(FDiffStats.Deletes);
        end;
      end;
  end;
end;

procedure TTextDiff.AddChangeInt(Offset1, range: integer; ChangeKind: TChangeKind);
var
  i, j: integer;
  compareRec: PCompareRec;
begin
  // first, add any unchanged items into this list ...
  while (FLastCompareRec.OldIndex1 < Offset1 -1) do
  begin
    with FLastCompareRec do
    begin
      Kind := ckNone;
      inc(OldIndex1);
      inc(OldIndex2);
      if (OldIndex1 >= 0) and (OldIndex1 < FList1.Count) then
        int1 := FList1[OldIndex1];
      if (OldIndex2 >= 0) and (OldIndex2 < FList2.Count) then
        int2 := FList2[OldIndex2];
    end;
    New(compareRec);
    compareRec^ := FLastCompareRec;
    FCompareList.Add(compareRec);
    inc(FDiffStats.Matches);
  end;
  case ChangeKind of
    ckNone:
      for i := 1 to range do
      begin
        with FLastCompareRec do
        begin
          Kind := ckNone;
          inc(OldIndex1);
          inc(OldIndex2);
          if (OldIndex1 >= 0) and (OldIndex1 < FList1.Count) then
            int1 := FList1[OldIndex1];
          if (OldIndex2 >= 0) and (OldIndex2 < FList2.Count) then
            int2 := FList2[OldIndex2];
        end;
        New(compareRec);
        compareRec^ := FLastCompareRec;
        FCompareList.Add(compareRec);
        inc(FDiffStats.Matches);
      end;
    ckAdd :
      begin
        for i := 1 to range do
        begin
          with FLastCompareRec do
          begin
            // check if a range of Adds are following a range of Deletes and convert them to Modifies ...
            if Kind = ckDelete then
            begin
              j := FCompareList.Count -1;
              while (j > 0) and (PCompareRec(FCompareList[j-1]).Kind = ckDelete) do
                dec(j);
              PCompareRec(FCompareList[j]).Kind := ckModify;
              dec(FDiffStats.Deletes);
              inc(FDiffStats.Modifies);
              inc(FLastCompareRec.OldIndex2);
              PCompareRec(FCompareList[j]).OldIndex2 := FLastCompareRec.OldIndex2;
              PCompareRec(FCompareList[j]).int2 := FList2[OldIndex2];
              if j = FCompareList.Count-1 then FLastCompareRec.Kind := ckModify;
              continue;
            end;
            Kind := ckAdd;
            int1 := $0;
            inc(OldIndex2);
            if (OldIndex2 >= 0) and (OldIndex2 < FList2.Count) then
              int2 := FList2[OldIndex2]; //ie what we added
          end;
          New(compareRec);
          compareRec^ := FLastCompareRec;
          FCompareList.Add(compareRec);
          inc(FDiffStats.Adds);
        end;
      end;
    ckDelete :
      begin
        for i := 1 to range do
        begin
          with FLastCompareRec do
          begin
            // check if a range of Deletes are following a range of Adds and convert them to Modifies ...
            if Kind = ckAdd then
            begin
              j := FCompareList.Count -1;
              while (j > 0) and (PCompareRec(FCompareList[j-1]).Kind = ckAdd) do
                dec(j);
              PCompareRec(FCompareList[j]).Kind := ckModify;
              dec(FDiffStats.Adds);
              inc(FDiffStats.Modifies);
              inc(FLastCompareRec.OldIndex1);
              PCompareRec(FCompareList[j]).OldIndex1 := FLastCompareRec.OldIndex1;
              PCompareRec(FCompareList[j]).int1 := FList1[OldIndex1];
              if j = FCompareList.Count-1 then FLastCompareRec.Kind := ckModify;
              continue;
            end;
            Kind := ckDelete;
            int2 := $0;
            inc(OldIndex1);
            if (OldIndex1 >= 0) and (OldIndex1 < FList1.Count) then
              int1 := FList1[OldIndex1]; //ie what we deleted
          end;
          New(compareRec);
          compareRec^ := FLastCompareRec;
          FCompareList.Add(compareRec);
          inc(FDiffStats.Deletes);
        end;
      end;
  end;
end;

procedure TTextDiff.Clear;
var
  i: integer;
begin
  for i := 0 to FCompareList.Count-1 do
    dispose(PCompareRec(FCompareList[i]));
  FCompareList.clear;
  FLastCompareRec.Kind := ckNone;
  FLastCompareRec.OldIndex1 := -1;
  FLastCompareRec.OldIndex2 := -1;
  FDiffStats.Matches  := 0;
  FDiffStats.Adds     := 0;
  FDiffStats.Deletes  :=0;
  FDiffStats.Modifies :=0;
end;

function  TTextDiff.GetCompareCount: integer;
begin
  Result := FCompareList.count;
end;

function  TTextDiff.GetCompare(index: integer): TCompareRec;
begin
  Result := PCompareRec(FCompareList[index])^;
end;

procedure TTextDiff.Cancel;
begin
  FCancelled := true;
end;

end.
