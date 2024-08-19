unit WksTextDiffFormUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows, Winapi.Messages
  , System.SysUtils, System.Variants, System.Classes, System.ImageList
  , Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SynEdit
  , Vcl.Grids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ImgList
  , Generics.Collections, SynEditMiscClasses, SynEditSearch, SynEditRegexSearch
  , WksTextDiffUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TTextDiffForm = class(TForm)
    ImageList24: TImageList;
    TopToolBar: TToolBar;
    File1ToolButton: TToolButton;
    File2ToolButton: TToolButton;
    Save1ToolButton: TToolButton;
    Save2ToolButton: TToolButton;
    CompareToolButton: TToolButton;
    StopToolButton: TToolButton;
    IgnoreCaseToolButton: TToolButton;
    IgnoreSpacesToolButton: TToolButton;
    LineNumberToolButton: TToolButton;
    PageControl: TPageControl;
    EditTabSheet: TTabSheet;
    EditGridPanel: TGridPanel;
    SynEdit1: TSynEdit;
    SynEdit2: TSynEdit;
    Label2: TLabel;
    Label1: TLabel;
    CompareTabSheet: TTabSheet;
    ResultGrid: TStringGrid;
    DoneToolButton: TToolButton;
    StatusBar: TStatusBar;
    OpenDialog: TOpenDialog;
    ClearAllToolButton: TToolButton;
    MatchPrevToolButton: TToolButton;
    MatchNextToolButton: TToolButton;
    ImageList16: TImageList;
    CompareGridPanel: TGridPanel;
    ToolBar2: TToolBar;
    Row2CopyToLeftToolButton: TToolButton;
    Row2InsertToolButton: TToolButton;
    Row2DeleteToolButton: TToolButton;
    ToolBar1: TToolBar;
    Row1DeleteToolButton: TToolButton;
    Row1InsertToolButton: TToolButton;
    Row1CopyToRightToolButton: TToolButton;
    SynEditSearch: TSynEditSearch;
    SynEditRegexSearch: TSynEditRegexSearch;
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    procedure DoneToolButtonClick(Sender: TObject);
    procedure File1ToolButtonClick(Sender: TObject);
    procedure File2ToolButtonClick(Sender: TObject);
    procedure Save1ToolButtonClick(Sender: TObject);
    procedure Save2ToolButtonClick(Sender: TObject);
    procedure CompareToolButtonClick(Sender: TObject);
    procedure StopToolButtonClick(Sender: TObject);
    procedure LineNumberToolButtonClick(Sender: TObject);
    procedure ResultGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ClearAllToolButtonClick(Sender: TObject);
    procedure MatchPrevToolButtonClick(Sender: TObject);
    procedure MatchNextToolButtonClick(Sender: TObject);
    procedure IgnoreCaseToolButtonClick(Sender: TObject);
    procedure IgnoreSpacesToolButtonClick(Sender: TObject);
    procedure Row1CopyToRightToolButtonClick(Sender: TObject);
    procedure Row2CopyToLeftToolButtonClick(Sender: TObject);
    procedure Row1InsertToolButtonClick(Sender: TObject);
    procedure Row1DeleteToolButtonClick(Sender: TObject);
    procedure Row2InsertToolButtonClick(Sender: TObject);
    procedure Row2DeleteToolButtonClick(Sender: TObject);
    procedure ResultGridGetEditText(Sender: TObject; ACol, ARow: Integer; var Value: string);
    procedure ResultGridSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
    procedure ResultGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: boolean);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure SynEdit1SpecialLineColors(Sender: TObject; Line: Integer; var Special: boolean; var FG, BG: TColor);
    procedure SynEdit1Paint(Sender: TObject; ACanvas: TCanvas);
    procedure SynEdit1PaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
    procedure SynEdit1Change(Sender: TObject);
    procedure SynEdit1Scroll(Sender: TObject; ScrollBar: TScrollBarKind);
  private
    { Private declarations }
    FTextDiff : TTextDiff;
    FFile1: string;
    FFile2: string;
  //FSource1, FSource2: TStringList; // instead of SynEdit1/SynEdit2
  //FResult1, FResult2: TStringList; // to builds results from ResultGrid and save them
    FHashlist1: TList<Cardinal>;
    FHashlist2: TList<Cardinal>;
    procedure Clear(Iv1, Iv2: boolean);
    procedure ResultGridClear;
    procedure HashListBuild(Iv1, Iv2: boolean);
    procedure SynEditHighlightNow(IvSynEdit: TSynEdit; IvPatternList: TStrings);
  public
    { Public declarations }
    class function  Execute(const IvTextSource: TStrings): boolean;
  end;
{$ENDREGION}

