unit WksAllCtrlUnit;

// minimal common unit (similar to Wks00Unit) just for controls

interface

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , Datasnap.DBClient
  , Soap.SOAPConn
  , Soap.SOAPHTTPClient
  ;
{$ENDREGION}

implementation

function CodeSqlResultRioGet(const IvObjectId: integer; const IvParam2: string): TClientDataSet;
var
  rio: THTTPRIO;
  con: TSoapConnection;
  cds: TClientDataset;
begin
  // clientdataset
  cds := TClientDataSet.Create(nil);
  try
    // soap connection (MIDAS over SOAP)
    con := TSoapConnection.Create(cds); //<--ownership!

    // soap transport (HTTP)
    rio := THTTPRIO.Create(con); //<--ownership!
    rio.URL := 'https://www.wks.cloud/WksCodeSoapProject.dll/soap';
    rio.HTTPWebNode.UseUTF8InHeader := true;

  //con.RIO := rio;
    con.URL := rio.URL;
    con.Connected := true;

    // cds
    cds.RemoteServer := con;
    cds.ProviderName := 'CodeSqlResultDataSetProvider';

    // parameters
  //cds.Params.Clear;
  //cds.Params.CreateParam(ftInteger, 'PObjectId', ptInput).AsInteger := IvObjectId;
  //cds.Params.CreateParam(ftString, 'Param2', ptInput).AsString := IvParam2;

    // opendataset
    cds.Open;

    Result := cds; // caller owns it now, and when disposed also the owned objects are disposed (rio, con)
  except
    cds.Free;
    raise;
  end;
end;

end.
