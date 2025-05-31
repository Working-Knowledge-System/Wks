unit Wks000GeomUnit;

interface

{$REGION 'Help'}
{
  point, vector in N2, N3, R2, R3 spaces (without mass)

  Logical         --->  Real Point     --->  R  --->  Pos(X, Y)  --->  P(X, Y)
  Gdi/BmpBuffer   --->  integer Point  --->  I  --->  Dot(I, J)  --->  D(I, J)

  0 XYOrigin
  1 XMin
  2 XMax
  3 YMin
  4 YMax

  FgClientRect      220x220         client rectangle, the whole control's area

  FgTopRect         10              borders
  FgBottomRect      10
  FgLeftRect        10
  FgRightRect       10

  FgScreenRect                      screen frame, what is left after the borders

  RefP1             (-90,-90)       generic reference points
  RefP2             (+90,+90)

  LX LY                             logical space
  CX CY                             client space, the FgCliRect



  Logical 2D Model
  ================
                     AxeY
                       ^
                       |
                       |
                       |
                     Y |· · · o P Pos
                       |      ·
                       |      ·
                       |      ·
     ---|--------------+------|-----------|---> AxeX
       Min            0|      X          Max
                       |     Pos
                       |
                       |
                       |
                       |
                       |



  Buffer Model (Bmp WxH) (mapping it to a buffer-bitmap WxH)
  ============

        0                     I           W
       0|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
        |                     ·           |
        |                     ·           |
        |                     ·           |
        |                  |¯¯¯¯¯| Spot   |
       J|· · · · · · · · · |  o D Dot     |
        |                  |_____|        |
        |                                 |
        |                                 |
        |                                 |
        |_________________________________|
       H

  Relations
  ¯¯¯¯¯¯¯¯¯
        (X - Min) : (I - 0) = (Max - Min) : (W - 0)

        (X - Min) = (Max - Min) : (W - 0) * (I - 0)

        (I - 0) = (X - Min) / (Max - Min) * (W - 0)

        I = (X - Min) / (Max - Min) * W
        J = ...



  Entities
  ========
    draw space              plot space
    -----------------------------------------------
    Dot(i, j) integer       Pos(x, y) real
    Rect                    Area
    - - - - - - - - - - - - - - - - - - - - - - - -
    Text                    Text
    Box                     Rectangle
    Spot                    Point
    Stroke                  Line
    Round                   Circle



  Box Model    http://www.mjtnet.com/workflow-designer.htm
  =========

   ---------------------------------  <--- Box
  |                                 |   | Margin
  |    -------------------------    | <--- Border
  |   |                         |   |   | Padding
  |   |    -----------------    |   | <--- Content/Text
  |   |   | XxxXxxXxxXxxXxx |   |   |   | Value
  |   |    -----------------    |   | <---
  |   |                         |   |
  |    -------------------------    |
  |                                 |
   ---------------------------------



  Box Grips
  =========

  TL       MT      TR           -1      0     +1
    o------o------o              o------o------o +1
    |             |              |             |
    |       MC    |              |             |
 ML o      o      o MR           o      o      o  0
    |             |              |             |
    |             |              |             |
    o------o------o              o------o------o -1
  BL       MB      BR



  2                 1                   6
    o------o------o              o------o------o
    |             |              |             |
    |       0     |              |             |
    o      o      o           7  o      o      o 5
    |             |              |             |
    |             |              |             |
    o------o------o              o------o------o
  3                 4                   8


    8      0      2
    | 12   |4     | 6
    o------o------o -- 4
    |             |
    | 8     0     | 2
    o      o      o -- 0
    |             |
    | 9     1     | 3
    o------o------o -- 1



  Grid
  ====
         Y ^
           |
           |                        J ^
           |                          |
        RowNumberOn __  ColPitch      |
           |          \   |---|       |
           |           \
           |    RowMax  4 +---+---+---+---+---+---+---+---+
           |              |   |   |   |   |   |   |   |   |
           |            3 +---+---+---+---+---+---+---+---+
           |              |   |   |   |   |   |   |   |   |
           |            2 +---+---+---+---+---+---+---+---+
           |              |   |   |   |   |   |   |   |   |
           |            1 +---+---+---+---+---+---+---+---+
           |              |   |   |   |   |   |   |   |   |
  Origin.Y - - - - - -  0 +---+---+---O---+---+---+---+---+  ---------> I
           |              |   |   |   |   |   |   |   |   |
           |           -1 +---+---+---+---+---+---+---+---+  -+-
           |              |   |   |   |   |   |   |   |   |   | RowPitch
           |   RowMin  -2 +---+---+---+---+---+---+---+---+  -+-
           |
           |             -3  -2  -1   0   1   2   3   4   5  <-- ColNumberOn
           |              |           |               |
           |            ColMin                      ColMax
           |                          |
           |
           +--------------------------|------------------------------------> X
                                  Origin.X

  3D Model
  ========

                   Z
                   |           Y
                   |         /
         (dept) D  |  H   / \
                   |   /      \
                   |/           \
                    \             \
                      \            /
                        \       /
                      W   \  /
                            \
                              \
                                \
                                  X
}
{$ENDREGION}

{$REGION 'Use'}
uses
    System.Types
  , System.Classes
  , System.SysUtils
  , System.StrUtils
//, System.Character
  , System.AnsiStrings
  , Winapi.Windows
  , Vcl.Graphics
  ;
{$ENDREGION}