{$REGION 'Var'}
//var
  //TextDiffForm: TTextDiffForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    System.Math
  , System.StrUtils
  , SynEditTypes // BufferCoord
  , SynEditHighlighter // TSynHighlighterAttributes
  , Wks000Unit
  , WksTextDiffHashUnit
  ;
{$ENDREGION}

{$REGION 'Routine'}
procedure TTextDiffForm.Clear(Iv1, Iv2: boolean);
begin
  if Iv1 then begin
    FHashlist1.Clear;
    Label1.Caption := ' File1 ';
  end;
  if Iv2 then begin
    FHashlist2.Clear;
    Label2.Caption := ' File2 ';
  end;
  ResultGridClear;
  FTextDiff.Clear;
//  StatusBar.Panels[0].Text := '';
//  StatusBar.Panels[1].Text := '';
//  StatusBar.Panels[2].Text := '';
//  StatusBar.Panels[3].Text := '';
end;

procedure TTextDiffForm.ResultGridClear;
begin
  ResultGrid.RowCount := 1;
  ResultGrid.Cells[0, 0].Empty;
  ResultGrid.Cells[1, 0].Empty;
  ResultGrid.Cells[2, 0].Empty;
  ResultGrid.Cells[3, 0].Empty;
end;

procedure TTextDiffForm.HashListBuild(Iv1, Iv2: boolean);
{
 It's MUCH EASIER AND FASTER comparing hashes (integers) than comparing whole lines
 of text, so we'll build a list of hashes for all lines in the source files
 Each line is represented by a (virtually) unique hash that is based on the
 contents of that line.  Also, since the likelihood of 2 different lines
 generating the same hash is so small, we can safely ignore that possibility
}
var
  i: integer;
begin
  if Iv1 then begin
    FHashlist1.Clear;
    for i := 0 to SynEdit1.Lines.Count - 1 do
      FHashlist1.Add(HashLine(SynEdit1.Lines[i], IgnoreCaseToolButton.Down, IgnoreSpacesToolButton.Down));
  end;
  if Iv2 then begin
    FHashlist2.Clear;
    for i := 0 to SynEdit2.Lines.Count - 1 do
      FHashlist2.Add(HashLine(SynEdit2.Lines[i], IgnoreCaseToolButton.Down, IgnoreSpacesToolButton.Down));
  end;
end;
{$ENDREGION}

{$REGION 'Form'}
class function  TTextDiffForm.Execute(const IvTextSource: TStrings): boolean;
var
  f: TTextDiffForm;
begin
  // objs
  f := TTextDiffForm.Create(nil);

  // file1
  f.SynEdit1.Text := IvTextSource.Text;
  f.Label1.Caption := 'REMOTE CONTENT';
//f.HashListBuild(true, false); // moved just before compare

  // file2
  // this is done explicitly when the form appear

  // go
  try
    Result := f.ShowModal = mrOk;
  finally
  //FreeAndNil(f);
    f.Release;
  end;
end;

