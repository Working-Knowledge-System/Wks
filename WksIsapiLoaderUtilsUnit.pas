unit WksIsapiLoaderUtilsUnit;

interface

uses
  Winapi.Windows;

// it returns the full path and file name of the module it is running in
function  GetModuleFName: string;

// looks up the user name and domain name for the user account associated with the calling thread
// return true if the function  succeeds otherwise, false and GetLastError() will return the failure reason
// if either of the supplied buffers are too small, GetLastError() will return ERROR_INSUFFICIENT_BUFFER
// and pcchUser and pcchDomain will be adjusted to reflect the required buffer sizes
// szUser     - a buffer that receives the user name
// pcchUser   - the size, in characters, of szUser
// szDomain   - a buffer that receives the domain name
// pcchDomain - the size, in characters, of szDomain
function  GetCurrentUserAndDomain(szUser: PChar; pcchUser: DWORD; szDomain: PChar; pcchDomain: DWORD): boolean;

implementation

function  GetModuleFName: string;
var
  FileName : array[0..MAX_PATH] of char;
  P: integer;
begin
  FillChar(FileName, SizeOf(FileName), #0);
  GetModuleFileName(HInstance, FileName, SizeOf(FileName));
  P:= Pos('\\?\', FileName);
  if P = 1 then
    Result:= Copy(FileName, 5, High(integer))
  else
    Result:= FileName;
end;

function  GetCurrentUserAndDomain(szUser: PChar; pcchUser: DWORD; szDomain: PChar; pcchDomain: DWORD): boolean;
var
  fSuccess : boolean;
  hToken   : THandle;
  ptiUser  : PSIDAndAttributes;
  cbti     : DWORD;
  snu      : SID_NAME_USE;
begin
  ptiUser := nil;
  Result := false;

  try
    // Get the calling thread's access token.
    if (not OpenThreadToken(GetCurrentThread(), TOKEN_QUERY, TRUE, hToken)) then begin
      if (GetLastError() <> ERROR_NO_TOKEN) then
        exit;
      // Retry against process token if no thread token exists.
      if (not OpenProcessToken(GetCurrentProcess(), TOKEN_QUERY, hToken)) then
        exit;
    end;

    // Obtain the size of the user information in the token.
    if (GetTokenInformation(hToken, TokenUser, nil, 0, cbti)) then
      // Call should have failed due to zero-length buffer.
      Exit
    else
      // Call should have failed due to zero-length buffer.
      if (GetLastError() <> ERROR_INSUFFICIENT_BUFFER) then
        Exit;


    // Allocate buffer for user information in the token.
    ptiUser :=  HeapAlloc(GetProcessHeap(), 0, cbti);
    if (ptiUser= nil) then
      Exit;

    // Retrieve the user information from the token.
    if (not GetTokenInformation(hToken, TokenUser, ptiUser, cbti, cbti)) then
      Exit;

    // Retrieve user name and domain name based on user's SID.
    if (not LookupAccountSid(nil, ptiUser.Sid, szUser, pcchUser, szDomain, pcchDomain, snu)) then
      Exit;

    fSuccess := TRUE;
  finally
    // Free resources.
    if (hToken > 0) then
      CloseHandle(hToken);

    if (ptiUser <> nil) then
      HeapFree(GetProcessHeap(), 0, ptiUser);
   end;

   Result :=  fSuccess;
end;

end.