{$REGION 'Type'}
type

  {$REGION 'Transformation'}
  TTransformationEnum = (
    trNormal
  , trScale
  , trTranslate
  , trRotate
  , trShear
  , trReflect
  );

  TTransformationMatrix = record // also called xform and maps tagXFORM windows record
    eM11: single;
    eM12: single;
    eM21: single;
    eM22: single;
    eDx : single;
    eDy : single;
  end;
  {$ENDREGION}

  {$REGION 'Direction'}
  TDirectionEnum = (
    diLeft
  , diRight
  , diBottom
  , diTop
  , diFront
  , diBack
  );
  {$ENDREGION}

  {$REGION 'Orientation'}
  TOrientationEnum = (
    orHorizontal
  , orVertical
  );
  {$ENDREGION}

  {$REGION 'Alignment'}
  TAlignEnum = (
    alTL, alMT, alTR
  , alML, alMC, alMR
  , alBL, alMB, alBR
  );
  {$ENDREGION}

  {$REGION 'Look'}
  TLookRec = record
    LineWidth: double;
    LineColor: string;
    FillColor: string;
    LineOn: boolean;
    FillOn: boolean;
  end;
  {$ENDREGION}

  {$REGION 'Range'}
  TIRange = record // -n ... 0 ... +m
    Min: integer;
    Max: integer;
    function  Make(IvMin, IvMax: integer): TIRange;
    function  Fix(IvInteger, IvMin, IvMax: integer): integer;
    function  Has(IvI, IvMin, IvMax: integer{IvIncludeBounds = true}): boolean; overload; {inline;}
    function  Has(IvX, IvMin, IvMax: double{extended}{IvIncludeBounds = true}): boolean; overload; {inline;}
    function  Center(IvMin, IvMax: integer): integer; overload;
    function  Center(IvMin, IvMax: double): double; overload;
  end;

  TIRangeVector = array of TIRange;

  TXRange = record // -s ... 0.0 ... +t
    Min: double;
    Max: double;
    function  Make(IvMin, IvMax: double): TXRange;
  end;

  TXRangeVector = array of TXRange;
  {$ENDREGION}

  {$REGION 'Grid'}
  TGridRec = record
  const
    GRID_NUMBER_OFFSET_COEFF = 22/20;
  public
    Origin     : TPointF; // grid origin position
    ColPitch   : single ;
    RowPitch   : single ;
    ColMin     : integer;
    ColMax     : integer;
    RowMin     : integer;
    RowMax     : integer;
    LineWidth  : double ;
    LineColor  : string ;
    LineType   : string ;
    ColLineOn  : boolean;
    RowLineOn  : boolean;
    ColNumberOn: boolean;
    RowNumberOn: boolean;
  end;
  {$ENDREGION}

  {$REGION 'Size'}
  TIjSize = record
    W: integer;
    H: integer;
  public
    function  Min: integer;
    function  Max: integer;
  end;

  TIjSizeVector = array of TIjSize;

  TXySize = record
    W: double;
    H: double;
  public
    function  Min: double;
    function  Max: double;
  end;

  TXySizeVector = array of TXySize;

  TIjkSize = record
    W: integer;
    H: integer;
    D: integer; // depth
  end;

  TXyzSize = record
    W: double;
    H: double;
    D: double; // depth
  end;
  {$ENDREGION}

  {$REGION 'Displace'}
  TIjDisplace = record // N1P1
    H: double; // -1.0 ... 0.0 ... +1.0
    V: double; // -1.0 ... 0.0 ... +1.0
  end;
  {$ENDREGION}

  {$REGION 'Coords/Vector'}
  TIj = record
    I: integer;
    J: integer;
  end;
  TIjVec =   TIj;  // important! allow a coord ij to be treated as a vector from origin
  TIjAs0Vec = TIj; // important! allow a point ij to be treated as a vector from origin
  TIjVector = array of TIj;
  TIjVector4 = array [0..3] of TIj;

  TXy = record
    X: double;
    Y: double;
  end;
  TXyVec =   TXy;  // important! allow a coord xy  to be treated as a vector from origin
  TXyAs0Vec = TXy; // important! allow a point xy to be treated as a vector from origin
  TXyVector = array of TXy;
  TXyVector4 = array [0..3] of TXy;

  TIjXy = record // indexed xy/point values
    Ij: TIj;
    Xy: TXy;
  end;
  TIjXyVector = array of TIjXy;

  TIjk = record
    I: integer;
    J: integer;
    K: integer;
  end;
  TIjkAs0Vec = TIjk; // important! allow a point ijk to be treated as a vector from origin
  TIjkVector = array of TIjk;
  TIjkVector4 = array [0..3] of TIjk;

  TXyz = record
    X: double;
    Y: double;
    Z: double;
  end;
  TXyzAs0Vec = TXyz; // important! allow a point xyz to be treated as a vector from origin
  TXyzVector = array of TXyz;
  TXyzVector4 = array [0..3] of TXyz;

  TIjkXyz = record // indexed xyz/point values
    Ijk: TIjk;
    Xyz: TXyz;
  end;
  TIjkXyzVector = array of TIjkXyz;
  {$ENDREGION}

  {$REGION 'Rect'}
  TRctHlp = record helper for TRect // extend trect
  private
    function  GetSize: TSIze;
    procedure SetSize(const Value: TSIze);
    function  GetW: integer; inline;
    procedure SetW(const Value: integer); inline;
    function  GetH: integer; inline;
    procedure SetH(const Value: integer); inline;
    function  GetBL: TPoint;
    function  GetBR: TPoint;
    function  GetTL: TPoint;
    function  GetTR: TPoint;
    function  GetML: TPoint;
    function  GetMR: TPoint;
    function  GetMT: TPoint;
    function  GetMB: TPoint;
    function  GetMC: TPoint;
    procedure SetBL(const Value: TPoint);
    procedure SetBR(const Value: TPoint);
    procedure SetTL(const Value: TPoint);
    procedure SetTR(const Value: TPoint);
    procedure SetML(const Value: TPoint);
    procedure SetMR(const Value: TPoint);
    procedure SetMB(const Value: TPoint);
    procedure SetMT(const Value: TPoint);
    procedure SetMC(const Value: TPoint);
  public
    function  AsString: string;
    function  Equals(const B: TRect): boolean; inline;
    function  CenteredLT(IvInnerW, IvInnerH: integer): TPoint;
    procedure AssignLW(Left, Width: integer);
    procedure AssignTH(Top, Height: integer);
    procedure AssignLTWH(Left, Top, Width, Height: integer);
    procedure AlignToPoint(const APoint: TPoint; const ASize: TSize; Align: TAlignEnum);
    procedure Add(const Value: TRect);
    procedure Grow(DX, DY: integer);
    procedure Move(DX, DY: integer);
    procedure SwapH;
    procedure SwapV;
    procedure GdiAdjust;
    procedure CheckOrder;
    property Size: TSIze read GetSize write SetSize;
    property W: integer read GetW write SetW;
    property H: integer read GetH write SetH;
    property BL: TPoint read GetBL write SetBL;
    property BR: TPoint read GetBR write SetBR;
    property TL: TPoint read GetTL write SetTL;
    property TR: TPoint read GetTR write SetTR;
    property ML: TPoint read GetML write SetML;
    property MR: TPoint read GetMR write SetMR;
    property MT: TPoint read GetMT write SetMT;
    property MB: TPoint read GetMB write SetMB;
    property MC: TPoint read GetMC write SetMC;
  end;

  TIjRect = record
    P1: TIj;
    P2: TIj;
  public
    function  Has(const IvI, IvJ: integer; const IvRect: TRect): boolean; {inline;}
  end;

  TXyRect = record
    P1: TXy;
    P2: TXy;
  public
    constructor Create(IvX1, IvY1, IvX2, IvY2: double);
    procedure FillRandom(IvXMin, IvXMax, IvYMin, IvYMax: double);
    function  VertexVector: TXyVector4;
    function  Has(const IvI, IvJ: integer; const IvRect: TRect): boolean; {inline;}
  end;
  {$ENDREGION}

  {$REGION 'Cell'}
  TIjCell = record
    Rect: TIjRect;
    Look: TLookRec;
    Text: string;
  end;

  TIjCellVector = array of TIjCell;

  TXyCell = record
    Rect: TXyRect;
    Look: TLookRec;
    Text: string;
  end;

  TXyCellVector = array of TXyCell;
  {$ENDREGION}

  {$REGION 'Rectangle'}
  TIjRectangle = record
    Center: TIj;
    Size: TIjSize;
    AngleRad: double;
  end;

  TXyRectangle = record
    Center: TXy;
    Size: TXySize;
    AngleRad: double;
    BoundOn: boolean;
  public
    constructor Create(IvCenterX, IvCenterY, IvW, IvH, IvAngleRad: double);
    constructor Create2(IvLeftX, IvTopY, IvW, IvH, IvAngleRad: double);
    procedure FillRandom(IvXMin, IvXMax, IvYMin, IvYMax, IvWMin, IvWMax, IvHMin, IvHMax, IvAngleRadMin, IvAngleRadMax: double);
    function  VertexVector: TXyVector4;
    function  Bound: TXyRect;
    function  Area: double;
  end;
  {$ENDREGION}

  {$REGION 'Point'}
  TPntHlp = record helper for TPoint // extend tpoin
  public
    class function  New(AX, AY: integer): TPoint; static;
    function  Equals(const B: TPoint): boolean; inline;
    function  Assign(Point: TPoint): boolean; // inline;
    function  Convert(const Value: TSize): TPoint; inline;
    function  AsString: string;
    procedure SetZero;
    procedure Inc; overload; // inline;
    procedure Inc(Delta: integer); overload; // inline;
    procedure Inc(DeltaX, DeltaY: integer); overload; // inline;
    procedure Inc(Delta: TPoint); overload; // inline;
    procedure Dec(DeltaX, DeltaY: integer); overload; // inline;
  end;

  TPointKind = (   // a representation of a geometric point
    ptkDot      // ·
  , ptkCross    // x
  , ptkStar     // *
  , ptkPlus     // +
  , ptkMinus    // -
  , ptkVertical // |
  , ptkBox      // []
  , ptkDiamond  // <>
  , ptkEllipse  // o
  , ptkHandle   // [] highlighted box for mouse operations
  );

  TIjPoint = record
    Ij: TIj;
    Size: TIjSize;
    Look: TLookRec;
    Text: string;
  end;

  TIjSpot = record
    Ij: TIj;
    Size: TIjSize;
    Look: TLookRec;
    Text: string;
  end;

  TXyPoint = record
    Xy: TXy;
    Size: TXySize;
    Look: TLookRec;
    Text: string;
  end;

  TXySpot = record
    Xy: TXy;
    Size: TXySize;
    Look: TLookRec;
    Text: string;
  end;
  {$ENDREGION}

  {$REGION 'Box'}
  TIjBox = record
    Rectangle: TIjRectangle;
    Look: TLookRec;
    Text: string;
  end;

  TXyBox = record
    Rectangle: TXyRectangle;
    Look: TLookRec;
    Text: string;
  end;

  TBoxCls = class(TPersistent) // tbox model, a text representation with additional outline and letter style
  private                      // TPersistent is the ancestor for all objects that have assignment and streaming capabilities
    FText: string;
    FFont: TFont;
    FBg: TBrush;
    FOutline: TPen;
    FLetterOutline: TPen;
    FGap: integer;
    FOffsetH: double;
    FOffsetV: double;
    procedure SetText(const Value: string);
    procedure SetFont(const Value: TFont);
    procedure SetBg(const Value: TBrush);
    procedure SetOutline(const Value: TPen);
    procedure SetLetterOutline(const Value: TPen);
    procedure SetGap(const Value: integer);
    procedure SetOffsetH(const Value: double);
    procedure SetOffsetV(const Value: double);
  public
    constructor Create(IvText: string);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Text: string read FText write SetText;
    property Font: TFont read FFont write SetFont;
    property Bg: TBrush read FBg write SetBg;
    property Outline: TPen read FOutline write SetOutline;
    property LetterOutline: TPen read FLetterOutline write SetLetterOutline;
    property Gap: integer read FGap write SetGap;
    property OffsetH: double read FOffsetH write SetOffsetH;
    property OffsetV: double read FOffsetV write SetOffsetV;
  end;
  {$ENDREGION}

  {$REGION 'Geom'}
  TGemRec = record
    function  Ij(IvI, IvJ: integer): TIj;
    procedure XyRotate(var IvX, IvY, IvAngleRad: double); // center = 0,0
    procedure TransformationSet(var FTransformationMatrix: TTransformationMatrix; IvTransformation: TTransformationEnum{IvT: TPoint; IvR, IvS: single}); // gditransformation
    function  RadiusFromChordAndRise(IvChord, IvRise: double): double;
  end;
  {$ENDREGION}

  {$REGION 'Mass'}
  TXyMass = record
    Point: TXy;
    Mass: double;
  end;

  TXyzMass = record
    Point: TXyz;
    Mass: double;
  end;
  {$ENDREGION}

{$ENDREGION}

implementation

{$REGION 'TGemRec'}
function  TGemRec.Ij(IvI, IvJ: integer): TIj;
begin
  Result.I := IvI;
  Result.J := IvJ;
end;

procedure TGemRec.XyRotate(var IvX, IvY, IvAngleRad: double);
var
  x, y, sina, cosa: double;
begin
  sina := Sin(IvAngleRad);
  cosa := Cos(IvAngleRad);
  x := IvX * cosa - IvY * sina;
  y := IvY * cosa + IvX * sina;
  IvX := x;
  IvY := y;
end;

