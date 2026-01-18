unit WksComUnit;

// Include this unit in multithread apps like isapidll, demonexe or similar and when connecting to db
// WksComUnit must be the last file imported or the app will hang !!!
//
// In most Delphi ISAPI applications, it is not necessary to manually call: CoInitializeEx(nil, COINIT_MULTITHREADED) in the initialization section
// if you've set CoInitFlags := COINIT_MULTITHREADED; before Application.Initialize
// Delphi's WebBroker framework (used in ISAPI) automatically calls CoInitializeEx in the main thread with the flags from CoInitFlags
//
// You need to manually call CoInitializeEx(nil, COINIT_MULTITHREADED); in the thread itself if:
// you're creating your own threads (e.g., using TThread or Windows API directly), and
// those threads use COM objects (e.g., ADO, MSXML, Word automation)
// In that case, each thread must call:
//
// CoInitializeEx(nil, COINIT_MULTITHREADED);
// try
//   // COM usage here
// finally
//   CoUninitialize;
// end;
//
// So, avoid calling CoInitializeEx in the initialization section of this unit, because:
// you don't control which thread the initialization block runs in
// it may conflict with Delphi's Application.Initialize behavior

interface

{}
uses
    Winapi.ActiveX
  ;

implementation
{}
initialization
  CoInitializeEx(nil, COINIT_MULTITHREADED);

finalization
  CoUninitialize;

end.