procedure TTextDiffForm.FormCreate(Sender: TObject);
begin
  // gui
  File1ToolButton.Visible     := false;
  Save1ToolButton.Visible     := false;
  IgnoreCaseToolButton.Down   := gini.BooGet('TextDiff/IgnoreCase'  , false);
  IgnoreSpacesToolButton.Down := gini.BooGet('TextDiff/IgnoreSpaces', false);
  LineNumberToolButton.Down   := gini.BooGet('TextDiff/LineNumber'  , true );
  PageControl.ActivePageIndex := 0;
  Width                       := 1024;
  Height                      :=  768;
  FFile1                      := gini.StrGet('TextDiff/File1', ''); // X:\$\I\WksDbaAllCreate_MASTER.txt
  FFile2                      := gini.StrGet('TextDiff/File2', ''); // X:\$\I\WksDbaAllCreate_MASTER_OLD_TO_CHECK.txt
  ResultGrid.ColWidths[0]     := 40;
  ResultGrid.ColWidths[2]     := 40;
  ResultGrid.Canvas.Font      := ResultGrid.Font;
  SynEdit1.Clear;
  SynEdit2.Clear;

  // objs
  FTextDiff   := TTextDiff.Create(Self); // selffree
  FHashlist1  := TList<Cardinal>.Create;
  FHashlist2  := TList<Cardinal>.Create;
end;

procedure TTextDiffForm.FormDestroy(Sender: TObject);
begin
  // gui
  gini.BooGet('TextDiff/IgnoreCase'  , IgnoreCaseToolButton.Down  );
  gini.BooGet('TextDiff/IgnoreSpaces', IgnoreSpacesToolButton.Down);
  gini.BooGet('TextDiff/LineNumber'  , LineNumberToolButton.Down  );
  gini.StrSet('TextDiff/File1'       , FFile1                     );
  gini.StrSet('TextDiff/File2'       , FFile2                     );

  // objs
  FHashlist1.Free;
  FHashlist2.Free;
end;

procedure TTextDiffForm.FormResize(Sender: TObject);
var
  i: integer;
begin
  with ResultGrid do begin
    i := (ClientWidth - 80) div 2;
    ResultGrid.ColWidths[1] := i;
    ResultGrid.ColWidths[3] := i;
  end;
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TTextDiffForm.DoneToolButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TTextDiffForm.ClearAllToolButtonClick(Sender: TObject);
begin
  Clear(true, true);
end;

procedure TTextDiffForm.File1ToolButtonClick(Sender: TObject);
//var
//  i: integer;
begin
  OpenDialog.InitialDir := ExtractFilePath(FFile1);
  OpenDialog.FileName   := ExtractFileName(FFile1);
  if not OpenDialog.Execute then Exit;
  FFile1 := OpenDialog.FileName;
  if not fileExists(FFile1) then Exit;
  Clear(true, false);
  SynEdit1.Lines.LoadFromFile(FFile1);
  Label1.Caption := FFile1;
//HashListBuild(true, false); // moved just before compare
end;

procedure TTextDiffForm.File2ToolButtonClick(Sender: TObject);
//var
//  i: integer;
begin
  OpenDialog.InitialDir := ExtractFilePath(FFile2);
  OpenDialog.FileName   := ExtractFileName(FFile2);
  if not OpenDialog.Execute then Exit;
  FFile2 := OpenDialog.FileName;
  if not FileExists(FFile2) then Exit;
  Clear(false, true);
  SynEdit2.Lines.LoadFromFile(FFile2);
  Label2.Caption := FFile2;
//HashListBuild(false, true); // moved just before compare
end;

procedure TTextDiffForm.Save1ToolButtonClick(Sender: TObject);
begin
  if TAskRec.Yes('Save/override file 1 %s ? ', [FFile1]) then
    SynEdit1.Lines.SaveToFile(FFile1);
end;

procedure TTextDiffForm.Save2ToolButtonClick(Sender: TObject);
begin
  if TAskRec.Yes('Save/override file 2 %s ?', [FFile2]) then
    SynEdit2.Lines.SaveToFile(FFile2);
end;

procedure TTextDiffForm.CompareToolButtonClick(Sender: TObject);
var
  i: integer;
