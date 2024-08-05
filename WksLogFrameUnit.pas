unit WksLogFrameUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.ComCtrls
  , Vcl.StdCtrls
  , Vcl.ToolWin
  , Data.DB
  , System.Actions
  , Vcl.ActnList
  , Vcl.ExtCtrls
  , JvExExtCtrls
  , JvNetscapeSplitter
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TLogFrame = class(TFrame)
    LogPageControl: TPageControl;
    LogRichEdit: TRichEdit;
    OutputTabSheet: TTabSheet;
    OutputRichEdit: TRichEdit;
    LogToolBar: TToolBar;
    ClearToolButton: TToolButton;
    WrapToolButton: TToolButton;
    ClearAutoToolButton: TToolButton;
    ClearAllToolButton: TToolButton;
    OptionTabSheet: TTabSheet;
    OptionOutputLineWidthMaxLabel: TLabel;
    OptionOutputLineWidthMaxEdit: TEdit;
    OptionOutputLinesMaxLabel: TLabel;
    OptionOutputLinesMaxEdit: TEdit;
    OptionSoapShowCheckBox: TCheckBox;
    SoapTabSheet: TTabSheet;
    SoapGridPanel: TGridPanel;
    SoapResponseLabel: TLabel;
    SoapRequestRichEdit: TRichEdit;
    SoapRequestLabel: TLabel;
    SoapResponseRichEdit: TRichEdit;
    OptionSaveButton: TButton;
    LogTabSheet: TTabSheet;
    LogOneStaticText: TStaticText;
    LogOneTimer: TTimer;
    procedure ClearToolButtonClick(Sender: TObject);
    procedure ClearAllToolButtonClick(Sender: TObject);
    procedure WrapToolButtonClick(Sender: TObject);
    procedure OptionOutputLineWidthMaxEditChange(Sender: TObject);
    procedure OptionSoapShowCheckBoxClick(Sender: TObject);
    procedure OptionSaveButtonClick(Sender: TObject);
    procedure ConsoleSplitterMoved(Sender: TObject);
    procedure LogOneTimerTimer(Sender: TObject);
  private
    { Private declarations }
    FOptionOutputLineWidthMax: integer;
  public
    { Public declarations }
    property OptionOutputLineWidthMax: integer read FOptionOutputLineWidthMax {write FOptionOutputLineWidthMax};
    constructor Create(AOwner: TComponent); override;
    // log
    procedure LogShow;
    procedure Log(IvString: string; IvColor: TColor = clWindowText); overload;
    procedure Log(IvString: string; IvSuccess: boolean); overload;                                                        // if success log green else red
    procedure Log(IvFormatString: string; IvVarRecVector: array of TVarRec; IvColor: TColor = clWindowText); overload;
    procedure Log(IvFormatString: string; IvVarRecVector: array of TVarRec; IvSuccess: boolean); overload;                // if success log green else red
    procedure Log(IvVarRecVector: array of TVarRec; IvColor: TColor = clWindowText); overload;
    procedure Log(IvE: Exception); overload;
    // output
    procedure OutputShow;
    procedure Output(IvString: string; IvColor: TColor = clWindowText); overload;
    procedure Output(IvString: string; IvSuccess: boolean); overload;                                                     // if success output green else red
    procedure Output(IvFormatString: string; IvVarRecVector: array of TVarRec; IvColor: TColor = clWindowText); overload;
    procedure Output(IvFormatString: string; IvVarRecVector: array of TVarRec; IvSuccess: boolean); overload;             // if success log green else red
    procedure Output(IvVarRecVector: array of TVarRec; IvColor: TColor = clWindowText); overload;
    procedure OutputDs(IvDs: TDataSet; IvFldVec: TArray<string>);
    // logone
    procedure LogOne(IvString: string; IvFbkMode: TFbkModeEnum = fmNone; IvMs: integer = 5000); overload;
    procedure LogOne(IvFormatString: string; IvVarRecVector: array of TVarRec; IvFbkMode: TFbkModeEnum = fmNone; IvMs: integer = 5000); overload;
    // soap
    procedure LogSoapShow(IvShow: boolean);
    procedure LogSoapRequest(IvStream: TStream);
    procedure LogSoapResponse(IvStream: TStream);
  end;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    System.UITypes
  , System.TypInfo
  ;
{$ENDREGION}

