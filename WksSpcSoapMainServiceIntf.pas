unit WksSpcSoapMainServiceIntf;

interface

{$REGION 'Use'}
uses
    System.Types
  , Soap.InvokeRegistry
  , Soap.XSBuiltIns
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  ISpcSoapMainService = interface(IInvokable)
    ['{287876F8-F27C-424F-95E2-661B3445A52E}']
    function  SpcSoapInfo(var IvFbk: string): boolean; stdcall;
  end;
{$ENDREGION}

implementation

{$REGION 'Init'}
initialization
  InvRegistry.RegisterInterface(TypeInfo(ISpcSoapMainService));
{$ENDREGION}

end.
