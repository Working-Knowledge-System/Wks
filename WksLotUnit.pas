unit WksLotUnit;

interface

type

TLotRec = record
  // general
  Customer           : string; // 'INTEL';
  DesignId           : string; // 'F070';
  Product            : string; // 'F070A1L040';
  Traveler           : string; // 'F070M1L1000';
  Priority           : string; // 'Normal';
  TypeOfWip          : string; // 'PRODUCTION';
  TypeOfProduct      : string; // 'DEVELOPMENT';
  TypeOfProcess      : string; // '';
  // who
  Lot                : string; // '1095819.009';
  LotAtStart         : string; // '1095819.009';
  LotParent          : string; // '';
  // qty
  QuantityAtStart    : integer; // 2;
  QuantityCurrent    : integer; // 2;
  // where
  Location           : string; // 'PHOTO';
  Step               : string; // 'TGT-CLN+ACI-CD';
  StepNext           : string; // 'TGT-CLN+ENG-DISP';
  // state
  State              : string; // 'Waiting';
  StateOfScheduling  : string; // '';
  // equip
  Equipment          : string; // '';
  EquipmentLastUsed  : string; // 'VIRTUALRFID';
  // datetime
  StartDateTime      : string; // '2024-08-08 09:48:51';
  LastUpdatedDateTime: string; // '2024-08-08 09:52:54';
  StagedDateTime     : string; // '2024-08-08 09:52:47';
  TrackInDateTime    : string; // 'NOT TRACKED-IN';
  HoldDateTime       : string; // 'MACH WS';
  MinTimerDateTime   : string; // '';
  // scheduling
  MachSchedule       : string; // '';
end;

implementation

end.
