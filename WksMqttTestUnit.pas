unit WksMqttTestUnit;

interface

{$REGION 'Use'}
uses
    DUnitX.TestFramework
  , WksMqttTypesUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  [TestFixture]
  TMqttTestFixture = class
  public
    // test RemainingLengthWrite
    [Test]
  //[TestCase('Test length 0'        , '0,-1'       )]
    [TestCase('Test length 0'        , '0,1'        )]
    [TestCase('Test length 127'      , '127,1'      )] // 2^7 - 1
    [TestCase('Test length 128'      , '128,2'      )] // 2^7
    [TestCase('Test length 16383'    , '16383,2'    )] // 2^14 - 1
    [TestCase('Test length 16384'    , '16384,3'    )] // 2^14
    [TestCase('Test length 2097151'  , '2097151,3'  )] // 2^21 - 1
    [TestCase('Test length 2097152'  , '2097152,4'  )] // 2^21
    [TestCase('Test length 268435455', '268435455,4')] // 2^28 - 1
  //[TestCase('Test length 268435456', '268435456,5')] // 2^28       <-- this will fail
    procedure RemainingLengthWriteTest(ALength: cardinal; ALengthExpected: byte);
  end;
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  ;
{$ENDREGION}

{$REGION 'Tests'}
procedure TMqttTestFixture.RemainingLengthWriteTest(ALength: cardinal; ALengthExpected: byte);
var
  packet: TMqttPacketClass;
begin
  Packet := TMqttPacketClass.Create;
  try
    packet.RemainingLengthWrite(ALength);
    Assert.AreEqual<integer>(ALengthExpected, packet.Stream.Size);
  finally
    Packet.Free;
  end;
end;
{$ENDREGION}

{$REGION 'Init'}
initialization
  TDUnitX.Options.ExitBehavior := TDUnitXExitBehavior.Pause;
  TDUnitX.RegisterTestFixture(TMqttTestFixture);
{$ENDREGION}

end.