procedure TGemRec.TransformationSet(var FTransformationMatrix: TTransformationMatrix; IvTransformation: TTransformationEnum);
begin
  case IvTransformation of
    trNormal: begin  // set the unity transformation
      FTransformationMatrix.eM11 := 1.0;
      FTransformationMatrix.eM12 := 0.0;
      FTransformationMatrix.eM21 := 0.0;
      FTransformationMatrix.eM22 := 1.0;
      FTransformationMatrix.eDx  := 0.0;
      FTransformationMatrix.eDy  := 0.0;
    end;
    trScale: begin  // scale to 1/2 of the original size
      FTransformationMatrix.eM11 := 1.0;
      FTransformationMatrix.eM12 := 0.0;
      FTransformationMatrix.eM21 := 0.0;
      FTransformationMatrix.eM22 := 1.0;
      FTransformationMatrix.eDx  := 0.0;
      FTransformationMatrix.eDy  := 0.0;
    end;
    trTranslate: begin  // translate right by 3/4 inch
      FTransformationMatrix.eM11 := 1.0;
      FTransformationMatrix.eM12 := 0.0;
      FTransformationMatrix.eM21 := 0.0;
      FTransformationMatrix.eM22 := 1.0;
      FTransformationMatrix.eDx  := 75.0;
      FTransformationMatrix.eDy  := 0.0;
    end;
    trRotate: begin  // rotate 30 degrees counterclockwise
      FTransformationMatrix.eM11 := 0.8660;
      FTransformationMatrix.eM12 := 0.5000;
      FTransformationMatrix.eM21 := -0.5000;
      FTransformationMatrix.eM22 := 0.8660;
      FTransformationMatrix.eDx  := 0.0;
      FTransformationMatrix.eDy  := 0.0;
    end;
    trShear: begin  // shear along the x-axis with a proportionality constant of 0.5
      FTransformationMatrix.eM11 := 1.0;
      FTransformationMatrix.eM12 := 0.5;
      FTransformationMatrix.eM21 := 0.0;
      FTransformationMatrix.eM22 := 1.0;
      FTransformationMatrix.eDx  := 0.0;
      FTransformationMatrix.eDy  := 0.0;
    end;
    trReflect: begin  // reflect about a horizontal axis
      FTransformationMatrix.eM11 := 1.0;
      FTransformationMatrix.eM12 := 0.0;
      FTransformationMatrix.eM21 := 0.0;
      FTransformationMatrix.eM22 := -1.0;
      FTransformationMatrix.eDx  := 0.0;
      FTransformationMatrix.eDy  := 0.0;
    end;
  end;
end;

function  TGemRec.RadiusFromChordAndRise(IvChord, IvRise: double): double;
begin
  try
    Result := IvRise / 2 + IvChord*IvChord / (8 * IvRise); // r = h/2 + s^2/8h
  except
    on e: Exception do begin
      Result := INFINITE;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TIRange'}
function  TIRange.Center(IvMin, IvMax: integer): integer;
begin
  Result := IvMin + Abs(IvMax - IvMin) div 2;
end;

function  TIRange.Center(IvMin, IvMax: double): double;
var
  min, max: double;
begin
  if IvMin <= IvMax then begin
    min := IvMin;
    max := IvMax;
  end else begin
    min := IvMax;
    max := IvMin;
  end;
  Result := min + (max - min) / 2;
end;

function  TIRange.Fix(IvInteger, IvMin, IvMax: integer): integer;
begin
  if IvInteger < IvMin then
    Result := IvMin
  else if IvInteger > IvMax then
    Result := IvMax
  else
    Result := IvInteger;
end;

function  TIRange.Has(IvI, IvMin, IvMax: integer): boolean;
begin
  Result := (IvMin <= IvI) and (IvI <= IvMax);
end;

function  TIRange.Has(IvX, IvMin, IvMax: double): boolean;
begin
  Result := (IvMin <= IvX) and (IvX <= IvMax);
end;

function  TIRange.Make(IvMin, IvMax: integer): TIRange;
begin
  Result.Min := IvMin;
  Result.Max := IvMax;
end;
{$ENDREGION}

{$REGION 'TXRange'}
function  TXRange.Make(IvMin, IvMax: double): TXRange;
begin
  Result.Min := IvMin;
  Result.Max := IvMax;
end;
{$ENDREGION}

{$REGION 'TIjSize'}
function  TIjSize.Max: integer;
begin
  if W > H then
    Result := W
  else
    Result := H;
end;

function  TIjSize.Min: integer;
begin
  if W > H then
    Result := H
  else
    Result := W;
end;
{$ENDREGION}

{$REGION 'TXySize'}
function  TXySize.Max: double;
begin
  if W > H then
    Result := W
  else
    Result := H;
end;

function  TXySize.Min: double;
begin
  if W > H then
    Result := H
  else
    Result := W;
end;
{$ENDREGION}

{$REGION 'TRctHlp'}
procedure TRctHlp.Add(const Value: Winapi.Windows.TRect);
begin
  if Value.Left < Left then
    Left := Value.Left;
  if Value.Right > Right then
    Right := Value.Right;
  if Value.Top < Top then
    Top := Value.Top;
  if Value.Bottom > Bottom then
    Bottom := Value.Bottom;
end;

procedure TRctHlp.AlignToPoint(const APoint: TPoint; const ASize: TSize; Align: TAlignEnum);
begin
  case Align of
    alTL
    : begin
        TopLeft := APoint;
        Size := ASize;
      end;
    alMT
    : begin
        Top := APoint.Y;
        Left := APoint.X-ASize.cx DIV 2;
        Size := ASize;
      end;
    alTR
    : begin
        TR := APoint;
        H := ASize.cy;
        Left := Right-ASize.cx;
      end;
    alMR
    : begin
        Top := APoint.Y- ASize.cy DIV 2;
        Right := APoint.X;
        Left := Right -ASize.cx;
        H:= ASize.cy;
      end;
    alBR
    : begin
        BottomRight := APoint;
        Left := Right-ASize.cx;
        Top := Bottom-ASize.cy;
      end;
    alMB
    : begin
        Bottom := APoint.Y;
        Top := Bottom - ASize.cy;
        Left := APoint.X-ASize.cx DIV 2;
        W := ASize.cx;
      end;
    alBL
    : begin
        BL := APoint;
        Top := Bottom-ASize.cy;
        W := ASize.cx;
      end;
    alML
    : begin
        Left := APoint.X;
        W := ASize.cx;
        Top := APoint.Y-ASize.cy DIV 2;
        H := ASize.cy;
      end;
    alMC
    : begin
        Left := APoint.X - ASize.cx DIV 2;
        Top := APoint.Y - ASize.cy DIV 2;
        Size := ASize;
      end;
  end;
end;

procedure TRctHlp.AssignLTWH(Left, Top, Width, Height: integer);
begin
  Self.Left := Left;
  Self.Top := Top;
  Self.Right := Left+Width {-1};
  Self.Bottom := Top+Height {-1};
end;

procedure TRctHlp.AssignLW(Left, Width: integer);
begin
  Self.Left := Left;
  Self.Right := Left+Width;
end;

procedure TRctHlp.AssignTH(Top, Height: integer);
begin
  Self.Top := Top;
  Self.Height := Top+Height;
end;

function  TRctHlp.AsString: string;
begin
  Result := Format('Left:%d; Top:%d; Right:%d; Bottom:%d',[Left, Top, Right, Bottom]);
end;

function  TRctHlp.CenteredLT(IvInnerW, IvInnerH: integer): TPoint;
begin
  Result.X := Left + (W - IvInnerW) div 2;
  Result.Y := Top + (H - IvInnerH) div 2;
end;

procedure TRctHlp.CheckOrder;
begin
  if Left > Right then
    SwapH;
  if Top > Bottom then
    SwapV;
end;

function  TRctHlp.Equals(const B: Winapi.Windows.TRect): boolean;
begin
  Result := TopLeft.Equals(B.TopLeft) and BottomRight.Equals(B.BottomRight);
end;

procedure TRctHlp.GdiAdjust;
begin
  if Bottom > Top then
    Inc(BottomRight.Y)
  else
    Inc(TopLeft.Y);
  if Right > Left then
    Inc(BottomRight.X)
  else
    Inc(TopLeft.X);
end;

function  TRctHlp.GetBL: TPoint;
begin
  Result.X := Left;
  Result.Y := Bottom;
end;

function  TRctHlp.GetBR: TPoint;
begin
  Result.X := Right;
  Result.Y := Bottom;
end;

function  TRctHlp.GetH: integer;
begin
  Result := Bottom - Top;
end;

function  TRctHlp.GetMB: TPoint;
begin
  Result.X := (Right - Left) div 2;
  Result.Y := Bottom;
end;

function  TRctHlp.GetMC: TPoint;
begin
  Result.X := (Right - Left) div 2;
  Result.Y := (Bottom - Top) div 2;
end;

function  TRctHlp.GetML: TPoint;
begin
  Result.X := Left;
  Result.Y := (Bottom - Top) div 2;
end;

function  TRctHlp.GetMR: TPoint;
begin
  Result.X := Right;
  Result.Y := (Bottom - Top) div 2;
end;

function  TRctHlp.GetMT: TPoint;
begin
  Result.X := (Right - Left) div 2;
  Result.Y := Top;
end;

function  TRctHlp.GetSize: TSize;
begin
  Result.cx := Right - Left;
  Result.cy := Bottom - Top;
end;

function  TRctHlp.GetTL: TPoint;
begin
  Result.X := Left;
  Result.Y := Top;
end;

function  TRctHlp.GetTR: TPoint;
begin
  Result.X := Right;
  Result.Y := Top;
end;

function  TRctHlp.GetW: integer;
begin
  Result := Right - Left;
end;

procedure TRctHlp.Grow(DX, DY: integer);
begin
  if DX <> 0 then begin
    Dec(Left,DX);
    Inc(Right,DX);
  end;
  if DY <> 0 then begin
    Dec(Top,DY);
    Inc(Bottom,DY);
  end;
end;

procedure TRctHlp.Move(DX, DY: integer);
begin
  if DX <> 0 then begin
    Inc(Left,DX);
    Inc(Right,DX);
  end;
  if DY <> 0 then begin
    Inc(Top,DY);
    Inc(Bottom,DY);
  end;
end;

procedure TRctHlp.SetBL(const Value: TPoint);
begin
  Bottom := Value.Y;
  Left := Value.X;
