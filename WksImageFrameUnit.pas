unit WksImageFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls;

type
  TImageFrame = class(TFrame)
    ImageLoadLabel: TLabel;
    ImageSaveLabel: TLabel;
    ImageEditLabel: TLabel;
    ImageFitLabel: TLabel;
    ImageClearLabel: TLabel;
    ImageDBImage: TDBImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
