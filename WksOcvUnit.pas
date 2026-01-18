unit WksOcvUnit;

{$POINTERMATH ON}

interface

{$REGION 'Help'}
{
  https://mustafamahrous.wordpress.com/2016/01/17/how-to-become-an-expert-in-computer-vision

  threshold
  ---------
  CV_THRESH_BINARY     = 0; // value = value > threshold ? max_value : 0
  CV_THRESH_BINARY_INV = 1; // value = value > threshold ? 0 : max_value
  CV_THRESH_TRUNC      = 2; // value = value > threshold ? threshold : value
  CV_THRESH_TOZERO     = 3; // value = value > threshold ? value : 0
  CV_THRESH_TOZERO_INV = 4; // value = value > threshold ? 0 : value
}
{$ENDREGION}

{$REGION 'Zzz'}
{
interface

uses
  Data.Win.ADODB;

var
  AvCvDbaConnection: TADOConnection;

implementation

initialization
  CoInitialize(nil);
  AvCvDbaConnection := TADOConnection.Create(nil);
  DbaConnAdoInit3(AvCvDbaConnection, 'DbaCv');

finalization
  DbaConnAdoFree(AvCvDbaConnection);
  CoUninitialize;
}
{$ENDREGION}

{$REGION 'Use'}
uses
    ocv.lib
  , ocv.core_c
  , ocv.core.types_c
  , ocv.imgproc_c
  , ocv.imgproc.types_c
  , ocv.highgui_c
  , ocv.legacy
  , ocv.nonfree
  , ocv.utils
  , ocv.compat
  , Winapi.Windows
  , System.Types
  , System.Classes
  , System.SysUtils
  , System.Json
  , Vcl.Graphics
//, WksBoxPlotCtrlUnit
//, WksAllUnit
;
{$ENDREGION}

{$REGION 'From Wks TEMP'}
type
  TBoxPlotIntRec = record // ha senso se si tratta di pixels
    Average: integer;
    Median : integer;
    StdDev : integer;
    Range  : integer;
    Pc10   : integer;
    Pc25   : integer;
    Pc50   : integer;
    Pc75   : integer;
    Pc90   : integer;
  end;

const
  NOT_AVAILABLE_STR = 'Not Available';
  OK_STR            = 'Ok';
{$ENDREGION}

{$REGION 'Type'}
type

  {$REGION 'Auxiliary'}
  // points set
  T4CvPoint2D32f = array [0..3] of TCvPoint2D32f;

  PTCvLine = ^TCvLine;
  TCvLine = array [0..1] of TCvPoint; // p1 and p2

  PTCvCircle = ^TCvCircle;
  TCvCircle = array[0..2] of single; // Cx, Cy, R

  TCvRectVector = array of TCvRect;
  TCvPointVector = array of TCvPoint;
  {$ENDREGION}

  {$REGION 'TCvContourFilter'}
  TCvContourFilterRec = record
    LevelCsv: string;
    AreaMin: integer;
    AreaMax: integer;
  end;

  TCvContourAnalysisResultRec = record
    Count: integer;
    MinArea: double;
    MaxArea: double;
    TotalArea: double; // summ of all loops' areas
  public
    procedure Reset;
  end;
  {$ENDREGION}

  {$REGION 'CvRecipe'}
  TCvRecipeRec = record
    Id           : integer;
    PId          : integer;
    Order        : integer;
    State        : string ;
    Organization : string ; // \
    Owner        : string ; //  |-- pseudokey
    Recipe       : string ; // /
    Description  : string ;
    Code         : string ;
    Note         : string ;
    TestImage    : TBitmap;
    TestImagePath: string ;
    ProcessShow  : boolean;
  public
    procedure Reset;
    function  ToJson: string;
    function  IsValid(var IvFbk: string): boolean;
    function  IniLoad(var IvFbk: string): boolean;
    function  IniSave(var IvFbk: string): boolean;
  end;
  TCvRecipeRecVector = array of TCvRecipeRec;

//TCvRecipeRem = class(TRemotable)
//private
//  FId: integer;
//  FPId: integer;
//  FState: string;
//  FOrder: integer;
//  FRecipe: string;
//  FDescription: string;
//  FCode: string;
//  FTestImage: TByteDynArray;
//  FTestImagePath: string;
//  FProcessShow: boolean;
//public
//  constructor Create; override;
//  destructor Destroy; override;
//  procedure Reset;
//  function  ToJson: string;
//  procedure FromRec(const IvCvRecipeRec: TCvRecipeRec);
//  procedure ToRec(var IvCvRecipeRec: TCvRecipeRec);
//published
//  property Id: integer read FId write FId;
//  property PId: integer read FPId write FPId;
//  property State: string read FState write FState;
//  property Order: string read FOrder write FOrder;
//  property Recipe: string read FRecipe write FRecipe;
//  property Description: string read FDescription write FDescription;
//  property Code: string read FCode write FCode;
//  property TestImage: TByteDynArray read FTestImage write FTestImage;
//  property TestImagePath: string read FTestImagePath write FTestImagePath;
//  property ProcessShow: boolean read FProcessShow write FProcessShow;
//end;
//
//TCvRecipeRemVector = array of TCvRecipeRem;
  {$ENDREGION}

  {$REGION 'CvStudy'}