begin
  Screen.Cursor := crHourGlass;
  PageControl.ActivePageIndex := 1;
  ResultGridClear;
  HashListBuild(true, true);
  if (FHashlist1.Count = 0) or (FHashlist2.Count = 0) then Exit;
  try
    // this is where it all happens ...
    FTextDiff.Execute(FHashlist1, FHashlist2); // TList.list is a pointer to the bottom of the list's integer array
    if FTextDiff.Cancelled then
      Exit;

    // fill ResultGrid with the differences
    for i := 0 to 3 do begin
      ResultGrid.Cols[i].BeginUpdate;
      ResultGrid.Cols[i].Clear;
    end;
    try
      ResultGrid.RowCount := FTextDiff.Count;
      for i := 0 to FTextDiff.Count -1 do
        with FTextDiff.Compares[i], ResultGrid do begin
          if Kind <> ckAdd then begin
            Cells[0, i] := IntToStr(OldIndex1{+1});
            Cells[1, i] := SynEdit1.Lines[OldIndex1];
          end;
          if Kind <> ckDelete then begin
            Cells[2, i] := IntToStr(OldIndex2{+1});
            Cells[3, i] := SynEdit2.Lines[OldIndex2];
          end;
        end;
    finally
      for i := 0 to 3 do ResultGrid.Cols[i].EndUpdate;
    end;

    // stats -> ownerdraw
//    with FTextDiff.DiffStats do begin
//      StatusBar.Panels[0].Text := ' Matches: '  + IntToStr(Matches);
//      StatusBar.Panels[1].Text := ' Modifies: ' + IntToStr(Modifies);
//      StatusBar.Panels[2].Text := ' Adds: '     + IntToStr(Adds);
//      StatusBar.Panels[3].Text := ' Deletes: '  + IntToStr(Deletes);
//    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TTextDiffForm.StopToolButtonClick(Sender: TObject);
begin
  FTextDiff.Cancel;
end;

procedure TTextDiffForm.MatchPrevToolButtonClick(Sender: TObject);
var
  r: integer; // row
  k: TChangeKind;
begin
  r := ResultGrid.Selection.Top;
  if r = 0 then exit;
  k := FTextDiff.Compares[r].Kind;
  while (r > 0) and (FTextDiff.Compares[r].Kind = k) do
    dec(r);
  if FTextDiff.Compares[r].Kind = ckNone then begin
    k := ckNone;
    while (r > 0) and (FTextDiff.Compares[r].Kind = k) do
      dec(r);
  end;
  ResultGrid.Selection := TGridRect(Rect(0, r, 3, r));
  if r < ResultGrid.TopRow then
    ResultGrid.TopRow := Max(0, r-ResultGrid.VisibleRowCount+1);
  ResultGrid.Row := r;
end;

procedure TTextDiffForm.MatchNextToolButtonClick(Sender: TObject);
var
  r: integer; // row
  k: TChangeKind;
begin
  r := ResultGrid.Selection.Top;
  if r = ResultGrid.RowCount-1 then exit;
  k := FTextDiff.Compares[r].Kind;
  while (r < ResultGrid.RowCount-1) and (FTextDiff.Compares[r].Kind = k) do
    inc(r);
  if FTextDiff.Compares[r].Kind = ckNone then begin
    k := ckNone;
    while (r < ResultGrid.RowCount-1) and (FTextDiff.Compares[r].Kind = k) do
      inc(r);
  end;
  ResultGrid.Selection := TGridRect(Rect(0, r, 3, r));
  if r > ResultGrid.TopRow + ResultGrid.VisibleRowCount-1 then
    ResultGrid.TopRow := max(0, min(r, ResultGrid.RowCount - ResultGrid.VisibleRowCount));
  ResultGrid.Row := r;
  ResultGrid.TopRow := r-2;
end;

procedure TTextDiffForm.Row1CopyToRightToolButtonClick(Sender: TObject);
var
  r: integer; // rowcurrent
  v: string; // leftvalue
begin
  with ResultGrid do begin
    r := Row;
    v := Cells[1, r];
    Cells[3, r] := v;
  end;
  SynEdit2.Lines[r] := v;
  CompareToolButton.Click;
  MatchNextToolButton.Click;
end;

procedure TTextDiffForm.Row1InsertToolButtonClick(Sender: TObject);
begin
  TMesRec.NI;
end;

procedure TTextDiffForm.Row1DeleteToolButtonClick(Sender: TObject);
begin
  SynEdit1.Lines.Delete(ResultGrid.Row);
  CompareToolButton.Click;
  MatchNextToolButton.Click;
