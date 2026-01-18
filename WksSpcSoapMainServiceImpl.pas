unit WksSpcSoapMainServiceImpl;

interface

{$REGION 'Use'}
uses
    System.Types
  , Soap.InvokeRegistry
  , Soap.XSBuiltIns
  , Wks000Unit
  , WksSpcSoapMainServiceIntf
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TSpcSoapMainService = class(TInvokableClass, ISpcSoapMainService)
  public
    function  SpcSoapInfo(var IvFbk: string): boolean; stdcall;
  end;
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  ;
{$ENDREGION}

{$REGION 'TSpcSoapMainService'}
function  TSpcSoapMainService.SpcSoapInfo(var IvFbk: string): boolean;
begin
  gdbg.Dbg('SOAPMAINSERVICE INFO');

  IvFbk := Format('%s SPC Soap Main Service (%s - %s)', [TSysRec.ACRONYM, TBynRec.Info, DateTimeToStr(Now)]);
  Result := true;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
  InvRegistry.RegisterInvokableClass(TSpcSoapMainService);
{$ENDREGION}

end.