{$REGION 'Frame'}
constructor TLogFrame.Create(AOwner: TComponent);
begin
  inherited;

  LogRichEdit.Clear;
  OutputRichEdit.Clear;
  SoapRequestRichEdit.Clear;
  SoapResponseRichEdit.Clear;
  LogOneStaticText.Caption          := '';
//LogRichEdit.Width                 := gini.IntGet('Log/Width'                   , 800    ); *** does not work, see BaseClient FormOnShow ***
  WrapToolButton.Down               := gini.BooGet('Log/Wrap'                    , false  );
  ClearAutoToolButton.Down          := gini.BooGet('Log/ClearAuto'               , false  );
  OptionOutputLinesMaxEdit.Text     := gini.StrGet('Log/OptionOutputLinesMax'    , '10000');
  OptionOutputLineWidthMaxEdit.Text := gini.StrGet('Log/OptionOutputLineWidthMax', '1024' );
  OptionSoapShowCheckBox.Checked    := gini.BooGet('Log/OptionSoapShow'          , false  );
  LogSoapShow(OptionSoapShowCheckBox.Checked);
end;
{$ENDREGION}

{$REGION 'Log'}
procedure TLogFrame.LogShow;
begin
  LogPageControl.ActivePage := LogTabSheet;
end;

procedure TLogFrame.Log(IvString: string; IvColor: TColor);
var
  str: string;
begin
  LogRichEdit.Lines.BeginUpdate;
  if ClearAutoToolButton.Down then
    LogRichEdit.Clear;
  try
    str := Format('%s %s', [FormatDateTime('yyyy/mm/dd hh:nn:ss.zzz:', Now), IvString]);
  //LogRichEdit.Lines.Add(str);
    TRicRec.RowAdd(LogRichEdit, str, IvColor);
  finally
    LogRichEdit.Lines.EndUpdate;
  end;
end;

procedure TLogFrame.Log(IvString: string; IvSuccess: boolean);
begin
  if IvSuccess then
    Log(IvString, clGreen)
  else
    Log(IvString, clRed);
end;

procedure TLogFrame.Log(IvFormatString: string; IvVarRecVector: array of TVarRec; IvColor: TColor);
begin
  Log(Format(IvFormatString, IvVarRecVector), IvColor);
end;

procedure TLogFrame.Log(IvFormatString: string; IvVarRecVector: array of TVarRec; IvSuccess: boolean);
begin
  if IvSuccess then
    Log(IvFormatString, IvVarRecVector, clGreen)
  else
    Log(IvFormatString, IvVarRecVector, clRed);
end;

procedure TLogFrame.Log(IvVarRecVector: array of TVarRec; IvColor: TColor = clWindowText);
var
  csv: string;
begin
  csv := TVntRec.VntVecToCsv(IvVarRecVector);
  Log(csv, IvColor);
end;

procedure TLogFrame.Log(IvE: Exception);
begin
  Log(TStdRec.StdException(IvE), clRed);
end;
{$ENDREGION}

{$REGION 'Output'}
procedure TLogFrame.OutputShow;
begin
  LogPageControl.ActivePage := OutputTabSheet;
end;

procedure TLogFrame.Output(IvString: string; IvColor: TColor);
begin
  OutputRichEdit.Lines.BeginUpdate;
  if ClearAutoToolButton.Down then
    OutputRichEdit.Clear;
  try
  //OutputRichEdit.Lines.Add(IvString);
    TRicRec.RowAdd(OutputRichEdit, IvString, IvColor);
  finally
    OutputRichEdit.Lines.EndUpdate;
  end;
end;

