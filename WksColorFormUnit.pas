unit WksColorFormUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , System.SysUtils
  , System.Classes
  , Vcl.Graphics
  , Controls
  , Vcl.Forms
  , Vcl.StdCtrls
  , Vcl.ComCtrls
  , Vcl.ExtCtrls
  , Vcl.GraphUtil
  , mbColorPreview
  , HexaColorPicker
  , HSLColorPicker
  , HSLRingPicker
  , mbColorList
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TColorForm = class(TForm)
    ColorSelectedTrackBar: TTrackBar;
    ColorPreviewLabel: TLabel;
    ColorSelectedLabel: TLabel;
    OkButton: TButton;
    CancelButton: TButton;
    ColorUseRadioGroup: TRadioGroup;
    ColorUseHtmlEdit: TEdit;
    ColorUseRgbEdit: TEdit;
    ColorNamedLabel: TLabel;
    ColorHexaColorPicker: THexaColorPicker;
    ColorPreviewMbColorPreview: TmbColorPreview;
    ColorSelectedMbColorPreview: TmbColorPreview;
    ColorPageControl: TPageControl;
    ColorHexTabSheet: TTabSheet;
    ColorWebTabSheet: TTabSheet;
    ColorHSLTabSheet: TTabSheet;
    ColorHSLColorPicker: THSLColorPicker;
    ColorHSLRingTabSheet: TTabSheet;
    ColorHSLRingPicker: THSLRingPicker;
    ColorNamedMbColorList: TmbColorList;
    ColorNamedSortByRadioGroup: TRadioGroup;
    ColorNamedSortByReversedCheckBox: TCheckBox;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ColorHexaColorPickerChange(Sender: TObject);
    procedure ColorHexaColorPickerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure ColorSelectedTrackBarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ColorHSLColorPickerChange(Sender: TObject);
    procedure ColorHSLColorPickerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ColorHSLRingPickerChange(Sender: TObject);
    procedure ColorHSLRingPickerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ColorNamedMbColorListMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ColorNamedSortByRadioGroupClick(Sender: TObject);
    procedure ColorNamedSortByReversedCheckBoxClick(Sender: TObject);
  private
    { Private declarations }
    FColor: TColor;
    FHexColor: string;
    FWebColor: string;
    FWebColorVec: TColorArray;
    procedure GuiOnMoveUpdate(IvColor: TColor);
    procedure GuiOutputUpdate;
    procedure GuiInputUpdate;
    procedure GuiColorNamedLoad(IvSortIdx: integer; IvColorSelect: string; IvReversed: boolean);
  public
    { Public declarations }
    class function Execute(var IvColor, IvFbk: string): boolean;
  end;
{$ENDREGION}

{$REGION 'Var'}
//var
  //ColorForm: TColorForm; // force to create, use and dispose
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    Generics.Defaults
  , Generics.Collections
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Routine'}
procedure TColorForm.GuiOnMoveUpdate(IvColor: TColor);
begin
  ColorPreviewMbColorPreview.Color := IvColor;
end;

procedure TColorForm.GuiOutputUpdate;
begin
  ColorSelectedMbColorPreview.Color := FColor;
  ColorUseRgbEdit.Text              := FColor.ToHexString;
  ColorUseHtmlEdit.Text             := FColor.ToHtmlString;
end;

procedure TColorForm.GuiInputUpdate;
begin
  ColorHSLColorPicker.SelectedColor  := FColor;
  ColorHSLRingPicker.SelectedColor   := FColor;
  ColorHexaColorPicker.SelectedColor := FColor;
  ColorNamedMbColorList.ItemIndex    := ColorNamedMbColorList.Items.IndexOf(FWebColor);
end;

procedure TColorForm.GuiColorNamedLoad(IvSortIdx: integer; IvColorSelect: string; IvReversed: boolean);
var
  i: integer;
  sty: TColorArraySortType;
begin
  // byname
  if IvSortIdx = 0 then begin
    if not IvReversed then
      TArray.Sort<TIdentMapEntry>(FWebColorVec, TDelegatedComparer<TIdentMapEntry>.Construct(
        function(const Left, Right: TIdentMapEntry): integer
        begin
          Result := TComparer<string>.Default.Compare(Left.Name, Right.Name);
        end)
      )
    else
      TArray.Sort<TIdentMapEntry>(FWebColorVec, TDelegatedComparer<TIdentMapEntry>.Construct(
        function(const Left, Right: TIdentMapEntry): integer
        begin
          Result := TComparer<string>.Default.Compare(Right.Name, Left.Name);
        end)
      );

  // by...
  end else begin
    sty := TColorArraySortType(IvSortIdx);
    SortColorArray(FWebColorVec, 0, WebNamedColorsCount-1, sty, IvReversed);
  end;

  // add
  ColorNamedMbColorList.ClearColors;
  for i := Low(FWebColorVec) to High(FWebColorVec) do
    ColorNamedMbColorList.AddColor(FWebColorVec[i].Name.Remove(0, 5), FWebColorVec[i].Value, false);
  ColorNamedMbColorList.UpdateColors;

  // select
  ColorNamedMbColorList.ItemIndex := ColorNamedMbColorList.Items.IndexOf(IvColorSelect);
