unit WksPythonEditorFormUnit;

{ *** DERIVED FROM WksTextEditorFormUnit *** }

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.Actions
  , System.Classes
  , System.Diagnostics
  , System.ImageList
  , System.SysUtils
  , System.UITypes
  , System.Variants
  , Vcl.ActnList
  , Vcl.Buttons
  , Vcl.ComCtrls
  , Vcl.Controls
  , Vcl.Dialogs
  , Vcl.ExtCtrls
  , Vcl.ExtDlgs
  , Vcl.Forms
  , Vcl.Graphics
  , Vcl.ImgList
  , Vcl.Menus
  , Vcl.StdCtrls
  , Vcl.ToolWin
  , JvExControls
  , JvExExtCtrls
  , JvExtComponent
  , JvNetscapeSplitter
  , JvScrollMax
  , VirtualTrees
  , SynEdit
  , SynEditCodeFolding
  , SynEditHighlighter
  , SynHighlighterJSON
  , PythonEngine
  , PythonVersions, VarPyth
  , Vcl.PythonGUIInputOutput
  , WksLogFrameUnit
  , WksTextEditorFormUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TPythonEditorForm = class(TTextEditorForm)
    PythonToolButton: TToolButton;
    PythonPopupMenu: TPopupMenu;
    PandasToolButton: TToolButton;
    PandasPopupMenu: TPopupMenu;
    OcvToolButton: TToolButton;
    OcvPopupMenu: TPopupMenu;
    PandasDfToStringMenuItem: TMenuItem;
    PythonEngineResetMenuItem: TMenuItem;
    OcvImageShowMenuItem: TMenuItem;
    PandasDfinfoMenuItem: TMenuItem;
    PythonModuleReloadMenuItem: TMenuItem;
    PythonVarInLocalMenuItem: TMenuItem;
    PythonVarInGloalMenuItem: TMenuItem;
    PilToolButton: TToolButton;
    PilPopupMenu: TPopupMenu;
    PilImageShowMenuItem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure RunActionExecute(Sender: TObject);
    procedure User1ActionExecute(Sender: TObject);
    procedure User2ActionExecute(Sender: TObject);
    procedure User3ActionExecute(Sender: TObject);
    procedure User4ActionExecute(Sender: TObject);
    procedure User5ActionExecute(Sender: TObject);
    procedure PythonEngineResetMenuItemClick(Sender: TObject);
    procedure PandasDfToStringMenuItemClick(Sender: TObject);
    procedure OcvImageShowMenuItemClick(Sender: TObject);
    procedure PandasDfinfoMenuItemClick(Sender: TObject);
    procedure PythonModuleReloadMenuItemClick(Sender: TObject);
    procedure PythonVarInLocalMenuItemClick(Sender: TObject);
    procedure PythonVarInGloalMenuItemClick(Sender: TObject);
    procedure PilImageShowMenuItemClick(Sender: TObject);
    //procedure PandasDfToStringMenuItemClick(Sender: TObject);
  private
    { Private declarations }
  //procedure EngineLocalRun(IvScript: string);  // created, used then destroyed in the same run-session
    procedure EngineGlobalRun(IvScript: string); // created at form level, used many times with many run session, destroyed on demand or at form closing
    procedure DecorateAndRun(IvDecoration: string);
  public
    { Public declarations }
    class function  Execute(var IvPython: string; var IvFbk: string): boolean; // indicate python is changed or not
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  PythonEditorForm: TPythonEditorForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Routine'}
class function TPythonEditorForm.Execute(var IvPython: string; var IvFbk: string): boolean;
var
  frm: TPythonEditorForm;
begin
  // form
  frm := TPythonEditorForm.Create(nil);

  // forismodalinvokedbyclient
  frm.FormIsModalInvoked := true;

  // temporarytransfer
  frm.Script := IvPython;

  // waitforclose
  try
    Result := frm.ShowModal = mrOk;
    if Result then begin
      IvFbk    := 'Python script changed';
      IvPython := frm.SynEditCurrent.Text;
    end else
      IvFbk    := 'Python script unchanged';
    //IvPython := should be unchanged;
  finally
  //FreeAndNil(frm);
    frm.Release;
  end;
end;