procedure TLogFrame.Output(IvString: string; IvSuccess: boolean);
begin
  if IvSuccess then
    Output(IvString, clGreen)
  else
    Output(IvString, clRed);
end;

procedure TLogFrame.Output(IvFormatString: string; IvVarRecVector: array of TVarRec; IvColor: TColor = clWindowText);
begin
  Output(Format(IvFormatString, IvVarRecVector), IvColor);
end;

procedure TLogFrame.Output(IvFormatString: string; IvVarRecVector: array of TVarRec; IvSuccess: boolean);
begin
  if IvSuccess then
    Output(IvFormatString, IvVarRecVector, clGreen)
  else
    Output(IvFormatString, IvVarRecVector, clRed);
end;

procedure TLogFrame.Output(IvVarRecVector: array of TVarRec; IvColor: TColor);
var
  csv: string;
begin
  csv := TVntRec.VntVecToCsv(IvVarRecVector);
  Output(csv, IvColor);
end;

procedure TLogFrame.OutputDs(IvDs: TDataSet; IvFldVec: TArray<string>);
var
  i  : integer;
  fld: TField;
  row: string;
begin
  // check if the dataset is active
  if not IvDs.Active then begin
    Output('Dataset is not active', clWebOrangeRed);
    Exit;
  end;

  // header
  row := '';
  for i := 0 to IvDs.FieldCount - 1 do begin
    fld := IvDs.Fields[i];
    TCsvRec.CsvRowFieldAppend(row, fld.FieldName);
  end;
  Output(row, clRed);

  // iterate through each record in the dataset
  IvDs.First;
  while not IvDs.Eof do begin
    // iterate through each field in the current record
    if false then begin
      Output('Record:', clGrayText);
      for i := 0 to IvDs.FieldCount - 1 do begin
        fld := IvDs.Fields[i];
        Output(Format('%s: %s', [fld.FieldName, fld.AsString]));
      end;
      Output('---', clGrayText);
    end else begin
      row := '';
      for i := 0 to IvDs.FieldCount - 1 do begin
        fld := IvDs.Fields[i];
        TCsvRec.CsvRowFieldAppend(row, fld.AsString);
      end;
      Output(row);
    end;

    IvDs.Next;
  end;
end;
{$ENDREGION}

{$REGION 'LogOne'}
procedure TLogFrame.LogOne(IvString: string; IvFbkMode: TFbkModeEnum; IvMs: integer);
begin
  // timer
  LogOneTimer.Enabled := false;

  // toast
  with LogOneStaticText do begin
    if IvString.IsEmpty then
      Caption := ''
    else
      Caption := Format(' %s  %s ', [FormatDateTime('hh:nn:ss', Time), IvString]);
    Width := TCnvRec.CnvTextWidth(Caption, Font);

    // fbkmode
    case IvFbkMode of
    fmNone   : begin // transparent
                 Color      := clBtnFace;
                 Font.Color := clWindowText;
               end;

    fmInfo   : begin // blue
                 Color      := clWhite;
                 Font.Color := clBlue;
               end;

    fmSuccess: begin // green
                 Color      := clWebMediumAquamarine;
                 Font.Color := clWhite;
               end;

    fmWarning: begin // orange
                 Color      := clWebOrange;
                 Font.Color := clWhite;
               end;

    fmDanger : begin // red
                 Color      := clWebCrimson;
                 Font.Color := clWhite;
               end;

    fmError  : begin // black
                 Color      := clWebDarkSlategray;
                 Font.Color := clWhite;
               end;

    else       begin // transparent
                 Color      := clBtnFace;
                 Font.Color := clWindowText;
               end;
    end;

    if IvMs <= 0 then
      Exit
    else if IvMs < 1000 then
      IvMs := 1000;
    LogOneTimer.Interval := IvMs;
    LogOneTimer.Enabled := true;
  end;
end;

procedure TLogFrame.LogOne(IvFormatString: string; IvVarRecVector: array of TVarRec; IvFbkMode: TFbkModeEnum; IvMs: integer);
begin
  LogOne(Format(IvFormatString, IvVarRecVector), IvFbkMode, IvMs);