end;
{$ENDREGION}

{$REGION 'Static'}
class function  TColorForm.Execute(var IvColor, IvFbk: string): boolean;
var
  frm: TColorForm;
  mre: integer; // modalresult
begin
  // exit
  Result := (6 <= IvColor.Length) and (IvColor.Length <= 7);
  if not Result then begin
    IvFbk := 'Hex color string should be in the "RRGGBB" or "#RRGGBB" format, please check';
    Exit;
  end;

  // form
  frm := TColorForm.Create(nil);
  try
    // color
    frm.FHexColor := TStrRec.StrRight(IvColor, 6); // input: rrggbb, #rrggbb
    frm.FColor.FromHexString(frm.FHexColor);
    frm.FWebColor := TColRec.TColToHtmlNameStr(frm.FColor, 'clWebWhite').Remove(0, 5);

    // plainorhtml
    frm.ColorUseRadioGroup.ItemIndex := frm.FHexColor.Length - 6;

    // gui
    frm.GuiColorNamedLoad(0{byname}, frm.FWebColor, frm.ColorNamedSortByReversedCheckBox.Checked);
    frm.GuiOutputUpdate;
    frm.GuiInputUpdate;

    // show
    mre := frm.ShowModal;
    Result := mre = mrOk;
    if Result then begin
      case frm.ColorUseRadioGroup.ItemIndex of
        0: begin
          IvColor := frm.ColorUseRgbEdit.Text;
          IvFbk := 'Selected RGB Color: ' + IvColor;
        end;
        1: begin
          IvColor := frm.ColorUseHtmlEdit.Text;
          IvFbk := 'Selected HTML Color: ' + IvColor;
        end;
      end;
    end else
      IvFbk := 'Color selection cancelled by user';
  finally
    frm.Release;
  end;
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TColorForm.FormCreate(Sender: TObject);
var
  i: integer;
begin
  // webcolorsclone
  SetLength(FWebColorVec, WebNamedColorsCount);
  for i := Low(WebNamedColors) to High(WebNamedColors) do begin
   FWebColorVec[i].Name  := WebNamedColors[i].Name;
   FWebColorVec[i].Value := WebNamedColors[i].Value;
  end;
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TColorForm.OkButtonClick(Sender: TObject);
begin
  ModalResult := mrOK; // this will close the form
end;

procedure TColorForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel; // this will close the form
end;
{$ENDREGION}

{$REGION 'HSL'}
procedure TColorForm.ColorHSLColorPickerChange(Sender: TObject);
begin
  FColor := ColorHSLColorPicker.SelectedColor;
  GuiOutputUpdate;
end;

procedure TColorForm.ColorHSLColorPickerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  GuiOnMoveUpdate(ColorHSLColorPicker.ColorUnderCursor);
end;
{$ENDREGION}

{$REGION 'HSLRing'}
procedure TColorForm.ColorHSLRingPickerChange(Sender: TObject);
begin
  FColor := ColorHSLRingPicker.SelectedColor;
  GuiOutputUpdate;
end;

procedure TColorForm.ColorHSLRingPickerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  GuiOnMoveUpdate(ColorHSLRingPicker.ColorUnderCursor);
end;
{$ENDREGION}

{$REGION 'Hexagon'}
procedure TColorForm.ColorHexaColorPickerChange(Sender: TObject);
begin
  FColor := ColorHexaColorPicker.SelectedColor;
  GuiOutputUpdate;
end;

procedure TColorForm.ColorHexaColorPickerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
begin
  GuiOnMoveUpdate(ColorHexaColorPicker.ColorUnderCursor);
end;
{$ENDREGION}

{$REGION 'Web'}
procedure TColorForm.ColorNamedMbColorListMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FColor := ColorNamedMbColorList.Colors[ColorNamedMbColorList.ItemIndex].Value;
  FWebColor := ColorNamedMbColorList.Colors[ColorNamedMbColorList.ItemIndex].Name;
  GuiOnMoveUpdate(FColor);
  GuiOutputUpdate;
end;

procedure TColorForm.ColorNamedSortByRadioGroupClick(Sender: TObject);
begin
  GuiColorNamedLoad(ColorNamedSortByRadioGroup.ItemIndex, FWebColor, ColorNamedSortByReversedCheckBox.Checked);
end;

procedure TColorForm.ColorNamedSortByReversedCheckBoxClick(Sender: TObject);
begin
  ColorNamedSortByRadioGroupClick(nil);
end;
{$ENDREGION}

{$REGION 'Preview'}
{$ENDREGION}

{$REGION 'Selected'}
procedure TColorForm.ColorSelectedTrackBarChange(Sender: TObject);
begin
  ColorSelectedMbColorPreview.Opacity := ColorSelectedTrackBar.Position;
  FColor := ColorSelectedMbColorPreview.Color;
  GuiOutputUpdate;
end;
{$ENDREGION}

end.