end;

procedure TRctHlp.SetBR(const Value: TPoint);
begin
  Bottom := Value.Y;
  Right := Value.X;
end;

procedure TRctHlp.SetH(const Value: integer);
begin
  Bottom := Top + Value;
end;

procedure TRctHlp.SetMB(const Value: TPoint);
begin
  raise Exception.Create('NOT IMPLEMENTED');
end;

procedure TRctHlp.SetMC(const Value: TPoint);
var
  p: TPoint;
begin
  p := GetMC;
  Move(Value.X - p.X, Value.Y - p.Y);
end;

procedure TRctHlp.SetML(const Value: TPoint);
begin
  raise Exception.Create('NOT IMPLEMENTED');
end;

procedure TRctHlp.SetMR(const Value: TPoint);
begin
  raise Exception.Create('NOT IMPLEMENTED');
end;

procedure TRctHlp.SetMT(const Value: TPoint);
begin
  raise Exception.Create('NOT IMPLEMENTED');
end;

procedure TRctHlp.SetSize(const Value: TSize);
begin
  Right := Left + Value.cx;
  Bottom := Top + Value.cy;
end;

procedure TRctHlp.SetTL(const Value: TPoint);
begin
  Top := Value.Y;
  Left := Value.X;
end;

procedure TRctHlp.SetTR(const Value: TPoint);
begin
  Top := Value.Y;
  Right := Value.X;
end;

procedure TRctHlp.SetW(const Value: integer);
begin
  Right := Left + Value;
end;

procedure TRctHlp.SwapH;
var
  Temp: integer;
begin
  Temp := Left;
  Left := Right;
  Right := Temp;
end;

procedure TRctHlp.SwapV;
var
  Temp: integer;
begin
  Temp := Top;
  Top := Bottom;
  Bottom := Temp;
end;
{$ENDREGION}

{$REGION 'TIjRect'}
function  TIjRect.Has(const IvI, IvJ: integer; const IvRect: TRect): boolean;
var
  r: TIRange;
begin
  Result := r.Has(IvI, IvRect.Left, IvRect.Right) and r.Has(IvJ, IvRect.Top, IvRect.Bottom);
end;
{$ENDREGION}

{$REGION 'TXyRect'}
constructor TXyRect.Create(IvX1, IvY1, IvX2, IvY2: double);
begin
  Self.P1.X := IvX1;
  Self.P1.Y := IvY1;
  Self.P2.X := IvX2;
  Self.P2.Y := IvY2;
end;

procedure TXyRect.FillRandom(IvXMin, IvXMax, IvYMin, IvYMax: double);
//var
//  s: TStsRec;
begin
  raise Exception.Create('NOT IMPLEMENTED');
//  Self.P1.X := s.RndDistributionUniformRange(IvXMin, IvXMax);
//  Self.P1.Y := s.RndDistributionUniformRange(IvYMin, IvYMax);
//  Self.P2.X := s.RndDistributionUniformRange(IvXMin, IvXMax);
//  Self.P2.Y := s.RndDistributionUniformRange(IvYMin, IvYMax);
end;

function  TXyRect.Has(const IvI, IvJ: integer; const IvRect: TRect): boolean; {inline;}
var
  r: TIRange;
begin
  Result := r.Has(IvI, IvRect.Left, IvRect.Right) and r.Has(IvJ, IvRect.Top, IvRect.Bottom);
end;

function  TXyRect.VertexVector: TXyVector4;
begin
  Result[0].X := P1.X;      //                      P2
  Result[0].Y := P1.Y;      //       o---------------o
  Result[1].X := P2.X;      //       | 3           2 |
  Result[1].Y := P1.Y;      //       |       +       |
  Result[2].X := P2.X;      //       | 0           1 |
  Result[2].Y := P2.Y;      //       o---------------o
  Result[3].X := P1.X;      //      P1
  Result[3].Y := P2.Y;      //
end;
{$ENDREGION}

{$REGION 'TXyRectangle'}
constructor TXyRectangle.Create(IvCenterX, IvCenterY, IvW, IvH, IvAngleRad: double);
begin
  Self.Center.X := IvCenterX;
  Self.Center.Y := IvCenterY;
  Self.Size.W   := IvW;
  Self.Size.H   := IvH;
  Self.AngleRad := IvAngleRad;
  Self.BoundOn  := false;
end;

constructor TXyRectangle.Create2(IvLeftX, IvTopY, IvW, IvH, IvAngleRad: double);
begin
  Self.Center.X := IvLeftX + IvW / 2;
  Self.Center.Y := IvTopY + IvH / 2;
  Self.Size.W   := IvW;
  Self.Size.H   := IvH;
  Self.AngleRad := IvAngleRad;
  Self.BoundOn  := false;
end;

procedure TXyRectangle.FillRandom(IvXMin, IvXMax, IvYMin, IvYMax, IvWMin, IvWMax, IvHMin, IvHMax, IvAngleRadMin, IvAngleRadMax: double);
//var
//  s: TStsRec;
begin
  raise Exception.Create('NOT IMPLEMENTED');

//  Self.Center.X := s.RndDistributionUniformRange(IvXMin, IvXMax);
//  Self.Center.Y := s.RndDistributionUniformRange(IvYMin, IvYMax);
//  Self.Size.W   := s.RndDistributionUniformRange(IvWMin, IvWMax);
//  Self.Size.H   := s.RndDistributionUniformRange(IvHMin, IvHMax);
//  Self.AngleRad := s.RndDistributionUniformRange(IvAngleRadMin, IvAngleRadMax);
end;

function  TXyRectangle.Area: double;
begin
  Result := Size.W * Size.H;
end;

function  TXyRectangle.Bound: TXyRect;
const
  pi2 = pi / 2;
var
  cx, cy, w2, h2, a, b2x, b2y: double;
  xmin, xmax, ymin, ymax: double;
  sina, cosa: double;
  n: integer;
begin
  // zip
  cx := Self.Center.X;
  cy := Self.Center.Y;
  w2 := Self.Size.W / 2;
  h2 := Self.Size.H / 2;
  a := Self.AngleRad;
  n := Round(a / Pi);
  a := a - n*Pi;
  // boundsprojection
  if (0 <= a) and (a <= Pi2) then begin
    sina := sin(a);
    cosa := cos(a);
    b2x := w2 * cosa + h2 * sina;
    b2y := w2 * sina + h2 * cosa;
  end else if (0 <= Pi2) and (a <= Pi) then begin
    sina := sin(a-pi2);
    cosa := cos(a-pi2);
    b2y := w2 * cosa + h2 * sina;
    b2x := w2 * sina + h2 * cosa;
  end else begin
    b2x := 0;
    b2y := 0;
  end;
  // rect
  xmin := cx - b2x;
  xmax := cx + b2x;
  ymin := cy - b2y;
  ymax := cy + b2y;
  // end
  Result.Create(xmin, ymin, xmax, ymax);
end;

function  TXyRectangle.VertexVector: TXyVector4;
var
  cx, cy, w2, h2, a, x, y: double;
  g: TGemRec;
begin
  // zip
  cx := Self.Center.X;
  cy := Self.Center.Y;
  w2 := Self.Size.W / 2;
  h2 := Self.Size.H / 2;
  a := Self.AngleRad;

  // vertex 0
  x := - w2;
  y := - h2;
  g.XyRotate(x, y, a);
  Result[0].X := cx + x;
  Result[0].Y := cy + y;

  // vertex 1
  x := + w2;
  y := - h2;
  g.XyRotate(x, y, a);
  Result[1].X := cx + x;
  Result[1].Y := cy + y;

  // vertex 2
  x := + w2;
  y := + h2;
  g.XyRotate(x, y, a);
  Result[2].X := cx + x;
  Result[2].Y := cy + y;

  // vertex 3
  x := - w2;
  y := + h2;
  g.XyRotate(x, y, a);
  Result[3].X := cx + x;
  Result[3].Y := cy + y;
end;
{$ENDREGION}

{$REGION 'Point'}
function  TPntHlp.Assign(Point: TPoint): boolean;
begin
  Result := (Point.X <> X) or (Point.Y <> Y);
  if Result then
    Self := Point;
end;

function  TPntHlp.AsString: string;
begin
  Result := Format('X:%d; Y:%d',[X,Y]);
end;

function  TPntHlp.Convert(const Value: TSize): TPoint;
begin
  Result := TPoint(Value);
end;

procedure TPntHlp.Dec(DeltaX, DeltaY: integer);
begin
  System.Dec(X, DeltaX);
  System.Dec(Y, DeltaY);
end;

function  TPntHlp.Equals(const B: TPoint): boolean;
begin
  Result := (X = B.X) and (Y = B.Y);
end;

procedure TPntHlp.Inc;
begin
  System.Inc(X);
  System.Inc(Y);
end;

procedure TPntHlp.Inc(Delta: TPoint);
begin
  System.Inc(X, Delta.X);
  System.Inc(Y, Delta.Y);
end;

procedure TPntHlp.Inc(DeltaX, DeltaY: integer);
begin
  System.Inc(X,DeltaX);
  System.Inc(Y,DeltaY);
end;

procedure TPntHlp.Inc(Delta: integer);
begin
  System.Inc(X, Delta);
  System.Inc(Y, Delta);
end;

class function  TPntHlp.New(AX, AY: integer): TPoint;
begin
  Result.X := AX;
  Result.Y := AY;
end;

procedure TPntHlp.SetZero;
begin
  X := 0;
  Y := 0;
end;
{$ENDREGION}

{$REGION 'TBoxCls'}
procedure TBoxCls.Assign(Source: TPersistent);
var
  b: TBoxCls;