end;

procedure TLogFrame.LogOneTimerTimer(Sender: TObject);
begin
  LogOne('', fmNone, 0);
end;
{$ENDREGION}

{$REGION 'LogSoap'}
procedure TLogFrame.LogSoapShow(IvShow: boolean);
begin
  SoapTabSheet.TabVisible := IvShow;
  if IvShow then begin
    LogPageControl.ActivePage := SoapTabSheet;
  //LogToolBar.Left := 215;
  end else begin
    LogPageControl.ActivePage := OutputTabSheet;
  //LogToolBar.Left := 175;
  end;
end;

procedure TLogFrame.LogSoapRequest(IvStream: TStream);
begin
  if not OptionSoapShowCheckBox.Checked then
    Exit;

  IvStream.Position := 0;
  SoapRequestRichEdit.Lines.LoadFromStream(IvStream);
  IvStream.Free;
end;

procedure TLogFrame.LogSoapResponse(IvStream: TStream);
begin
  if not OptionSoapShowCheckBox.Checked then
    Exit;

  IvStream.Position := 0;
  SoapResponseRichEdit.Lines.LoadFromStream(IvStream);
  IvStream.Free;
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TLogFrame.ClearToolButtonClick(Sender: TObject);
begin
  if LogPageControl.ActivePage = OutputTabSheet then
    OutputRichEdit.Clear
  else if LogPageControl.ActivePage = LogTabSheet then
    LogRichEdit.Clear;
end;

procedure TLogFrame.ClearAllToolButtonClick(Sender: TObject);
begin
  OutputRichEdit.Clear;
  LogRichEdit.Clear;
end;

procedure TLogFrame.WrapToolButtonClick(Sender: TObject);
begin
  if WrapToolButton.Down then begin
    OutputRichEdit.WordWrap := true;
    LogRichEdit.WordWrap := true;
    OutputRichEdit.ScrollBars := TScrollStyle.ssVertical;
    LogRichEdit.ScrollBars := System.UITypes.TScrollStyle.ssVertical;
  end else begin
    OutputRichEdit.WordWrap := false;
    LogRichEdit.WordWrap := false;
    OutputRichEdit.ScrollBars := TScrollStyle.ssBoth;
    LogRichEdit.ScrollBars := TScrollStyle.ssBoth;
  end;
end;

procedure TLogFrame.ConsoleSplitterMoved(Sender: TObject);
begin
  gini.IntSet('Log/Width', LogRichEdit.Width); // *** this dows work ***
end;
{$ENDREGION}

{$REGION 'Option'}
procedure TLogFrame.OptionOutputLineWidthMaxEditChange(Sender: TObject);
begin
  FOptionOutputLineWidthMax := StrToIntDef(OptionOutputLineWidthMaxEdit.Text, 1024);
end;

procedure TLogFrame.OptionSaveButtonClick(Sender: TObject);
begin
  gini.BooSet('Log/Wrap'                    , WrapToolButton.Down              );
  gini.BooSet('Log/ClearAuto'               , ClearAutoToolButton.Down         );
  gini.StrSet('Log/OptionOutputLinesMax'    , OptionOutputLinesMaxEdit.Text    );
  gini.StrSet('Log/OptionOutputLineWidthMax', OptionOutputLineWidthMaxEdit.Text);
  gini.BooSet('Log/OptionSoapShow'          , OptionSoapShowCheckBox.Checked   );
  {TMesRec.I}Log('Log options saved');
end;

procedure TLogFrame.OptionSoapShowCheckBoxClick(Sender: TObject);
begin
  LogSoapShow(OptionSoapShowCheckBox.Checked);
end;
{$ENDREGION}

{$REGION 'Zzz'}
{
procedure TLogFrame.LogWidthSet(IvWidth: integer);
begin
  LogRichEdit.Width := IvWidth;
end;
}
{$ENDREGION}

end.
