unit WksHelpDialogFormUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , System.Actions
  , System.ImageList
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.ActnList
  , Vcl.ImgList
  , Vcl.ComCtrls
  , Vcl.ToolWin
  , Vcl.Buttons
  , Vcl.ExtCtrls
  , Vcl.OleCtrls
  , SHDocVw
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  THelpDialogForm = class(TForm)
    HelpWebBrowser: TWebBrowser;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function  Execute(IvObj: string; IvIdOrPath: string): boolean;
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  HelpDialogForm: THelpDialogForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}
{$ENDREGION}

{$REGION 'Execute'}
class function THelpDialogForm.Execute(IvObj, IvIdOrPath: string): boolean;
begin
  with THelpDialogForm.Create(nil) do
    try
      // form
      Caption := Format('Help Dialog Form (%s %s)', [IvObj, IvIdOrPath]);

      // gui

      // load
      HelpWebBrowser.Navigate(Format('http://www.wks.cloud/WksPageIsapiProject.dll?CoId=%s&CoTopNavOff=true&CoSystemInfoOff=true', [IvIdOrPath])) ;

      // show
      Result := ShowModal = mrOk; // stop here and an internal loop start then, when ShowModal <> mrNone continue;

      // return
      if not Result then begin

      end else begin

      end;
    finally
      Free;
    end;
end;
{$ENDREGION}

{$REGION 'Form'}
procedure THelpDialogForm.FormShow(Sender: TObject);
begin
  Left   := Screen.Width - Width + 8;
  Top    := 0;
  Height := 800;
end;
{$ENDREGION}

{$REGION 'Action'}
{$ENDREGION}

end.