{procedure TPythonEditorForm.EngineLocalRun(IvScript: string);
var
  wat: TStopwatch;
var
  pvs: TPythonVersions;
  pio: TPythonGUIInputOutput;
  pye: TPythonEngine;
begin
  // exit
  if not OptionPythonVersionComboBox.ItemIndex >= 0 then begin
    ShowMessage('No Python version has been detected');
    Exit;
  end;

  // pyio
  pio := TPythonGUIInputOutput.Create(nil);
  pio.Output := LogFrame.OutputRichEdit;
  pio.MaxLines := StrToIntDef(LogFrame.OptionOutputLinesMaxEdit.Text, 1000);
  pio.MaxLineLength := StrToIntDef(LogFrame.OptionOutputLineWidthMaxEdit.Text, 256);
  pio.RawOutput := OptionPythonRawOutputCheckBox.Checked;

  // pyengine
  pvs := GetRegisteredPythonVersions;
  pye := TPythonEngine.Create(nil);
  pvs[OptionPythonVersionComboBox.ItemIndex].AssignTo(pye);
  pye.IO := pio;
  pye.LoadDll; // error, anhoter instance of python engine is already active

  // exec
  wat := TStopwatch.StartNew;
  Screen.Cursor := crHourGlass;
  try
    MaskFPUExceptions(true);
    try
      pye.ExecString(UTF8encode(IvScript));
    except
      on e: Exception do begin
        LogFrame.Log('EXCEPTION: %s', [e.Message]);
        MessageDlg(e.Message, mtWarning, [mbOK], 0);
      end;
    end;
  finally
    FreeAndNil(pio);
    FreeAndNil(pye);
    Screen.Cursor := crDefault;
  end;
  wat.Stop;
  LogFrame.Log('Done (%d ms)', [wat.ElapsedMilliseconds]);
end;}

procedure TPythonEditorForm.EngineGlobalRun(IvScript: string);
var
  wat: TStopwatch;
begin
  // exit
  if not OptionPythonVersionComboBox.ItemIndex >= 0 then begin
    ShowMessage('No Python version has been detected');
    Exit;
  end;

  // pyio
  PythonGUIInputOutput1.MaxLines      := StrToIntDef(LogFrame.OptionOutputLinesMaxEdit.Text    , 1000);
  PythonGUIInputOutput1.MaxLineLength := StrToIntDef(LogFrame.OptionOutputLineWidthMaxEdit.Text,  256);
  PythonGUIInputOutput1.RawOutput     := OptionPythonRawOutputCheckBox.Checked;

  // exec
  wat := TStopwatch.StartNew;
  Screen.Cursor := crHourGlass;
  try
    MaskFPUExceptions(true);
    try
      PythonEngine1.ExecString(UTF8encode(IvScript));
    except
      on e: Exception do begin
        LogFrame.Log('EXCEPTION: %s', [e.Message]);
        MessageDlg(e.Message, mtWarning, [mbOK], 0);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  wat.Stop;
  LogFrame.Log('Done (%d ms)', [wat.ElapsedMilliseconds]);
end;

procedure TPythonEditorForm.DecorateAndRun(IvDecoration: string);
var
  fra: string;
begin
  // exit
  if not Assigned(MainPageControl.ActivePage) then begin
    MessageDlg('No documents', mtInformation, [mbOk], 0, mbOk);
    Exit;
  end;

  // exit
  if SynEditCurrent.SelText.IsEmpty then begin
    ShowMessage('Please select a printable python fragment...');
    Exit;
  end;

  // output
  if LogFrame.ClearAutoToolButton.Down then
    LogFrame.ClearToolButton.Click;

  // fragment
  fra := Format(IvDecoration, [SynEditCurrent.SelText]);

  // run
  EngineGlobalRun(fra);
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TPythonEditorForm.FormCreate(Sender: TObject);
begin
  inherited;

  // specializeit
  Caption := Format('%s - [PYTHON Editor]', [Caption]);

  // custombutton: *** enable all necessary for python editor ***
  RunToolButton.Visible             := true;
  User1ToolButton.Visible           := true; User1ToolButton.Caption := 'Print'  ; User1ToolButton.Hint := 'Print currently selection'                ;
  User2ToolButton.Visible           := true; User2ToolButton.Caption := 'Len'    ; User2ToolButton.Hint := 'Print Lenght of currently selected object';
  User3ToolButton.Visible           := true; User3ToolButton.Caption := 'Shape'  ; User3ToolButton.Hint := 'Print Shape of currently selected object' ;
  User4ToolButton.Visible           := true; User4ToolButton.Caption := 'Type'   ; User4ToolButton.Hint := 'Print Type of currently selected object'  ;
  User5ToolButton.Visible           := true; User5ToolButton.Caption := 'Inspect'; User5ToolButton.Hint := 'Inspect currently selected object'        ;
//PythonEngineResetToolButton.Visible := true;
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TPythonEditorForm.RunActionExecute(Sender: TObject);
begin
  inherited;
  // *** CONTINUE FROM ANCESTOR TTextEditorForm.RunActionExecute ***

  EngineGlobalRun(Script);
