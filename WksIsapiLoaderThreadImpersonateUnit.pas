unit WksIsapiLoaderThreadImpersonateUnit;

interface

uses
  Classes, Windows;

type
  TThreadImpersonate = class(TThread)
  protected
    FToken: THandle; // LongWord
    procedure Impersonate;
  public
    constructor Create(CreateSuspended: boolean);
    destructor Destroy; override;
  end;

implementation

constructor TThreadImpersonate.Create(CreateSuspended: boolean);
begin
  OpenThreadToken(GetCurrentThread(), TOKEN_ALL_ACCESS, False, FToken);
  inherited Create(CreateSuspended);
end;

destructor TThreadImpersonate.Destroy;
begin
  inherited;
  CloseHandle(FToken);
end;

procedure TThreadImpersonate.Impersonate;
begin
  ImpersonateLoggedOnUser(FToken);
end;

end.