(*
  [study]  Study, StepId, ProcRecVec[
     |
   0 |-------Step, ProcId, [ ( ), ( ), ... ]-->
   1 |-------Step, ProcId, [ ( ), ( ), ... ]-->
     |
   N |-------Step, ProcId, [ (.), ( ), ... ]-->
     |                        |
     |     ]                  |__ Proc, Caption, Memo, Bitmap
     V
*)
(*
  TCvProcRec = record
    Proc: string;
    Caption: string;
    Memo: string;
    Bitmap: TBitmap;
  end;

  TCvStepRec = record
    Step: string;
    ProcId: integer;
    ProcRecVec: array of TCvProcRec;
  end;

  TCvStudyRec = record
    Study: string;
    StepId: integer;
    StepRecVec: array of TCvStepRec;
  public
    procedure Reset;
    procedure Init(IvStudy: string);
    procedure StepAdd(IvStep: string);
    function  Count: integer;
    procedure StepNext;
    procedure StepPrev;
    procedure StepFirst;
    procedure StepLast;
    procedure ProcAdd(IvProc, IvCaption, IvMemo: string; IvBmp: TBitmap);
  end;
*)
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Const'}
const

  {$REGION 'Sql'}
  CV_SELECT_BY_ID_SQL = ''
  + sLineBreak + ' declare @x varchar(64), @i int; set @x = ''%s''' // key = idorname
  + sLineBreak + ' if isnumeric(@x) = 1' // isinteger
  + sLineBreak + '     set @i = @x' // byid
  + sLineBreak + ' else'
  + sLineBreak + '     select @i = FldId from DbaCv.dbo.TblRecipe where FldRecipe = @x' // byname
  + sLineBreak + ''
  + sLineBreak + ' select'   // warning, for the select to be updatable, tblmaster.FldId and tblslave.FldId must be both primarykey
  + sLineBreak + '     a.*'
  + sLineBreak + ' from'
  + sLineBreak + '     DbaCv.dbo.TblRecipe a'
  + sLineBreak + ' where'
  + sLineBreak + '     a.FldState = ''Active'''
  + sLineBreak + ' and a.FldId = @i'
  ;
  {$ENDREGION}

  {$REGION 'CvRecipe'}
  CV_RECIPE_ID_DEFAULT            = 1;
  CV_RECIPE_PID_DEFAULT           = 0;
  CV_RECIPE_ORDER_DEFAULT         = 0;
  CV_RECIPE_STATE_DEFAULT         = 'Active';
  CV_RECIPE_ORGANIZATION_DEFAULT  = '';         // \
  CV_RECIPE_OWNER_DEFAULT         = '';         //  |-- pseudokey
  CV_RECIPE_RECIPE_DEFAULT        = 'CvRecipe'; // /
  CV_RECIPE_DESCRIPTION_DEFAULT   = '';
  CV_RECIPE_CODE_DEFAULT          = '';
  CV_RECIPE_NOTE_DEFAULT          = '';
  CV_RECIPE_TESTIMAGE_DEFAULT     = nil;
  CV_RECIPE_TESTIMAGEPATH_DEFAULT = '';
  CV_RECIPE_PROCESSSHOW_DEFAULT   = false;
  {$ENDREGION}

  {$REGION 'CvFunctionMatrix'}
  CvFunctionMatrix: array [0..46] of array [0..12] of string = (
  //   id   function                            p1      p2      p3      p4      p5      p6      p7      p8      p9      p10     description
  // ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
    ( '0', 'Load',                              '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Load an image')
  , ( '1', 'Save',                              '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Save the image')
  , ( '2', 'Pause',                          '250',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Pause execution for n milliseconds, p1 = milliseconds')
  , ( '3', 'Show',                           '250',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Show current result for n milliseconds, p1 = milliseconds')
  , ( '4', 'CameraUndistort',                   '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Perform camera undistortion')
  , ( '5', 'HistogramEqualize',                 '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Apply equalization histogram to 8-bit single-channel image')
  , ( '6', 'BgrToGray',                         '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Convert current image to 1 channel gray level')
  , ( '7', 'GrayToBgr',                         '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Convert image to 3 channels color')
  , ( '8', 'Threshold',                      '127',  '255',    '0',    '0',     '',     '',     '',     '',     '',     '',     'Apply threshold to image: p1 = Threshold, p2 = MaxLevel, p3 = , p4 = ')
  , ( '9', 'ThresholdAdaptive',              '255',    '1',    '0',    '7',  '2.0',     '',     '',     '',     '',     '',     'Apply adaptive threshold to image')
  , ('10', 'Smooth',                            '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Smoot image')
  , ('11', 'Erode',                            '2',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Apply erode filter to image, i = iteration')
  , ('12', 'Dilate',                           '2',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Apply dilate filter to image, i = iteration')
  , ('13', 'PyramidMean',                       '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     '')
  , ('14', 'PyramidDown',                       '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Down-scale image')
  , ('15', 'PyramidUp',                         '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Up-scale image')
  , ('16', 'PyramidNoiseRemove',                '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Down-scale and upscale the image to filter out the noise')
  , ('17', 'Resize',                            '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'p1:height, p2:width, p3:0 = CV_INTER_NN; 1 = CV_INTER_LINEAR; 2 = CV_INTER_CUBIC; 3 = CV_INTER_AREA; 8 = CV_WARP_FILL_OUTLIERS; 16 = CV_WARP_INVERSE_MAP')
  , ('18', 'Histogram',                      '256',     '',     '',     '',     '',     '',     '',     '',     '',     '',     '')
  , ('19', 'Magnitudo',                         '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     '')
  , ('20', 'Kmeans',                            '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     '')
  , ('21', 'Kmeans2',                           '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     '')
  , ('22', 'Sobel',                            '1',    '0',    '3',     '',     '',     '',     '',     '',     '',     '',     '')
  , ('23', 'Laplace',                          '3',     '',     '',     '',     '',     '',     '',     '',     '',     '',     '')
  , ('24', 'Canny',                          '128',   '64',    '3',     '',     '',     '',     '',     '',     '',     '',     'Detect edge in image: LowThreshold, HighThreshold, Aperture')
  , ('25', 'LinesHough',                     '1.0', '0.02',   '50', '30.0', '10.0',     '',     '',     '',     '',     '',     '')
  , ('26', 'LinesHoughProbabilistic',          '2',     '',     '',     '',     '',     '',     '',     '',     '',     '',     '')
  , ('27', 'CirclesHough',                   '2.0',  '2.0', '100.0', '100.0',   '10',     '',     '',     '',     '',     '',     '')
  , ('28', 'Corners',                           '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     '')
  , ('29', 'CornersHarris',                     '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     '')
  , ('30', 'Contours',                       '0.1',    '2',  '100', '1000',    '0',    '0',    '0',    '0',    '0',    '0',     'Find contours usually after a Canny result image' + ', p1:contour to poligon approximation accuracy (0.1 is ok), p2:min length of contour to report (1, 2, ...), p3:min area of each retreived countours, p4:max limit of contours to report, p5:min contours to report, p6:0 = trace 1 = fill the contour')
  , ('31', 'ContoursApproximatePolygon',      '10',    '1',    '1',  '100',   '10',     '',     '',     '',     '',     '',     '')
  , ('32', 'TemplateMatching',                  '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     '')
  , ('33', 'Crop',                            'x1',   'y1',   'x2',   'y2',     '',     '',     '',     '',     '',     '',     'Crop the image at rectangle p1(x1, y1), p1(x2, y2)')
  , ('34', 'ColorSplit',                        '',     '',     '',     '',     '',     '',     '',     '',     '',     '',     'Split color channels or extract a particular color plane')
  , ('35', 'Decompose',                        '4',    '4',    '1',    '1',     '',     '',     '',     '',     '',     '',     'Consider pixel-blocks row x col than decompose them and generate image(s) with a particular block position i, j')
  , ('36', 'DrawPoint',                      '100',     '100', '1',     '',     '',     '',     '',     '',     '',     '',     'Draw a point: X, Y, Type(0 = Dot, 1 = Disk, 2 = Square, 3 = Triangle, 4 = Diamond, 5 = Cross, 6 = Plus, 7 = Minus, 8 = Bar')
  , ('37', 'DrawLine',                        '10',    '10', '100',  '100',    '1',     '',     '',     '',     '',     '',     'Draw a line: P1(X1 Y1), P2{X2 Y2), Thicknes')
  , ('38', 'DrawCircle',                     '100',   '100',  '50',    '0',     '',     '',     '',     '',     '',     '',     'Draw a Circle: C(X1 Y1), Radius, Thickness, Filled')
  , ('39', 'DrawBox',                         '10',    '10', '100',  '100',    '1',    '0',    '0',    '0',    '0',    '0',     'Draw a Box: P1(X1 Y1), P2{X2 Y2), Thicknes, Filled')
  , ('40', 'Morphology',                       '1',     '1',    '',     '',     '',     '',     '',     '',     '',     '',     'p1:2 = CV_MOP_OPEN; 3 = CV_MOP_CLOSE; 4 = CV_MOP_GRADIENT; 5 = CV_MOP_TOPHAT; 6 = CV_MOP_BLACKHAT p2:iterations')
  , ('41', 'Fourier',                           '',      '',    '',     '',     '',     '',     '',     '',     '',     '',     'Fourier transform')
  , ('42', 'BlobBox',                       'True',   '100', '1000',   '10',    '0',   '10',    '0',   '10',    '7',  '.\',     'Find connect components blobs returning boxes and centers, p1:use polihull, p2:scale, p3:maxcontour, p4:crosssize, p5:minw, p6:maxw, p7:minh, p8:maxh, p9:draw cross/box/circle, p10:results csv file, NOT ACTIVE')
  , ('43', 'CleanUp',                           '',      '',    '',     '',     '',     '',     '',     '',     '',     '',     'Apply morphology open and close in sequence')
  , ('44', 'NoiseReduce',                       '',      '',    '',     '',     '',     '',     '',     '',     '',     '',     'Reduce noise applying a dilate alghoritm with a custom kernel')
  , ('45', 'Zoom',                              '',      '',    '',     '',     '',     '',     '',     '',     '',     '',     '')
  , ('46', 'CopyMakeBorder',                    '1',    '1',   '1',    '1',    '0',     '',     '',     '',     '',     '',     'Builds borders around an image.  Top = 1, Bottom = 1, Left = 1, Right = 1, BorderType = 0 = constant, ValueWhenBorderTypeConstant = 1. Actually builds only constant border with size = p1')
  );
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Routine'}
// scalar
function  CvuScalar(val0: double; val1: double; val2: double; val3: double): TCvScalar;
function  CvScalarAll(val0123: double): TCvScalar;
function  CvRgb(R, G, B: integer): TCvScalar;
function  CvRgba(R, G, B, A: integer): TCvScalar;
function  OcvColor(IvRgbHexStr: string = 'ffffff'): TCvScalar; // white by default

// stat
procedure CvStatGray(IvSource: pIplImage; var IvBoxPlotInt: TBoxPlotIntRec);

// size
function  CvuSize(IvWidth, IvHeight: integer): TCvSize;
//function  OcvGetSize(const IvIplImage: PIplImage): TCvSize;
function  CvuSizeWithBorder(const IvIplImage: PIplImage; IvTop, IvBottom, IvLeft, IvRight: integer): TCvSize;
function  CvSizeV(p_width, p_height: integer): TCvSize; overload;
function  CvSizeV(p_width, p_height: extended): TCvSize; overload;

// slice
function  CvSlice(start, end_: longint): TCvSlice;
function  CvSliceV(start_, end_: integer): TCvSlice;

// bmptoipl
function  BitmapToIplImage1(IvBmp: TBitmap): PIplImage;
function  BitmapToIplImage2(IvBmp: TBitmap): PIplImage;
procedure BitmapToIplImage3(IvBmp: TBitmap; var IvIplImage: PIplImage); // G.De Sanctis: create a new IplImage and convert a Windows bitmap (24 bit) to it
procedure BitmapToIplImage4(IvBmp: TBitmap; var IvIplImage: PIplImage);
procedure BitmapToIplImage5(IvBmp: TBitmap; var IvIplImage: PIplImage);

// ipltobmp
function  IplImageToBitmap(IvSrc: PIplImage; var IvBmp: TBitmap; IvFbk: string): boolean; // G.De Sanctis: convert a IplImage to a Windows bitmap (24 bit)
function  IplImageToBitmap2(IvSrc: PIplImage; var IvBmp: TBitmap): boolean;
function  IplImageToBitmap3(IvSrc: PIplImage): TBitmap;

// ipl
procedure CvIplImageInfo(IvIplImage: PIplImage; IvHeader: string; var IvString: string);
function  DibAllocate(header: pBITMAPINFOHEADER): PBitmapFileHeader;
function  IplImageToDib(image: pIplImage): PBitmapFileHeader;
procedure CvIplImageToCsv(IvSrc: PIplImage; IvFile: string);
procedure IplImage32ToImage8(Img32, Img8: PIplImage); // G.De Sanctis: convert a 32 bit IplImage to a 8 bit IplImage

// colorconvert
function  OcvIplImageToGray(IvIplImage: PIplImage): PIplImage;
function  OcvIplImageToColor(IvIplImage: PIplImage): PIplImage;

// split
function  CvIplImageSplit(IvIplImageSrc, IvIplImageRed, IvIplImageGreen, IvIplImageBlue: PIplImage; IvFbk: string): boolean; // split a 3ch image to 3imgs 1ch

// histogram
function  CvHistImage(IvSource: pIplImage): pIplImage;// takes a color image and returns a histogram image
procedure CvHistImageGray(IvSource: pIplImage; IvHistogram: pIplImage); // takes a gray scale image and draws a histogramin a pre-allocated image

// pyramid
function  CvuPyrUp(IvIplImage: PIplImage; IvFilter: integer = IPL_GAUSSIAN_5x5): PIplImage; // return a new upsized image that is doubled in size of the input image
function  CvuPyrDown(IvIplImage: PIplImage; IvFilter: integer = IPL_GAUSSIAN_5x5): PIplImage; // return a new downsized image that is half the width and height of the input image

// theshold, must pass a 8bits 1channel gray image like: var i: PIplImage; i := CvCreateImage(CvuSize(100, 100), IPL_DEPTH_8U, 1)
function  CvuThreshold(IvIplImage: PIplImage; IvThreshold: double; IvMax: double; IvInverted: boolean = false; IvAutoThresholdValue: boolean = false): PIplImage;

// canny
function  CvuCanny(IvIplImage: PIplImage; IvThresholdLow: double; IvThresholdHigh: double; IvAperture: integer): PIplImage;

// crop
function  CvuCrop(IvImage: PIplImage; IvRect: TCvRect): PIplImage; // be careful not to give a TCvRect bigger then source image, it will crash your program with an awful error message

// contour
procedure CvContourTreeWalk(IvPSeq: pCvSeq; IvImg: pIplImage; var IvCount: integer; var IvLevel: integer; const IvGoDown, IvLog: boolean; IvFbk: TFbkRec);
function  CvContourBoundingBox(
  IvIplImage: PIplImage         // in: input image
; IvUsePolyHull: boolean        // in: smooth method, if true use polyhull else use polyapproximation
; IvPerimScale: double          // in: defines how big connected component will be retained, bigger the number, more components are retained (100)
; var IvCount: integer          // in-out: in for max number of component will be found, out for found components
; var IvRects: TCvRectVector    // in-out: in is a empty vector, out are the bounding box of components
; var IvCenters: TCvPointVector // in-out: in is a empty vector, out are the centers of components
; var IvFbk: string             // fbk
): boolean;

// draw
function  CvuBoxPoints(box: TCvBox2D): T4Cvpoint2D32f;
function  CvuFontInit(scale: double; thickness: integer = 1): TCvFont;
procedure CvuDrawBox(img: PCvArr; rect: {TCvBox2D}TCvRect); overload;
function  CvuDrawBox(img: PCvArr; rect: {TCvBox2D}TCvRect; color: TCvScalar): TCvPoint2D32f; overload;
function  CvuDrawBox(img: PCvArr; box: {TCvBox2D}TCvBox2D; color: TCvScalar): TCvPoint2D32f; overload;
procedure CvuDrawRect(img: PCvArr; rect: TCvRect);
procedure CvuDrawEllipseBox(img: PCvArr; box: TCvBox2D; color: TCvScalar; thickness: integer = 1; line_type: integer = 8; shift: integer = 0);
procedure CvuDrawFitEllipse(const points: PCvPoint2D32f; count: integer; box: PCvBox2D);
procedure CvuCross(img: PCvArr; center: TCvPoint; radius: integer; color: TCvScalar; thickness: integer = 1; line_type: integer = 8; shift: integer = 0);

// point
function  CvPointV(x, y: integer): TCvPoint;
function  CvPoint2D32fV(x, y: double): TCvPoint2D32f;
function  CvPoint2D32f_(x, y: single): TCvPoint2D32f; overload;
function  CvPoint2D32f_(point: TCvPoint): TCvPoint2D32f; overload;
function  CvPointFrom32f(point: TCvPoint2D32f): TCvPoint;

// rect/roi
function  CvuRect(R: TRect): TCvRect; overload;
function  CvuRect(x, y, width, height: longint): TCvRect; overload;
function  CvRectToROI(rect: TCvRect; coi: integer): TIplROI;
function  CvROIToRect(roi: TIplROI): TCvRect;

// others
function  CvRound(value:double): longint;
procedure CvConvert(const src: PiplImage; dst: PiplImage; scale: double = 1; shift: double = 0);

// function
function  CvuFunctionScan(IvName: string; IvCol: integer): string;
function  CvuFunctionId(IvName: string): integer;
function  CvuFunctionParam(IvName: string; IvId: integer): string;
function  CvuFunctionHelp(IvName: string): string;
{$ENDREGION}

{$REGION 'Ocv'}
function  CvImageProcess(IvCvRecipe: string; IvShowResult: boolean; IvPauseMs: integer; IvXyWhResult: TStrings; IvBitmapResult: TBitmap; IvPixelFormat: TPixelFormat; var IvFbk: string): boolean;
procedure OcvCmdProcess(const IvStep: integer; IvCmd: string; IvSrc: pIplImage; var IvDest: pIplImage; var IvJson: TJSONObject; IvShow: boolean = false);
{$ENDREGION}

{$REGION 'Global shared in recursive CvContourTreeWalk'}
const
  cvwsi = 'Source image'; // window names
  cvwgi = 'Gray image';
  cvwci = 'Crop image';
//cvwbi = 'Blur image';
//cvwoi = 'Smooth Image';
  cvwqi = 'Equalize image';
  cvwti = 'Threshold image';
//cvwsi = 'Segmented image';
  cvwmi = 'Morphology image';
//cvwpi = 'Pyrramid image';
  cvwui = 'Contour image';
//cvwri = 'Roi image';
  cvwhi = 'Histogram image';
//cvrb  = 20;                                                       // roi border from original
//cvra  = 200;                                                      // roi adds value

var                                                                 // shared in recursive CvContourTreeWalk
  cvfn08p, cvfn10p, cvfn12p, cvfn06d, cvfn08d, cvfn10d: TCvFont;    // font 0.8, 1.0, 1.2plain, 0.6duplex, 0.8duplex, 1.0duplex
  cvc0, cvc1, cvc2: TCvScalar;                                      // colorsspares
  cvblack, cvblue, cvgreen, cvyellow, cvorange, cvred: TCvScalar;   // colors blue, green, yellow, orange, red
//cvi0, cvi1, cvi2: pIplImage;                                      // images
  cvsi, cvgi, cvci, cvqi, cvti, cvmi, cvui, cvri, cvhi: pIplImage;  // images
  cvke: pIplConvKernel;                                             // kernel
  cvms: pCvMemStorage;                                              // storage/hierarchy
  cvp1, cvp2: TCvPoint;                                             // points
//cvre: TCvRect;                                                    // rect
//cvam, cvax: integer;                                              // areamin, areamax
  cvca: double;                                                     // contourarea
  cvcc: integer;                                                    // contourconvexity
  cvcl: double;                                                     // contourlength
  cvq1, cvq2: pCvSeq;                                               // contoursequences
//cvcl: integer;                                                    // countourlevel
  cvcz: integer;                                                    // contourcount
  cvni: TCvTreeNodeIterator;                                        // sequencenodeiterator
  cvsr: TCvSeqReader;                                               // seqreader
  cvcf: TCvContourFilterRec;                                        // contourfilter
  cvcr: TCvContourAnalysisResultRec;                                // contourresults
//cvhl: integer;                                                    // hlevels
//cvrx, cvry, cvrw, cvrh: integer;                                  // roi stuff
  cvco: pCvPoint2D32f; cvrd: integer{double};                       // circlecenter, radius
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
//    Winapi.ActiveX
//  , Data.Win.ADODB
//  , Data.DB
    System.Math
  , Superobject
  , WksLangUnit
//  , DMath
;
{$ENDREGION}

{$REGION 'TCvContourAnalysisResultRec'}
procedure TCvContourAnalysisResultRec.Reset;
begin
  Count     := 0;
  MinArea   := infinite;
  MaxArea   := -infinite;
  TotalArea := 0.0;
end;
{$ENDREGION}

{$REGION 'TCvRecipeRec'}
procedure TCvRecipeRec.Reset;
begin
  Id            := CV_RECIPE_ID_DEFAULT           ;
  PId           := CV_RECIPE_PID_DEFAULT          ;
  Order         := CV_RECIPE_ORDER_DEFAULT        ;
  State         := CV_RECIPE_STATE_DEFAULT        ;
  Organization  := CV_RECIPE_ORGANIZATION_DEFAULT ; // \
  Owner         := CV_RECIPE_OWNER_DEFAULT        ; //  |-- pseudokey
  Recipe        := CV_RECIPE_RECIPE_DEFAULT       ; // /
  Description   := CV_RECIPE_DESCRIPTION_DEFAULT  ;
  Code          := CV_RECIPE_CODE_DEFAULT         ;
  TestImage     := CV_RECIPE_TESTIMAGE_DEFAULT    ;
  TestImagePath := CV_RECIPE_TESTIMAGEPATH_DEFAULT;
  ProcessShow   := CV_RECIPE_PROCESSSHOW_DEFAULT  ;
end;

function  TCvRecipeRec.ToJson: string;
var
  x: TSuperRttiContext;
begin
  x := TSuperRttiContext.Create;
  try
    Result := x.AsJson<TCvRecipeRec>(Self).AsJson;
  finally
    x.Free;
  end;
end;

function  TCvRecipeRec.IsValid(var IvFbk: string): boolean;
begin
  Result := Code <> '';
  if not Result then
    IvFbk := 'CvRecipeRec code is empty';
end;

function  TCvRecipeRec.IniLoad(var IvFbk: string): boolean;
begin
  Recipe := ini.StrGet('Cv/Recipe', CV_RECIPE_RECIPE_DEFAULT);

  IvFbk := 'CvRecipe loaded from ini file';
  Result := true;
end;

function  TCvRecipeRec.IniSave(var IvFbk: string): boolean;
begin
  ini.StrSet('Cv/Recipe',  Recipe);

  IvFbk := 'CvRecipe saved to ini file';
  Result := true;
end;
{$ENDREGION}

{$REGION 'TCvRecipeRem'}
{$ENDREGION}

{$REGION 'TCvStudyRec'}
(*
procedure TCvStudyRec.Reset;
var
  i, j: integer;
begin
  Study := '';
  StepId := -1;
  for i := Low(StepRecVec) to High(StepRecVec) do begin
    StepRecVec[i].Step := '';
    StepRecVec[i].ProcId := 0;
    for j := Low(StepRecVec[i].ProcRecVec) to High(StepRecVec[i].ProcRecVec) do begin
      StepRecVec[i].ProcRecVec[j].Proc := '';
      FreeAndNil(StepRecVec[i].ProcRecVec[j].Bitmap);
    end;
  end;
  SetLength(StepRecVec, 0);
end;

procedure TCvStudyRec.Init(IvStudy: string);
begin
  Reset;
  Study := IvStudy;
end;

procedure TCvStudyRec.StepAdd(IvStep: string);
begin
  StepId := Length(StepRecVec);
  SetLength(StepRecVec, StepId+1);
  StepRecVec[StepId].Step := IvStep;
end;

function  TCvStudyRec.Count: integer;
begin
  Result := Length(StepRecVec);
end;

procedure TCvStudyRec.StepFirst;
begin
  StepId := 0;
end;

procedure TCvStudyRec.StepLast;
begin
  StepId := Length(StepRecVec)-1;
end;

procedure TCvStudyRec.StepNext;
begin
  if StepId < Length(StepRecVec)-1 then
    Inc(StepId);
end;

procedure TCvStudyRec.StepPrev;
begin
  if StepId > 0 then
    Dec(StepId);
end;

procedure TCvStudyRec.ProcAdd(IvProc, IvCaption, IvMemo: string; IvBmp: TBitmap);
begin
  with StepRecVec[StepId] do begin
    ProcId := Length(ProcRecVec);
    SetLength(ProcRecVec, ProcId+1);
    ProcRecVec[ProcId].Proc    := IvProc;
    ProcRecVec[ProcId].Caption := IvCaption;
    ProcRecVec[ProcId].Memo    := IvMemo;
    ProcRecVec[ProcId].Bitmap  := TBitmap.Create;
    ProcRecVec[ProcId].Bitmap.Assign(IvBmp);
  end;
end;
*)
{$ENDREGION}

{$REGION 'CxCore'}
function  CvuScalar(val0: double; val1: double; val2: double; val3: double): TCvScalar;
var
  scalar: TCvScalar;
begin
  scalar.val[0] := val0;
  scalar.val[1] := val1;
  scalar.val[2] := val2;
  scalar.val[3] := val3;
  Result := scalar;
end;

function  CvScalarAll(val0123: double): TCvScalar;
var
  scalar: TCvScalar;
begin
  scalar.val[0] := val0123;
  scalar.val[1] := val0123;
  scalar.val[2] := val0123;
  scalar.val[3] := val0123;
  Result := scalar;
end;

function  CvRgb(R, G, B: integer {double}): TCvScalar;
begin
  Result.val[0] := B;
  Result.val[1] := G;
  Result.val[2] := R;
  Result.val[3] := 0;
//Result := CvuScalar(R, G, B, 0);
end;

function  CvRgba(R, G, B, A: integer): TCvScalar;
begin
  Result.val[0] := B;
  Result.val[1] := G;
  Result.val[2] := R;
  Result.val[3] := A;
end;

function  OcvColor(IvRgbHexStr: string): TCvScalar; // TColor is bgr not rgb
begin
  Result.val[0] := StrToInt('$' + copy(IvRgbHexStr, 5, 2));
  Result.val[1] := StrToInt('$' + copy(IvRgbHexStr, 3, 2));
  Result.val[2] := StrToInt('$' + copy(IvRgbHexStr, 1, 2));
  Result.val[3] := 0;
end;
{$ENDREGION}

{$REGION 'Size'}
function  CvuSize(IvWidth, IvHeight: integer): TCvSize;
begin
  Result.width := IvWidth;
  Result.height := IvHeight;
end;

{function  OcvGetSize(const IvIplImage: PIplImage): TCvSize;
begin
  if Assigned(IvIplImage^.roi) then begin
    Result.width := IvIplImage^.roi^.width;
    Result.height := IvIplImage^.roi^.height;
  end else begin
    Result.width := IvIplImage^.width;
    Result.height := IvIplImage^.height;
  end;
end;}

function  CvuSizeWithBorder(const IvIplImage: PIplImage; IvTop, IvBottom, IvLeft, IvRight: integer): TCvSize;
var
  z: TCvSize;
begin
  z := cvGetSize(IvIplImage);
  Result.Width := IvLeft + z.Width + IvRight;
  Result.Height := IvTop + z.Height + IvBottom;
end;
{$ENDREGION}

{$REGION 'Stat'}
procedure CvStatGray(IvSource: pIplImage; var IvBoxPlotInt: TBoxPlotIntRec);
var
  g: pIplImage;
  b: array of byte;
  i, j, t: integer;   // cols, rows, total
  x, row: System.SysUtils.PByteArray; // databyteblockrow
  o: longint; // offset
begin
  // ensure1channel
  g := cvCreateImage(cvGetSize(IvSource), IvSource.depth, 1);
  if IvSource.nChannels > 1 then
    cvCvtColor(IvSource, g, CV_BGR2GRAY)
  else
    g := IvSource;

  // walkrows
  t := g.Width * g.Height;
  SetLength(b, t);
  for j := 0 to g.Height-1 do begin
    // rowoffandpointer
    o := longint(g.ImageData) + g.WidthStep * j;
    x := System.SysUtils.PByteArray(o);
    // walkcolumn
    for i := 0 to g.Width-1 do
      b[i] := x[i];
  end;

  // end
  IvBoxPlotInt.Average := 0;
end;
{$ENDREGION}

{$REGION 'Slice'}
function  CvSlice(start, end_: longint): TCvSlice;
var
  slice: TCvSlice;
begin
  slice.start_index := start;
  slice.end_index := end_;
  result := slice;
end;

//function  CV_WHOLE_SEQ: TCvSlice;
//begin
//  result := CvSliceV(0, CV_WHOLE_SEQ_END_INDEX);
//end;

function  CvSliceV(start_, end_: integer): TCvSlice;
begin
  result.start_index := start_;
  Result.end_index := end_;
end;
{$ENDREGION}

{$REGION 'BmpToIpl'}
function  BitmapToIplImage1(IvBmp: TBitmap): PIplImage;
var
  r, s: integer; // row, step
  p: Pointer;
  i: PIplImage;
  a: System.SysUtils.PByteArray;
begin
  // def
  Result := nil;

  // exit
  if not Assigned(IvBmp) then
    raise Exception.Create('BitmapToIplImage1: IvBmp not assigned');

  // exit
  Assert(IvBmp.PixelFormat in [pf24bit, pf32bit], 'BitmapToIplImage1: IvBmp is not 24bit or 32bit');

  // formats
           if IvBmp.PixelFormat = pf24bit then begin
    i := CvCreateImage(CvSizeV(IvBmp.Width, IvBmp.Height), IPL_DEPTH_8U, 3);
    s := i^.WidthStep;
    p := i^.ImageData;
    for r := 0 to IvBmp.Height - 1 do begin
      a := IvBmp.ScanLine[r];
      Move(a^[0], p^, s);
      PChar(p) := PChar(p) + s;
    end;
    Result := i;

  end else if IvBmp.PixelFormat = pf32bit then begin
    i := CvCreateImage(CVSizeV(IvBmp.Width, IvBmp.Height), IPL_DEPTH_8U, 4);
    s := i^.WidthStep;
    p := i^.ImageData;
    for r := 0 to IvBmp.Height - 1 do begin
      a := IvBmp.ScanLine[r];
      Move(a^[0], p^, s);
      PChar(p) := PChar(p) + s;
    end;
    Result := i;
  end else
    raise Exception.Create('BitmapToIplImage1: Image pixel format not implemented');
end;

function  BitmapToIplImage2(IvBmp: TBitmap): PIplImage;
begin
  Result := cvCreateImage(cvSize(IvBmp.Width, IvBmp.Height), IPL_DEPTH_8U, 3);
  Result.Origin := IPL_ORIGIN_BL;
  CopyMemory(Result.ImageData, IvBmp.ScanLine[IvBmp.Height - 1], Result.ImageSize);
end;

procedure BitmapToIplImage3(IvBmp: TBitmap; var IvIplImage: PIplImage);
var
//i, j: integer; offset: longint;
  DataByte, RowIn: System.SysUtils.PByteArray;
begin
  // exit
  Assert((IvIplImage.Depth = 8) and (IvIplImage.NChannels = 3), 'Not a 24 bit color ipl image!');
//Assert((IvBmp.PixelFormat = pf24bit), 'Not a 24 bit color bitmap!');

  // ipl
  case IvBmp.PixelFormat of
    pf8bit :           IvIplImage := CvCreateImage(cvSize(IvBmp.Width, IvBmp.Height), 8, 1);
    pf16bit:           IvIplImage := CvCreateImage(cvSize(IvBmp.Width, IvBmp.Height), 8, 2);
    pf24bit, pfDevice: IvIplImage := CvCreateImage(cvSize(IvBmp.Width, IvBmp.Height), 8, 3);
    pf32bit:           IvIplImage := CvCreateImage(cvSize(IvBmp.Width, IvBmp.Height), 8, 4);
    else exit;
  end;

  try
    // i (G.De Sanctis: create a new IplImage and convert a Windows bitmap (24 bit) to it)
    IvIplImage.Origin := IPL_ORIGIN_BL;
    IvIplImage.ChannelSeq := 'BGR';
    RowIn := IvBmp.Scanline[IvBmp.height-1];
    DataByte := System.SysUtils.PByteArray(IvIplImage.ImageData);
    CopyMemory(DataByte, RowIn, IvIplImage.ImageSize); // direct copy of the bitmap row bytes to iplImage rows

    // ii
  //IvIplImage := CvCreateImage(CvuSize(IvBmp.Width, IvBmp.Height), IPL_DEPTH_8U, 3);
  //IvIplImage.Origin := IPL_ORIGIN_BL;
  //CopyMemory(IvIplImage.ImageData, IvBmp.ScanLine[IvBmp.Height - 1], IvIplImage.ImageSize);

    // iii
{
    for j := 0 to IvBmp.Height-1 do begin
      if (IvIplImage.Origin = IPL_ORIGIN_BL) then
        RowIn := IvBmp.Scanline[IvBmp.height -1 -j]
      else
        RowIn := IvBmp.Scanline[j];
      offset := longint(IvIplImage.ImageData) + IvIplImage.WidthStep * j;
      dataByte := System.SysUtils.PByteArray( offset);

      if (IvBmp.PixelFormat = pf24bit) then begin
        CopyMemory( dataByte, rowin, IvIplImage.WidthStep); // direct copy of the iplImage row bytes to bitmap row
      end else if (IvIplImage.ChannelSeq = 'GRAY') then
        for i := 0 TO IvBmp.Width-1 DO begin
          databyte[i] := RowIn[i];
      end else
        for i := 0 to IvBmp.Width-1 DO begin
          databyte[IvIplImage.NChannels*i+0]  := RowIn[IvIplImage.NChannels*i];
          databyte[IvIplImage.NChannels*i+1]  := RowIn[IvIplImage.NChannels*i+1];
          databyte[IvIplImage.NChannels*i+2]  := RowIn[IvIplImage.NChannels*i+2];
        end;
    end;
}
  except
    on e: Exception do
      raise Exception.Create('Exception in BitmapToIplImage3' + e.Message);
  end;
end;

procedure BitmapToIplImage4(IvBmp: TBitmap; var IvIplImage: PIplImage);
var
  r, c: integer; // row, col
  l: System.SysUtils.PByteArray; // rowptr
begin
  // src
  IvBmp.PixelFormat := pf24bit;

  // dest
  IvIplImage := cvCreateImage(cvSize(IvBmp.Width, IvBmp.Height), IPL_DEPTH_8U, 3);

  // destcopy
  for r := 0 to IvBmp.Height - 1 do begin
    l := IvBmp.ScanLine[r];
    for c := 0 to IvBmp.Width * 3 - 1 do
      IvIplImage.imageData[IvIplImage.widthStep * r + c] := l[c];
  end;
end;

procedure BitmapToIplImage5(IvBmp: TBitmap; var IvIplImage: PIplImage);
var
  rd, ad: System.SysUtils.PByteArray; // rowdata, alldata
begin
  Assert((IvIplImage.Depth = 8) and (IvIplImage.NChannels = 3), 'BitmapToIplImage: Not a 24 bit color iplImage!');
  try
    IvIplImage.Origin := IPL_ORIGIN_BL;
    IvIplImage.ChannelSeq := 'BGR';

    rd := IvBmp.Scanline[IvBmp.height - 1];

    ad := System.SysUtils.PByteArray(IvIplImage.ImageData);

    CopyMemory(ad, rd, IvIplImage.ImageSize); // direct copy of the bitmap row bytes to iplImage rows
  except
    on e: Exception do
      raise Exception.Create('BitmapToIplImage - error - ' + e.Message);
  end
end;
{$ENDREGION}

{$REGION 'IplToBmp'}
function  IplImageToBitmap(IvSrc: PIplImage; var IvBmp: TBitmap; IvFbk: string): boolean;
var
  c, r: integer; // xicolumn, yjrow
  x, row: System.SysUtils.PByteArray; // databyteblock one row
  o: longint; // offset
begin
  // exit
//Assert((IvSrc.Depth = 8) and (IvSrc.NChannels = 3), 'Not a 24 bit color iplImage!');

  // ipl
  if IvSrc.NChannels = 1 then
    IvSrc := OcvIplImageToColor(IvSrc); // ensure3channels

  // bmp
  IvBmp.Width  := IvSrc.Width;
  IvBmp.Height := IvSrc.Height;
//case IvSrc.nChannels of
//  1: IvBmp.PixelFormat := pf8bit;
//  2: IvBmp.PixelFormat := pf16bit;
//  3: IvBmp.PixelFormat := pf24bit;
//end;
  IvBmp.PixelFormat := pf24bit; // always 3ch

  try
    // rowsscan
    for r := 0 to IvSrc.Height-1 do begin

      // row
      if IvSrc.Origin = IPL_ORIGIN_BL then // BL = BottomLeft
        row := IvBmp.Scanline[IvSrc.Height-1 - r]
      else
        row := IvBmp.Scanline[r];

      // iplrow image datablock pointer-startingpoint
      o := longint(IvSrc.ImageData) + IvSrc.WidthStep * r;
      x := System.SysUtils.PByteArray({IvSrc.ImageData} o);

    //for c := 0 to IvBmp.Width - 1 do // g.desanctis
      //move(System.SysUtils.PByteArray(IvSrc^.imageData)^[IvSrc^.widthStep * r], row^[0] , IvSrc^.widthStep); // move(x^[s*r], row^[0], s);

      // iplImagerowbytes to bitmaprowbytes
      if (IvSrc.ChannelSeq = 'BGR') then begin // and (IvSrc.Origin = IPL_ORIGIN_BL)
        // scanrowcolumn copying byte by byte
      //for c := 0 to 3 * IvSrc.Width - 1 do begin
        //row[c  ] := x[c  ];
        //row[c+1] := x[c+1];
        //row[c+2] := x[c+2];
      //end;
        CopyMemory(row, x, IvSrc.WidthStep {IvSrc.imageSize}); // direct copy of the iplImage row bytes to bitmap row

      end else if (IvSrc.ChannelSeq = 'GRAY') then begin
        // scanrowcolumn copying byte by byte
        for c := 0 to 3 * IvSrc.Width - 1 do begin
          row[c  ] := x[c];
          row[c+1] := x[c];
          row[c+2] := x[c];
        end;

      end else begin
        // scanrowcolumn copying byte by byte
        for c := 0 to 3 * IvSrc.Width - 1 do begin
          row[c  ] := x[c+2];
          row[c+1] := x[c+1];
          row[c+2] := x[c  ];
        end;
      end;
    end;

    IvFbk := 'Ok';
    Result := true;
  except
    on e: Exception do begin
      IvFbk := e.Message;
      Result := false;
    //raise Exception.Create('Exception: ' + e.Message);
    end;
  end;
end;

function  IplImageToBitmap2(IvSrc: PIplImage; var IvBmp: TBitmap): boolean;
//var
//  tmp: PIplImage;
//  roi: TCvRect;
begin
(*
  if Assigned(IvSrc.roi) then
    roi := cvGetImageROI(IvSrc)
  else
    roi := cvRect(0, 0, IvSrc.width, IvSrc.height);

  tmp := cvCreateImage(cvSize(roi.width, roi.height), IPL_DEPTH_8U, 3);
  if IvSrc.nChannels <> 3 then
    cvCvtColor(IvSrc, tmp, CV_GRAY2RGB)
  else
    cvCopy(IvSrc, tmp);

  if (IvBmp.Width = 0) or (IvBmp.Height = 0) then begin
    IvBmp.Width := roi.width;
    IvBmp.Height := roi.height;
  end else begin
    IplImage * temp1 := cvCloneImage(tmp);
    cvReleaseImageData(tmp);
    cvInitImageHeader(tmp, cvSize(IvBmp.Width, IvBmp.Height), IPL_DEPTH_8U, 3, IvSrc.origin, 4);
    cvCreateImageData(tmp);
    roi.width := IvBmp.Width;
    roi.height := IvBmp.Height;
    cvResize(temp1, tmp);
    cvReleaseImage( {C2PAS: RefOrBit?} &temp1);
  end;

   IvBmp.PixelFormat := pf24bit;

  try
    unsigned char *pLine;
    Integer x, y;
    for(y := 0; y < roi.height; y++) begin
      pLine := (unsigned char * )IvBmp.ScanLine[roi.height - y - 1];
      for (x := 0 ;x <roi.width * 3  ;x++)  begin
        pLine[x] := ((unsigned char* )(tmp.imageData + tmp.widthStep * y))[x];
      end;
    end;
  except
    ShowMessage('Error while converting ...');

  cvReleaseImage(&tmp);
  Result := true;
*)
end;

function  IplImageToBitmap3(IvSrc: PIplImage): TBitmap;
var
  t: PIplImage; // tmpipl
  x: PByte; // allrowsdata
  i: integer;
begin
  try
    Result := TBitmap.Create;
    Result.Width  := IvSrc.width;
    Result.Height := IvSrc.height;
    Result.PixelFormat := pf24bit;

    t := nil;
    if IvSrc.nChannels = 1 then begin
      t := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 3);
      cvCvtColor(IvSrc, t, CV_GRAY2BGR);
      IvSrc := t;
    end;

    x := IvSrc.imageData;

    if IvSrc.origin = IPL_ORIGIN_BL then
      CopyMemory(Result.ScanLine[IvSrc.height-1], x, IvSrc.imageSize)

    else begin
      for i := 0 to IvSrc.height do
        x := x + IvSrc.widthStep;
      CopyMemory(Result.ScanLine[i], x, IvSrc.widthStep);
    end;

    cvReleaseImage(&t);
  finally
    t := nil;
  end;
{
procedure IplImageToBitmap4(IvSrc: PIplImage; var IvBmp: TBitmap);
var
  r, c: longint; //
  o: longint; // offset
  x, row: System.SysUtils.PByteArray;
begin
  IvBmp.Height := IvSrc.Height;
  IvBmp.Width := IvSrc.Width;

  if (IvSrc.ChannelSeq = 'BGR') and (IvSrc.Origin = IPL_ORIGIN_BL) then begin // origin BL = Bottom-Left
    row  := IvBmp.Scanline[IvBmp.height -1 ];
    x := System.SysUtils.PByteArray(IvSrc.ImageData);
    CopyMemory(row, x, IvSrc.ImageSize); // direct copy of the iplImage row bytes to bitmap row
  end else begin
    for r := 0 to IvBmp.Height-1 do begin
      row  := IvBmp.Scanline[r];
      o := longint(IvSrc.ImageData) + IvSrc.WidthStep * j;
      x := System.SysUtils.PByteArray(o);
    //for c := 0 to 3*IvBmp.Width-1 do begin
    //  row[c  ] := x[c+2];
    //  row[c+1] := x[c+1];
    //  row[c+2] := x[c  ];
    //end;
      CopyMemory(row, x, IvSrc.WidthStep);
    end;
  end;
end;
}
end;
{$ENDREGION}

{$REGION 'IplToOthers'}
function  DibAllocate(header: PBitmapInfoHeader): PBitmapFileHeader;
//var
//  memsize: integer;
//  dib: PBitmapInfoHeader;
//  i: integer;
//  b: byte;
begin
  {
  memsize := SizeOF(TBitmapFileHeader) + header.biSize +
    (( ((header.biWidth * header.biBitCount) + 31) div 32 ) *4) *
    header.biHeight;
  if (Header^.biClrUsed>0) then Inc(MemSize, 256 * sizeof(TRGBQUAD) );
  GetMem(Result, memsize);
  if (Result = nil) then Exit;
  Result.bfType := $4D42;
  Result.bfSize := memsize;
  Result.bfOffBits := memsize
  - (( ((header.biWidth * header.biBitCount) + 31) div 32 ) *4) *
    header.biHeight;
  dib := @(System.SysUtils.PByteArray(Result)^[SizeOF(TBitmapFileHeader)]);
  dib^ := header^;
  if (dib^.biClrUsed>0) then begin
    for i := 0 to dib^.biClrUsed-1 do begin
      b := Round((i*255)/(dib^.biClrUsed-1));
      pBitmapInfo(dib).bmiColors[i].rgbRed := b;
      pBitmapInfo(dib).bmiColors[i].rgbGreen := b;
      pBitmapInfo(dib).bmiColors[i].rgbBlue := b;
    end;
  end;
  }
end;

function  IplImageToDib(image: pIplImage): PBitmapFileHeader;
//var
//  bmp: TBitmapInfoHeader;
//  DIB: PBitmapInfoHeader;
begin
{
  bmp.biSize:= sizeof(TBitmapInfoHeader);
  bmp.biWidth:= image.width;
  bmp.biHeight:= image.height;
  bmp.biPlanes:= 1;
  case image.nChannels of
  1: bmp.biBitCount := 8;
  3: bmp.biBitCount := 24;
  4: bmp.biBitCount := 32;
  else bmp.biBitCount := 0;
  end;//case
  bmp.biCompression:= BI_RGB;
  bmp.biSizeImage:= 0;
  bmp.biXPelsPerMeter:= 0;
  bmp.biYPelsPerMeter:= 0;
  if Image.nChannels = 1  then
    bmp.biClrUsed:= 1 shl bmp.biBitCount else bmp.biClrUsed:= 0;
  bmp.biClrImportant:= 0;
  if (bmp.biBitCount = 0) then
    raise EAbort.Create('');
  Result := DibAllocate(@bmp);
  DIB := @(System.SysUtils.PByteArray(Result)^[SizeOF(TBitmapFileHeader)]);
  iplConvertToDIB(image, dib, IPL_DITHER_NONE, IPL_PALCONV_POPULATE);
  }
end;

procedure CvIplImageToCsv(IvSrc: PIplImage; IvFile: string);
var
  s: TStrings;
  f, l, k: string; // file, txtline
  r, c, o: integer; // row, col, offset
  x: System.SysUtils.PByteArray; // databyteblock
begin
  // exit
  Assert((IvSrc.Depth = 8) and (IvSrc.NChannels = 1), 'Not a gray color iplImage!');

  f := ChangeFileExt(IvFile, '.csv');
  s := TStringList.Create;
  try
    // walk
    for r := 0 to IvSrc.Height-1 do begin
      // iplrow image datablock pointer-startingpoint
      o := longint(IvSrc.ImageData) + IvSrc.WidthStep * r;
      x := System.SysUtils.PByteArray(o);

      // line
      l := '';
      for c := 0 to IvSrc.WidthStep-1 do
        l := l + ',' + IntToStr(x[c]);
      Delete(l, 1, 1);
      s.Add(l);
    end;

    // save
    fsy.FsFileRenameNew(f, 'Csv', f, k, '.csv');
    s.SaveToFile(f);
  finally
    s.Free;
  end;
end;

procedure IplImage32ToImage8(Img32, Img8: PIplImage);
var
  a, b: TCvPoint;
  scale, shift, diff, minVal, maxVal: double;
begin
  Assert((Img32.Depth = 32) and (Img32.NChannels = 1) and (Img8.Depth = 8) and (Img8.NChannels = 1), 'Input must be 32F, 1 channel; output must be 8U, 1 channel!');

  try
    //src = IplImage * - depth = IPL_DEPTH_32F, nChannels = 1
    //dest = IplImage * - depth = IPL_DEPTH_8U, nChannels = 1 (gray)
    cvMinMaxLoc(PCvArr(img32), @minVal, @maxVal, @a, @b); // cvMinMaxLoc(img32,  @minVal, @maxVal, a, b);
    diff := maxVal - minVal;
    if diff <> 0 then
      scale := 255 / diff
    else
      scale := 0;
    shift := -minVal * scale;
    cvConvertScale(PCvArr(img32), PCvArr(img8), scale, shift); // cvConvertScale (img32, img8, scale, shift);
  except
    on E: Exception do begin
      raise Exception.Create('IplImage32ToImage8: ' + e.Message);
    end;
  end;
end;
{$ENDREGION}

{$REGION 'IplInfo'}
procedure CvIplImageInfo(IvIplImage: PIplImage; IvHeader: string; var IvString: string);
begin
  IvString := IvString
  + sLineBreak + Format('%s'                  , [IvHeader])
  + sLineBreak + StringOfChar('¯'             , 80)
  + sLineBreak + Format('id: %d'              , [IvIplImage.ID])
  + sLineBreak + Format('height: %d'          , [IvIplImage.height])
  + sLineBreak + Format('width: %d'           , [IvIplImage.width])
  + sLineBreak + Format('widthstep: %d'       , [IvIplImage.widthStep])
  + sLineBreak + Format('channels: %d'        , [IvIplImage.nChannels])
  + sLineBreak + Format('depth: %d'           , [IvIplImage.depth])
  + sLineBreak + Format('alphachannels: %d'   , [IvIplImage.alphaChannel])
  + sLineBreak + Format('colormodel: %s%s%s%s', [IvIplImage.colorModel[0], IvIplImage.colorModel[1], IvIplImage.colorModel[2], IvIplImage.colorModel[3]])
  + sLineBreak + Format('size: %d'            , [IvIplImage.nSize])
  + sLineBreak + Format('image size: %d'      , [IvIplImage.imageSize])
end;
{$ENDREGION}

{$REGION 'Convert'}
function  OcvIplImageToGray(IvIplImage: PIplImage): PIplImage;
var
  i: PIplImage;
begin
  if IvIplImage.nChannels = 1 then
    Result := cvCloneImage(IvIplImage)
  else begin
    i := CvCreateImage(cvGetSize(IvIplImage), IPL_DEPTH_8U, 1);
    cvCvtColor(IvIplImage, i, CV_BGR2GRAY);
    Result := i;
  //cvReleaseImage(i);
  end;
end;

function  OcvIplImageToColor(IvIplImage: PIplImage): PIplImage;
var
  i: PIplImage;
begin
//Assert(IvIplImage.nChannels < 3, 'Warning: Image is already three channels colors');

  if IvIplImage.nChannels = 3 then
    Result := cvCloneImage(IvIplImage)
  else begin
    i := CvCreateImage(CvGetSize(IvIplImage), IPL_DEPTH_8U, 3);
    cvCvtColor(IvIplImage, i, CV_GRAY2BGR);
    Result := i;
  //cvReleaseImage(i);
  end;
end;
{$ENDREGION}

{$REGION 'Split'}
function  CvIplImageSplit(IvIplImageSrc, IvIplImageRed, IvIplImageGreen, IvIplImageBlue: PIplImage; IvFbk: string): boolean;
begin
  // allocate image planes as
//  r = cvCreateImage(CvGetSize(IvIplImageSrc), IPL_DEPTH_8U, 1);
//  g = cvCreateImage(CvGetSize(IvIplImageSrc), IPL_DEPTH_8U, 1);
//  b = cvCreateImage(CvGetSize(IvIplImageSrc), IPL_DEPTH_8U, 1);

  // exit
  Assert((IvIplImageRed.nChannels <> 1) or (IvIplImageGreen.nChannels <> 1) or (IvIplImageBlue.nChannels <> 1), 'Red, green and blue images have to be 1 channel');

  // split image onto the color planes
  cvSplit(IvIplImageSrc, IvIplImageRed, IvIplImageGreen, IvIplImageBlue, nil);
end;

{$ENDREGION}

{$REGION 'Histogram'}
function  CvHistImage(IvSource: pIplImage): pIplImage;
var
  j, i: integer;                 // binidx, channelidx
  s: TCvSize; c, p: integer;     // source sizerect, channels, coldept
  h: pCvHistogram;               // pointer to histogram object
  hi: pIplImage;                 // histImage
  hw: integer;                   // histogramidth
  him, hvm, hix, hvx: single;    // idxmin, valmin, idxmax, valmax (indexes&values in histogram)
  bw: integer;                   // binwidth (initial width to draw bars)
  bn: integer;                   // numofbins (size of histogram)
  rv: array [0..1] of single;    // ranges
  pr: PSingle;                   // pointer@range0
  dv: array [0..3] of PIplImage; // destimagesvect
begin
  // source
  s.Height := IvSource.Height;
  s.Width  := IvSource.Width;
  c        := IvSource.NChannels;
  p        := IvSource.Depth;

  // range
  rv[0] := 0;
  rv[1] := 256;
  pr := @rv;

  // bin
  bn := 256;
  bw  := 0;
  hvx := 0;
  hw := 260;

  // histobj
  h := cvCreateHist(1, @bn, CV_HIST_ARRAY, @pr, 1);

  // histimg
  hi := cvCreateImage(cvSize((hw * c), 200), 8, 1);
  cvSet(hi, cvScalarAll(255), nil);

  // destimages
  dv[0] := nil;
  dv[1] := nil;
  dv[2] := nil;
  dv[3] := nil;
  for i := 0 to c - 1 do
    dv[i] := cvCreateImage(s, p, 1);
  if c = 1 then
    cvCopy(IvSource, dv[0], nil)
  else
    cvSplit(IvSource, dv[0], dv[1], dv[2], dv[3]);

  // walkchannels
  for i := 0 to c - 1 do begin
    // histcalcforeachchannel
    cvCalcHist(dv[i], h, 0, nil);
    cvGetMinMaxHistValue(h, nil, @hvx, nil, nil);
    cvConvertScale(h.bins, h.bins, hi.height/hvx, 0);

    // binwidth
    bw := cvRound(hw / bn);

    // walkbins
    for j := 0 to bn - 1 do
      cvRectangle(
        hi
      , cvPoint(j * bw + (i * hw), hi.height)
      , cvPoint((j + 1) * bw + (i * hw), hi.height - cvRound(cvGetReal1D(h.bins, j)))
      , cvScalarAll(0)
      , -1, 8, 0
      );
  end;
  Result := hi; // caller have to free

  // free
  for i := 0 to c - 1 do
    cvReleaseImage(dv[i]);
  cvReleaseHist(h);
end;

procedure CvHistImageGray(IvSource: pIplImage; IvHistogram: pIplImage);
var
  j: integer;                    // binidx
  s: TCvSize; c, p: integer;     // source sizerect, channels, coldept
  h: pCvHistogram;               // pointer to histogram object
  hi: pIplImage;                 // histImage
  hw: integer;                   // histogramidth
  him, hvm, hix, hvx: single;    // idxmin, valmin, idxmax, valmax (indexes&values in histogram)
  bw: integer;                   // binwidth (initial width to draw bars)
  bn: integer;                   // numofbins (size of histogram)
  rv: array [0..1] of single;    // ranges
  pr: PSingle;                   // pointer@range0
  dv: array [0..3] of PIplImage; // destimagesvect
begin
  // source
  s.Height := IvSource.Height;
  s.Width  := IvSource.Width;
  c        := IvSource.NChannels;
  p        := IvSource.Depth;

  // range
  rv[0] := 0;
  rv[1] := 256;
  pr := @rv;

  // bin
  bn := 256;
  bw  := 0;
  hvx := 0;
  hw := 260;

  // histobj
  h := cvCreateHist(1, @bn, CV_HIST_ARRAY, @pr, 1);

  // histimg
  hi := cvCreateImage(cvSize((hw * c), 200), 8, 1);
  cvSet(IvHistogram, cvScalarAll(255), 0);

  // histcalcforonechannel
  cvCalcHist(IvSource, h, 0, nil);
  cvGetMinMaxHistValue(h, nil, @hvx, nil, nil);
  cvScale(h.bins, h.bins, IvHistogram^.height/hvx, 0);

  // binwidth
  bw := cvRound(IvHistogram^.width / bn);

  // walkbins
  for j := 0 to bn - 1 do
    cvRectangle(
      IvHistogram
    , cvPoint(j * bw + 0, IvHistogram^.height)
    , cvPoint((j + 1) * bw + 0, IvHistogram^.height - cvRound(cvGetReal1D(h^.bins, j)))
    , cvScalarAll(0)
    , -1, 8, 0
    );

  // free
  cvReleaseHist(h);
end;
{$ENDREGION}

{$REGION 'Pyramid'}
function  CvuPyrUp(IvIplImage: PIplImage; IvFilter: integer = IPL_GAUSSIAN_5x5): PIplImage;
var
  i: PIplImage;
begin
  try
    // create an image
    i := CvCreateImage(CvuSize(IvIplImage.width * 2, IvIplImage.height * 2), IvIplImage.depth, IvIplImage.nChannels);
    // do
    cvPyrUp(PCvArr(IvIplImage), PCvArr(i), IvFilter);
    // return
    Result := i;
  except
    // return
    Result := nil;
  end;
end;

function  CvuPyrDown(IvIplImage: PIplImage; IvFilter: integer = IPL_GAUSSIAN_5x5): PIplImage;
var
  i: PIplImage;
begin
  try
    // check: better to make sure input image is divisible by two
    Assert((IvIplImage.width mod 2 = 0) and (IvIplImage.height mod 2 = 0), 'Warning in CvuPyrDown: Image is not divisible by 2');
    // create an image
    i := CvCreateImage(CvuSize(IvIplImage.width div 2, IvIplImage.height div 2), IvIplImage.depth, IvIplImage.nChannels);
    // do
    cvPyrDown(PCvArr(IvIplImage), PCvArr(i), IvFilter);
    // return
    Result := i;
  except
    // return
    Result := nil;
  end;
end;
{$ENDREGION}

{$REGION 'Theshold'}
function  CvuThreshold(IvIplImage: PIplImage; IvThreshold: double; IvMax: double; IvInverted: boolean = false; IvAutoThresholdValue: boolean = false): PIplImage;
var
  i: PIplImage;
  t: integer; // type
begin
  try
    // check
    Assert(IvIplImage.nChannels = 1, 'Warning in CvuThreshold: Threshold only handles gray scale images');
    // inverted
    if not IvInverted then
      t := CV_THRESH_BINARY
    else
      t := CV_THRESH_BINARY_INV;
    // auto
    if IvAutoThresholdValue then
      t := t + CV_THRESH_OTSU;
    // create an image
    i := CvCreateImage(cvGetSize(IvIplImage), IPL_DEPTH_8U, 1); // one channel
    // do
    cvThreshold(PCvArr(IvIplImage), PCvArr(i), IvThreshold, IvMax, t);
    // return
    Result := i;
  except
    // return
    Result := nil;
  end;
end;
{$ENDREGION}

{$REGION 'Canny'}
function  CvuCanny(IvIplImage: PIplImage; IvThresholdLow: double; IvThresholdHigh: double; IvAperture: integer): PIplImage;
var
  i: PIplImage;
begin
  try
    // check
    Assert(IvIplImage.nChannels = 1, 'Warning in CvuCanny: Canny only handles gray scale images');
    // create an image
    i := CvCreateImage(cvGetSize(IvIplImage), IPL_DEPTH_8U, 1); // one channel
    // do
    cvCanny(PCvArr(IvIplImage), PCvArr(i), IvThresholdLow, IvThresholdHigh, IvAperture);
    // return
    Result := i;
  except
    // return
    Result := nil;
  end;
end;
{$ENDREGION}

{$REGION 'Crop'}
// CvuCrop(i0, CvuRect(Rect(10, 10, 50, 50)));
function  CvuCrop(IvImage: PIplImage; IvRect: TCvRect): PIplImage;
var
  i: PIplImage;
begin
  // must have dimensions of output image
  i := CvCreateImage(CvuSize(IvRect.width, IvRect.height), {8}{IPL_DEPTH_8U}IvImage.depth, {1}IvImage.nChannels);
  // say what the source region is
  cvSetImageROI(IvImage, IvRect);
  // do the copy
  cvCopy(PCvArr(IvImage), PCvArr(i));
  cvResetImageROI(IvImage);
  // end
  Result := i;
end;
{$ENDREGION}

{$REGION 'Contour'}
function  OcvContourTiltAngle(const m11, m20, m02: double): integer;
(*
  Return integer degree angle of contour's major axis relative to the horizontal, assuming that the positive y-axis goes down the screen.
  This code is based on maths explained in "Simple Image Analysis By Moments", by Johannes Kilian, March 15, 2001 (see Table 1 on p.7).
  see: http://public.cranfield.ac.uk/c5354/teaching/dip/opencv/SimpleImageAnalysisbyMoments.pdf
*)
Var
  diff, theta: double;
  tilt: Integer;
begin
  diff := m20 - m02;
  if (diff = 0) then
    if (m11 = 0) then
      Exit(0)
    else if (m11 > 0) then
      Exit(45)
    else // m11 < 0
      Exit(-45);

  theta := 0.5 * ArcTan2(2 * m11, diff);
  tilt := round(RadToDeg(theta));

  if ((diff > 0)) and ((m11 = 0)) then
    Exit(0)
  else if ((diff < 0)) and ((m11 = 0)) then
    Exit(-90)
  else if ((diff > 0)) and ((m11 > 0)) then // 0 to 45 degrees
    Exit(tilt)
  else if ((diff > 0)) and ((m11 < 0)) then // -45 to 0
    Exit(180 + tilt) // change to counter-clockwise angle measure
  else if ((diff < 0)) and ((m11 > 0)) then // 45 to 90
    Exit(tilt)
  else if ((diff < 0)) and ((m11 < 0)) then // -90 to -45
    Exit(180 + tilt); // change to counter-clockwise angle measure

  Result := 0;
  raise Exception.Create('Error in moments for tilt angle');

//Result := 180 - Result; // this makes the angle relative to a positive y-axis that runs up the screen
end;

procedure OcvContourMoments(IvPSeq: PCvSeq; var m00, m10, m01, m11, m20, m02: double; var cog: TCvPoint);
var
  m: TCvMoments;
begin
  cvMoments(IvPSeq, @m, 1); // CvSeq is a subclass of CvArr

  // spatial
  m00 := cvGetSpatialMoment(@m, 0, 0); // =are
  m10 := cvGetSpatialMoment(@m, 1, 0); // ?
  m01 := cvGetSpatialMoment(@m, 0, 1); // ?

  // central
  m11 := cvGetCentralMoment(@m, 1, 1);
  m20 := cvGetCentralMoment(@m, 2, 0);
  m02 := cvGetCentralMoment(@m, 0, 2);

  // centerofgravity
  if m00 <> 0 then begin
    cog.x := round(m10 / m00) {* scale};
    cog.y := round(m01 / m00) {* scale};
  end;

end;

procedure CvContourTreeWalk(IvPSeq: PCvSeq; IvImg: pIplImage; var IvCount: integer; var IvLevel: integer; const IvGoDown, IvLog: boolean; IvFbk: TFbkRec);
var
  i: integer;
begin
  if not assigned(IvPSeq) then
    Exit;

  if IvGoDown then begin

    // count
    Inc(IvCount);

    // data
    cvca := CvContourArea(PCvArr(IvPSeq), CV_WHOLE_SEQ);
    cvcc := CvCheckContourConvexity(PCvArr(IvPSeq));
    cvcl := CvArcLength(IvPSeq, CV_WHOLE_SEQ, 1);
  //if IvLog then
    //LogFmt('No: %d, level: %d, elements: %d, convexity: %d, area: %f, length: %f', [IvCount, IvLevel, IvPSeq.total, cc, ca, cl]);

    // filter
    if csv.CsvHas(cvcf.LevelCsv, IvLevel.ToString) and ((cvcf.AreaMin <= cvca) and (cvca <= cvcf.AreaMax)) then begin
      // count
      Inc(cvcr.Count);

      // area
      if cvca < cvcr.MinArea then
        cvcr.MinArea := cvca;
      if cvca > cvcr.MaxArea then
        cvcr.MaxArea := cvca;
      cvcr.TotalArea := cvcr.TotalArea + cvca;

      // log
      if IvLog then
        IvFbk.AddFmt('No: %d, level: %d, elements: %d, convexity: %d, area: %f, length: %f, selected: %d', [IvCount, IvLevel, IvPSeq.total, cvcc, cvca, cvcl, cvcr.Count]);

      // draw (on the source image)
      cvStartReadSeq(IvPSeq, @cvsr, 0);
      CV_READ_SEQ_ELEM(@cvp1, cvsr, SizeOf(cvp1));
      for i := 0 to IvPSeq^.total - 1 do begin
        CV_READ_SEQ_ELEM(@cvp2, cvsr, SizeOf(cvp1));
      //if IvLog then
        //LogFmt('%d) p(%d,%d) ; p2(%d,%d)', [i, cvp1.x, cvp1.y, cvp2.x, cvp2.y]);
        if IvLevel mod 2 = 0 then
          cvLine(cvsi, cvp1, cvp2, cvred, 1)
        else
          cvLine(cvsi, cvp1, cvp2, cvgreen, 1);
        cvp1 := cvp2;
      end;

      // debug
      //cvShowImage(wci, cvi0);
      //cvWaitKey(0);
    end;

    // vnext - down - vvvv
    if assigned(IvPSeq.v_next) then begin
      Inc(IvLevel);
    //Log('DOWN');
      CvContourTreeWalk(IvPSeq.v_next, IvImg, IvCount, IvLevel, true, IvLog, IvFbk);
      Exit;
    end;

  end;

  // hnext - right - >>>>
  if assigned(IvPSeq.h_next) then begin
  //Log('RIGHT');
    CvContourTreeWalk(IvPSeq.h_next, IvImg, IvCount, IvLevel, true, IvLog, IvFbk);
    Exit;
  end;

  // vprev - up - ^^^^
  if assigned(IvPSeq.v_prev) then begin
    Dec(IvLevel);
  //Log('UP');
    CvContourTreeWalk(IvPSeq.v_prev, IvImg, IvCount, IvLevel, false, IvLog, IvFbk);
    Exit;
  end;

end;

function  CvContourBoundingBox(IvIplImage: PIplImage; IvUsePolyHull: boolean; IvPerimScale: double; var IvCount: integer; var IvRects: TCvRectVector; var IvCenters: TCvPointVector; var IvFbk: string): boolean;
var
  ms: PCvMemStorage;
  se, se2, se3: PCvSeq; // sequences
  cs: PCvContourScanner;
//cp, cpt: double; // perimeter, perimeterthreshold, area
  ii, zz: integer; // total, returned
  p: TCvPoint;
begin
  try
    // init
    ms := CvCreateMemStorage(0); // storage for contours
    se := nil; // sequence for contours

    // find and scan contours
    ii := 0;
    zz := 0;
    cs := CvStartFindContours(PCvArr(IvIplImage), ms, sizeof(TCvContour), CV_RETR_EXTERNAL, CV_CHAIN_APPROX_SIMPLE, CvPoint(0, 0));
    se2 := CvFindNextContour(cs);
    while se2 <> nil do begin

      if zz < IvCount then begin

        //cp := CvContourPerimeter(se2);
        //cpt := (IvIplImage.height + IvIplImage.width) / IvPerimScale;

        // get rid of blob if its perimeter is too small
        //if cp < cpt then begin
          //cvSubstituteContour(cs, nil)
        //end else begin
          // smoot
          //if IvUsePolyHull then
            se3 := CvConvexHull2(PCvArr(se2), ms, CV_CLOCKWISE, 1);
          //else
            //se3 := CvApproxPoly(PCvArr(se2), sizeof(TCvContour), ms, CV_POLY_APPROX_DP, 2, 0);
          cvSubstituteContour(cs, se3); // replace in sequence

          // save contour (x, y, w, h, area, perim)
          SetLength(IvRects, Length(IvRects)+1);
          SetLength(IvCenters, Length(IvRects));
          IvRects[zz] := CvBoundingRect(PCvArr(se3));
          p := CvPoint((IvRects[zz].x + IvRects[zz].width div 2), (IvRects[zz].y + IvRects[zz].height div 2));
          IvCenters[zz] := p;
          //IvRects[zz] := CvContourArea(PCvArr(se2), CV_WHOLE_SEQ);

          // next storage
          Inc(zz);
        //end;

      end;

      // next contour
      se2 := CvFindNextContour(cs);
      Inc(ii);
    end;
    // end scan
    se2 := CvEndFindContours(cs);

    // end
    Result := true;
    IvFbk := Format('%s', [OK_STR]);
  except
    on e: Exception do begin
      Result := false;
      IvFbk := Format('%s', [NOT_AVAILABLE_STR]);
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Draw'}
function  CvuBoxPoints(box: TCvBox2D): T4Cvpoint2D32f;
var
  a, b: single;
  pt: T4Cvpoint2D32f;
begin
  a := cos(box.angle) * 0.5;
  b := sin(box.angle) * 0.5;
  pt[0].x := box.center.x - a*box.size.height - b*box.size.width;
  pt[0].y := box.center.y + b*box.size.height - a*box.size.width;
  pt[1].x := box.center.x + a*box.size.height - b*box.size.width;
  pt[1].y := box.center.y - b*box.size.height - a*box.size.width;
  pt[2].x := 2*box.center.x - pt[0].x;
  pt[2].y := 2*box.center.y - pt[0].y;
  pt[3].x := 2*box.center.x - pt[1].x;
  pt[3].y := 2*box.center.y - pt[1].y;
  Result := pt;
end;

function  CvuFontInit(scale: double; thickness: integer = 1): TCvFont;
//CV_INLINE TCvFont TCvFont(double scale, int thickness CV_DEFAULT(1))
//  TCvFont font;
//  cvInitFont(&font, CV_FONT_HERSHEY_PLAIN, scale, scale, 0, thickness, CV_AA);
//  return font;
//
begin
  cvInitFont(@Result, CV_FONT_HERSHEY_PLAIN, scale, scale, 0, thickness, CV_AA);
end;

procedure CvuDrawBox(img: PCvArr; rect: {TCvBox2D}TCvRect); overload;
begin
  cvRectangle(img, CvPoint(rect.x, rect.y), CvPoint(rect.x + rect.width-1, rect.y + rect.height-1), CvuScalar(255, 255, 255, 0));
end;

function  CvuDrawBox(img: PCvArr; rect: {TCvBox2D}TCvRect; color: TCvScalar): TCvPoint2D32f; overload;
begin
  cvRectangle(img, CvPoint(rect.x, rect.y), CvPoint(rect.x + rect.width-1, rect.y + rect.height-1), CvuScalar(255, 255, 255, 0));
end;

function  CvuDrawBox(img: PCvArr; box: {TCvBox2D}TCvBox2D; color: TCvScalar): TCvPoint2D32f; overload;
//var
//  points: T4Cvpoint2D32f;
//  iPoint: integer;
begin
  //points := CvPointsOfBox(box);
  //for iPoint := 0 to 3 do
    //CvLine(img, cvPointfrom32f_(points[iPoint]), cvPointfrom32f_(points[(iPoint + 1) mod 4]), color);
end;

function  CvDrawBox(img: PiplImage; box: TCvBox2D; color: TCvScalar): TCvPoint2D32f;
var
  points: T4Cvpoint2D32f;
  iPoint: integer;
begin
  points := CvuBoxPoints(box);
  for iPoint := 0 to 3 do
    CvLine(PCvArr(img), CvPointfrom32f(points[iPoint]), CvPointfrom32f(points[(iPoint + 1) mod 4]), color);
end;

procedure CvuDrawRect(img: PCvArr; rect: TCvRect);
begin
  cvRectangle(img, CvPoint(rect.x, rect.y), CvPoint(rect.x + rect.width-1, rect.y + rect.height-1), CvuScalar(255, 255, 255, 255));
end;

procedure CvuDrawEllipseBox(img: PCvArr; box: TCvBox2D; color: TCvScalar; thickness: integer = 1; line_type: integer = 8; shift: integer = 0);
var
  axes: TCvSize;
begin
  axes.width  := CvRound(box.size.height * 0.5);
  axes.height := CvRound(box.size.width * 0.5);
  cvEllipse(img, CvPointFrom32f(box.center), axes, (box.angle{*180/pi}), 0, 360, color, thickness, line_type, shift);
  cvEllipse(img, CvPointFrom32f(box.center), axes, (box.angle*180/pi), 0, 360, color, thickness, line_type, shift);
end;

procedure CvuDrawFitEllipse(const points: PCvPoint2D32f; count: integer; box: PCvBox2D);
//var
//  mat: TCVMat;
begin
//  CvMat mat = CvMat(1, count, CV_32FC2, (void*)points);
//  *box = CvFitEllipse2(&mat);
end;

procedure CvuCross(img: PCvArr; center: TCvPoint; radius: integer; color: TCvScalar; thickness: integer = 1; line_type: integer = 8; shift: integer = 0);
begin
  CvLine(img, CvPoint(center.X-radius, center.Y-radius), CvPoint(center.X+radius, center.Y+radius), color, thickness, line_type, shift);
  CvLine(img, CvPoint(center.X+radius, center.Y-radius), CvPoint(center.X-radius, center.Y+radius), color, thickness, line_type, shift);
end;
{$ENDREGION}

{$REGION 'General'}
function  CvuRect(x, y, width, height: longint): TCvRect; overload;
var
  r: TCvRect;
begin
  r.x := x;
  r.y := y;
  r.width := width;
  r.height := height;
  result := r;
end;

function  CvuRect(R: TRect): TCvRect; overload;
begin
  Result.X := R.Left;
  Result.Y := R.Top;
  Result.Width := R.Right - R.Left;
  Result.Height := R.Bottom - R.Top;
end;

function  CvRound(value: double):longint;
//var
//  temp: double;
begin
  //the algorithm was taken from Agner Fog's optimization guide at http://www.agner.org/assem
  //  temp := value + 6755399441055744.0;
  //  result := (int)*((uint64*)&temp);
  result := round(value);
end;

procedure CvConvert(const src: PiplImage; dst: PiplImage; scale: double = 1; shift: double = 0);
begin
  cvConvertScale(PCvArr(src), PCvArr(dst), scale, shift);
end;

function  CvPointV(x, y: integer): TCvPoint;
begin
  result.x := x;
  result.y := y;
end;

function  CvPoint2D32fV(x, y: double): TCvPoint2D32f;
begin
  result.x := x;
  result.y := y;
end;

function  CvPoint2D32f_(x, y: single): TCvPoint2D32f;
begin
  result.x := x;
  result.y := y;
end;

function  CvPoint2D32f_(point: TCvPoint): TCvPoint2D32f;
var
  p: TCvPoint2D32f;
begin
  p.x := point.x;
  p.y := point.y;
  result := p;
end;

function  CvPointfrom32f(point: TCvPoint2D32f): TCvPoint;
var
  p: TCvPoint;
begin
  p.x := CvRound(point.x);
  p.y := CvRound(point.y);
  result := p;
end;

function  CvSizeV(p_width, p_height: integer): TCvSize;
begin
  result.width := p_width;
  Result.height := p_height;
end;

function  CvSizeV(p_width, p_height: extended): TCvSize; overload;
begin
  result.width  := round(p_width);
  Result.height := round(p_height);
end;

function  CvRectToROI(rect: TCvRect; coi: integer): TIplROI;
begin
  result.xOffset := rect.x;
  result.yOffset := rect.y;
  result.width := rect.width;
  result.height := rect.height;
  result.coi := coi;
end;

function  CvROIToRect(roi: TIplROI): TCvRect;
begin
  result := CvuRect(roi.xOffset, roi.yOffset, roi.width, roi.height);
end;
{$ENDREGION}

{$REGION 'Function'}
function  CvuFunctionScan(IvName: string; IvCol: integer): string;
var
  i: integer;
  s: string;
begin
  Assert((IvCol >= 0) and (IvCol <= 12), 'Parameters must be in range 0..12');
  Result := '-1';
  for i := 0 to High(CvFunctionMatrix) do begin
    s := CvFunctionMatrix[i][1];
    if s = IvName then begin
      Result := CvFunctionMatrix[i][IvCol];
      Exit;
    end;
  end;
end;

function  CvuFunctionId(IvName: string): integer;
begin
  Result := StrToInt(CvuFunctionScan(IvName, 0));
end;

function  CvuFunctionParam(IvName: string; IvId: integer): string;
begin
  Result := CvuFunctionScan(IvName, IvId+1);
end;

function  CvuFunctionHelp(IvName: string): string;
begin
  Result := CvuFunctionScan(IvName, 8);
end;
{$ENDREGION}

{$REGION 'Ocv'}
function  CvImageProcess(IvCvRecipe: string; IvShowResult: boolean; IvPauseMs: integer; IvXyWhResult: TStrings; IvBitmapResult: TBitmap; IvPixelFormat: TPixelFormat; var IvFbk: string): boolean;
var

  {$REGION 'var'}

  {$REGION 'general'}
  b: boolean;
  k: string; // fbk
  i, j, z: integer; // counters
  w, h: integer; // width, height
  wc, wc2: PAnsiChar; // windows caption
  fbk: TStringList; // feedback
  ms: PCvMemStorage; // memorystorage
  se, se2: PCvSeq; // sequencelist
  pt: TCvPoint;
  sc: TCvScalar;
  {$ENDREGION}

  {$REGION 'file'}
  fp, fn, f: string; // filepath, filename
//tfile: TextFile;
  {$ENDREGION}

  {$REGION 'recipe'}
  re, ri: TStringList; // recipe, ingredients
  rr, fu, p2, p3, p4, p5, p6, p7, p8, p9, p10: string; // recipe row, function, params
  p1: ansistring; // 1st param
  id: integer; // functionid
  {$ENDREGION}

  {$REGION 'iplimages'}
  i0, i1, i2: PIplImage; // initialimage, tempimagemodified, tempimage
  {$ENDREGION}

  {$REGION 'histogram'}
  hi: PCvHistogram; // gray images histogram
  hs: integer; // histogramsize
  hc: TCvScalar; // histogramcolor
  hr: array[0..1] of single; // histogramrange
  hrs: array[0..1] of PSingle; // histogramranges
  hmin, hmax: single; // histogramminmax
  hmini, hmaxi: integer; // histogramminmax
  hbinw, hval: integer; // histogramwidth, histogramvalue
  {$ENDREGION}

  {$REGION 'linecircle'}
  li: PTCvLine; // line
  ci: PTCvCircle; // circle
  {$ENDREGION}

  {$REGION 'contour'}
  cz: integer; // contour index
  ca, cl: double; // countourarea, countourlength
  cc: integer; // countourconvexity 1 = convex 0 = concavo
  {$ENDREGION}

  {$REGION 'rect-roi'}
  rc: TCvRect;
  rz: TCvSize;
  {$ENDREGION}

  {$REGION 'blobbox'}
  bbh: boolean; // use hull
  bbs: integer; // scale
  bbz: integer; // max contours
  bbx: integer; // center cross dim
  bbwmin, bbwmax, bbhmin, bbhmax: integer;
  bbdx, bbdb, bbde: boolean; // drawcross, box, ellipse
//bbr: string; // csv file result
  bbrv: TCvRectVector;
  bbcv: TCvPointVector;
  {$ENDREGION}

  {$REGION 'kernel'}
  kn: PIplConvKernel;
  {$ENDREGION}

  {$REGION 'bmp'}
  bmp: TBitmap;
  {$ENDREGION}

  {$REGION 'routine'}
  procedure FbkAdd(IvString: string; IvVarRecVector: array of TVarRec);
  begin
    fbk.Add(Format(IvString, IvVarRecVector));
  end;
  procedure TheEnd;
  begin
    // recipe&ingredients
    re.Free;
    ri.Free;
    // log
    IvFbk := fbk.Text;
    fbk.Free;
    // images
    cvReleaseImage(i0);
    // window
    if IvShowResult then
      cvDestroyWindow(wc);
  end;
  {$ENDREGION}

  {$ENDREGION}

begin

  {$REGION 'exit'}
  Result := IvCvRecipe <> '';
  if not Result then begin
    IvFbk := 'Recipe is empty';
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'Init'}
  // logbuffer
  fbk := TStringList.Create;
  // awindow
  if IvShowResult then begin
    wc := 'Cv Image Process';
    cvNamedWindow(wc, CV_WINDOW_AUTOSIZE);
  end;
  {$ENDREGION}

  {$REGION 'start'}
  FbkAdd('Start image processing', []);
  {$ENDREGION}

  {$REGION 'recipe'}
  re := TStringList.Create;
  re.Text := IvCvRecipe;
  {$ENDREGION}

  {$REGION 'ingredients'}
  ri := TStringList.Create;
  ri.NameValueSeparator := ','; // was: ', '
  for i := 0 to re.Count-1  do begin

    {$REGION 'skipdo'}
    // recipe row
    rr := re.Strings[i];

    // continue if we have an empty or comment row
    if (rr = '') or str.IsComment(rr) then
      Continue;
    {$ENDREGION}

    {$REGION 'ingredient'}
    ri.CommaText := rr;
    if ri.Count > 0  then fu  := ri[0]  else Exit;
    if ri.Count > 1  then p1  := ri[1]  else p1  := CvuFunctionParam(fu, 1);
    if ri.Count > 2  then p2  := ri[2]  else p2  := CvuFunctionParam(fu, 2);
    if ri.Count > 3  then p3  := ri[3]  else p3  := CvuFunctionParam(fu, 3);
    if ri.Count > 4  then p4  := ri[4]  else p4  := CvuFunctionParam(fu, 4);
    if ri.Count > 5  then p5  := ri[5]  else p5  := CvuFunctionParam(fu, 5);
    if ri.Count > 6  then p6  := ri[6]  else p6  := CvuFunctionParam(fu, 6);
    if ri.Count > 7  then p7  := ri[7]  else p7  := CvuFunctionParam(fu, 7);
    if ri.Count > 8  then p8  := ri[8]  else p8  := CvuFunctionParam(fu, 8);
    if ri.Count > 9  then p9  := ri[9]  else p9  := CvuFunctionParam(fu, 9);
    if ri.Count > 10 then p10 := ri[10] else p10 := CvuFunctionParam(fu, 10);
    id := CvuFunctionId(fu);
    FbkAdd('%s(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', [fu, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10]);
    {$ENDREGION}

    {$REGION 'apply prescripted function'}
    try
      case id of

        {$REGION 'Load'}
        0: begin
          if not FileExists(p1) then begin
            FbkAdd('File not found %s', [p1]);
            TheEnd;
            Exit;
          end;
          fp := ExtractFileDir(p1);
          fn := ExtractFileName(p1);
          i0 := CvLoadImage(PAnsiChar(p1));
          FbkAdd('File %s loaded', [p1]);
        end;
        {$ENDREGION}

        {$REGION 'Save'}
        1: begin
          if p1 = 'Auto' then begin
            p1 := fp + '\' + fsy.FileVersionedNext(fp, fn);
            FbkAdd('Autosave to %s', [p1]);
          end else begin
            FbkAdd('Save to %s', [p1]);
          end;
        //cvSaveImage(PAnsiChar(p1), PCvArr(i0));

          bmp := TBitmap.Create;
          try
            b := IplImageToBitmap(i0, bmp, k);
            bmp.PixelFormat := IvPixelFormat; // pf4bit 16colors
            if not b then
              FbkAdd('%s', [k]);
            bmp.SaveToFile(p1);
          finally
            bmp.Free;
          end;

        end;
        {$ENDREGION}

        {$REGION 'To Implement'}
        // cvConvertScale(PCvArr(i1), PCvArr(i1), 1/3.0, 0); // doesnt change pixel dept but acts on pixel values * scale
        {$ENDREGION}

        {$REGION 'Pause'}
        2: begin
          if StrToInt(p1) > 0 then begin
            FbkAdd('Paused %s milliseconds', [p1]);
            Sleep(StrToInt(p1));
          end else begin
            FbkAdd('Paused until user press a key', [p1]);
            cvWaitKey(0);
//            Application.ProcessMessages;
          end;
        end;
        {$ENDREGION}

        {$REGION 'Show (explicit)'}
        3: begin
          FbkAdd('Show current result for %s milliseconds', [p1]);
          wc2 := 'Cv Image Current Result';
          cvNamedWindow(wc2, CV_WINDOW_AUTOSIZE);
          cvShowImage(wc2, i0);
//          Application.ProcessMessages;
          Sleep(StrToInt(p1));
          cvDestroyWindow(wc2);
        end;
        {$ENDREGION}

        {$REGION 'CameraUndistortion'}
        4: begin
//          if (OptionForm.intrinsicsName = '') or (OptionForm.distortionName = '') then begin
//            MessageDlg('Select intrinsics and distortion matrix files in options window', mtWarning, [mbOK], 0);
//            OptionForm.ShowModal;
//          end;
//          if not(assigned(intrinsic)) or (OptionForm.changed = true) then begin
//            intrinsic := CvLoad(PChar(OptionForm.intrinsicsName) );
//            if not (assigned(intrinsic)) then
//              raise Exception.Create('Intrinsic file not found!');
//            OptionForm.changed := false;
//          end;
//          // scale from 320x240 to 640x480
//          //cvConvertScale(intrinsic, intrinsic, 2.0, 0);
//          // extract the focal length of camera
//          //focalLen := CvmGet(intrinsic, 0, 0);
//          if not(assigned(distortion)) or (OptionForm.changed = true) then begin
//            distortion := CvLoad( pchar(OptionForm.distortionName) );
//            if not (assigned(distortion)) then
//              raise Exception.Create('Distortion file not found!');
//            OptionForm.changed := false;
//          end;
//          if i0.NChannels = 1 then
//            img2 := CvCreateImage(CvuSize(Round(i0.Width * 1.2), Round(i0.Height * 1.2)), IPL_DEPTH_8U, 1)
//          else
//            img2 := CvCreateImage(CvuSize(Round(i0.Width * 1.2), Round(i0.Height * 1.2)), IPL_DEPTH_8U, 3);
//          // build the undistort map that we will use for all subsequent frames
//          mapx := CvCreateImage(cvGetSize(img2), IPL_DEPTH_32F, 1);
//          mapy := CvCreateImage(cvGetSize(img2), IPL_DEPTH_32F, 1);
//          cvInitUndistortMap(intrinsic, distortion, mapx, mapy);
//          cvRemap(i0, img2, mapx, mapy, CV_INTER_LINEAR+CV_WARP_FILL_OUTLIERS, CvuScalar(0, 0, 0, 0) ); // undistort image
//          cvReleaseImage(i0);
//          i0 := CvCloneImage(img2);
//          cvReleaseImage(img2);
//          cvReleaseImage(mapx);
//          cvReleaseImage(mapy);
          FbkAdd('CameraUndistortion not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'HistogramEqualize -ok-'}
        5: begin
          i1 := CvCloneImage(i0);
          cvEqualizeHist(PCvArr(i0), PCvArr(i1));
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image histogram equalization applied', []);
        end;
        {$ENDREGION}

        {$REGION 'BgrToGray -ok- (3channels -> 1Channel8bit, color -> gray)'}
        6: begin
          i1 := CvCreateImage(cvGetSize(i0), IPL_DEPTH_8U, 1); // 1 channel
          cvCvtColor(i0, i1, CV_BGR2GRAY);
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image converted to 1 channel 8 bits gray', []);
        end;
        {$ENDREGION}

        {$REGION 'GrayToBgr (1Channel -> 3Channel8bit, gray -> color, still gray)'}
        7: begin
          i1 := CvCreateImage(cvGetSize(i0), IPL_DEPTH_8U, 3); // 3 channel
          cvCvtColor(i0, i1, CV_GRAY2BGR);
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image converted to 3 channels 8 bits color', []);
        end;
        {$ENDREGION}

        {$REGION 'Threshold -ok-'}
        8: begin
          i0 := CvuThreshold(i0, str.ToFloat(p1), str.ToFloat(p2), StrToBool(p3), StrToBool(p4));
          (*
          i1 := CvCloneImage(i0);
          CvZero(i1);
          cvThreshold(PCvArr(i0), PCvArr(i1), str.ToFloat(p1), str.ToFloat(p2), CV_THRESH_BINARY);
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          *)
          FbkAdd('Image threshold applied', []);
        end;
        {$ENDREGION}

        {$REGION 'ThresholdAdaptive -ok-'}
        9: begin //
          i1 := CvCloneImage(i0);
          CvZero(i1);
          cvAdaptiveThreshold(i0, i1, str.ToFloat(p1), StrToInt(p2), StrToInt(p3), StrToInt(p4), str.ToFloat(p5));
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image threshold adaptive applied', []);
        end;
        {$ENDREGION}

        {$REGION 'Smooth'}
        10: begin
          i1 := CvCloneImage(i0);
          CvZero(i1);
          cvSmooth(i0, i1, StrToInt(p1), StrToInt(p2), StrToInt(p3), str.ToFloat(p4), str.ToFloat(p5));
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image smooth applied', []);
        end;
        {$ENDREGION}

        {$REGION 'Erode -ok-'}
        11: begin
          cvErode(i0, i0, nil, StrToInt(p1));
          FbkAdd('Image erode applied', []);
        end;
        {$ENDREGION}

        {$REGION 'Dilate -ok-'}
        12: begin
          cvDilate(i0, i0, nil, StrToInt(p1));
          FbkAdd('Image dilate applied', []);
        end;
        {$ENDREGION}

        {$REGION 'PyramidMean (*** NOT WORKING ***)'}
        13: begin
          Assert(i0.nChannels = 3, 'WARNING, PyramidMean, Image is not 3 channels color');
          Assert(i0.depth = 8, 'WARNING, PyramidMean, Image is not 8 bits color depth');
          i1 := CvCreateImage(cvGetSize(i0), IPL_DEPTH_8U, 3);
          cvPyrMeanShiftFiltering(PCvArr(i0), PCvArr(i1), str.ToFloat(p1), str.ToFloat(p2), StrToInt(p3), CvTermCriteria(CV_TERMCRIT_ITER+CV_TERMCRIT_EPS, 5, 1));
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image pyramid mean applied', []);
        end;
        {$ENDREGION}

        {$REGION 'PyramidDown -ok-'}
        14: begin
          i1 := CvCreateImage(CvuSize(i0.width div 2, i0.height div 2), i0.depth, i0.nChannels);
          cvPyrDown(PCvArr(i0), PCvArr(i1), CV_GAUSSIAN_5x5);
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image pyramid down applied', []);
        end;
        {$ENDREGION}

        {$REGION 'PyramidUp -ok-'}
        15: begin
          i1 := CvCreateImage(CvuSize(i0.width * 2, i0.height * 2), i0.depth, i0.nChannels);
          cvPyrUp(PCvArr(i0), PCvArr(i1), 7);
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image pyramid up applied', []);
        end;
        {$ENDREGION}

        {$REGION 'PyramidNoiseRemove (*** NON MI CONVINCE ***)'}
        16: begin
          //cvPyrDown(PCvArr(i0), PCvArr(i0), 7);
          //cvPyrUp(PCvArr(i0), PCvArr(i0), 7);
          FbkAdd('Image pyramid noise remove not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'Resize(Zoom) -ok-'}
        17: begin
//          img1 := CvCloneImage(i0);
//          initParm(i, '2', '', '', '', '');
//          if Cells[2, i] <> '' then
//            ipar1 := StrToInt(Cells[2, i]);
//          case ipar1 of
//            2: begin kShift := 1; kOffset := 25 / 100; end;
//            4: begin kShift := 2; kOffset := 37.5 / 100; end;
//            8: begin kShift := 3; kOffset := 43.75 / 100; end;
//          else
//;
//          end;
//          cvSetImageROI(i0, CvuRect(round(i0.Width*kOffset), round(i0.Height * kOffset), (i0.Width shr kShift), (i0.Height shr kShift)));
//          cvResize(i0, img1, CV_INTER_LINEAR);
//          cvReleaseImage(i0);
//          i0 := CvCloneImage(img1);
//          cvReleaseImage(img1);
          if (p1 <> '') and (p2 <> '') then begin
            w := StrToInt(p1);
            h := StrToInt(p2);
          end else if (p1 <> '') and (p2 = '') then begin
            w := StrToInt(p1);
            h := Round(i0.height * w / i0.width);
          end else if (p1 = '') and (p2 <> '') then begin
            w := Round(i0.width * h / i0.height);
            h := StrToInt(p2);
          end;
          i1 := CvCreateImage(CvuSize(w, h), i0.depth, i0.nChannels);
          cvResize(PCvArr(i0), PCvArr(i1), {CV_INTER_LINEAR} StrToInt(p3));
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image resize applied', []);
        end;
        {$ENDREGION}

        {$REGION 'Histogram (*** DA FINIRE, OUT HISTOGRAM AS A SECONDARY IMAGE ***)'}
        18: begin
          i1 := CvCreateImage(cvGetSize(i0), IPL_DEPTH_8U, 3);
          CvZero(i1);
          hs := StrToInt(p1);
          hr[0] := 0;
          hr[1] := 255;
          hrs[0] := @hr;
          hi := CvCreateHist(1, @hs, CV_HIST_ARRAY, @hrs, 1);
          cvCalcHist(i0, hi, 0, nil);
          cvGetMinMaxHistValue(hi, @hmin, @hmax, @hmini, @hmaxi);
          hbinw := round(i1.Width / hs);
          hc := CvRgb(255, 0, 0);
          for j := 0 to hs-1 do begin
            hval := CvRound(CvGetReal1D(hi^.bins, j));
            if hval > 0 then begin
              hval := CvRound(hval * (i1^.Height / hmax));
              cvRectangle(PCvArr(i1), CvPoint(j * hbinw, i1.height), CvPoint( (j+1) * hbinw, i1.height - hval), hc, -1, 8, 0);
            end;
          end;
          cvReleaseHist(hi);
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image histogram created and saved to %s', ['?']);
        end;
        {$ENDREGION}

        {$REGION 'Magnitudo'}
        19: begin
//          initParm(i, '7', '', '', '', '');
//          if Cells[2, i] <> '' then
//            ipar1 := StrToInt(Cells[2, i]);
//          sx  := CvCreateImage(cvGetSize(i0), IPL_DEPTH_16S, 1);
//          sy  := CvCreateImage(cvGetSize(i0), IPL_DEPTH_16S, 1);
//          sxf := CvCreateImage(cvGetSize(i0), IPL_DEPTH_32F, 1);
//          syf := CvCreateImage(cvGetSize(i0), IPL_DEPTH_32F, 1);
//          //phi := CvCreateImage(cvGetSize(i0), IPL_DEPTH_32F, 1);
//          img1 := CvCreateImage(cvGetSize(i0), IPL_DEPTH_32F, 1);
//          cvSetZero(img1);
//          cvSobel(i0, sx, 1, 0 , ipar1);
//          cvSobel(i0, sy, 0, 1 , ipar1);
//          cvConvertScale(sx, sxf, 1, 0);
//          cvConvertScale(sy, syf, 1, 0);
//          cvCartToPolar(syf, sxf, img1, nil, 0);
//          // release temp images
//          cvReleaseImage(sx);
//          cvReleaseImage(sy);
//          cvReleaseImage(sxf);
//          cvReleaseImage(syf);
//          cvReleaseImage(i0);
//          i0 := CvCreateImage(cvGetSize(img1), IPL_DEPTH_8U, 1);
//          IplImage32ToImage8(img1, i0);
//          cvReleaseImage(img1);
          FbkAdd('Image magnitudo not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'Kmeans'}
        20: begin
          FbkAdd('Image kmeans not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'Kmeans2'}
        21: begin
//          initParm(i, '5', '', '', '', '');
//          if Cells[2, i] <> '' then
//            ipar1 := StrToInt(Cells[2, i]);
//          img1 := CvCreateImage(cvGetSize(i0), IPL_DEPTH_32F, i0.NChannels);
//          cvSetZero(img1);
//          cvConvertScale(i0, img1, 1, 0);
//          sample_count := img1.Height * img1.Width;
//          pmClusters:= CvCreateMat(sample_count, 1, CV_32SC1 );
//          mImage := CvMat_(sample_count, 1, CV_32FC3, img1.ImageData);
//          pmPoints := @mImage;
//          cvKMeans2(pmPoints, ipar1, pmClusters, CvTermCriteria(CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, 10, 0.5));
//          cvReleaseImage(i0);
//          //i0 := CvCreateImage(cvGetSize(img1), IPL_DEPTH_8U, 1);
//          i0 := CvCreateImage(cvGetSize(img1), IPL_DEPTH_8U, img1.NChannels);
//          CvZero(i0);
//          clusterColors[0] := CvRgb(255,   0,   0);
//          clusterColors[1] := CvRgb(  0, 255,   0);
//          clusterColors[2] := CvRgb(  0,   0, 255);
//          clusterColors[3] := CvRgb(255, 255, 255);
//          clusterColors[4] := CvRgb(  0, 255, 255);
//          clusterColors[5] := CvRgb(100, 100, 255);
//          clusterColors[6] := CvRgb(127,   0, 255);
//          clusterColors[7] := CvRgb(  0, 127, 255);
//          clusterColors[8] := CvRgb(255,   0, 255);
//          clusterColors[9] := CvRgb( 50, 100, 127);
//          clusterArray := System.SysUtils.PByteArray(pmClusters.data);
//          pointsArray  := System.SysUtils.PByteArray(i0.ImageData);
//          k := 0;
//          for y := 0 to  i0.Height-1 do begin
//            for x := 0 to i0.Width-1 do begin
//              cluster_idx := PInteger(longint(clusterArray) + k)^;
//              if cluster_idx > 9 then
//                cluster_idx := 0;
//              cvSet2D(i0, y, x,  clusterColors[cluster_idx]);
//              //if cluster_idx = 2 then
//                //cvSet2D(i0, y, x, CvuScalar(255, 255, 255, 0));
//              k := k + sizeof(integer);
//            end;
//          end;
//          cvReleaseImage(img1);
//          cvReleaseData(pmPoints);
//          cvReleaseMat(@pmClusters);
//          //calcMoments(i0);
//          cvCircle(i0, CvPoint(round(Fxc), round(Fyc)), 5, CvRgb(255, 255, 255), 2);
          FbkAdd('Image kmeans2 not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'Sobel'}
        22: begin
          i1 := CvCloneImage(i0);
          CvZero(i1);
          cvSobel(PCvArr(i0), PCvArr(i1), StrToInt(p1), StrToInt(p2), StrToInt(p3));
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image sobel NOT WORKING', []);
        end;
        {$ENDREGION}

        {$REGION 'Laplace'}
        23: begin
          i1 := CvCreateImage(cvGetSize(i0), IPL_DEPTH_32F, 1);
          CvZero(i1);
          cvLaplace(PCvArr(i0), PCvArr(i1), StrToInt(p1));
          cvReleaseImage(i0);
          //i0 := CvCreateImage(cvGetSize(i1), IPL_DEPTH_8U, 1);
          //IplImage32ToImage8(i1, i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image laplace NOT WORKING', []);
        end;
        {$ENDREGION}

        {$REGION 'Canny'}
        24: begin
          i0 := CvuCanny(i0, str.ToFloat(p1), str.ToFloat(p2), StrToInt(p3));
          FbkAdd('Image canny applied', []);
        end;
        {$ENDREGION}

        {$REGION 'LinesHough (*** DA RIVEDERE, ALSO OUT LINES AS NUMBERS ***)'}
        25: begin
          Assert(i0.nChannels = 1, 'WARNING, HoughLines needs a one channel gray image as input');
          Assert(i0.depth = 8, 'WARNING, HoughLines needs a 8 bits color depth image as input');
          i1 := CvCloneImage(i0); // only gray images
          CvZero(i1);
          se := nil; // lines
          ms := CvCreateMemStorage(0); // create memory storage that will contain all the dynamic data
          se := CvHoughLines2(PCvArr(i1), ms, CV_HOUGH_PROBABILISTIC, str.ToFloat(p1), str.ToFloat(p2), StrToInt(p3), str.ToFloat(p4), str.ToFloat(p5));
          if se = nil then
            FbkAdd('No liness found', [])
          else begin
            FbkAdd('Extracted %d lines', [se.total]);
            for j := 0 to se^.total-1 do begin
              // too much
              if j > 100 then
                break;
              li := PTCvLine(CvGetSeqElem(se, j));
              CvLine(PCvArr(i1), li^[0]{p1}, li^[1]{p2}, CvRgb(255, 255, 255), 1, CV_AA, 0);
              li := nil;
            end;
          end;
          cvReleaseMemStorage(ms);
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image houg lines applied', []);
        end;
        {$ENDREGION}

        {$REGION 'LinesHoughProbabilistic'} // *** change in HoughLinesProbabilistic ***
        26: begin
          FbkAdd('Image houg lines probabilistic not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'CirclesHough, ALSO OUT CIRCLES AS NUMBERS'}
        27: begin
          i1 := CvCloneImage(i0);
          se := nil; // circles
          ms := CvCreateMemStorage(0);
          se := CvHoughCircles(PCvArr(i1), ms, CV_HOUGH_GRADIENT, str.ToFloat(p1), str.ToFloat(p2), str.ToFloat(p3), str.ToFloat(p4), StrToInt(p5), StrToInt(p6));
          if se = nil then
            FbkAdd('No circles found', [])
          else begin
            FbkAdd('Extracted %d circles', [se.total]);
            for j := 0 to se.total-1 do begin
              // too much
              if j > 100 then
                break;
              ci := PTCvCircle(CvGetSeqElem(se, j));
              cvCircle(PCvArr(i1), CvPoint(Round(ci^[0]), Round(ci^[1])), 5, CvRgb(255, 255, 255), -1, 8, 0);
              cvCircle(PCvArr(i1), CvPoint(Round(ci^[0]), Round(ci^[1])), Round(ci^[2]), CvRgb(255, 255, 255), 2, 8, 0);
            end;
          end;
          cvReleaseMemStorage(ms);
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image houg circles applied', []);
        end;
        {$ENDREGION}

        {$REGION 'Corners'}
        28: begin
//          img2 := CvCloneImage(i0);
//          eig := CvCreateImage(cvGetSize(img2), 32, 1);
//          temp := CvCreateImage(cvGetSize(img2), 32, 1);
//          initParm(i, '50', '0, 05', '10, 0', '5', '');
//          if Cells[2, i] <> '' then
//            ipar1 := StrToInt(Cells[2, i]);
//          if Cells[3, i] <> '' then
//            fpar2:= str.ToFloat(Cells[3, i]);
//          if Cells[4, i] <> '' then
//            fpar3:= str.ToFloat(Cells[4, i]);
//          if Cells[5, i] <> '' then
//            ipar4:= StrToInt(Cells[5, i]);
//          points[0] := @pointsRow1[0];
//          points[1] := @pointsRow2[0];
//          cvGoodFeaturesToTrack(img2, eig, temp, @points[1][0], @ipar1, fpar2, fpar3, 0, ipar4, 0, 0.09 );
//          cvFindCornerSubPix( img2, @points[1][0], count, CvuSize(ipar4, ipar4), CvuSize(-1, -1), CvTermCriteria(CV_TERMCRIT_ITER or CV_TERMCRIT_EPS, 20, 0.03));
//          cvReleaseImage(eig);
//          cvReleaseImage(temp);
//          // show corners
//          for j := 0 to ipar1 -1 do begin
//            cvCircle(img2, cvPointFrom32f_(points[1][j]), 3, CvRgb(0, 255, 255), -1, 8, 0);
//            cvCircle(img2, cvPointFrom32f_(points[1][j]), 8, CvRgb(255, 0, 0), -1, 8, 0);
//          end;
//          cvReleaseImage(i0);
//          i0 := CvCloneImage(img2);
//          cvReleaseImage(img2);
          FbkAdd('Image corners not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'CornersHarris'}
        29: begin
//          img1 := CvCreateImage( cvGetSize(i0), IPL_DEPTH_32F, 1);
//          initParm(i, '3', '3', '0, 04', '', '');
//          if Cells[2, i] <> '' then
//            ipar1 := StrToInt(Cells[2, i]);
//          if Cells[3, i] <> '' then
//            ipar2 := StrToInt(Cells[3, i]);
//          if Cells[4, i] <> '' then
//            fpar3 := str.ToFloat(Cells[4, i]);
//          cvCornerHarris(i0, img1, ipar1, ipar2, fpar3);
//          cvReleaseImage(i0);
//          i0 := CvCreateImage(cvGetSize(img1), IPL_DEPTH_8U, 1);
//          IplImage32ToImage8(img1, i0);
//          cvReleaseImage(img1);
          FbkAdd('Image corners harris not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'Contours (*** DA RIVEDERE E FINIRE, ALSO OUT CONTOURS AS NUMBERS ***)'}
        30: begin
          // p1 = contour to poligon approximation accuracy (0.1 is ok)
          // p2 = min length of contour to report (1, 2, ...)
          // p3 = min area of each retreived countours
          // p4 = max limit of contours to report
          // p5 = min contours to report
          // create color image
          i1 := CvCreateImage(cvGetSize(i0), IPL_DEPTH_8U, 3); // create color image 3 channels
          //cvShowImage(w, i1);
          // sequence & storage
          se := nil; // sequence for contours
          ms := CvCreateMemStorage(0); // storage for contours
          // find contours in input image i0
          z := CvFindContours(PCvArr(i0), ms, @se, sizeof(TCvContour), {CV_RETR_EXTERNAL}CV_RETR_LIST, CV_CHAIN_APPROX_SIMPLE, CvPoint(0, 0));
          if se = nil then
            FbkAdd('No contours found', [])
          else begin
            FbkAdd('Extracted %d raw contours, now approximate them with %d polygons', [se.total, z]);
            // test each contour
            cz := 0;
            while (se <> nil) do begin
              // init
              Inc(cz);
              // too much, limit
              if j > 100 then
                break;
                // idle until the user hits the “Esc” key.
              //while true do
                //if cvWaitKey(10) = 27 then
                  //break;

              // contours normal
              FbkAdd('Process contour %d', [cz]);
              ca := CvContourArea(PCvArr(se), CV_WHOLE_SEQ);
              cc := CvCheckContourConvexity(PCvArr(se));
              cl := CvArcLength(se, CV_WHOLE_SEQ, 1);
              FbkAdd('Contour area: %f, convexity: %d, length: %f', [ca, cc, cl]);

              // contours approximated
              //se2 := nil;
              se2 := CvApproxPoly(se, SizeOf(TCvContour), ms, CV_POLY_APPROX_DP, {accouracy}str.ToFloat(p1), {???}0);
              ca := CvContourArea(PCvArr(se2), CV_WHOLE_SEQ);
              cc := CvCheckContourConvexity(PCvArr(se2));
              cl := CvArcLength(se2, CV_WHOLE_SEQ, 1);
              FbkAdd('ContourApproximated area: %f, convexity: %d, length: %f', [ca, cc, cl]);

              // contour draw
              if p6 = '0' then
                cvDrawContours(PCvArr(i1), se2, CvRgb(0, 200, 255), CvRgb(200, 255, 0), 0, 1, CV_AA, CvPoint(0, 0))
              //cvDrawContours(img, contour, external_color, hole_color, max_level, 1, 8, CvPoint(0, 0));
              else
                cvDrawContours(PCvArr(i1), se2, CvRgb(0, 200, 255), CvRgb(200, 255, 0), 0, CV_FILLED, 8, CvPoint(0, 0));
              //CvWaitKey(0);
              //if (se.total >= 3) and (cc = 0) and (Abs(ca) > str.ToFloat(p3)) then begin
              //  if cl > str.ToFloat(p2) then // limit contour length
              //    if (se2.total <= str.ToFloat(p2)) then // limit max cutoff contours
              //end;

              // out as a numerical vector *** TO DO ***

              // take the next contour
              se := se.h_next;
            end;
          end;
          cvReleaseMemStorage(ms); // realease
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1); // restore
          cvReleaseImage(i1);
          FbkAdd('Image contours applied', []);
        end;
        {$ENDREGION}

        {$REGION 'ContoursApproximatePolygon'}
        31: begin
          FbkAdd('Image contours approximate polygons not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'TemplateMatching'}
        32: begin
//          Assert(FileExists(IvTemplate), 'Template file doesn''t exists');
//            if (OptionForm.templateName = '') then begin
//              MessageDlg('Select template image in options window', mtWarning, [mbOK], 0);
//              OptionForm.ShowModal;
//            end;
//          if not(Assigned(template)) or (OptionForm.changed) then begin
//            if i0.NChannels = 3 then // color
//              template := CvLoadImage(PChar(IvTemplate), 1 ) // load color
//            else
//              template := CvLoadImage(PChar(IvTemplate), 0 ); // load gray
//            if not (assigned(template)) then
//              raise Exception.Create('Template image not found!');
//            OptionForm.changed := false;
//          end;
//          if (template.Height >= i0.Height) or (template.Width >= i0.Width) then begin
//            raise Exception.Create('Template image must be smaller than image!');
//          end;
//          if (template.NChannels <> i0.NChannels) then begin
//            raise Exception.Create(format('Template channels (%d) different from image (%d)!', [template.NChannels, i0.NChannels]));
//          end;
//          img1 := CvCreateImage(CvuSize((i0.Width-template.Width+1), (i0.Height-template.Height+1)), IPL_DEPTH_32F, 1);
//          initParm(i, '5', '', '', '', '');
//          // CV_TM_CCOEFF_NORMED
//          if Cells[2, i] <> '' then
//            ipar1 := StrToInt(Cells[2, i]);
//          cvMatchTemplate(i0, template, img1, ipar1);
//          cvMinMaxLoc(img1, @min, @max, minLoc, maxLoc);
//          pt2.x := maxLoc.x + template.Width;
//          pt2.y := maxLoc.y + template.Height;
//          cvRectangle(i0, maxLoc, pt2, CvRgb(0, 255, 0), 2, CV_AA, 0);
//          case ipar1 of  // method
//            CV_TM_CCORR_NORMED, CV_TM_SQDIFF_NORMED, CV_TM_CCOEFF_NORMED:   maxpc := max;
//          else
//            maxpc := max/abs(max-min);
//          end;
//          if i0.Width >= 120 then
//            rad1 := 40
//          else
//            rad1 := round(i0.Width / 4);
//          rad := round(rad1*maxpc);
//          if rad <= 0 then
//            rad:= 2;
//          pt1.x := maxLoc.x + round(template.Width / 2);
//          pt1.y := maxLoc.y + round(template.Height / 2);
//          cvCircle(i0, pt1, rad1, CvRgb(255, 0, 0));
//          cvCircle(i0, pt1, rad, CvRgb(0, 255, 0));
//          cvReleaseImage(img1);
          FbkAdd('Image template matching not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'Crop'}
        33: begin
          //i0 := CvuCrop(i0, CvuRect(Rect(StrToInt(p1), StrToInt(p2), StrToInt(p3), StrToInt(p4))));
          // set roi origin
          rc := CvuRect(Rect(StrToInt(p1), StrToInt(p2), i0.width - StrToInt(p3), i0.height - StrToInt(p4)));
          cvSetImageROI(i0, rc);
          // create target with new size
          rz := CvuSize(rc.width, rc.height);
          i1 := CvCreateImage(rz, i0.depth, i0.nChannels); // i1 := CvCloneImage(i0); // clone
          // copy of roi = crop
          cvCopy(PCvArr(i0), PCvArr(i1));
          // reset source roi
          cvResetImageROI(i0);
          // std
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image crop applied', []);
        end;
        {$ENDREGION}

        {$REGION 'ColorSplit'}
        34: begin
          FbkAdd('Image color split not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'Decompose'}
        35: begin
          //CvuDecompose(IvImage: PIplImage; IvRect: TCvRect): PIplImage;
          FbkAdd('Image decompose not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'DrawPoint'}
        36: begin
          FbkAdd('Image draw point not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'DrawLine'}
        37: begin
          FbkAdd('Image draw line not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'DrawCircle'}
        38: begin
          FbkAdd('Image draw circle not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'DrawBox'}
        39: begin
          FbkAdd('Image draw box not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'Morphology'}
        40: begin
//          i1 := CvCreateImage(CvuSize(w, h), i0.depth, i0.nChannels);
//          i2 := CvCreateImage(CvuSize(w, h), i0.depth, i0.nChannels);
//          cvMorphologyEx(PCvArr(i0), PCvArr(i1), PCvArr(i2), StrToInt(p1), StrToInt(p2));
//          cvReleaseImage(i0);
//          i0 := CvCloneImage(i1);
//          cvReleaseImage(i1);
//          cvReleaseImage(i2);
          FbkAdd('Image morphology not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'Fourier'}
        41: begin
//          img1 := CvCreateImage(cvGetSize(i0), IPL_DEPTH_32F, 1);
//          img2 := CvCloneImage(img1);
//          cvConvertScale(i0, img1, 1.0, 0);
//          CvZero(img2);
//          cvDFT(img1, img2, CV_DXT_INV_SCALE, 0);
//
//          cvReleaseImage(i0);
//          i0 := CvCreateImage(cvGetSize(img2), IPL_DEPTH_8U, 1);
//          IplImage32ToImage8(img2, i0);
//          cvReleaseImage(img1);
//          cvReleaseImage(img2);
          FbkAdd('Image fourier transform not yet activated', []);
        end;
        {$ENDREGION}

        {$REGION 'BlobBox'}
        42: begin
          // working img1
          //i1 := CvCloneImage(i0);
          i1 := CvCreateImage(cvGetSize(i0), IPL_DEPTH_8U, 3);

          // settings
          bbh    := p1 = 'True';
          bbs    := StrToInt(p2);
          bbz    := StrToInt(p3);
          bbx    := StrToInt(p4);
          bbwmin := StrToInt(p5);
          bbwmax := StrToInt(p6);
          bbhmin := StrToInt(p7);
          bbhmax := StrToInt(p8);
          bbdx   := bit.BitIsSet(StrToInt(p9), 0);
          bbdb   := bit.BitIsSet(StrToInt(p9), 1);
          bbde   := bit.BitIsSet(StrToInt(p9), 2);
        //bbr    := p10;

          // find
          if not CvContourBoundingBox(i0, bbh, bbs, bbz, bbrv, bbcv, f) then
            FbkAdd('BlobBox nothing found', [])
          else begin
            FbkAdd('BlobBox found %d components', [Length(bbrv)]);

          //AssignFile(tfile, bbr);
            try
            //Rewrite(tfile);
            //try
              //WriteLn(tfile, 'X, Y, W, H');
                IvXyWhResult.Add('FldXCol,FldYRow,FldWidth,FldHeight');
                for z := Low(bbrv) to High(bbrv) do begin
                  if (bbrv[z].width > bbwmin) and (bbrv[z].width < bbwmax)
                  and (bbrv[z].height > bbhmin) and (bbrv[z].height < bbhmax) then begin
                    // csv
                    FbkAdd('TL(%d, %d), W:%d, H:%d', [bbrv[z].X - 1, bbrv[z].Y - 1, bbrv[z].Width, bbrv[z].Height]);
                  //Write(tfile, z);
                  //Write(tfile, Format(', %d', [bbrv[z].X]));
                  //Write(tfile, Format(', %d', [bbrv[z].Y]));
                  //Write(tfile, Format(', %d', [bbrv[z].Width]));
                  //Write(tfile, Format(', %d', [bbrv[z].Height]));
                  //WriteLn(tfile);
                    IvXyWhResult.Add(Format('%d,%d,%d,%d', [{z, } bbrv[z].X - 1, bbrv[z].Y - 1, bbrv[z].Width, bbrv[z].Height]));
                    // draw
                    if bbdx then
                      CvuCross(PCvArr(i1), CvPoint(
                        bbrv[z].x + bbrv[z].width div 2
                      , bbrv[z].y + bbrv[z].Height div 2)
                      , bbx, CvuScalar($00, $00, $ff, $ff));
                    if bbdb then
                      cvRectangle(PCvArr(i1)
                      , CvPoint(bbrv[z].x, bbrv[z].y)
                      , CvPoint(bbrv[z].x + bbrv[z].width-1, bbrv[z].y + bbrv[z].height-1)
                      , CvuScalar($00, $ff, $00, $ff));
                    if bbde then
                      cvEllipse(PCvArr(i1), CvPoint(
                        bbrv[z].x + bbrv[z].width div 2
                      , bbrv[z].y + bbrv[z].Height div 2)
                      , CvuSize(bbrv[z].width div 2, bbrv[z].height div 2)
                      , 0, 0, 360
                      , CvuScalar($ff, $00, $ff, $ff));
                  end;
                end;
            //finally
              //CloseFile(tfile);
              //FbkAdd('Results saved to %s', [bbr]);
            //end;
            except
              on e: Exception do
                FbkAdd('%s', [e.Message]);
            end;
          end;

          // check
        //cvSaveImage(PAnsiChar('E:\Etl\Probe\Esdm\Bmp\i0.bmp'), PCvArr(i0));
        //cvSaveImage(PAnsiChar('E:\Etl\Probe\Esdm\Bmp\i1.bmp'), PCvArr(i1));

          // swap
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          FbkAdd('Image BlobBox applied, %s', [f]);
        end;
        {$ENDREGION}

        {$REGION 'CleanUp'}
        43: begin
          cvMorphologyEx(PCvArr(i0), PCvArr(i0), {0}nil, {0}nil, CV_MOP_OPEN, 1);
          cvMorphologyEx(PCvArr(i0), PCvArr(i0), {0}nil, {0}nil, CV_MOP_CLOSE, 1);
          FbkAdd('Image CleanUp applied', []);
        end;
        {$ENDREGION}

        {$REGION 'NoiseReduce'}
        44: begin
          kn := CvCreateStructuringElementEx(2, 2, 1, 1, CV_SHAPE_ELLIPSE);
          cvDilate(i0, i0, kn, 1);
          cvReleaseStructuringElement(kn);
          FbkAdd('Image NoiseReduce applied', []);
        end;
        {$ENDREGION}

        {$REGION 'Zoom'}
        45: begin
        //FbkAdd('Zoom %s applied', [p1]);
          FbkAdd('Zoom not available', []);
        end;
        {$ENDREGION}

        {$REGION 'CopyMakeBorder'}
        46: begin
          rz := CvuSizeWithBorder(i0, StrToInt(p1), StrToInt(p2), StrToInt(p3), StrToInt(p4));

          i1 := CvCreateImage(rz, i0.depth, i0.nChannels);

          //CvZero(i1);

          FbkAdd('CopyMakeBorder applied (oldsize: %dx%d, newsize: %dx%d)', [i0.width, i0.height, i1.width, i1.height]);

          pt := CvPointV(1, 1);

          sc := CvuScalar(str.ToFloat(p1), str.ToFloat(p2), str.ToFloat(p3), str.ToFloat(p4));

          cvCopyMakeBorder(PCvArr(i0), PCvArr(i1), pt, IPL_BORDER_CONSTANT, sc);

          cvReleaseImage(i0);

          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
        end;
        {$ENDREGION}

        {$REGION 'MergeResultWithInitialImage'}
        (*
        99: begin
          i1 := CvCloneImage(i0);
          if (i0.NChannels <> i1.NChannels) then begin
            i2 := CvCreateImage(cvGetSize(i0), IPL_DEPTH_8U, i1.NChannels);
            case i0.NChannels of
              1: cvCvtColor(i0, i2, CV_GRAY2BGR);
              3: cvCvtColor(i0, i2, CV_BGR2GRAY);
            end;
            cvOr(PCvArr(i1), PCvArr(i2), PCvArr(i1), 0);
          end else begin
            cvor(PCvArr(i1), PCvArr(i0), PCvArr(i1), 0);
          end;
          cvReleaseImage(i0);
          i0 := CvCloneImage(i1);
          cvReleaseImage(i1);
          cvReleaseImage(i2);
          FbkAdd('Image MergeResultWithInitialImage will be removed', []);
        end;
        *)
        {$ENDREGION}

        {$REGION 'Else'}
        else begin
          FbkAdd('Unknown function  %s (%d), skip and continue', [fu, id]);
        end;
        {$ENDREGION}

      end;
    except

      {$REGION 'exception'}
      on e: Exception do begin
        Result := false;
        FbkAdd('Exception in function  %s, %s, continue', [fu, e.Message]);
        //Exit;
      end;
      {$ENDREGION}

    end;
    {$ENDREGION}

    {$REGION 'showafter'}
    if IvShowResult then
      cvShowImage(wc, i0);
    //Application.ProcessMessages;
    {$ENDREGION}

    {$REGION 'pause'}
    if IvShowResult and (IvPauseMs > 0) then
      Sleep(IvPauseMs);
    {$ENDREGION}

  end;
  {$ENDREGION}

  {$REGION 'Bmp Result'}
  if Assigned(IvBitmapResult) then begin
    b := IplImageToBitmap(i0, IvBitmapResult, k);
    IvBitmapResult.PixelFormat := IvPixelFormat; // pf4bit 16colors
    if not b then
      FbkAdd('%s', [k]);
  end;
  {$ENDREGION}

  {$REGION 'end/release'}
  FbkAdd('done', []);
  TheEnd;
  {$ENDREGION}

end;

procedure OcvCmdProcess(const IvStep: integer; IvCmd: string; IvSrc: pIplImage; var IvDest: pIplImage; var IvJson: TJSONObject; IvShow: boolean);

  {$REGION 'var'}
type
  TFloat4Vec  = array [0..3] of single;
  TFloatArray = array [0..10] of single;
  PFloatArray = ^TFloatArray;
  TPointsArr = array [0..250] of TCvPoint2D32f;
  PPointsArr = ^TPointsArr;

var
  // GENERAL
  cmr: TLangCmdRec;       // cmdrec
  c, k: string;           // cmd
  p  : TArray<string>;    // params
  o, s: string;           // oper = p[0], str
  i  : integer;           // loopcount
  x, y, w, h: integer;    // coord and box
  x0, y0, x1, y1: integer;// line
  z  : integer;           // count
  cas: integer;           // charasci
  // JSON
  jo0{jol}: TJSONObject;  // jasonobjectlocal
  // BOOLEAN
  can: boolean;           // docanny
  smt: boolean;           // dosmoot
  // BASIC
  txt: string;            // text
  rad: integer;           // radius
  dia: integer;           // diameter
  ite: integer;           // itarations
  apz: integer;           // aperturesize
  fon: TCvFont;           // font
  met: integer;           // method (0,1,...)
  siz: TCvSize;           // size
  sz1, sz2: integer;      // sizes
  sd1, sd2: integer;      // sigmas
  max, min: integer;      // max, min
  are: double;            // area
  shi: integer;           // shift
  typ: integer;           // type
  thr, tlo, thi: double;  // threshold, thresholdlow, thresholdhigh
  ker: PIplConvKernel;    // kernel
  kid: integer;           // kernel id
  fli: single;            // fit line
  // IPL
  tmp: PIplImage;         // temp ipl for intermediate storage
  gry: PIplImage;         // gray ipl
  ths: PIplImage;         // threshold ipl
  eig: PIplImage;         // eig ipl
  pyr: PIplImage;         // pyramid ipl
  // SEQ
  seq: pCvSeq;            // sequence
  // COLOR
  col: TCvScalar;         // color
  coh, cli, cfi: string;  // color hexstr, line, fill

  mem: pCvMemStorage;     // memorystorage
  pnt, pt0, pt1: TCvPoint;// point
  ptp: PCvPoint;          // point ptr
  pta: PCvPointArray;     // pointsvect
  ptm: TCvMat;            // pointsmatrix
  thk: integer;           // thickness
  fls: pFloatArray;       // floatsvec
  rec: TCvRect;           // rect
//roi: pIplROI;           // roi
  cen: TCvPoint2D32f;     // center float
  cei: TCvPoint;          // center int
  box: TCvBox2D;          // box tilted
  bvx: TBoxPoints;        // box tilted vertices
  // CONTOUR
  cix: integer;           // contour index
  clo: boolean;           // contour closed
  cfu: boolean;           // contour found (meet filters)
  cfx: integer;           // contour found index
  cfd: boolean;           // contour found draw only
  cja: TJSONArray;        // contour json vector
  cje: TJSONObject;       // contour json element
  cab: boolean;           // contour approx use
  caa: double;            // contour approx accuracy
  cob: boolean;           // contour open also
  cnh: pCvMemStorage;     // contour hierarchy
  cns: pCvSeq;            // contour seq
  cax: PCvSeq;            // contour seq approximate
  con: PCvSeq;            // contour seq final (cns | cax)
  cnz: integer;           // contours count
  czx: integer;           // contours return max
  cce: string;            // contour external color hex
  cch: string;            // contour holes color hex
  cxl: integer;           // contour max level
  mom: PCvMoments;        // contour moments
  m00: double;            // contour m00 = area
  m10: double;            // contour moment
  m01: double;            // contour moment
  m11: double;            // contour moment
  m20: double;            // contour moment
  m02: double;            // contour moment
  cog: TCvPoint;          // contour center of gravity (centroid)
  ccx: double;            // contour cog x
  ccy: double;            // contour cog y
  cpe: double;            // contour perimeter (arclength)
  cam: double;            // contour filter area min
  cay: double;            // contour filter area max
//cvs: boolean;           // contour vertex show
  cvz: integer;           // contour vertex size (0=hide)
  cvc: string;            // contour vertex color
  cvx: string;            // contour vertex x
  cvy: string;            // contour vertex y
  cbx: integer;           // contour bounding box type 0=none 1=rectangle 2=rectangleangled
  cnb: boolean;           // contour no blobs
  // FITLINE
  line: TFloat4Vec;
  fvx, fvy: double;       // versor
  fx0, fy0: double;       // point of the fitting line
  lefty, righty: integer; //
  // GFTT
  gj0, gj1: TJSONArray;   // p0x,y jsonvector
  // HOUGLINEPROBABILISTIC
  lj0, lj1, lj2, lj3: TJSONArray; // p0x,y, p1x,y jsonvector
  rho: integer;           // rho,           resolution of parameter r in pixels, usually 1 pixel
  the: double ;           // theta,         resolution of  parameter ? in radians, usually 1 degree (CV_PI/180)
  mit: integer;           // threshold,     minimum number of intersections necessary to declare "detected" a line
  mll: double ;           // minLineLength, minimum number of pixels that can form a line (lines with less than this number of pixels are disregarded)
  mlg: double ;           // maxLineGap,    maximum gap between two points to be considered in the same line
  // HOUGCRCLE
  ira: double ;           // inverse ratio of the accumulator resolution
  mga: integer;           // mingap/distance
  xga: integer;           // maxgap/distance
  mra: integer;           // minradius
  xra: integer;           // maxradius
  pa1, pa2: integer;      // method-specific parameters
  // GOODFEATURETOTRACK
  gpv: array [0..1] of PPointsArr; // ?
  gr1: TPointsArr;                 // ?

  function kernel(IvRadius: integer): PIplConvKernel;
  begin
    if IvRadius <=0 then rad := 1 else rad := IvRadius;
    Result := cvCreateStructuringElementEx(rad*2+1, rad*2+1, rad, rad, CV_SHAPE_ELLIPSE);
  end;
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

  {$REGION 'src'}
  if not Assigned(IvSrc) then begin
    jo0.AddPair('warning', 'source iplimage is not assigned');
    Exit;
  end;
  if IvShow then begin
    cvNamedWindow('Source', CV_WINDOW_AUTOSIZE);
    cvShowImage('Source', IvSrc);
  end;
  {$ENDREGION}

  {$REGION 'dest'}
  o := cmr.Ope.Trim.ToLower;

    {$REGION 'Circle'}
           if 'circle'.Contains(o) then begin // Ocv.Circle,10,10,100,00ff00,1,0;
    // zip
    x0  := StrToIntDef (p[0],        0);
    y0  := StrToIntDef (p[1],        0);
    rad := StrToIntDef (p[2],      100);
    thk := StrToIntDef (p[3],        1);
    cli := LangParamDef(p[4], '00ff00');
    cfi := LangParamDef(p[5], '000000'); // non used by ocv, use agg instead
    shi := StrToIntDef (p[6],        0);

    // dest
    IvDest := OcvIplImageToColor(IvSrc);

    // do
    cvCircle(IvDest, cvPoint(x0, y0), rad, OcvColor(cli), thk, CV_AA, shi);

    // json
    jo0.AddPair('cX'       , TJSONNumber.Create( x0));
    jo0.AddPair('cY'       , TJSONNumber.Create( y0));
    jo0.AddPair('radius'   , TJSONNumber.Create(rad));
    jo0.AddPair('colorHex' , coh                    );
    jo0.AddPair('thickness', TJSONNumber.Create(thk));
    jo0.AddPair('shift'    , TJSONNumber.Create(shi));
    {$ENDREGION}

    {$REGION 'CirclesDetect (Houg)'}
  end else if 'circlesdetect'.Contains(o) then begin
    // zip
    thk := StrToIntDef  (p[0],         3);
    col := OcvColor     (p[1]           );
    smt := StrToBoolDef (p[2],     false); // *** REMOVE ***
    ira := StrToFloatDef(p[3],         1); // inverse ratio of the accumulator resolution to the image resolution
    mga := StrToIntDef  (p[4],        10); // minimum distance between the centers of the detected circles
    pa1 := StrToIntDef  (p[5],       100); // higher threshold of the two passed to the Canny edge detector (the lower one is twice smaller)
    pa2 := StrToIntDef  (p[6],       100); // accumulator threshold for the circle centers at the detection stage. The smaller it is, the more false circles may be detected
    mra := StrToIntDef  (p[7],         0); // minimum circle radius
    xra := StrToIntDef  (p[8],         0); // maximum circle radius
    shi := StrToIntDef  (p[9],         0);

    // gray
    gry := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 1);
    cvCvtColor(IvSrc, gry, CV_BGR2GRAY);

    // smooth the image *** REMOVE ***
    if smt then
      cvSmooth(gry, gry, CV_GAUSSIAN, 5, 5);

    // search for circles
    mem := cvCreateMemStorage(0); // memory storage for circles
    seq := cvHoughCircles(gry, mem, CV_HOUGH_GRADIENT, ira, mga, pa1, pa2, mra, xra);
    //cvReleaseMemStorage(mem);

    // dest
    IvDest := OcvIplImageToColor(IvSrc);

    // run through circles and draw them on the dest image
    for i := 0 to seq^.total - 1 do begin
      fls := pFloatArray(cvGetSeqElem(seq, i));
      x0  := cvRound(fls^[0]);
      y0  := cvRound(fls^[1]);
      rad := cvRound(fls^[2]);
      pnt := CvPoint(x0, y0);
      cvCircle(IvDest, pnt, rad, col, thk, CV_AA, shi);

      // json
      jo0.AddPair('cX'       , TJSONNumber.Create( x0));
      jo0.AddPair('cY'       , TJSONNumber.Create( y0));
    end;
    {$ENDREGION}

    {$REGION 'Contours'}
  end else if 'contours'.Contains(o) then begin // Ocv.Contours,1,00ff00,00ffff,-1,0,0.1,1,10,!,!,!,!,!;
    // zip
    thk := StrToIntDef  (p[ 0],        1); // thickness
    cce := LangParamDef (p[ 1], '00ff00'); // colorexternal
    cch := LangParamDef (p[ 2], '00ffff'); // colorholes
    cxl := StrToIntDef  (p[ 3],       -1); // maxlevel
    cab := StrToBoolDef (p[ 4],    false); // approx
    caa := StrToFloatDef(p[ 5],      0.1); // approxaccuracy (% of contour perimeter)
  //cob := StrToBoolDef (p[ 6],     true); // openalso                                 (filter)
    cfd := StrToBoolDef (p[ 6],     true); // filtered only draw
    czx := StrToIntDef  (p[ 7],       10); // max number of contours to be detected    (filter)
    cam := StrToFloatDef(p[ 8], 0.1 * IvSrc.width * IvSrc.height); // contour area min (filter)
    cay := StrToFloatDef(p[ 9], 0.9 * IvSrc.width * IvSrc.height); // contour area max (filter)
  //cvs := StrToBoolDef (p[10],    false); // vertex show
    cvz := StrToIntDef  (p[10],        6); // vertex size (0=hide)
    cvc := LangParamDef (p[11], 'ff0000'); // vertex color
    cbx := StrToIntDef  (p[12],        1); // bounding box type
    cnb := StrToBoolDef (p[13],    false); // no blobs

    // gray
    gry := OcvIplImageToGray(IvSrc);

    // contours
    cnh := cvCreateMemStorage(0);
    cvClearMemStorage(cnh);
    cns := AllocMem(SizeOf(TCvSeq));
    cnz := cvFindContours(gry, cnh, @cns, sizeof(TCvContour), CV_RETR_EXTERNAL{CV_RETR_LIST}, CV_CHAIN_APPROX_SIMPLE, cvPoint(0, 0));
    jo0.AddPair('contourTotal', TJSONNumber.Create(cnz));

    // dest
    IvDest := OcvIplImageToColor(IvSrc);
    if cnb then cvZero(IvDest);

    // draw
    cvInitFont(@fon, CV_FONT_HERSHEY_PLAIN, 0.8, 0.8);
    if cnz <= 0 then begin
      cvPutText(IvDest, 'no contours', cvPoint(0, 10), @fon, OcvColor('00ff00'));
      jo0.AddPair('info', 'no contours');
      jo0.AddPair('hasFindings', TJSONBool.Create(false));
      jo0.AddPair('defect', 'None');

    end else begin
      // contoursfiltering
      jo0.AddPair('filterAreaMin', TJSONNumber.Create(cam));
      jo0.AddPair('filterAreaMax', TJSONNumber.Create(cay));

      // contoursvector
      cja := TJSONArray.Create;

      // contourswalk
      cix := -1;
      cfx := -1;
      cfu := false;
      while Assigned(cns) do begin
        // new
        Inc(cix);

        // contoursmax
        if cix > czx then begin
          cvPutText(IvDest, c_str('contours more than ' + czx.ToString), cvPoint(0, 10), @fon, OcvColor('00ff00'));
          jo0.AddPair('warning', 'contours more than ' + czx.ToString);
          Break;
        end;

        // json
        cje := TJSONObject.Create;
        cje.AddPair('contourId'  , TJSONNumber.Create(cix));

        // closed
        clo := CV_IS_SEQ_CLOSED(cns);
        cje.AddPair('closed', TJSONBool.Create(clo));

        // approx
        cje.AddPair('approximate', TJSONBool.Create(cab));
        cje.AddPair('approximateAccuracy', TJSONNumber.Create(caa));
        if cab then begin
          con := cvApproxPoly(cns, SizeOf(TCvContour), cnh, CV_POLY_APPROX_DP, {cvContourPerimeter(cns) *} caa, 0);
        end else
          con := cns;

        // perimeter
        cpe := cvArcLength(con, CV_WHOLE_SEQ, true.ToInteger);
        cje.AddPair('perimeter', TJSONNumber.Create(cpe));

        // area
        are := cvContourArea(con, CV_WHOLE_SEQ);
        cje.AddPair('area'     , TJSONNumber.Create(are));

        // moments
        OcvContourMoments(con, m00, m10, m01, m11, m20, m02, cog);
        cje.AddPair('m00'      , TJSONNumber.Create(m00));// =are
        cje.AddPair('m01'      , TJSONNumber.Create(m01));
        cje.AddPair('m10'      , TJSONNumber.Create(m10));
        cje.AddPair('m11'      , TJSONNumber.Create(m10));
        cje.AddPair('m20'      , TJSONNumber.Create(m20));
        cje.AddPair('m02'      , TJSONNumber.Create(m02));
        cje.AddPair('cogX'     , TJSONNumber.Create(cog.x));
        cje.AddPair('cogY'     , TJSONNumber.Create(cog.y));

        // filters
        cfu := (are >= cam) and (are <= cay);
        cje.AddPair('meetFilters', TJSONBool.Create(cfu));
        if cfu then Inc(cfx);

        // draw
        if cfd and cfu then begin
          // curve
          if thk > 0 then
            cvDrawContours(IvDest, con, OcvColor(cce), OcvColor(cch), cxl, thk, CV_AA, cvPoint(0, 0)); // warning: findcontours destroy the input image

          // vertex
          if cvz > 0 then begin
            cvx := '';
            cvy := '';
            for i := 0 to con.total - 1 do begin
              ptp := CV_GET_SEQ_ELEM(sizeof(TCvPoint), con, i);
              cvx := cvx + ',' + ptp.x.ToString;
              cvy := cvy + ',' + ptp.y.ToString;
              cvCircle(IvDest, cvPoint(ptp.x, ptp.y), cvz, OcvColor(cvc), 1);
            end;
            Delete(cvx, 1, 1);
            Delete(cvy, 1, 1);
            cje.AddPair('vertexXCsv', TJSONNumber.Create(cvx));
            cje.AddPair('vertexYCsv', TJSONNumber.Create(cvy));
          end;

          // fittingstuff
          case cbx of
            // noboundinbox
            0: ;

            // boundingbox
            1: begin
              rec := cvBoundingRect(con);
              cje.AddPair('boundingBoxCenter', Format('%d, %d', [rec.x + rec.width div 2, rec.y + rec.height div 2]));
              cje.AddPair('boundingBoxWH'    , Format('%d, %d', [rec.width, rec.height]));

              cvRectangle(IvDest, cvPoint(rec.x, rec.y), cvPoint(rec.x + rec.width, rec.y + rec.height), CV_RGB(255, 255, 0), 1);
            end;

            // boundingboxtilted
            2: begin
              box := cvMinAreaRect2(con);
              cje.AddPair('boundingBoxTiltedCenter', Format('%f, %f', [box.center.x  , box.center.y   ]));
              cje.AddPair('boundingBoxTiltedWH'    , Format('%f, %f', [box.size.width, box.size.height]));

              cvBoxPoints(box, bvx);
              pt0.x := cvRound(bvx[3].x);
              pt0.y := cvRound(bvx[3].y);
              for i := 0 to 3 do begin
                pt1.x := cvRound(bvx[i].x);
                pt1.y := cvRound(bvx[i].y);
                cvLine(IvDest, pt0, pt1, CV_RGB(255, 255, 0), 1, CV_AA);
                pt0 := pt1;
              end;
            end;

            // linefit
            3: begin
              cvFitLine(con, CV_DIST_L2, 0.01, 0.01, 0.01, fli);
              cje.AddPair('lineFit', Format('%f', [fli]));

              fvx := fli{line[0]};
              fvy := 1 - fli{line[1]};
              fx0 := 10{line[2]};
              fy0 := 10{line[3]};
              lefty  := Round((-x * fvy / fvx) + fy0);
              righty := Round(((IvSrc.width - x) * fvy / fvx) + fy0);
              pt0 := cvPoint(IvSrc.width - 1, righty);
              pt1 := cvPoint(0, lefty);
              cvLine(IvDest, pt0, pt1, CV_RGB(255, 255, 0), 2, CV_AA);
            end;
          end;

          // classify
          // ...
        end;

        // elementadd
        cja.AddElement(cje);

        // next
        cns := cns^.h_next;
      end;

      // contourselectedzdd
      jo0.AddPair('contourSelected', TJSONNumber.Create(cfx + 1));
      jo0.AddPair('hasFindings', TJSONBool.Create((cfx + 1) > 0));
      jo0.AddPair('defect', 'Unknown');

      // contoursvectoradd
      jo0.AddPair('contourVector', cja);
    end;
    cvReleaseMemStorage(cnh);
    {$ENDREGION}

    {$REGION 'Corners'}
  end else if 'cornerharris'.Contains(o) then begin // Harris Corner Dectection (HCD)
    jo0.AddPair('warning', 'not implemented');
    {$ENDREGION}

    {$REGION 'Crop'}
  end else if 'crop'.Contains(o) then begin
    // zip
    rec.x      := StrToIntDef  (p[0],            0);
    rec.y      := StrToIntDef  (p[1],            0);
    rec.width  := StrToIntDef  (p[2], IvSrc.width );
    rec.height := StrToIntDef  (p[3], IvSrc.height);
    jo0.AddPair('x', TJSONNumber.Create(rec.x));
    jo0.AddPair('y', TJSONNumber.Create(rec.y));
    jo0.AddPair('w', TJSONNumber.Create(rec.width));
    jo0.AddPair('h', TJSONNumber.Create(rec.height));

    // prepare
    cvSetImageROI(IvSrc, rec); // say what the source region is

    // dest
    IvDest := cvCreateImage(cvSize(rec.Width, rec.Height), IvSrc^.depth, IvSrc^.nChannels);

    // do the copy
    cvCopy(IvSrc, IvDest);

    // release
    cvResetImageROI(IvSrc);
    {$ENDREGION}

    {$REGION 'EdgeDetect (Canny)'}
  end else if 'edgedetect'.Contains(o) then begin // Ocv.EdgeDetect, 50, 200, 3;
    // check
    //Assert(IvSrc.nChannels = 1, 'Warning: CvCanny only handles gray scale images');

    // zip
    tlo := StrToFloatDef(p[0],  50);
    thi := StrToFloatDef(p[1], 200);
    apz := StrToIntDef  (p[2],   3);

    // dest
    IvDest := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 1);

    // do
    cvCanny(IvSrc, IvDest, tlo, thi, apz);
    {$ENDREGION}

    {$REGION 'Gftt (GoodFeatureToTrack)'}
  end else if 'gftt,goodfeaturetotrack'.Contains(o) then begin
    // zip
    pa1 := StrToIntDef  (p[0],         100);
    pa2 := StrToIntDef  (p[1],         250); // count
    dia := StrToIntDef  (p[2],           8); // diameter

    // dest
    IvDest := OcvIplImageToColor(IvSrc);
    cvZero(IvDest);

    // tmp
    gry := OcvIplImageToGray(IvSrc);
    eig := cvCreateImage(cvGetSize(gry), 32, 1); // IPL_DEPTH_32F
    tmp := cvCreateImage(cvGetSize(gry), 32, 1);

    // do
    gpv[0] := @gr1[0];
    cvGoodFeaturesToTrack(gry, eig, tmp, @gpv[0][0], @pa1, 0.05, 10, nil, 5, 0, 0.09);
    cvFindCornerSubPix(gry, @gpv[0][0], pa2, cvSize(5, 5), cvSize(-1, -1), cvTermCriteria(CV_TERMCRIT_ITER or CV_TERMCRIT_EPS, 20, 0.03));

    jo0.AddPair('gfttDetected', TJSONNumber.Create(pa1));

    // draw
    gj0 := TJsonArray.Create();
    gj1 := TJsonArray.Create();
    for i := 0 to pa1 - 1 do begin
      pnt := cvPointFrom32f(gpv[0][i]);
    //cvCircle(IvDest, cvPointFrom32f(gpv[0][i]), dia div 4, CV_RGB(0  , 255, 255), -1, 8, 0);
      cvCircle(IvDest, cvPointFrom32f(gpv[0][i]), dia div 2, CV_RGB(255, 255, 255), -1, 8, 0);

      gj0.Add(pnt.x);
      gj1.Add(pnt.y);
    end;
    if gj0.Count > 0 then begin
      jo0.AddPair('pX', gj0);
      jo0.AddPair('pY', gj1);
    end;
  //gj0.Free;
  //gj1.Free;

    // release
    cvReleaseImage(gry);
    cvReleaseImage(eig);
    cvReleaseImage(tmp);
    {$ENDREGION}

    {$REGION 'Line'}
  end else if 'line'.Contains(o) then begin // Ocv.Line,10,10,100,200,00ff00,1,0;
    // zip
    x0  := StrToIntDef (p[0],        0);
    y0  := StrToIntDef (p[1],        0);
    x1  := StrToIntDef (p[2],      100);
    y1  := StrToIntDef (p[3],      100);
    coh := LangParamDef(p[4], '00ff00');
    thk := StrToIntDef (p[5],        1);
    shi := StrToIntDef (p[6],        0);

    w   := Abs(x1 - x0);
    h   := Abs(y1 - y0);

    // dest
    IvDest := OcvIplImageToColor(IvSrc);

    // do
    cvLine(IvDest, cvPoint(x0, y0), cvPoint(x1, y1), OcvColor(coh), thk, CV_AA, shi);

    // json
    jo0.AddPair('p0X'      , TJSONNumber.Create( x0));
    jo0.AddPair('p0Y'      , TJSONNumber.Create( y0));
    jo0.AddPair('p1X'      , TJSONNumber.Create( x1));
    jo0.AddPair('p1Y'      , TJSONNumber.Create( y1));
    jo0.AddPair('w'        , TJSONNumber.Create(  w));
    jo0.AddPair('h'        , TJSONNumber.Create(  h));
    jo0.AddPair('colorHex' , coh                    );
    jo0.AddPair('thickness', TJSONNumber.Create(thk));
    jo0.AddPair('shift'    , TJSONNumber.Create(shi));
    {$ENDREGION}

    {$REGION 'LinesDetect (Houg)'}
  end else if 'linesdetect'.Contains(o) then begin
    // zip       
    thk := StrToIntDef  (p[ 0],         3);
    col := OcvColor     (p[ 1]           );
    can := StrToBoolDef (p[ 2],      true); // *** REMOVE ***
    tlo := StrToFloatDef(p[ 3],        50);
    thi := StrToFloatDef(p[ 4],       200);
    apz := StrToIntDef  (p[ 5],         3);
    rho := StrToIntDef  (p[ 6],         1); // 1 pixel
    the := StrToFloatDef(p[ 7], CV_PI/180); // 1 deg
    mit := StrToIntDef  (p[ 8],         2); // minimum rho-theta plots intersections
    mll := StrToFloatDef(p[ 9],         4); // minimum line length
    mlg := StrToFloatDef(p[10],         2); // maximum points gap

    // edgedetectionornot *** REMOVE ***
    gry := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 1);
    if can then    
      cvCanny(IvSrc, gry, tlo, thi, apz) // *** REMOVE ***
    else if IvSrc.nChannels = 3 then
      cvCvtColor(IvSrc, gry, CV_BGR2GRAY)
    else
      gry := cvCloneImage(IvSrc);

    // linesfind
    mem := cvCreateMemStorage(0); 
    seq := nil;
    seq := cvHoughLines2(gry, mem, CV_HOUGH_PROBABILISTIC, rho, the, mit, mll, mlg);
    //cvReleaseMemStorage(mem);

    jo0.AddPair('lineDetected', TJSONNumber.Create(seq^.total));

    // dest
    IvDest := OcvIplImageToColor(IvSrc);
      
    // linesdraw
    lj0 := TJsonArray.Create();
    lj1 := TJsonArray.Create();
    lj2 := TJsonArray.Create();
    lj3 := TJsonArray.Create();
    for i := 0 to seq^.total - 1 do begin
      pta := pCvPointArray(cvGetSeqElem(seq, i));
      cvLine(IvDest, pta^[0], pta^[1], col, thk, CV_AA, 0); // CV_RGB(255, 0, 0)

      lj0.Add(pta[0].x);
      lj1.Add(pta[0].y);
      lj2.Add(pta[1].x);
      lj3.Add(pta[1].y);
    end;
    if lj0.Count > 0 then begin
      jo0.AddPair('p0X', lj0);
      jo0.AddPair('p0Y', lj1);
      jo0.AddPair('p1X', lj2);
      jo0.AddPair('p1Y', lj3);
    end;
  //lj0.Free;
  //lj1.Free;
  //lj2.Free;
  //lj3.Free;

    // release
    cvReleaseImage(gry);
    {$ENDREGION}

    {$REGION 'MinCircle'}
  end else if 'mincircle'.Contains(o) then begin
    // dest
    IvDest := OcvIplImageToColor(IvSrc);

    // do
    cvMinEnclosingCircle(@ptm, @cen, @rad);
    cei.x := cvRound(cen.x);
    cei.y := cvRound(cen.y);
    cvCircle(IvDest, cei, cvRound(rad), OcvColor('ffff00'), 1, CV_AA, 0);
    {$ENDREGION}

    {$REGION 'MinRectangle'}
  end else if 'minrectangle'.Contains(o) then begin
    // zip
    sz1 := StrToIntDef  (p[0],           3);

    // dest
    IvDest := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 3);

    // do
    // ...
    {$ENDREGION}

    {$REGION 'Morphology'}
  end else if 'erode,dilate'.Contains(o) then begin
    // zip
    rad := StrToIntDef(p[0], 1); // kernel radius
    ite := StrToIntDef(p[1], 1); // iterations

    // kernel
    ker := kernel(rad);

    // dest
    IvDest := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 3);

    // do
         if o = 'erode' then      // Erode,2,1
      cvErode       (IvSrc, IvDest, ker, ite)
    else if o = 'dilate' then     // Dilate,2,1
      cvDilate      (IvSrc, IvDest, ker, ite);

    // release
    cvReleaseStructuringElement(ker);
    {$ENDREGION}

    {$REGION 'MorphologyEx'}
  end else if 'open,close,gradient,tophat,blackhat'.Contains(o) then begin
    // zip
    rad := StrToIntDef(p[0], 1);
    ite := StrToIntDef(p[1], 1);

    // kernel
    ker := kernel(rad);

    // dest
    IvDest := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 3);

    // gray
    gry := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 1);

    // do
         if o = 'open' then       // Open,2,1
      cvMorphologyEx(IvSrc, IvDest, gry, ker, CV_MOP_OPEN    , ite)
    else if o = 'close' then      // Close,2,1
      cvMorphologyEx(IvSrc, IvDest, gry, ker, CV_MOP_CLOSE   , ite)
    else if o = 'gradient' then   // Gradient,2,1
      cvMorphologyEx(IvSrc, IvDest, gry, ker, CV_MOP_GRADIENT, ite)
    else if o = 'tophat' then     // TopHat,2,1
      cvMorphologyEx(IvSrc, IvDest, gry, ker, CV_MOP_TOPHAT  , ite)
    else if o = 'blackhat' then   // BlacHhat,2,1
      cvMorphologyEx(IvSrc, IvDest, gry, ker, CV_MOP_BLACKHAT, ite);

    // release
    cvReleaseStructuringElement(ker);
    cvReleaseImage(gry);
    {$ENDREGION}

    {$REGION 'PyrDown'}
  end else if 'pyrdown'.Contains(o) then begin // Ocv.PyrDown,!;
    // zip
    kid := StrToIntDef(p[0], CV_GAUSSIAN_5x5);
    ite := StrToIntDef(p[1],               1);

    siz := cvSize((IvSrc^.width and -2), (IvSrc^.height and -2));
    tmp := cvCloneImage(IvSrc); // make a copy of input image
  //gry := cvCreateImage(siz, 8, 1); // halfsize
    pyr := cvCreateImage(cvSize(siz.width div 2, siz.height div 2), IvSrc^.depth, IvSrc^.nChannels);

    // do
    //for i := 0 to ite - 1 do begin
      cvPyrDown(tmp, pyr, kid);
    //tmp := pyr;
    //end;

    // dest
    IvDest := cvCloneImage(pyr);

    // release
    cvReleaseImage(tmp);
  //cvReleaseImage(gry);
    cvReleaseImage(pyr);

    // json
    jo0.AddPair('kernel', 'gaussian 5x5')
    {$ENDREGION}

    {$REGION 'PyrUp'}
  end else if 'pyrup'.Contains(o) then begin // Ocv.PyrUp,!;
    // zip
    kid := StrToIntDef(p[0], CV_GAUSSIAN_5x5);
    ite := StrToIntDef(p[1],               1);

    siz := cvSize((IvSrc^.width and -2), (IvSrc^.height and -2));
    tmp := cvCloneImage(IvSrc); // make a copy of input image
  //gry := cvCreateImage(siz, 8, 1); // halfsize
    pyr := cvCreateImage(cvSize(siz.width * 2, siz.height * 2), IvSrc^.depth, IvSrc^.nChannels);

    // do
    //for i := 0 to ite - 1 do begin
      cvPyrUp(tmp, pyr, kid);
    //tmp := pyr;
    //end;

    // dest
    IvDest := cvCloneImage(pyr);

    // release
    cvReleaseImage(tmp);
  //cvReleaseImage(gry);
    cvReleaseImage(pyr);

    // json
    jo0.AddPair('kernel', 'gaussian 5x5')
    {$ENDREGION}

    {$REGION 'PyrDownUp (noise reduce)'}
  end else if 'pyrdownup'.Contains(o) then begin // Ocv.PyrDownUp,!,!;
    // zip
    kid := StrToIntDef(p[0], CV_GAUSSIAN_5x5);
    ite := StrToIntDef(p[1],               1);

    siz := cvSize((IvSrc^.width and -2), (IvSrc^.height and -2));
    tmp := cvCloneImage(IvSrc); // make a copy of input image
  //gry := cvCreateImage(siz, 8, 1); // halfsize
    pyr := cvCreateImage(cvSize(siz.width div 2, siz.height div 2), IvSrc^.depth, IvSrc^.nChannels);

    // do
    for i := 0 to ite - 1 do begin
      cvPyrDown(tmp, pyr, kid);
      cvPyrUp  (pyr, tmp, kid);
    end;

    // dest
    IvDest := cvCloneImage(tmp);

    // release
    cvReleaseImage(tmp);
  //cvReleaseImage(gry);
    cvReleaseImage(pyr);

    // json
    jo0.AddPair('kernel', 'gaussian 5x5')
    {$ENDREGION}

    {$REGION 'Smoot'}
  end else if 'smoot'.Contains(o) then begin
    // zip
    met := StrToIntDef  (p[0], CV_GAUSSIAN); // CV_BLUR_NO_SCALE = 0
    sz1 := StrToIntDef  (p[1],           3); // CV_BLUR          = 1
    sz2 := StrToIntDef  (p[2],           3); // CV_GAUSSIAN      = 2
    sd1 := StrToIntDef  (p[3],           0); // CV_MEDIAN        = 3
    sd2 := StrToIntDef  (p[4],           0); // CV_BILATERAL     = 4

    // dest
    IvDest := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 3);

    // do
    cvSmooth(IvSrc, IvDest, met, sz1, sz2, sd1, sd2);
    {$ENDREGION}

    {$REGION 'TextOut'}
  end else if 'textout'.Contains(o) then begin
    // zip
    x   := StrToIntDef (p[0],        0);
    y   := StrToIntDef (p[1],       10);
    h   := StrToIntDef (p[2],       10); // ignored
    coh := LangParamDef(p[3], '00ff00');
    txt := LangParamDef(p[4],      '?');

    // dest
    IvDest := cvCloneImage(IvSrc);

    // do
    cvInitFont(@fon, CV_FONT_HERSHEY_PLAIN , 0.8, 0.8); // 10
    cvPutText(IvDest, c_str(txt), cvPoint(x, y), @fon, OcvColor(coh));

    // json
    jo0.AddPair('x'       , TJSONNumber.Create(x));
    jo0.AddPair('y'       , TJSONNumber.Create(y));
    jo0.AddPair('h'       , 'ignored'            );
    jo0.AddPair('ColorHex', coh                  );
    {$ENDREGION}

    {$REGION 'Threshold'}
  end else if 'threshold'.Contains(o) then begin // Ocv.Threshold,50,250,0;
    // zip
    thr := StrToIntDef(p[0],              127);
    max := StrToIntDef(p[1],              255);
    typ := StrToIntDef(p[2], CV_THRESH_BINARY);

    // src
    gry := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 1);
    cvCvtColor(IvSrc, gry, CV_BGR2GRAY);

    // dest
    IvDest := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 1);

    // do
    cvThreshold(gry, IvDest, thr, max, typ);

    // release
    cvReleaseImage(gry);
    {$ENDREGION}

    {$REGION 'ThresholdAdaptive'}
  end else if 'thresholdadaptive'.Contains(o) then begin     // Ocv.ThresholdAdaptive,250,1,0,7,1;
    max := StrToIntDef(p[0],                           255); // non-zero value assigned to the pixels for which the condition is satisfied
    met := StrToIntDef(p[1], CV_ADAPTIVE_THRESH_GAUSSIAN_C);
    typ := StrToIntDef(p[2],              CV_THRESH_BINARY);
    apz := StrToIntDef(p[3],                             7); // size of a pixel neighborhood that is used to calculate a threshold value for the pixel: 3, 5, 7, and so on
    pa1 := StrToIntDef(p[4],                             1); // constant subtracted from the mean or weighted mean (see the details below), normally, it is positive but may be zero or negative as well

    // src
    gry := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 1);
    cvCvtColor(IvSrc, gry, CV_BGR2GRAY);

    // tmp
    tmp := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 1);

    // do
    cvAdaptiveThreshold(gry, tmp, max, met, typ, apz, pa1);

    // dest
    IvDest := cvCreateImage(cvGetSize(IvSrc), IPL_DEPTH_8U, 3);
    cvCvtColor(tmp, IvDest, CV_GRAY2BGR);

    // release
    cvReleaseImage(gry);
    {$ENDREGION}

    {$REGION 'Invalid'}
  end else begin
    IvDest := cvCloneImage(IvSrc);
    cvInitFont(@fon, CV_FONT_HERSHEY_PLAIN , 0.8, 0.8); // 10
    cvPutText(IvDest, c_str('invalid operation: ' + o), cvPoint(2, 10), @fon, CvScalar($00, $ff, $00));
    jo0.AddPair('warning', 'invalid command: ' + o);
  end;
    {$ENDREGION}

    {$REGION 'Show'}
  if IvShow then begin
    cvNamedWindow('Destination', CV_WINDOW_AUTOSIZE);
    cvShowImage('Destination', IvDest);
  end;
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'wait'}
  if IvShow then begin
    // wait
    while true do begin
      cas := cvWaitKey(33);
      if cas = 32 then
        Break;
    end;

    // destroy
    cvDestroyAllWindows();
  end;
  {$ENDREGION}

  {$REGION 'json'}
  IvJson.AddPair(Format('step%d', [IvStep]), jo0);
//jo0.Free;
  {$ENDREGION}

end;
{$ENDREGION}

initialization

{$REGION 'Colors'}
  cvblack   := CvRgb(  0,   0,   0);
  cvred     := CvRgb(255,   0,   0);
  cvgreen   := CvRgb(  0, 255,   0);
  cvblue    := CvRgb(   0,   0,255);
  cvyellow  := CvRgb(255, 255,   0);
  cvorange  := CvRgb(255, 127,   0);
{$ENDREGION}

{$REGION 'Fonts'}                                         // height
  cvInitFont(@cvfn08p, CV_FONT_HERSHEY_PLAIN , 0.8, 0.8); // 10
  cvInitFont(@cvfn10p, CV_FONT_HERSHEY_PLAIN , 1.0, 1.0); // 13
  cvInitFont(@cvfn12p, CV_FONT_HERSHEY_PLAIN , 1.2, 1.2); // 16
  cvInitFont(@cvfn06d, CV_FONT_HERSHEY_DUPLEX, 0.6, 0.6); // 18
  cvInitFont(@cvfn08d, CV_FONT_HERSHEY_DUPLEX, 0.8, 0.8); // 24
  cvInitFont(@cvfn10d, CV_FONT_HERSHEY_DUPLEX, 1.0, 1.0); // 29
{$ENDREGION}

{$REGION 'Storage'}
  cvms := CvCreateMemStorage(0);
{$ENDREGION}

{$REGION 'Sequence'}
  cvq1 := AllocMem(SizeOf(TCvSeq));
  cvq2 := AllocMem(SizeOf(TCvSeq));
{$ENDREGION}

finalization

{$REGION 'Sequence'}
//  FreeMem(cvq1);
//  FreeMem(cvq2);
{$ENDREGION}

{$REGION 'Storage'}
  cvReleaseMemStorage(cvms);
{$ENDREGION}

{$REGION 'Image'}
  cvReleaseImage(cvsi);
  cvReleaseImage(cvgi);
  cvReleaseImage(cvci);
  cvReleaseImage(cvqi);
  cvReleaseImage(cvti);
  cvReleaseImage(cvmi);
  cvReleaseImage(cvui);
  cvReleaseImage(cvri);
  cvReleaseImage(cvhi);
{$ENDREGION}

{$REGION 'Windows'}
  cvDestroyAllWindows;
{$ENDREGION}

{$REGION 'Zzz'}
(*
procedure TFormCvRecipe.CalcParameter(IvIplImage: PIplImage);
var
  a, t: integer; // area, counter
  sum: TCvScalar;
  avg: TCvScalar;
  pxColor: TCvScalar;
  subrec, subrecBW: PIplImage;
  sx, sy, sxf, syf: PIplImage;
  phi, mag, outi: PIplImage;
begin
  // create iplimages
  FImageCorners := CvCreateImage(cvGetSize(IvIplImage), 8, 1);
  FImageGray := CvCreateImage(cvGetSize(IvIplImage), 8, 1);
  //
  cvCvtColor(IvIplImage, FImageGray, CV_BGR2GRAY);
  cvCanny(@FImageGray, @FImageCorners, 50, 70, 3);
  a := IvIplImage.ImageSize;
  BottomFrame.LogInfoFmt('Image size = %f x %f', [FImageCorners.Width, FImageCorners.Height]);
  t := CvCountNonZero(@FImageCorners);
  BottomFrame.LogInfoFmt('Corners density = %f', [t / a]);
  avg := CvAvg(@FImageGray);
  BottomFrame.LogInfoFmt('Average brightness = %f', [avg.val[0]]);
  subrec := CvCreateImage(cvGetSize(IvIplImage), 8, 1);
  subrecBW := CvCreateImage(cvGetSize(IvIplImage), 8, 1);
  cvCopy(@FImageGray, @subrec, 0);
  pxColor := CvGet1D(@subrec, round(subrec.Height/2-1) * subrec.WidthStep + round(subrec.Width/2-1));
  cvInRangeS(@subrec, pxColor, CvuScalar(pxcolor.val[0]+1, 0, 0, 0), @subrecBW);
  t := CvCountNonZero(@subrecBW); // the total pixels in the area, comprised the central one
  BottomFrame.LogInfoFmt('Autocorrelation = ', [t / a]);
  // visualizza magnitudo
  sx  := CvCreateImage(cvGetSize(FImageGray), IPL_DEPTH_16S, 1);
  sy  := CvCreateImage(cvGetSize(FImageGray), IPL_DEPTH_16S, 1);
  sxf := CvCreateImage(cvGetSize(FImageGray), IPL_DEPTH_32F, 1);
  syf := CvCreateImage(cvGetSize(FImageGray), IPL_DEPTH_32F, 1);
  phi := CvCreateImage(cvGetSize(FImageGray), IPL_DEPTH_32F, 1);
  mag := CvCreateImage(cvGetSize(FImageGray), IPL_DEPTH_32F, 1);
  cvSetZero(@phi);
  cvSetZero(@mag);
  cvSobel(@FImageGray, @sx, 1, 0 ,3);
  cvSobel(@FImageGray, @sy, 0, 1 ,3);
  cvConvertScale(@sx, @sxf, 1, 0);
  cvConvertScale(@sy, @syf, 1, 0);
  cvCartToPolar(@syf, @sxf, @mag, @phi, 0);
  //mag = IplImage * , Magnitude
  //phi = IplImage * , edges-orientation
  cvReleaseImage(@sx);
  cvReleaseImage(@sy);
  cvReleaseImage(@sxf);
  cvReleaseImage(@syf);
  avg := CvAvg(@phi);
  BottomFrame.LogInfoFmt('Average edges orientation = %f', [avg.val[0]]);
  avg := CvAvg(@mag);
  BottomFrame.LogInfoFmt('Average magnitudo = %f', [avg.val[0]]);
  // release
  cvReleaseImage(@mag);
  cvReleaseImage(@phi);
  cvReleaseImage(@subrec);
  cvReleaseImage(@subrecBW);
  cvReleaseImage(@FImageGray);
  cvReleaseImage(@FImageCorners);
end;

function  TCvRec.DbaInit(var IvFbk: string): boolean;
var
  q, k: string;
  x: TDbaCls;
begin
  x := TDbaCls.Create(FDManager);
  try

    {$REGION 'Dba'}
    x.DbaCreateIfNotExists('DbaCv', IvFbk);
    {$ENDREGION}

    {$REGION 'TblRecipe'}
    q := ''
    + sLineBreak + '   FldId                 int          NOT NULL'
    + sLineBreak + ' , FldPId                int          NOT NULL'
    + sLineBreak + ' , FldState              varchar(16)      NULL'
    + sLineBreak + ' , FldOrganization       varchar(32)      NULL'
    + sLineBreak + ' , FldOwner              varchar(32)      NULL'
    + sLineBreak + ' , FldRecipe             varchar(32)  NOT NULL'
    + sLineBreak + ' , FldDescription        varchar(256)     NULL'
    + sLineBreak + ' , FldCode               varchar(max)     NULL'
    + sLineBreak + ' , FldNote               varchar(256)     NULL'
    ;
    if x.TblCreateIfNotExists('DbaCv', 'TblRecipe', q, IvFbk) then begin
      x.RecDefaultInsert('DbaCv.dbo.TblRecipe', IvFbk);
      x.RecTestInsert('DbaCv.dbo.TblRecipe', ['FldRecipe', 'FldCode'], ['RecipeTest', '-- cv test'], IvFbk);
    end;
    {$ENDREGION}

    {$REGION 'End'}
    IvFbk  := 'Cv database initialized';
    Result := true;
    {$ENDREGION}

  finally
    x.Free;
  end;
end;
*)
{$ENDREGION}

{$REGION 'Zzz'}
(*
{$REGION 'TCvRecipeRec'}
function  TCvRecipeRec.Init(IvOrganization, IvOwner, IvCvRecipe: string; var IvFbk: string): boolean;
begin
  Id           := ID_DEFAULT    ;
  PId          := PID_DEFAULT   ;
  State        := sta.ACTIVE.Key;
  Organization := IvOrganization;
  Owner        := IvOwner       ;
  Recipe       := IvCvRecipe    ;
  Description  := ''            ;
  Code         := ''            ;
  Note         := ''            ;

  IvFbk := 'Cv Recipe initialized';
  Result := true;
end;

function  TCvRecipeRec.ToJson: string;
var
  x: TSuperRttiContext;
begin
  x := TSuperRttiContext.Create;
  try
    Result := x.AsJson<TCvRecipeRec>(Self).AsJson;
  finally
    x.Free;
  end;
end;

function  TCvRecipeRec.HasKey(var IvFbk: string): boolean;
begin
  Result := Id > 0; // -1
  if Result then
    IvFbk := Format('Cv Recipe has key Id %d', [Id])
  else
    IvFbk := 'Cv Recipe has no valid key';
end;

function  TCvRecipeRec.IsValid(var IvFbk: string): boolean;
begin
  // check i
  Result := HasKey(IvFbk);
  if not Result then
    Exit;

  // check ii
  Result := Recipe <> '';
  if not Result then begin
    IvFbk := 'Cv Recipe is not valid';
    Exit;
  end;

  // end
  IvFbk := 'Cv Recipe is valid';
end;

function  TCvRecipeRec.DbaExists(var IvFbk: string): boolean;
var
  x: TDbaCls;
  w: string;
begin

  {$REGION 'Check'}
  Result := HasKey(IvFbk);
  if not Result then
    Exit;
  {$ENDREGION}

  {$REGION 'Dba'}
  x := TDbaCls.Create(FDManager);
  try
    w := Format('FldOrganization = ''%s'' and FldOwner = ''%s'' and FldId = %d', [Organization, Owner, Id]);
    Result := x.RecExists('DbaCv.dbo.TblRecipe', w, IvFbk);
  finally
    x.Free;
  end;
  {$ENDREGION}

end;

function  TCvRecipeRec.DbaSelect(var IvFbk: string; IvInsertIfNotExist: boolean = false): boolean;
var
  n, q: string; // name
  x: TDbaCls;
  d: TDataSet;
begin

  {$REGION 'Check'}
  Result := HasKey(IvFbk);
  if not Result then
    Exit;
  {$ENDREGION}

  {$REGION 'InsertIfNotExist'}
  if IvInsertIfNotExist then
    if not DbaExists(IvFbk) then begin
      n := IfNxRnd(Recipe);
      Result := Init(Organization, Owner, n, IvFbk);
      Result := DbaInsert(IvFbk);
      if not Result then begin
        glog.Log(IvFbk);
        Exit;
      end else
        LogFmt('Cv Recipe Id %d does not exist, insert a default one before select it', [Id]);
    end;
  {$ENDREGION}

  {$REGION 'Dba'}
  x := TDbaCls.Create(FDManager);
  try

    {$REGION 'Ds'}
    q := Format('select * from DbaCv.dbo.TblRecipe where FldId = %d', [Id]);
    Result := x.DsFD(q, d, IvFbk);
    if not Result then begin
      glog.Log(IvFbk);
      Exit;
    end;
    {$ENDREGION}

    {$REGION 'Empty'}
    Result := not d.IsEmpty; // return false if empty
    if not Result then begin
      IvFbk := Format('No data for Cv Recipe Id %d', [Id]);
      Exit;
    end;
    {$ENDREGION}

    {$REGION 'Integrity'}
    Result := d.RecordCount = 1;
    if not Result then begin
      LogWFmt('Cv Recipe record is not unique, count is %d', [d.RecordCount]);
    //log.Ds(d);
      Exit;
    end;
    {$ENDREGION}

    {$REGION 'Set'}
    Id           := d.FieldByName('FldId'          ).AsInteger ;
    PId          := d.FieldByName('FldPId'         ).AsInteger ;
    State        := d.FieldByName('FldState'       ).AsString  ;
    Organization := d.FieldByName('FldOrganization').AsString  ;
    Owner        := d.FieldByName('FldOwner'       ).AsString  ;
    Recipe       := d.FieldByName('FldRecipe'      ).AsString  ;
    Description  := d.FieldByName('FldDescription' ).AsString  ;
    Code         := d.FieldByName('FldCode'        ).AsString  ;
    Note         := d.FieldByName('FldNote'        ).AsString  ;
    // or
  //Result := sod.SetOrDef(Id       ,            d.FieldByName('FldId'       ).AsVariant, Recipe_ID_DEFAULT       , IvFbk); // key
  //Result := sod.SetOrDef(Bitmap   , TBlobField(d.FieldByName('FldBitmap'   ))         , Recipe_BITMAP_DEFAULT   , IvFbk);
  //Result := sod.SetOrDef(ByteArray, TBlobField(d.FieldByName('FldByteArray'))         , Recipe_BYTEARRAY_DEFAULT, IvFbk);
    {$ENDREGION}

    {$REGION 'End'}
    IvFbk  := Format('Cv Recipe selected for Id %d', [Id]);
    Result := true;
    {$ENDREGION}

  finally
    d.Free;
    x.Free;
  end;
  {$ENDREGION}

end;

function  TCvRecipeRec.DbaInsert(var IvFbk: string): boolean;
var
  x: TDbaCls;
  t, q, k: string;
  i: integer;
begin

  {$REGION 'Check'}
  Result := IsValid(IvFbk);
  if not Result then
    Exit;
  {$ENDREGION}

  {$REGION 'Dba'}
  x := TDbaCls.Create(FDManager);
  try
    // table
    t := 'DbaCv.dbo.TblRecipe';

    // sql
    q := ''
    + sLineBreak + 'insert into DbaCv.dbo.TblRecipe('
    + sLineBreak + '    FldId          '
    + sLineBreak + '  , FldPId         '
    + sLineBreak + '  , FldState       '
    + sLineBreak + '  , FldOrganization'
    + sLineBreak + '  , FldOwner       '
    + sLineBreak + '  , FldRecipe      '
    + sLineBreak + '  , FldDescription '
    + sLineBreak + '  , FldCode        '
    + sLineBreak + '  , FldNote        '
    + sLineBreak + ') values('
    + sLineBreak + '    :PId          '
    + sLineBreak + '  , :PPId         '
    + sLineBreak + '  , :PState       '
    + sLineBreak + '  , :POrganization'
    + sLineBreak + '  , :POwner       '
    + sLineBreak + '  , :PRecipe      '
    + sLineBreak + '  , :PDescriptio  '
    + sLineBreak + '  , :PCode        '
    + sLineBreak + '  , :PNote        '
    + sLineBreak + ')'
    ;
    // insertwithparams
    Result := x.RecInsert(t, q, [
      Id
    , PId
    , State
    , Organization
    , Owner
    , Recipe
    , Description
    , Code
    , Note
    ], i, k);
    if Result then
      Id := i;
  finally
    x.Free;
  end;
  {$ENDREGION}

end;

function  TCvRecipeRec.DbaUpdate(var IvFbk: string; IvInsertIfNotExist: boolean = false): boolean;
var
  x: TDbaCls;
  n, t, q, k: string;
begin

  {$REGION 'Check'}
  Result := IsValid(IvFbk);
  if not Result then
    Exit;
  {$ENDREGION}

  {$REGION 'InsertIfNotExist'}
  if IvInsertIfNotExist then
    if not DbaExists(IvFbk) then begin
      n := IfNxRnd(Recipe);
      Init(Organization, Owner, n, k);
      DbaInsert(IvFbk);
      glog.Log(IvFbk);
      Exit;
    end;
  {$ENDREGION}

  {$REGION 'Dba'}
  x := TDbaCls.Create(FDManager);
  try
    // table
    t := 'DbaCv.dbo.TblRecipe';

    // sql
    q := ''
    + sLineBreak + 'update'
    + sLineBreak + '    DbaCv.dbo.TblRecipe'
    + sLineBreak + 'set'
  //+ sLineBreak + '    FldId =           :PId          ' // key
    + sLineBreak + '    FldPId =          :PPId         '
    + sLineBreak + '  , FldState =        :PState       '
    + sLineBreak + '  , FldOrganization = :POrganization'
    + sLineBreak + '  , FldOwner =        :POwner       '
    + sLineBreak + '  , FldRecipe =       :PRecipe      '
    + sLineBreak + '  , FldDescription =  :PDescription '
    + sLineBreak + '  , FldCode =         :PCode        '
    + sLineBreak + '  , FldNote =         :PNote        '
    + sLineBreak + 'where'
    + sLineBreak + '    FldId =           :PId          '
    ;
    // updatewithparams
    Result := x.RecUpdate(t, q, [
      PId
    , State
    , Organization
    , Owner
    , Recipe
    , Description
    , Code
    , Note
    , Id
    ], k);
  finally
    x.Free;
  end;
  {$ENDREGION}

end;

function  TCvRecipeRec.DbaDelete(var IvFbk: string): boolean;
var
  x: TDbaCls;
begin

  {$REGION 'Check'}
  Result := HasKey(IvFbk);
  if not Result then
    Exit;
  {$ENDREGION}

  {$REGION 'Dba'}
  x := TDbaCls.Create(FDManager);
  try
    Result := x.RecDelete('DbaCv.dbo.TblRecipe', Id, IvFbk);
  finally
    x.Free;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'TCvRecipeRem'}
constructor TCvRecipeRem.Create;
begin
  inherited;

end;

destructor TCvRecipeRem.Destroy;
begin

  inherited;
end;

procedure TCvRecipeRem.ToRec(var IvCvRecipeRec: TCvRecipeRec);
begin
  IvCvRecipeRec.Id           := FId          ;
  IvCvRecipeRec.PId          := FPId         ;
  IvCvRecipeRec.State        := FState       ;
  IvCvRecipeRec.Organization := FOrganization;
  IvCvRecipeRec.Owner        := FOwner       ;
  IvCvRecipeRec.Recipe       := FRecipe      ;
  IvCvRecipeRec.Description  := FDescription ;
  IvCvRecipeRec.Code         := FCode        ;
  IvCvRecipeRec.Note         := FNote        ;
end;

procedure TCvRecipeRem.FromRec(const IvCvRecipeRec: TCvRecipeRec);
begin
  FId           := IvCvRecipeRec.Id          ;
  FPId          := IvCvRecipeRec.PId         ;
  FState        := IvCvRecipeRec.State       ;
  FOrganization := IvCvRecipeRec.Organization;
  FOwner        := IvCvRecipeRec.Owner       ;
  FRecipe       := IvCvRecipeRec.Recipe      ;
  FDescription  := IvCvRecipeRec.Description ;
  FCode         := IvCvRecipeRec.Code        ;
  FNote         := IvCvRecipeRec.Note        ;
end;
{$ENDREGION}

*)
{$ENDREGION}

{$REGION 'Zzz'}
(*
procedure WksOcvRecipe(IvDevice, IvFailBin, IvStrategy: string; var IvRecipe: string; var IvFbk: string);
var
  q, f: string;
  d: TDataSet;
begin
  q := Format(   ' select'
  + sLineBreak + '     *'
  + sLineBreak + ' from'
  + sLineBreak + '     DbaFoundry.dbo.TblCvRecipe'
  + sLineBreak + ' where'
  + sLineBreak + '     FldDevice = ''%s'''
  + sLineBreak + ' and FldFailBin = ''%s'''
  + sLineBreak + ' and FldStrategy = ''%s'''
  , [IvDevice, IvFailBin, IvStrategy]
  );
//  d := FDba.Ds(WksDbaAdoConn, q, f);
  try
    if d.IsEmpty then begin
      IvRecipe := '';
      IvFbk := Format(RS_DATASET_IS_EMPTY, [q, f]);
    end else begin
      IvRecipe := d.FieldByName('FldRecipe').AsString;
      IvFbk := f;
    end;
  finally
    FreeAndNil(d);
  end;

//  IvRecipe :=
////  'Load,C:\Temp\ImageCropped.bmp' + sLineBreak
//    'Load,[RvImageFile]' + sLineBreak
////+ Format('Crop,%d,%d,%d,%d', [mp1i, mp1j, mp2i, mp2j]) + sLineBreak
//  + 'BgrToGray' + sLineBreak
//
//  + 'HistogramEqualize' + sLineBreak
//
////+ 'PyramidDown' + sLineBreak
////+ 'PyramidUp' + sLineBreak
//  + 'PyramidDown' + sLineBreak
//  + 'PyramidDown' + sLineBreak
//
//  + 'Erode,2' + sLineBreak
////+ 'Dilate,1' + sLineBreak
//
////+ 'PyramidNoiseRemove' + sLineBreak
////+ 'Morphology,1,3' + sLineBreak
//
////+ 'Threshold,80,255,1,0' + sLineBreak
////+ 'Threshold,132,255,1,0' + sLineBreak
//  + 'ThresholdAdaptive' + sLineBreak
//
//  + 'Canny,120,55,3' + sLineBreak
//
////+ 'LinesHough,1.0,0.02,50,30.0,10.0' + sLineBreak
//
//  + 'Contours,2.00' + sLineBreak
//
////+ 'Dilate,1' + sLineBreak
//
//  + 'Resize,256,256,2' + sLineBreak
//  + 'Dilate,5' + sLineBreak
//
//  + 'Save,C:\Temp\ImageAnalyzed.bmp' + sLineBreak
////+ 'Save,Auto' + sLineBreak
//  ;
end;
*)
{$ENDREGION}

end.

