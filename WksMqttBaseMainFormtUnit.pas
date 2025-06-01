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
  , Vcl.ExtCtrls, JvExExtCtrls, JvNetscapeSplitter
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
    LogRichEdit: TRichEdit;
    RequestHexRichEdit: TRichEdit;
    ResponseHexRichEdit: TRichEdit;
    RequestTabSheet: TTabSheet;
    RequestTxtRichEdit: TRichEdit;
    ResponseTabSheet: TTabSheet;
    ResponseTxtRichEdit: TRichEdit;
    ResponseJvNetscapeSplitter: TJvNetscapeSplitter;
    RequestJvNetscapeSplitter: TJvNetscapeSplitter;
    RequestTopPanel: TPanel;
    RequestClearButton: TButton;
    ResponseTopPanel: TPanel;
    ResponseClearButton: TButton;
    XxxExitButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LogClearButtonClick(Sender: TObject);
    procedure RequestClearButtonClick(Sender: TObject);
    procedure ResponseClearButtonClick(Sender: TObject);
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

{$REGION 'Routine'}
procedure TBaseForm.Log(AStr: string);
var
  str: string;
begin
  str := FormatDateTime('dd hh:nn:ss zzz : ', Now) + AStr;
  LogRichEdit.Lines.Add(str);
end;

procedure TBaseForm.Log(AFmt: string; AVarRecVec: array of TVarRec);
begin
  Log(Format(AFmt, AVarRecVec));
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TBaseForm.FormCreate(Sender: TObject);
begin
  // gui
  Caption := 'WKS MQTT Base';
  TopPageControl.ActivePageIndex := 0;
  MainPageControl.ActivePageIndex := 0;
  MainPanel.Align := alClient;
  LogRichEdit.Clear;
  RequestHexRichEdit.Clear;
  RequestTxtRichEdit.Clear;
  ResponseHexRichEdit.Clear;
  ResponseTxtRichEdit.Clear;

  // ini
  FIni := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
end;

procedure TBaseForm.FormDestroy(Sender: TObject);
begin
  // ini
  FIni.Free;
end;

procedure TBaseForm.XxxExitButtonClick(Sender: TObject);
begin
  Close;
end;
{$ENDREGION}

{$REGION 'Log'}
procedure TBaseForm.LogClearButtonClick(Sender: TObject);
begin
  LogRichEdit.Clear;
  LogRichEdit.Tag := 0;
end;
{$ENDREGION}

{$REGION 'Request'}
procedure TBaseForm.RequestClearButtonClick(Sender: TObject);
begin
  RequestHexRichEdit.Clear;
  RequestTxtRichEdit.Clear;
end;
{$ENDREGION}

{$REGION 'Response'}
procedure TBaseForm.ResponseClearButtonClick(Sender: TObject);
begin
  ResponseHexRichEdit.Clear;
  ResponseTxtRichEdit.Clear;
end;
{$ENDREGION}

end.