begin
  if Source is TBoxCls then begin
    b := TBoxCls(Source);
    FText := b.Text;
    FFont.Assign(b.Font);
    FBg.Assign(b.Bg);
    FOutline.Assign(b.Outline);
    FLetterOutline.Assign(b.LetterOutline);
    FGap := b.Gap;
    FOffsetH := b.OffsetH;
    FOffsetV := b.OffsetV;
  end else
    inherited;
end;

constructor TBoxCls.Create(IvText: string);
begin
  inherited Create;

  // string
  FText := IvText;

  // font
  FFont       := TFont.Create;
  FFont.Name  := 'Tahoma';  // TEXT_FONT
  FFont.Size  := 8;         // TEXT_SIZE
  FFont.Color := clSkyBlue; // TEXT_COLOR

  // background
  FBg       := TBrush.Create;
  FBg.Color := clWhite; // TEXT_BG_COLOR;
  FBg.Style := bsSolid; // TEXT_BG_STYLE;

  // outline
  FOutline       := TPen.Create;
  FOutline.Color := clSilver; // TEXT_OUTLINE_COLOR;
  FOutline.Style := psSolid;  // TEXT_OUTLINE_STYLE;
  FOutline.Width := 1;        // TEXT_OUTLINE_WIDTH;

  // letter
  FLetterOutline := TPen.Create;
  FLetterOutline.Color := clSilver; // TEXT_LETTER_OUTLINE_COLOR;
  FLetterOutline.Style := psClear;  // TEXT_LETTER_OUTLINE_STYLE;
  FLetterOutline.Width := 0;        // TEXT_LETTER_OUTLINE_WIDTH;

  // geo
  FGap     := 2; // TEXT_GAP;
  FOffsetH := 0.0;
  FOffsetV := 0.0;
end;

destructor TBoxCls.Destroy;
begin
  FFont.Free;
  FBg.Free;
  FOutline.Free;
  FLetterOutline.Free;
  inherited;
end;

procedure TBoxCls.SetBg(const Value: TBrush);
begin
  FBg := Value;
end;

procedure TBoxCls.SetFont(const Value: TFont);
begin
  FFont := Value;
end;

procedure TBoxCls.SetGap(const Value: integer);
begin
  FGap := Value;
end;

procedure TBoxCls.SetLetterOutline(const Value: TPen);
begin
  FLetterOutline := Value;
end;

procedure TBoxCls.SetOffsetH(const Value: double);
begin
  FOffsetH := Value;
end;

procedure TBoxCls.SetOffsetV(const Value: double);
begin
  FOffsetV := Value;
end;

procedure TBoxCls.SetOutline(const Value: TPen);
begin
  FOutline := Value;
end;

procedure TBoxCls.SetText(const Value: string);
begin
  FText := Value;
end;
{$ENDREGION}