end;

procedure TTextDiffForm.Row2CopyToLeftToolButtonClick(Sender: TObject);
var
  r: integer; // rowcurrent
  v: string; // rightvalue
begin
  with ResultGrid do begin
    r := Row;
    v := Cells[2, r];
    Cells[1, r] := v;
  end;
  SynEdit1.Lines[r] := v;
  CompareToolButton.Click;
  MatchNextToolButton.Click;
end;

procedure TTextDiffForm.Row2InsertToolButtonClick(Sender: TObject);
begin
  SynEdit2.Lines.Insert(ResultGrid.Row, '?');
  CompareToolButton.Click;
  MatchNextToolButton.Click;
end;

procedure TTextDiffForm.Row2DeleteToolButtonClick(Sender: TObject);
begin
  SynEdit2.Lines.Delete(ResultGrid.Row);
  CompareToolButton.Click;
  MatchNextToolButton.Click;
end;

procedure TTextDiffForm.IgnoreCaseToolButtonClick(Sender: TObject);
begin
//IgnoreCaseToolButton.Down := not IgnoreCaseToolButton.Down;
  Clear(false, false);
//HashListBuild(true, true); // moved just before compare
  CompareToolButton.Click;
end;

procedure TTextDiffForm.IgnoreSpacesToolButtonClick(Sender: TObject);
begin
//IgnoreSpacesToolButton.Down := not IgnoreSpacesToolButton.Down;
  Clear(false,false);
//HashListBuild(true, true); // moved just before compare
  CompareToolButton.Click;
end;

procedure TTextDiffForm.LineNumberToolButtonClick(Sender: TObject);
begin
  SynEdit1.Gutter.ShowLineNumbers := LineNumberToolButton.Down;
  SynEdit2.Gutter.ShowLineNumbers := LineNumberToolButton.Down;
end;

procedure TTextDiffForm.ResultGridGetEditText(Sender: TObject; ACol, ARow: Integer; var Value: string);
begin
  Value := ResultGrid.Cells[ACol, ARow];
end;

procedure TTextDiffForm.ResultGridSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
begin
  ResultGrid.Cells[ACol, ARow] := Value;
end;

procedure TTextDiffForm.ResultGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: boolean);
begin
  CompareTabSheet.Caption := Format('Compare %d,%d', [ACol, ARow]);
  SynEdit1.CaretY := ARow;
  SynEdit2.CaretY := ARow;
end;
{$ENDREGION}

{$REGION 'ResultGrid'}
procedure TTextDiffForm.ResultGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  bg, fg: TColor;
begin
  // exit
  if (SynEdit1.Lines.Count = 0) and (SynEdit2.Lines.Count = 0) then
    Exit;

  // colors
  if (gdSelected in State) and (ACol in [0, 2]) then begin
    bg := clHighlight;
    fg := clHighlightText;
  end else if (FTextDiff.Count = 0) then begin
    bg := clWhite;
    fg := clBlack;
  end else begin
    bg := clBtnFace;
    fg := clBlack;
  end;
  if (ACol in [1, 3]) and (ARow < FTextDiff.Count) then begin
    case FTextDiff.Compares[ARow].Kind of
      ckNone  : bg := clWhite;
      ckAdd   : bg := ADDED_COLOR;    // paleblue
      ckModify: bg := MODIFIED_COLOR; // palegreen;
      ckDelete: bg := DELETED_COLOR ; // palered;
    end;
  end;

  // canvas
  with ResultGrid.Canvas do begin
    Brush.Color := bg;
    Font.Color  := fg;
    FillRect(Rect);
    TextRect(Rect, Rect.Left+3, Rect.Top+2, ResultGrid.Cells[ACol, ARow]);
    // lines
    if (ACol in [0, 2]) then begin
      Pen.Color := clWhite;
      MoveTo(Rect.Right-1, 0);
      LineTo(Rect.Right-1, Rect.Bottom);
    end else begin
      if (ACol = 1) then begin
        Pen.Color := $333333;
        MoveTo(Rect.Right-1, 0);
        LineTo(Rect.Right-1, Rect.Bottom);
      end;
      Pen.Color := clSilver;
      MoveTo(Rect.Left, 0);
      LineTo(Rect.Left, Rect.Bottom);
    end;
    // focusrect
    if (gdSelected in State) and (ACol in [1, 3]) then begin
      Rect.Left := 0;
      DrawFocusRect(Rect);
    end;
  end;
