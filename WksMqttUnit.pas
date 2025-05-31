unit WksMqttUnit;

interface

{$REGION 'Help'}
{
  CONNECTION FLAGS
  ================
  ...


  TOPICS
  ======

  Topic can be anyting, altough this is the common practice

  - try to use only small leters

  - avoid a Leading Forward Slash
    it introduces an unnecessary topic level with a zero character: /myhome/groundfloor/livingroom

  - avoid Spaces and Special Chars, use only printable ASCII chars (32..196)

  System Topics
  -------------
  Topics that start with a $ symbol are reserved for internal MQTT server statistics exposed to clients as information
  These topics are not included in the subscription when using the multi-level wildcard (#)
  Publishing messages to topics starting with $ is not permitted

  examples:

  $/broker/clients/connected      number of clients currently connected to the MQTT broker

  $/broker/clients/disconnected   number of clients that have disconnected from the MQTT broker

  $/broker/clients/total          total number of clients (connected and disconnected) that have interacted with the MQTT broker

  $/broker/messages/sent          count of messages sent by the MQTT broker

  $/broker/uptime                 duration the MQTT broker has been running (in minutes?)

  Normal Topics
  -------------
  Any string of ASCII chars not starting with / and with / as separators for each level

  example:

  myhome/groundfloor/livingroom/temperature
  myhome/groundfloor/livingroom/humidity
  myhome/groundfloor/livingroom/brightness
  myhome/groundfloor/kitchen/temperature
  myhome/groundfloor/kitchen/humidity
  myhome/groundfloor/kitchen/brightness
  myhome/groundfloor/kitchen/refrigerator/temperature


  NOTES
  =====

  the MQTT protocol specifies that the server is supposed to monitor the client’s keep-alive PINGREQ and disconnect it if it doesn’t send the PINGREQ within that period
  but we can implement the server explicitly and periodically send a PINGREQ to ALL connected clients and expect a PINGRESP in return
  if a client fails to respond the server can register the event and close the connection with that client


  This design provides a solid foundation for a complete MQTT 3.1.1 implementation in Delphi

  Indy TCP server automatically handles connections in separate threads
  The server implementation should handle multiple concurrent clients. Consider thread safety in session management

  Session Management: The server should maintain sessions for clients that connect with CleanSession=False
  Retained Messages: The server should store retained messages and deliver them to new subscribers

  Will Message: The client should support specifying a will message in the CONNECT packet
  Keep Alive: Both client and server should monitor connection activity and disconnect inactive clients.

  WordRead and WordWrite handle network byte order (big-endian) conversion using Swap
  MQTT protocol requires all multi-byte values to be big-endian

  Strings are properly encoded/decoded using UTF-8
  Length prefixes are correctly written as 2-byte values
}
{$ENDREGION}

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , Vcl.StdCtrls
  , Vcl.ComCtrls
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TMqttClass = class
  protected
    FLogLineLabel: TLabel;                                          // a single line log
    FLogRichEdit: TRichEdit;                                        // here logs normally
    FRequestHexRichEdit: TRichEdit;                                 // here logs request packet raw string
    FResponseHexRichEdit: TRichEdit;                                // here logs response packet raw string
    FLogLast: string;                                               // hold the last logged message (to avoid logging same stuff)
  protected
    procedure Log(const AStr: string; AWithTime: boolean = true); overload;
    procedure Log(const AFmt: string; AVarRecVec: array of TVarRec; AWithTime: boolean = true); overload;
    procedure Dmp(const AStr: string);
  public
    constructor Create(ALogLineLabel: TLabel; ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit: TRichEdit); virtual;{}
  end;
{$ENDREGION}

implementation

{$REGION 'TMqttClass'}
constructor TMqttClass.Create(ALogLineLabel: TLabel; ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit: TRichEdit);
begin
  FLogLineLabel        := ALogLineLabel;
  FLogRichEdit         := ALogRichEdit;
  FRequestHexRichEdit  := ARequestHexRichEdit;
  FResponseHexRichEdit := AResponseHexRichEdit;
end;

procedure TMqttClass.Log(const AStr: string; AWithTime: boolean);
var
  cnt: integer;
  str: string;
begin
  if SameText(FLogLast, AStr) then begin
    cnt := StrToIntDef(FLogLineLabel.Caption, 0);
    Inc(cnt);
    FLogLineLabel.Caption := cnt.ToString;
    Exit;
  end;

  FLogLast := AStr;

  if Assigned(FLogRichEdit) then begin
    // i
    TThread.Synchronize(nil
    , procedure
      begin
        if AWithTime then
          str := FormatDateTime('dd hh:nn:ss zzz : ', Now) + AStr
        else
          str := AStr;
        FLogRichEdit.Lines.Add(str);
      end
    );

    // ii
//  TThread.Queue(TThread.CurrentThread
//  , procedure
//    begin
//      str := FormatDateTime('dd hh:nn:ss zzz : ', Now) + AStr;
//      FLogRichEdit.Lines.Add(str);
//    end
//  );
  end;
end;

procedure TMqttClass.Log(const AFmt: string; AVarRecVec: array of TVarRec; AWithTime: boolean);
begin
  Log(Format(AFmt, AVarRecVec), AWithTime);
end;

procedure TMqttClass.Dmp(const AStr: string);
begin
  Log(AStr, false);
end;
{$ENDREGION}

end.
