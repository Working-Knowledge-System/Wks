unit WksMqttBaseMainFormtUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , System.IniFiles
  , Vcl.Graphics
  , Vcl.Imaging.pngimage
  , Vcl.Controls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.StdCtrls
  , Vcl.ComCtrls
  , Vcl.ExtCtrls
  , SynEdit
  , SynEditTypes
  , SynEditHighlighter
  , SynHighlighterGeneral
  , JvExExtCtrls
  , JvNetscapeSplitter
  , VirtualTrees
  , Data.DB
  , Data.Win.ADODB
  , Vcl.Grids
  , Vcl.DBGrids
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TBaseForm = class(TForm)
    TopPageControl: TPageControl;
    XxxTabSheet: TTabSheet;
    TopPanel: TPanel;
    LogoImage: TImage;
    MainPanel: TPanel;
    MainPageControl: TPageControl;
    LogTabSheet: TTabSheet;
    LogTopPanel: TPanel;
    LogClearButton: TButton;
    XxxExitButton: TButton;
    LogVerboseCheckBox: TCheckBox;
    LogRawCharCheckBox: TCheckBox;
    LogRawHexCheckBox: TCheckBox;
    LogRawAsciiCheckBox: TCheckBox;
    LogSynEdit: TSynEdit;
    SynMqttSyn: TSynGeneralSyn;
    RightPanel: TPanel;
    RightJvNetscapeSplitter: TJvNetscapeSplitter;
    RightPageControl: TPageControl;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LogClearButtonClick(Sender: TObject);
    procedure XxxExitButtonClick(Sender: TObject);
  protected
    FIni: TIniFile;
    procedure Log(AStr: string); overload;
    procedure Log(AFmt: string; AVarRecVec: array of TVarRec); overload;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  BaseForm: TBaseForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

//uses
//  ;
{$ENDREGION}

{$REGION 'Form'}
procedure TBaseForm.FormCreate(Sender: TObject);
begin
  // init
  ReportMemoryLeaksOnShutdown := true;

  // gui
  Caption := 'WKS MQTT Base';
  TopPageControl.ActivePageIndex := 0;
  MainPageControl.ActivePageIndex := 0;
  MainPanel.Align := alClient;
  LogClearButton.Click;

  // ini
  FIni := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  LogVerboseCheckBox.Checked  := FIni.ReadBool('Log', 'Verbose', true);
  LogRawAsciiCheckBox.Checked := FIni.ReadBool('Log', 'RawAsci', true);
  LogRawHexCheckBox.Checked   := FIni.ReadBool('Log', 'RawHex' , true);
  LogRawCharCheckBox.Checked  := FIni.ReadBool('Log', 'RawChar', true);
end;

procedure TBaseForm.FormDestroy(Sender: TObject);
begin
  // ini
  FIni.WriteBool('Log', 'Verbose', LogVerboseCheckBox.Checked );
  FIni.WriteBool('Log', 'RawAsci', LogRawAsciiCheckBox.Checked);
  FIni.WriteBool('Log', 'RawHex' , LogRawHexCheckBox.Checked  );
  FIni.WriteBool('Log', 'RawChar', LogRawCharCheckBox.Checked );
  FIni.Free;
end;

procedure TBaseForm.XxxExitButtonClick(Sender: TObject);
begin
  Close;
end;
{$ENDREGION}

{$REGION 'Log'}
procedure TBaseForm.Log(AStr: string);
var
  str: string;
begin
  LogSynEdit.BeginUpdate;
  try
    str := FormatDateTime('dd hh:nn:ss zzz : ', Now) + AStr;
    LogSynEdit.Lines.Add(str);
    LogSynEdit.CaretXY := BufferCoord(1, LogSynEdit.Lines.Count);
    LogSynEdit.EnsureCursorPosVisible;
  finally
    LogSynEdit.EndUpdate;
  end;
end;

procedure TBaseForm.Log(AFmt: string; AVarRecVec: array of TVarRec);
begin
  Log(Format(AFmt, AVarRecVec));
end;

procedure TBaseForm.LogClearButtonClick(Sender: TObject);
begin
  LogSynEdit.Clear;
end;
{$ENDREGION}

end.