end;

procedure TPythonEditorForm.User1ActionExecute(Sender: TObject);
begin
  inherited;
  // *** CONTINUE FROM ANCESTOR ***

  DecorateAndRun('print(%s)');
end;

procedure TPythonEditorForm.User2ActionExecute(Sender: TObject);
begin
  inherited;
  // *** CONTINUE FROM ANCESTOR ***

  DecorateAndRun('print(len(%s))');
end;

procedure TPythonEditorForm.User3ActionExecute(Sender: TObject);
begin
  inherited;
  // *** CONTINUE FROM ANCESTOR ***

  DecorateAndRun('print(%s.shape)');
end;

procedure TPythonEditorForm.User4ActionExecute(Sender: TObject);
begin
  inherited;
  // *** CONTINUE FROM ANCESTOR ***

  DecorateAndRun('print(type(%s))');
end;

procedure TPythonEditorForm.User5ActionExecute(Sender: TObject);
begin
  inherited;
  // *** CONTINUE FROM ANCESTOR ***

  DecorateAndRun('print(dir(%s))');
  JsonStrTreefy(PythonGUIInputOutput1.Output.Text);
  JsonTreefyAction.Checked := true; // simulate
end;
{$ENDREGION}

{$REGION 'PythonAction'}
procedure TPythonEditorForm.PythonEngineResetMenuItemClick(Sender: TObject);
begin
  inherited;

  // exit
  if not TabAvailable then
    Exit;

  // reset
  OptionPythonEngineRecycleSpeedButton.Click;
  SynEditCurrentFlash(500);
end;

procedure TPythonEditorForm.PythonModuleReloadMenuItemClick(Sender: TObject);
var
  cmd: string;
begin
  inherited;

  cmd :=         '# import'
  + sLineBreak + 'import importlib'
  + sLineBreak + '# reloadmodule'
  + sLineBreak + 'importlib.reload(%s)'
  ;
  DecorateAndRun(cmd);

  LogFrame.Log('python module "%s" reloaded', [SynEditCurrent.SelText]);
end;

procedure TPythonEditorForm.PythonVarInGloalMenuItemClick(Sender: TObject);
var
  cmd: string;
begin
  inherited;

  cmd :=         'if "%s" in globals() :'
  + sLineBreak + '    print("variable is in globals()")'
  + sLineBreak + 'else :'
  + sLineBreak + '    print("variable is NOT in globals()")';
  DecorateAndRun(cmd);
end;

procedure TPythonEditorForm.PythonVarInLocalMenuItemClick(Sender: TObject); // *** inutile ***
var
  cmd: string;
begin
  inherited;

  cmd :=         'if "%s" in locals() :'
  + sLineBreak + '    print("variable is in locals()")'
  + sLineBreak + 'else :'
  + sLineBreak + '    print("variable is NOT in locals()")';
  DecorateAndRun(cmd);
end;
{$ENDREGION}

{$REGION 'PandasAction'}
procedure TPythonEditorForm.PandasDfinfoMenuItemClick(Sender: TObject);
begin
  inherited;

  DecorateAndRun('print(%s.info())');
end;

procedure TPythonEditorForm.PandasDfToStringMenuItemClick(Sender: TObject);
begin
  inherited;

  DecorateAndRun('print(%s.to_string())');
end;
{$ENDREGION}

{$REGION 'OcvAction'}
procedure TPythonEditorForm.OcvImageShowMenuItemClick(Sender: TObject);
var
  cmd, wna: string;
begin
  inherited;

  wna :=         'Image' + TRndRec.RndStr(4, true);
  cmd :=         '# create a named window'
  + sLineBreak + 'windowname = "' + wna + '"'
  + sLineBreak + 'cv2.namedWindow(windowname, cv2.WINDOW_AUTOSIZE)' // WINDOW_NORMAL
  + sLineBreak + '# move the window to the desired position (x, y)'
  + sLineBreak + 'xposition = 0'
  + sLineBreak + 'yposition = 0'
  + sLineBreak + 'cv2.moveWindow(windowname, xposition, yposition)'
  + sLineBreak + '# Display the image in the named window'
  + sLineBreak + 'cv2.imshow(windowname, %s)'
  ;
  DecorateAndRun(cmd);

  LogFrame.Log('cv2 image displayed in window "%s"', [wna]);
end;
{$ENDREGION}

{$REGION 'PilAction'}
procedure TPythonEditorForm.PilImageShowMenuItemClick(Sender: TObject);
begin
  inherited;

  DecorateAndRun('%s.show()');
end;
{$ENDREGION}

end.
