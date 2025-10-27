unit WksIsapiLoaderPatchUnit;

{
  simply include this unit in your uses clause for it to work
  it will act as a patch during isapi shutdown

  William Egge
  http://www.eggcentric.com
  billm@eggcentric.com
}

interface

uses
    Web.WebBroker
  , System.SysUtils
  , System.Classes
  ;

implementation

procedure DoneApplication;
begin
  try
    Application.Free;
    Application := nil;
  except
    on e: Exception do
      if Assigned(HandleShutdownException) then begin
        Application := nil;  // Application of no use at this point so clear it
        System.Classes.ApplicationHandleException := nil;
        HandleShutdownException(e);
      end;
  end;
end;

initialization

finalization

  DoneApplication;

end.
 