end;
{$ENDREGION}

{$REGION 'StatusBar'}
procedure TTextDiffForm.StatusBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
var
  o: integer; // offset
  t: string;
begin
  with StatusBar.Canvas, FTextDiff.DiffStats do begin
    // colors-text
         if Rect.Left = 1+18*0 then begin Brush.Color := clWindow      ; o := 4; t := '='; end
    else if Rect.Left = 3+18*1 then begin Brush.Color := ADDED_COLOR   ; o := 4; t := '+'; end
    else if Rect.Left = 3+18*2 then begin Brush.Color := MODIFIED_COLOR; o := 3; t := '~'; end
    else if Rect.Left = 3+18*3 then begin Brush.Color := DELETED_COLOR ; o := 6; t := '-'; end
    else                            begin Brush.Color := clWindow      ; o := 8; t := Format('%d lines unchanged, %d lines added, %d lines modified, %d lines deleted', [Matches, Modifies, Adds, Deletes]); end;
  //Font.Color := clBlack;

    // draw
    FillRect(Rect);
    TextRect(Rect, Rect.Left+o, Rect.Top+0, t);
  end;
end;
{$ENDREGION}

{$REGION 'SynEdit'}
// https://engineertips.wordpress.com/2020/08/14/delphi-synedit-highlight

function  StrHasWord(const IvString: string; const IvWord: string; IvSearchOptions: TStringSearchOptions): boolean;
var
  z: integer; // size
  c: PWideChar; // widechar
begin
  // extraperformance
  if Pos(LowerCase(IvWord), LowerCase(IvWord)) = 0 then
    Exit(false);

  c := PWideChar(IvString);
  z := StrLen(c);
  Result := SearchBuf(c, z, 0, 0, IvWord, IvSearchOptions) <> nil;
end;

procedure TTextDiffForm.SynEditHighlightNow(IvSynEdit: TSynEdit; IvPatternList: TStrings);
var
  i, j{, x}, y, u, v: int64;
  p: TPoint;
  c: TBufferCoord;
  n, l, f, t: string; // repattern, line, foundword, token
  a: TSynHighlighterAttributes; // attr
begin
  if not Assigned(IvSynEdit.SearchEngine) then
    IvSynEdit.SearchEngine := TSynEditSearch.Create(IvSynEdit);
  IvSynEdit.SearchEngine.Options := [ssoReplace, ssoReplaceAll];

  for i := 0 to IvPatternList.Count-1 do begin
    // repattern
    n := IvPatternList.Strings[i];
    if n.IsEmpty then
      Continue;

    // colors
    IvSynEdit.SearchEngine.Pattern := n;  
    IvSynEdit.Canvas.Font.Color    := clYellow;
    IvSynEdit.Canvas.Brush.Color   := clRed;

    // font
    IvSynEdit.GetHighlighterAttriAtRowCol(c, t, a);
//  try     
    if Assigned(a) then
      IvSynEdit.Canvas.Font.Style := a.Style
//  except on e: Exception do
    else
      IvSynEdit.Canvas.Font := Font;
//  end;

    // only visible lines
    for y := IvSynEdit.TopLine-1 to IvSynEdit.TopLine+IvSynEdit.LinesInWindow do begin 
      l := IvSynEdit.Lines[y];
      IvSynEdit.SearchEngine.FindAll(l);
      for j := 0 to IvSynEdit.SearchEngine.ResultCount-1 do begin
        u := IvSynEdit.SearchEngine.Results[j];
        v := IvSynEdit.SearchEngine.Lengths[j];
        f := Copy(l, u, v);
      try
      //c := IvSynEdit.CharIndexToRowCol(u-1);
        c := BufferCoord(u, y+1);
      except
      end;
