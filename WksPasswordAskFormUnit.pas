unit WksPasswordAskFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TPasswordAskForm = class(TForm)
    PasswordLabel: TLabel;
    PasswordEdit: TEdit;
    EnterButton: TButton;
    procedure EnterButtonClick(Sender: TObject);
  private
    FPassword: string;
  public
    property Password: string read FPassword;
    class function  Execute(IvPassword: string = ''): boolean;
  end;

//var
//  FormPassword: TFormPassword;

implementation

{$R *.dfm}

class function  TPasswordAskForm.Execute(IvPassword: string): boolean;
begin
  with TPasswordAskForm.Create(nil) do
    try
      FPassword := IvPassword;
      PasswordEdit.Text := '';
      Result := ShowModal = mrOk;
    finally
      Free;
    end;
end;

procedure TPasswordAskForm.EnterButtonClick(Sender: TObject);
begin
  if PasswordEdit.Text = FPassword then
    ModalResult := mrOK
  else
    ModalResult := mrAbort;
end;

end.