{$REGION 'Zzz'}
(*

{$REGION 'Routine'}
// General
procedure PixelsPerMm(IvCanvas: TCanvas; var IvX, IvY: single);
function  SizeFromWH(IvW: integer; IvH: integer): TIjSize; overload;
function  SizeFromWH(IvW: double; IvH: double): TXySize; overload;
// N2
function  IjOrigin: TIj;
function  IjIsEqual(IvP1, IvP2: TIj): boolean;
function  IjDistance(IvP1, IvP2: TIj): double;
function  IjDistanceI(IvP1, IvP2: TIj): integer;
function  IjDistanceJ(IvP1, IvP2: TIj): integer;
function  IjIsOrigin(IvIj: TIj): boolean;
function  AreaCenter(IvP1I, IvP1J, IvP2I, IvP2J: integer): TIj; overload;
function  AreaFromCenterAndSize(IvCenter: TIj; IvSize: TIjSize): Tijt; overload;
// N3
function  IjkOrigin: TIjk;
function  IjkIsOrigin(IvIjk: TIjk): boolean;
// R2
function  XyFromXy(IvX, IvY: double): TXy;
function  XyOrigin: TXy;
function  XyIsOrigin(IvXy: TXy): boolean;
function  XyIsEqual(IvP1, IvP2: TXy): boolean;
function  XyDistance(IvP1, IvP2: TXy): double;
function  XyIsInCircle(IvP: TXy; IvR: double): integer; // 0=inside, 1=cross, 2=outside (suppose circle center in originxy)
function  XyIsInDonut(IvP: TXy; IvR1, IvR2: double): integer; // 0=inside, 1=cross, 2=outside (suppose donut center in originxy)
function  AreaHas(IvI, IvJ, IvP1I, IvP1J, IvP2I, IvP2J: integer): boolean; overload;
function  AreaHas2(IvI, IvJ, IvCI, IvCJ, IvW, IvH: integer): boolean; overload;
function  AreaHas(IvX, IvY, IvP1X, IvP1Y, IvP2X, IvP2Y: double): boolean; overload;
function  AreaHas2(IvX, IvY, IvCx, IvCy, IvW, IvH: double): boolean; overload;
function  AreaCenter(IvP1X, IvP1Y, IvP2X, IvP2Y: double): TXy; overload;
function  AreaFromCenterAndSize(IvCenter: TXy; IvSize: TXySize): TXyt; overload;
function  AreaHasCircle(IvXyRect: TXyRect; IvR: double): integer; // 0=inside, 1=cross, 2=outside (suppose circle center in originxy)
function  AreaHasDonut(IvXyRect: TXyRect; IvR1, IvR2: double): integer; // 0=inside, 1=cross, 2=outside (suppose donut center in originxy)
procedure XyRotate(var x, y: double; {0, 0,} a: double); overload;
procedure XyRotate(var x, y: double; ox, oy, a: double); overload;
procedure XyRotateMirrorFlip(var x, y: double; a: double; mirror, flip: boolean);
procedure AreaToVertex(IvXyRect: TXyRect; var IvVertex: TXyVector4);
// R3
function  XyzBuild(IvX, IvY, IvZ: double): TXyz;
function  XyzOrigin: TXyz;
function  XyzIsOrigin(IvXyz: TXyz): boolean;
function  XyzIsEqual(IvP1, IvP2: TXyz): boolean;
function  XyzDistance(IvP1, IvP2: TXyz): double;
function  XyzMassNull: TXyzMass;
function  XyzMassIsEqual(IvMp1, IvMp2: TXyzMass): boolean;
function  XyzMassIsInMass(IvMp1, IvMp2: TXyzMass): boolean;
function  XyzMassIsInPosition(IvMp1, IvMp2: TXyzMass): boolean;
function  XyzMassAdd(IvMp1, IvMp2: TXyzMass): TXyzMass;
function  XyzMassCentroid(const IvMpArray: array of TXyzMass): TXyzMass;
function  XyzMassScalarMultiply(IvMp: TXyzMass; IvScalar: double): TXyzMass;
// Zzz
function  GdiWidth(IvIj1, IvIj2: TIj): integer; overload;
function  GdiWidth(IvIjRect: TGdiBox): integer; overload;
function  GdiHeight(IvIj1, IvIj2: TIj): integer; overload;
function  GdiHeight(IvIjRect: TGdiBox): integer; overload;
function  GdiSize(IvW, IvH: integer): TSize;
function  GdiAreaDiff(IvXyRect1, IvXyRect2: TXyRect): TXyRect;
procedure GdiBoxFill(IvCanvas: TCanvas; IvRect: TRect; IvBrushColor: TColor; IvBrushStyle: TBrushStyle);
procedure GdiCircle(IvCanvas: TCanvas; IvRect: TRect; IvPenColor, IvBrushColor: TColor; IvBrushStyle: TBrushStyle); overload;
procedure GdiCircle(IvCanvas: TCanvas; IvP1: TPoint; IvR: integer; IvPenColor, IvBrushColor: TColor; IvBrushStyle: TBrushStyle); overload;
procedure GdiLine(IvCanvas: TCanvas; IvP1, IvP2: TPoint; IvPenColor: TColor);
// Spare
function  D3ToD2(const D3Point: TXyz; const AbsoluteEyeDist: double = 1024): TXy; // make AbsoluteEyeDist the max width of your view area
function  D2ToD3(P: TXy; ZPlane: double; AbsoluteEyeDist: double = 1024): TXyz;
function  RotatePoint(const P: TXyz; const APhi, ATheta, ATwist: integer): TXyz;
function  FixIntDegrees(const Angle: integer): integer;
function  FixIntDegreesAllowNegative(const Angle: integer): integer;
function  AngleD2(X, Y: double): double;
function  MinAngleBetweenVectors(const P, Q, R: TXyz): double;
function  DistPoint2Line(const Point, LineP1, LineP2: TXyz): double;
function  DistPoint2LineSegment(const Point, LineStart, LineEnd: TXyz): double;
function  MidPoint(const P1, P2: TXyz): TXyz;
function  MidPointX(const P1, P2: TXyz): TXyz;
function  MidPointY(const P1, P2: TXyz): TXyz;
function  TriangleArea(const a, b, base: double): double;
function  TriangleHeight(const a, b, base: double): double;
function  Distance(const P1, P2: TXyz): double;
function  PointOnLine(const P1, P2: TXyz; const t: double): TXyz;
{$ENDREGION}


{$REGION 'Var'}
var
  // 360 is included to make programming easier, do not alter these! values are assigned in initialization section
  SinTable: array[0..360] of double;
  CosTable: array[0..360] of double;

  AvGripId: array[0..8] of integer = (
    12// 4 + 8 = tl grip
  , 6 // 4 + 2 = tr grip
  , 3 // 1 + 2 = br grip
  , 9 // 1 + 8 = bl grip
  , 8 // 8     = left border
  , 4 // 4     = top border
  , 2 // 2     = right border = cr grip
  , 1 // 1     = bottom border
  , 0 // 0 + 0 = cc grip
  );
{$ENDREGION}

{$REGION 'General'}
procedure PixelsPerMm(IvCanvas: TCanvas; var IvX, IvY: single);
var
  LvHdc: HDC;
  LvHRes, LvVRes,
  LvHSiz, LvVSiz: integer;
begin
  LvHdc := IvCanvas.Handle;
  LvHRes := GetDeviceCaps(LvHdc, HORZRES) ;  // display width in pixels
  LvVRes := GetDeviceCaps(LvHdc, VERTRES) ;  // display height in pixels
  LvHSiz := GetDeviceCaps(LvHdc, HORZSIZE) ; // display width in mm
  LvVSiz := GetDeviceCaps(LvHdc, VERTSIZE) ; // display height in mm
  IvX := LvHRes / LvHSiz;
  IvY := LvVRes / LvVSiz;
end;
{$ENDREGION}

{$REGION 'ij function  *** move in appropriate class ***'}
function  IjOrigin: TIj;
begin
  Result := Ij(0, 0);
end;

function  IjIsOrigin(IvIj: TIj): boolean;
begin
  Result := (IvIj.I = 0) and (IvIj.J = 0);
end;

function  IjIsEqual(IvP1, IvP2: TIj): boolean;
begin
  Result := (IvP1.I = IvP2.I) and (IvP1.J = IvP2.J);
end;

function  SizeFromWH(IvW: integer; IvH: integer): TIjSize; overload;
begin
  Result.W := IvW;
  Result.H := IvH;
end;

function  IjDistance(IvP1, IvP2: TIj): double;
begin
  Result := sqrt(sqr(IvP2.I - IvP1.I) + sqr(IvP2.J - IvP1.J));
end;

function  IjDistanceI(IvP1, IvP2: TIj): integer;
begin
  Result := Abs(IvP1.I - IvP2.I);
end;

function  IjDistanceJ(IvP1, IvP2: TIj): integer;
begin
  Result := Abs(IvP1.J - IvP2.J);
end;

function  AreaFromCenterAndSize(IvCenter: TIj; IvSize: TIjSize): TijRect;
begin
  Result.P1.I := IvCenter.I - IvSize.W div 2;
  Result.P1.J := IvCenter.J - IvSize.H div 2;
  Result.P2.I := IvCenter.I + IvSize.W div 2;
  Result.P2.J := IvCenter.J + IvSize.H div 2;
end;

function  AreaHas(IvI, IvJ, IvP1I, IvP1J, IvP2I, IvP2J: integer): boolean;
begin
  Result := RangeHas(IvI, IvP1I, IvP2I) and RangeHas(IvJ, IvP1J, IvP2J);
end;

function  AreaHas2(IvI, IvJ, IvCI, IvCJ, IvW, IvH: integer): boolean;
begin
  Result := RangeHas(IvI, IvCI - IvW div 2, IvCI + IvW div 2) and RangeHas(IvJ, IvCJ - IvH div 2, IvCJ + IvH div 2);
end;

function  AreaCenter(IvP1I, IvP1J, IvP2I, IvP2J: integer): TIj;
begin
  Result.I := RangeCenter(IvP1I, IvP2I);
  Result.J := RangeCenter(IvP1I, IvP2I);
end;

function  AreaFromCenterAndSize(IvCenter: TXy; IvSize: TXySize): TXyRect;
begin
  Result.P1.X := IvCenter.X - IvSize.W / 2;
  Result.P1.Y := IvCenter.Y - IvSize.H / 2;
  Result.P2.X := IvCenter.X + IvSize.W / 2;
  Result.P2.Y := IvCenter.Y + IvSize.H / 2;
end;
{$ENDREGION}

{$REGION 'xy function  *** move in appropriate class ***'}
function  XyFromXy(IvX, IvY: double): TXy;
begin
  Result.X := IvX;
  Result.Y := IvY;
end;

function  XyOrigin: TXy;
begin
  Result.X := 0.0;
  Result.Y := 0.0;
end;

function  XyIsOrigin(IvXy: TXy): boolean;
begin
  Result := (IvXy.X = 0.0) and (IvXy.Y = 0.0);
end;

function  XyIsEqual(IvP1, IvP2: TXy): boolean;
begin
  Result := (IvP1.X = IvP2.X) and (IvP1.Y = IvP2.Y);
end;

function  XyIsInCircle(IvP: TXy; IvR: double): integer;
var
  d: double;
begin
  d := XyDistance(XyOrigin, XyFromXy(IvP.x, IvP.y));
  if d < IvR then // inside
    Result := 0
  else if d = IvR then // cross
    Result := 1
  else if d > IvR then // outside
    Result := 2
  else
    Result := -1
end;

function  XyIsInDonut(IvP: TXy; IvR1, IvR2: double): integer;
var
  d: double;
begin
  d := XyDistance(XyOrigin, XyFromXy(IvP.x, IvP.y));
       if (IvR1 < d) and (d < IvR2) then // inside
    Result := 0
  else if (IvR1 = d) or (d = IvR2) then // cross
    Result := 1
  else if (IvR1 > d) or (d > IvR2) then // outside
    Result := 2
  else
    Result := -1
end;

function  SizeFromWH(IvW: double; IvH: double): TXySize; overload;
begin
  Result.W := IvW;
  Result.H := IvH;
end;

function  XyDistance(IvP1, IvP2: TXy): double;
begin
  Result := sqrt(sqr(IvP2.X - IvP1.X) + sqr(IvP2.Y - IvP1.Y));
end;

function  AreaHas(IvX, IvY, IvP1X, IvP1Y, IvP2X, IvP2Y: double): boolean;
begin
  Result := RangeHas(IvX, IvP1X, IvP2X) and RangeHas(IvY, IvP1Y, IvP2Y);
end;

function  AreaCenter(IvP1X, IvP1Y, IvP2X, IvP2Y: double): TXy; overload;
begin
  Result.X := RangeCenter(IvP1X, IvP2X);
  Result.Y := RangeCenter(IvP1Y, IvP2Y);
end;

function  AreaHas2(IvX, IvY, IvCx, IvCy, IvW, IvH: double): boolean;
begin
  Result := RangeHas(IvX, IvCx - IvW/2, IvCx + IvW/2) and RangeHas(IvY, IvCy - IvH/2, IvCy + IvH/2);
end;

procedure AreaToVertex(IvXyRect: TXyRect; var IvVertex: TXyVector4);
begin
  IvVertex[0] := XyFromXy(IvXyRect.P1.X, IvXyRect.P1.Y);
  IvVertex[1] := XyFromXy(IvXyRect.P1.X, IvXyRect.P2.Y);
  IvVertex[2] := XyFromXy(IvXyRect.P2.X, IvXyRect.P1.Y);
  IvVertex[3] := XyFromXy(IvXyRect.P2.X, IvXyRect.P2.Y);
end;

function  AreaHasCircle(IvXyRect: TXyRect; IvR: double): integer;
var
  i, zin, zou: integer; // counter, inside, outside
  v: TXyVector4; // areavertices
  d: array [0..3] of double; // vertex distances
begin
  // vertices distance
  AreaToVertex(IvXyRect, v);
  for i := 0 to 3 do
    d[i] := XyDistance(XyOrigin, v[i]);

  // count vertices in out
  zin := 0; zou := 0;
  for i := 0 to 3 do
    if d[i] <= IvR then
      inc(zin)
    else
      inc(zou);

  // test counts and result
       if zin = 4 then // 0 inside
    Result := 0
  else if zou = 4 then // 2 outside
    Result := 2
  else                 // 1 cross
    Result := 1;

//       if (d[0] < IvR) and (d[3] < IvR) then Result := $00 // 0 inside
//  else if (d[0] < IvR) and (d[3] > IvR) then Result := $01 // 1 cross
//  else if (d[0] > IvR) and (d[3] > IvR) then Result := $10 // 2 outside
end;

function  AreaHasDonut(IvXyRect: TXyRect; IvR1, IvR2: double): integer;
var
  r1, r2: double;
//a1, a2: integer;
  i, zin, zou: integer; // counter, inside, outside
  v: TXyVector4; // areavertices
  d: array [0..3] of double; // vertex distances
begin
  // ensure r1 <= r2
  if IvR1 = IvR2 then begin
    Result := AreaHasCircle(IvXyRect, IvR1);
    Exit;
  end else if IvR1 < IvR2 then begin
    r1 := IvR1;
    r2 := IvR2;
  end else begin
    r1 := IvR2;
    r2 := IvR1;
  end;

  // vertices distance
  AreaToVertex(IvXyRect, v);
  for i := 0 to 3 do
    d[i] := XyDistance(XyOrigin, v[i]);

  // count vertices in out
  zin := 0; zou := 0;
  for i := 0 to 3 do
    if (r1 < d[i]) and (d[i] <= r2) then
      inc(zin)
    else
      inc(zou);

  // test counts and result
       if zin = 4 then // 0 inside
    Result := 0
  else if zou = 4 then // 2 outside
    Result := 2
  else                 // 1 cross
    Result := 1;

//  // area respect r1 and r2
//  a1 := AreaHasCircle(IvXyRect, r1);
//  a2 := AreaHasCircle(IvXyRect, r2);

//  // return
//       if (a2 = $00) and (a1 = $00) then Result := 2  // 2 outside
//  else if (a2 = $00) and (a1 = $01) then Result := 1  // 1 cross
//  else if (a2 = $00) and (a1 = $10) then Result := 0  // 0 inside
//  else if (a2 = $01) and (a1 = $10) then Result := 1  // 1 cross
//  else if (a2 = $10) and (a1 = $10) then Result := 2; // 2 outside
end;

procedure XyRotate(var x, y: double; {0, 0,} a: double); overload;
var
  x2, y2, sina, cosa: double;
begin
  sina := Sin(a);
  cosa := Cos(a);
  x2 := x * cosa - y * sina;
  y2 := y * cosa + x * sina;
  x := x2;
  y := y2;
end;

procedure XyRotate(var x, y: double; ox, oy, a: double); overload;
//var
//  x2, y2: double;
begin
//  x2 := x - ox;
//  y2 := y - oy;
//  XyRotate(a, x, y);
//  x := x + ox;
//  y := y + oy;
end;

procedure XyRotateMirrorFlip(var x, y: double; a: double; mirror, flip: boolean); // affine transformation
//var
  //x2, y2: double;
begin
  //x2 := x;
  //y2 := y;

  if a <> 0 then
    XyRotate(x, y, a);

  if mirror then
    x := -x;

  if flip then
    y := -y;

  //x := x2;
  //y := y2;
end;
{$ENDREGION}

{$REGION 'Xyz Functions'}
function  XyzBuild(IvX, IvY, IvZ: double): TXyz;
begin
  Result.X := IvX;
  Result.Y := IvY;
  Result.Z := IvZ;
end;

function  XyzOrigin: TXyz;
begin
  Result.X := 0.0;
  Result.Y := 0.0;
  Result.Z := 0.0;
end;

function  XyzIsOrigin(IvXyz: TXyz): boolean;
begin
  Result := (IvXyz.X = 0.0) and (IvXyz.Y = 0.0) and (IvXyz.Z = 0.0);
end;

function  XyzIsEqual(IvP1, IvP2: TXyz): boolean;
begin
  Result := (IvP1.X = IvP2.X) and (IvP1.Y = IvP2.Y) and (IvP1.Z = IvP2.Z);
end;

function  XyzDistance(IvP1, IvP2: TXyz): double;
begin
  Result := sqrt(sqr(IvP2.X - IvP1.X) + sqr(IvP2.Y - IvP1.Y) + sqr(IvP2.Z - IvP1.Z));
end;
{$ENDREGION}

{$REGION 'Xyz Mass Functions'}
function  XyzMassNull: TXyzMass;
begin
  Result.Mass := 0;
  Result.Point := XyzOrigin;
end;

function  XyzMassIsInMass(IvMp1, IvMp2: TXyzMass): boolean;
begin
  Result := IvMp1.Mass = IvMp2.Mass;
end;

function  XyzMassIsInPosition(IvMp1, IvMp2: TXyzMass): boolean;
begin
  Result := XyzIsEqual(IvMp1.Point, IvMp2.Point);
end;

function  XyzMassIsEqual(IvMp1, IvMp2: TXyzMass): boolean;
begin
  Result := (XyzMassIsInMass(IvMp1, IvMp2)) and (XyzMassIsInPosition(IvMp1, IvMp2));
end;

function  XyzMassAdd(IvMp1, IvMp2: TXyzMass): TXyzMass;
begin
  Result.Mass := IvMp1.Mass + IvMp2.Mass;
  if Result.Mass = 0 then begin
    //gods.Ods('Mass Point Add: Total system mass degenerate to zero');
    Result.Point.X := 0;
    Result.Point.Y := 0;
    Result.Point.Z := 0;
  end else begin
    Result.Point.X := ((IvMp1.Mass * IvMp1.Point.X) + (IvMp2.Mass * IvMp2.Point.X)) / Result.Mass;
    Result.Point.Y := ((IvMp1.Mass * IvMp1.Point.Y) + (IvMp2.Mass * IvMp2.Point.Y)) / Result.Mass;
    Result.Point.Z := ((IvMp1.Mass * IvMp1.Point.Z) + (IvMp2.Mass * IvMp2.Point.Z)) / Result.Mass;
  end;
end;

function  XyzMassCentroid(const IvMpArray: array of TXyzMass): TXyzMass;
var
  i: integer;
begin
  if Length(IvMpArray) = 0 then begin
    Result := XyzMassNull;
  end else if Length(IvMpArray) = 1 then begin
    Result := IvMpArray[0];
  end else if Length(IvMpArray) > 1 then begin
    Result := IvMpArray[Low(IvMpArray)];
    for i := Low(IvMpArray)+1 to High(IvMpArray) do begin
      Result := XyzMassAdd(Result, IvMpArray[i]);
    end;
  end;
end;

function  XyzMassScalarMultiply(IvMp: TXyzMass; IvScalar: double): TXyzMass;
begin
  Result.Mass := IvMp.Mass * IvScalar;
  Result.Point := IvMp.Point;
end;
{$ENDREGION}

{$REGION 'Routine'}
function  GdiWidth(IvIj1, IvIj2: TIj): integer;
begin
  Result := IvIj2.I - IvIj1.I;
end;

function  GdiHeight(IvIj1, IvIj2: TIj): integer;
begin
  Result := IvIj2.J - IvIj1.J;
end;

//function  GdiWidth(IvIjRect: TGdiBox): integer; overload;
//begin
//  Result := GdiWidth(IvIjRect.P1, IvIjRect.P2)
//end;

//function  GdiHeight(IvIjRect: TGdiBox): integer; overload;
//begin
//  Result := GdiHeight(IvIjRect.P1, IvIjRect.P2)
//end;

function  GdiAreaDiff(IvXyRect1, IvXyRect2: TXyRect): TXyRect;
begin
  Result := IvXyRect1;
end;

procedure GdiBoxFill(IvCanvas: TCanvas; IvRect: TRect; IvBrushColor: TColor; IvBrushStyle: TBrushStyle);
begin
  with IvCanvas do begin
    Brush.Color := IvBrushColor;
    Brush.Style := IvBrushStyle;
    FillRect(IvRect);
  end;
end;

procedure GdiCircle(IvCanvas: TCanvas; IvRect: TRect; IvPenColor, IvBrushColor: TColor; IvBrushStyle: TBrushStyle); overload;
begin
  with IvCanvas do begin
    Pen.Color := IvPenColor;
    Brush.Color := IvBrushColor;
    Brush.Style := IvBrushStyle;
    Ellipse(IvRect);
  end;
end;

procedure GdiCircle(IvCanvas: TCanvas; IvP1: TPoint; IvR: integer; IvPenColor, IvBrushColor: TColor; IvBrushStyle: TBrushStyle); overload;
begin
  with IvCanvas do begin
    Pen.Color := IvPenColor;
    Brush.Color := IvBrushColor;
    Brush.Style := IvBrushStyle;
    Ellipse(IvP1.X - IvR, IvP1.Y - IvR, IvP1.X + IvR, IvP1.Y + IvR);
  end;
end;

procedure GdiLine(IvCanvas: TCanvas; IvP1, IvP2: TPoint; IvPenColor: TColor);
begin
  with IvCanvas do begin
    Pen.Color := IvPenColor;
    MoveTo(IvP1.X, IvP1.Y);
    LineTo(IvP2.X, IvP2.Y);
  end;
end;

function  GdiSize(IvW, IvH: integer): TSize;
begin
  with Result do begin
    cx := IvW;
    cy := IvH;
  end;
end;
{$ENDREGION}

{$REGION 'ijk Functions'}
function  IjkOrigin: TIjk;
begin
  Result.I := 0;
  Result.J := 0;
  Result.K := 0;
end;

function  IjkIsOrigin(IvIjk: TIjk): boolean;
begin
  Result := (IvIjk.I = 0) and (IvIjk.J = 0) and (IvIjk.K = 0);
end;
{$ENDREGION}

{$REGION 'Spare'}
function  D3ToD2(const D3Point: TXyz; const AbsoluteEyeDist: double = 1024): TXy;
const
  SZero: double = 0;
  SOne: double = 1;
  SNegOne: double = -1;
var
  D: double;
begin
  // Calculate distance from eye
  D := (AbsoluteEyeDist+D3Point.W);
  if D < SOne then begin
    if D > SZero then
      D := AbsoluteEyeDist+SOne
    else if D > SNegOne then
      D := AbsoluteEyeDist-SOne
    else if D = SZero then
      D := SOne;
  end;
  // Do conversion (meaning of D is lost but oh well)
  D := AbsoluteEyeDist / D;
  Result.V := D3Point.V * D;
  Result.U := D3Point.U * D;
end;

function  D2ToD3(P: TXy; ZPlane: double; AbsoluteEyeDist: double = 1024): TXyz;
var
  D: double;
begin
  D := AbsoluteEyeDist + ZPlane;
  Result.U := (P.U * D) / AbsoluteEyeDist;
  Result.V := (P.V * D) / AbsoluteEyeDist;
  Result.W := ZPlane;
end;

function  RotatePoint(const P: TXyz; const APhi, ATheta, ATwist: integer): TXyz;
var
  TempX, TempY, TempZ: double;
begin
  Result := P;
  with Result do begin
    // Twist, Clockwise ZSpin
    if (ATwist > 0) then begin
      TempX := CosTable[ATwist]*X - SinTable[ATwist]*Y;
      TempY := SinTable[ATwist]*X + CosTable[ATwist]*Y;
      X := TempX;
      Y := TempY;
    end;
    // Phi, top gets closer first (XRot)
    if (APhi>0) then begin
      TempZ := CosTable[APhi] * Z - SinTable[APhi] * Y;
      TempY := SinTable[APhi] * Z + CosTable[APhi] * Y;
      Z := TempZ;
      Y := TempY;
    end;
    // Theta, right gets closer first
    if (ATheta > 0) then begin
      TempX := CosTable[ATheta] * X - SinTable[ATheta] * Z;
      TempZ := SinTable[ATheta] * X + CosTable[ATheta] * Z;
      X := TempX;
      Z := TempZ;
    end;
  end;
end;

function  FixIntDegrees(const Angle: integer): integer;
var
  MakeZeroTo360: boolean;
begin
  MakeZeroTo360 := Angle <> 0;
  Result := Angle mod 360;
  if Result < 0 then
    Inc(Result, 360);
  if (Result = 0) and MakeZeroTo360 then
    Result := 360
end;

function  FixIntDegreesAllowNegative(const Angle: integer): integer;
var
  MakeZeroTo360: boolean;
begin
  MakeZeroTo360 := Angle <> 0;
  Result := Angle mod 360;
  if (Result = 0) and MakeZeroTo360 then
  begin
    if Angle > 0 then
      Result := 360
    else
      Result := -360;
  end;
end;

function  AngleD2(X, Y: double): double;
var
  Q: integer;
begin
  if X = 0 then begin
    if Y > 0 then
      Result := Pi / 2
    else
    begin
      if Y = 0 then
        Result := 0
      else
        Result := 3 * Pi / 2;
    end;
    Exit;
  end;
  if Y = 0 then begin
    if X > 0 then
      Result := 0
    else
      Result := Pi;
    Exit;
  end;
  if (X>0) then begin
    if Y>=0 then
      Q := 1
    else
      Q := 4;
  end else begin
    if Y<0 then
      Q := 3
    else
      Q := 2;
  end;
  try
    Result := ArcTan(abs(Y/X));
  except
    Result := Pi / 2;
  end;
  case Q of
    2: Result := (Pi) - Result;
    3: Result := Result+Pi;
    4: Result := 2*Pi - Result;
  end;
end;

function  MinAngleBetweenVectors(const P, Q, R: TXyz): double;
var
  CosAngle: double;
  V1, V2: TVector;
  Mag1, Mag2: double;
  MagMult: double;
begin
  V1 := Vector(P, Q);
  V2 := Vector(P, R);
  Mag1 := VectorMagnitude(V1);
  Mag2 := VectorMagnitude(V2);
  MagMult := Mag1*Mag2;
  if (MagMult=0) then
    Result := 0
  else begin
    CosAngle := VectorDot(V1, V2)/MagMult;
    {Round errors}
    if CosAngle > 1 then
      CosAngle := 1
    else if CosAngle < -1 then
      CosAngle := -1;
{$IFDEF VER80}
    Result := ArcTan(sqrt(1-sqr(CosAngle)) / CosAngle);
{$ELSE}
    Result := ArcCos(CosAngle);
{$ENDIF}
  end;
end;

function  DistPoint2Line(const Point, LineP1, LineP2: TXyz): double;
var
  U: TVector;
  MU: double;
  P: TXyz;
  PQ: TVector;
  PQCrossU: TVector;
begin
  // Bottom of Page 715 in Swokowski Calculus 5th Edition
  U := Vector(LineP1, LineP2);
  MU := VectorMagnitude(U);
  if (MU<0.0000000001) then begin
    Result := VectorMagnitude(Vector(Point, LineP1));
  end else begin
    P := LineP1;
    PQ := Vector(P, Point);
    PQCrossU := VectorCross(PQ, U);
    try
      Result := VectorMagnitude(PQCrossU)/MU;
    except
      Result := VectorMagnitude(Vector(Point, LineP1));
    end;
  end;
end;

function  DistPoint2LineSegment(const Point, LineStart, LineEnd: TXyz): double;
{
  Concept
  If the angle between either endpoint and the dot is greater than 90
  then the dot is outside of the line segment. I use a test and use
  the dot product because if the cos is negative then the angle is greater
  than 90. The dot product will be negative if the angle is greater than 90
  See page 703 in Swokowski Calculus 5th Edition for dot product cos reason
}
begin
  if VectorDot(Vector(LineStart, Point), Vector(LineStart, LineEnd)) < 0 then
    Result := VectorMagnitude(Vector(LineStart, Point))
  else if VectorDot(Vector(LineEnd, Point), Vector(LineEnd, LineStart)) < 0 then
    Result := VectorMagnitude(Vector(LineEnd, Point))
  else
    Result := DistPoint2Line(Point, LineStart, LineEnd);
end;

function  MidPoint(const P1, P2: TXyz): TXyz;
const
  CHalf: double = 0.5;
begin
  Result.U := (P1.U+P2.U)*CHalf;
  Result.V := (P1.V+P2.V)*CHalf;
  Result.W := (P1.W+P2.W)*CHalf;
end;

function  MidPointX(const P1, P2: TXyz): TXyz;
const
  CHalf: double = 0.5;
asm
  {
  eax -@P1
  edx -@P2
  ecx -@Result
  Memory bandwidth is the main performance problem in this function.
  }
  { load inverse of two onto stack }
  fld CHalf
  { load P1.U, P1.V & P1.W }
  fld [eax].TXyz.U  // P1.U | 0.5
  fld [eax].TXyz.V  // P1.V | P1.U | 0.5
  fld [eax].TXyz.W  // P1.W | P1.V | P1.U | 0.5
  { load P2.U, P2.V, P2.W and calculate (P2.?+P1.?) for each }
  fld [edx].TXyz.U   // P2.U | P1.W | P1.V | P1.U | 0.5
  faddp st(3), st(0)    // P1.W | P1.V | P2.U+P1.U  | 0.5
  fld [edx].TXyz.V   // P2.V | P1.W | P1.V | P2.U+P1.U  | 0.5
  faddp st(2), st(0)    // P1.W | P2+P1.V | P2.U+P1.U  | 0.5
  fld [edx].TXyz.W   // P2.W | P1.W | P2+P1.V | P2.U+P1.U  | 0.5
  faddp st(1), st(0)    // P2.W+P1.W | P2+P1.V | P2.U+P1.U  | 0.5
  { next, perform *0.5 for each one (and call this A,B,C for brevity) }
  fmul st(0), st(3)  //     C      | P2+P1.V | P2.U+P1.U  | 0.5
  fxch st(2)         // P2.U+P1.U  | P2+P1.V |     C      | 0.5
  fmul st(0), st(3)  //     A      | P2+P1.V |     C      | 0.5
  fxch st(3)         //    0.5     | P2+P1.V |     C      |  A
  fmulp st(1), st(0) //     B      |    C    |     A
  { store stuff to memory }
  fstp [ecx].TXyz.V
  fstp [ecx].TXyz.W
  fstp [ecx].TXyz.U
  { raise exceptions if any caused }
  fwait
end;

function  MidPointY(const P1, P2: TXyz): TXyz;
const
  CHalf: double = 0.5;
asm
  {
  eax -@P1
  edx -@P2
  ecx -@Result
  Memory bandwidth is the main performance problem in this function. }
  { load inverse of two onto stack }
  fld CHalf
  { load P1.U, P1.V & P1.W }
  fld [eax].TXyz.U  // P1.U | 0.5
  fld [eax].TXyz.V  // P1.V | P1.U | 0.5
  fld [eax].TXyz.W  // P1.W | P1.V | P1.U | 0.5
  { load P2.U, P2.V, P2.W and calculate (P2.?-P1.?) for each }
  fld [edx].TXyz.U  // P2.U | P1.W | P1.V | P1.U | 0.5
  fsub st(0), st(3)    // P2.U-P1.U | P1.W | P1.V | P1.U | 0.5
  fld [edx].TXyz.V  // P2.V | P2.U-P1.U | P1.W | P1.V | P1.U | 0.5
  fsub st(0), st(3)    // P2.V-P1.V | P2.U-P1.U | P1.W | P1.V | P1.U | 0.5
  fld [edx].TXyz.W  // P2.W | P2.V-P1.V | P2.U-P1.U | P1.W | P1.V | P1.U | 0.5
  fsub st(0), st(3)    // P2.W-P1.W | P2.V-P1.V | P2.U-P1.U | P1.W | P1.V | P1.U | 0.5
  { next, perform *0.5 for each one (and call this A,B,C for brevity) }
  fxch st(2)         // P2.U-P1.U | P2.V-P1.V | P2.W-P1.W | P1.W | P1.V | P1.U | 0.5
  fmul st(0), st(6)  // A | P2.V-P1.V | P2.W-P1.W | P1.W | P1.V | P1.U | 0.5
  fxch st(1)         // P2.V-P1.V | A | P2.W-P1.W | P1.W | P1.V | P1.U | 0.5
  fmul st(0), st(6)  // B | A | P2.W-P1.W | P1.W | P1.V | P1.U | 0.5
  { don't need 0.5 after this, get rid of it }
  fxch st(6)         // 0.5 | A | P2.W-P1.W | P1.W | P1.V | P1.U | B
  fmulp st(2), st(0) // A | C | P1.W | P1.V | P1.U | B
  { next, perform +P1.? to get Result.? }
  faddp st(4), st(0) // C | P1.W | P1.V | Result.U | B
  fxch st(4)         // B | P1.W | P1.V | Result.U | C
  faddp st(2), st(0) // P1.W | Result.V | Result.U | C
  faddp st(3), st(0) // Result.V | Result.U | Result.W
  { store stuff to memory }
  fxch st(1)  // Result.U | Result.V | Result.W
  fstp [ecx].TXyz.U
  fstp [ecx].TXyz.V
  fstp [ecx].TXyz.W

  { raise exceptions if any caused }
  fwait
end;

function  TriangleArea(const a, b, base: double): double;
var
  s: double;
begin
  s := (a+b+base) * 0.5;
  Result := Sqrt(s * (s - a) * (s - b) * (s - base));
end;

function  TriangleHeight(const a, b, base: double): double;
begin
  Result := (TriangleArea(a, b, base) * 2) / base;
end;

function  Distance(const P1, P2: TXyz): double;
begin
  Result := VectorMagnitude(Vector(P1, P2));
end;

function  PointOnLine(const P1, P2: TXyz; const t: double): TXyz;
begin
  Result := Vector(P1, P2);
  Result := VectorScale(t, Result);
  Result := VectorAdd(P1, Result);
end;

procedure InitCosSinTables;
var
  i: integer;
begin
  for i := 0 to 360 do begin
    SinTable[i] := sin((i / 180) * Pi);
    CosTable[i] := cos((i / 180) * Pi);
  end;
end;
{$ENDREGION}


initialization
  InitCosSinTables;

*)
{$ENDREGION}

end.