//      f := GetWordAtRowCol(c);
        p := IvSynEdit.RowColumnToPixels(IvSynEdit.BufferToDisplayPos(c));
        IvSynEdit.Canvas.TextOut(p.X, p.Y, {IvSynEdit.SearchEngine.Pattern}f);
      end;
    end;
  end;
end;

procedure TTextDiffForm.SynEdit1Change(Sender: TObject);
begin
  SynEdit1.Repaint; 
end;

procedure TTextDiffForm.SynEdit1Paint(Sender: TObject; ACanvas: TCanvas);
var
  {x, }y, j, u, v: integer; // x=col, y=row, seres idx, res, len
  p: TPoint;
  l, f, t: string; // line, found, token
  a: TSynHighlighterAttributes; // attr
begin
  SynEditHighlightNow(SynEdit1, Memo1.Lines);
  Exit;
  
  //SynEditSearch.Pattern := 'Fld';
  SynEditRegexSearch.Pattern := 'Fld\w*';

  with SynEdit1 do begin
    if not Assigned(SearchEngine) then Exit;
    if SearchEngine.Pattern = ''  then Exit;

    ACanvas.Brush.Color:= clYellow;
    ACanvas.Brush.Style:= bsSolid;

    for y := TopLine-1 to TopLine+LinesInWindow do begin // search terms are only highlighted in the visible area, saves a lot of time with large files
      l := Lines[y];
      SearchEngine.FindAll(l);
      for j := 0 to SearchEngine.ResultCount-1 do begin
        u := SearchEngine.Results[j];
        v := SearchEngine.Lengths[j];
        f := Copy(l, u, v);
        p := RowColumnToPixels(BufferToDisplayPos(BufferCoord(u, y+1)));
        GetHighlighterAttriAtRowCol(BufferCoord(u, y+1), t, a);
//      try
//        ACanvas.Font.Style := a.Style;
//      except
//        on e: Exception do
//          ACanvas.Font := Font;
//      end;
        if Assigned(a) then
          ACanvas.Font.Style := a.Style;        
      //ACanvas.TextOut(p.X, p.Y, SearchEngine.Pattern);  
        ACanvas.TextOut(p.X, p.Y, f);
      end;
    end;
  end;
end;

procedure TTextDiffForm.SynEdit1PaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
var
  l, k: string; // line, key
  x, y: integer; // charcellcoords x=col y=row
  c: TDisplayCoord; // charcell
  p: TPoint;
begin Exit;
  k := 'Fld';
  for y := SynEdit1.TopLine to SynEdit1.TopLine + SynEdit1.LinesInWindow do begin
    l := SynEdit1.Lines[y-1];
    x := Pos(k, l);
    while (x > 0) do begin
      c := SynEdit1.BufferToDisplayPos(BufferCoord(x, y));
      p := SynEdit1.RowColumnToPixels(c);

      Canvas.Brush.Color := clYellow;
      Canvas.Font.Color  := clRed;
      Canvas.TextOut(p.X, p.Y, k);

      x := PosEx(k, l, x+Length(k));
    end;
  end;
end;

procedure TTextDiffForm.SynEdit1Scroll(Sender: TObject; ScrollBar: TScrollBarKind);
begin
//  if Memo1.Lines.Count > 0 then begin
//    SynEditHighlightNow(SynEdit1, Memo1.Lines);
//    SynEdit1Change(nil);
//  end  
end;

procedure TTextDiffForm.SynEdit1SpecialLineColors(Sender: TObject; Line: Integer; var Special: boolean; var FG, BG: TColor);
//var
//  l: string;
begin Exit; 
//l := SynEdit1.Lines[Line];
//if StrHasWord(l, 'Fld', [soDown]) then begin // a word is in the line
//  BG      := clYellow; // background
//  FG      := clBlue;   // textcolor
//  Special := true;     // must be true, it is a special line!
//end;
  if Line = SynEdit1.CaretY then begin // current line
    BG      := clYellow; // background
  //FG      := clBlue;   // textcolor
    Special := true;     // must be true, it is a special line!
  end;                
end;
{$ENDREGION}

end.
