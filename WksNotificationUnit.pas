unit WksNotificationUnit;

interface

uses
  System.Notification;

type
  TWksNotification = class
  private
    FNotificationCenter: TNotificationCenter;
  public
    procedure NotificationSet(const IvTitle, IvMessage: string);
    procedure NotificationFireDateTimeSet(const IvName, IvTitle, IvMessage: string; IvDateTime: TDateTime);
    procedure NotificationCancel(const IvNotificationName: string);
    procedure NotificationCancelAll();
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TWksNotification }

constructor TWksNotification.Create;
begin
  FNotificationCenter := TNotificationCenter.Create(nil);
end;

destructor TWksNotification.Destroy;
begin
  FNotificationCenter.Free;
  inherited;
end;

procedure TWksNotification.NotificationSet(const IvTitle, IvMessage: string);
var
  ntf: TNotification;
begin
  if not FNotificationCenter.Supported then
  //ShowMessage('Push notification is not supported')
  else begin
    ntf := FNotificationCenter.CreateNotification;
    try
      ntf.Title       := IvTitle;
      ntf.AlertBody   := IvMessage;
      ntf.EnableSound := true;
      FNotificationCenter.PresentNotification(ntf);
    finally
      ntf.Free;
    end;
  end;
end;

procedure TWksNotification.NotificationFireDateTimeSet(const IvName, IvTitle, IvMessage: string; IvDateTime: TDateTime);
var
  ntf: TNotification;
begin
  if not FNotificationCenter.Supported then
  //ShowMessage('Push notification is not supported')
  else begin
    ntf := FNotificationCenter.CreateNotification;
    try
      ntf.Name        := IvName;
      ntf.Title       := IvTitle;
      ntf.AlertBody   := IvMessage;
      ntf.EnableSound := true;
      ntf.FireDate    := IvDateTime;
      FNotificationCenter.PresentNotification(ntf);
    finally
      ntf.Free;
    end;
  end;
end;

procedure TWksNotification.NotificationCancel(const IvNotificationName: string);
begin
  FNotificationCenter.CancelNotification(IvNotificationName);
end;

procedure TWksNotification.NotificationCancelAll;
begin
  FNotificationCenter.CancelAll;
end;

end.
