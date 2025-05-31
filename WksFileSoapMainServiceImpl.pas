unit WksFileSoapMainServiceImpl;

interface

{$REGION 'Use'}
uses
    System.Types
  , System.SysUtils
  , Soap.InvokeRegistry
  , Soap.XSBuiltIns
  , Wks000Unit
  , WksFileSoapMainServiceIntf
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  // file class that implements the corresponding soap invokable interface
  TFileSoapMainService = class(TInvokableClass, IFileSoapMainService)
  public
    // file methods
    function  FileInfoSoap(var IvFbk: string): boolean; stdcall;
    function  FileSelectSoap(var IvFilRem: TFilRem; const IvWhitByteArray: boolean; var IvFbk: string): boolean; stdcall;
    function  FileInsertSoap({var} const IvFilRem: TFilRem; var IvFbk: string): boolean; stdcall;
    function  FileUpdateSoap(const IvFilRem: TFilRem; const IvUser: string; var IvFbk: string): boolean; stdcall;
    function  FileDeleteSoap(const IvFilRem: TFilRem; const IvUser: string; IvRecoverable: boolean; var IvFbk: string): boolean; stdcall;
    function  FileMoveSoap(const IvUId, IvObj: string; const IvObjectIdNew: integer; var IvFbk: string): boolean; stdcall;
    function  FileMoveIsAllowedSoap(const IvObj: string; const IvObjectId: integer; const IvUId, IvUser: string; var IvIsAllowed: boolean; var IvFbk: string): boolean; stdcall;
    function  FileVectorSoap(const IvObjectId: integer; IvObj: string; var IvFilRemVector: TFilRemVector; const IvWhitByteArray: boolean; var IvFbk: string): boolean; stdcall;
  //function  FileDatasetSoap(const IvSql: string; var IvDs: OleVariant; var IvFbk: string): boolean; stdcall;
  //function  FileUploadSoap...
  //function  FileDownloadSoap...
  //function  FileCheckOutSoap...
  //function  FileCheckOutCancelSoap...
  //function  FileCheckInSoap...
  //function  FileHistorySoap...
  end;
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    System.Classes
  , System.StrUtils
  , Data.DB
  ;
{$ENDREGION}

{$REGION 'TFileSoapMainService'}
function  TFileSoapMainService.FileInfoSoap(var IvFbk: string): boolean;
begin
  IvFbk := Format('%s FILE Soap Main Service (%s - %s)', [TSysRec.ACRONYM, TBynRec.Info, DateTimeToStr(Now)]);
  Result := true;
end;

function  TFileSoapMainService.FileSelectSoap(var IvFilRem: TFilRem; const IvWhitByteArray: boolean; var IvFbk: string): boolean;
var
  fil: TFilRec;
begin
  // remtorec
  IvFilRem.ToRec(fil);

  // select
  Result := fil.DbaSelect(IvWhitByteArray, IvFbk);
  if not Result then
    Exit;

  // remfromrec
  IvFilRem.FromRec(fil);
end;

function  TFileSoapMainService.FileInsertSoap({var} const IvFilRem: TFilRem; var IvFbk: string): boolean;
var
  fil: TFilRec;
begin
  // remtorec
  IvFilRem.ToRec(fil);

  // select
  Result := fil.DbaInsert(IvFbk);
  if not Result then
    Exit;

  // remfromrec
//IvFilRem.FromRec(fil);
end;

function  TFileSoapMainService.FileUpdateSoap(const IvFilRem: TFilRem; const IvUser: string; var IvFbk: string): boolean;
var
  fil: TFilRec;
begin
  // remtorec
  IvFilRem.ToRec(fil);

  // select
  Result := fil.DbaUpdate(IvFbk);
end;

function  TFileSoapMainService.FileDeleteSoap(const IvFilRem: TFilRem; const IvUser: string; IvRecoverable: boolean; var IvFbk: string): boolean;
var
  fil: TFilRec;
begin
  // remtorec
  IvFilRem.ToRec(fil);

  // select
  Result := fil.DbaDelete(IvUser, IvRecoverable, IvFbk);
end;

function  TFileSoapMainService.FileMoveSoap(const IvUId, IvObj: string; const IvObjectIdNew: integer; var IvFbk: string): boolean;
var
  sql: string;
  ido, aff: integer;
begin
  // oidold
  sql := Format('select FldObjectId from DbaFile.dbo.TblFile where (FldUId = ''%s'') and (FldObj = ''%s'')', [IvUId, IvObj]);
  ido := TDbaRec.Scalar(sql, -1);

  // sql
  sql :=         'update'
  + sLineBreak + '    DbaFile.dbo.TblFile'
  + sLineBreak + 'set'
  + sLineBreak + '    FldObjectId = ' + TSqlRec.Val(IvObjectIdNew)
  + sLineBreak + 'where'
  + sLineBreak + '    FldUId = ' + TSqlRec.Val(IvUId)
  + sLineBreak + 'and FldObj = ' + TSqlRec.Val(IvObj);

  // exec
  Result := TDbaRec.CmdExec(sql, aff, IvFbk);
  if not Result then
    Exit;

  // fbk
  IvFbk := Format('File with UId %s and Obj %s moved from old ObjectId %d to new ObjectId %d', [IvUId, IvObj, ido, IvObjectIdNew]);
end;

function  TFileSoapMainService.FileMoveIsAllowedSoap(const IvObj: string; const IvObjectId: integer; const IvUId, IvUser: string; var IvIsAllowed: boolean; var IvFbk: string): boolean;
begin
  // def
  IvIsAllowed := false;

  // idtargetexists
  Result := TDbaRec.RecExists(Format('Dba%s.dbo.TblObject', [IvObj]), 'FldId', IvObjectId, IvFbk);
  if not Result then begin
    IvFbk := Format('Unable to move, object %s with Id %s does not exists', [IvObj, IvObjectId]);
    Exit;
  end;

  // fileexists
  Result := TDbaRec.RecExists('DbaFile.dbo.TblFile', 'FldUId', IvUId, IvFbk); // *** and FldObj = ''%s'' ***
  if not Result then begin
    IvFbk := Format('Unable to move, file with UId %s does not exists', [IvUId]); // *** and  Obj %s ***
    Exit;
  end;

  // userisowner
  Result := TDbaRec.RecExists('DbaFile.dbo.TblFile', Format('FldUId = ''%s'' and FldObj = ''%s'' and FldOwner = ''%s''', [IvUId, IvObj, IvUser]), IvFbk);
  if not Result then begin
    IvFbk := Format('Unable to move, file with UId %s is not owned by %s or %s', [IvUId, IvUser, IvFbk]);
    Exit;
  end;

  // end
  IvIsAllowed := true;
  IvFbk := Format('File with UId %s and Obj %s can be moved by %s', [IvUId, IvObj, IvUser]);
end;

function  TFileSoapMainService.FileVectorSoap(const IvObjectId: integer; IvObj: string; var IvFilRemVector: TFilRemVector; const IvWhitByteArray: boolean; var IvFbk: string): boolean;
var
  sql: string;
  dst: TDataSet;
  aff, i: integer;
begin
  // sql *** duplicated in TFilRec.DbaSelect ***
    sql                                 := 'select'
                          + sLineBreak + '    FldObjectId'
                          + sLineBreak + '  , FldUId'
                          + sLineBreak + '  , FldObj'
                          + sLineBreak + '  , FldKind'
                          + sLineBreak + '  , FldState'
                          + sLineBreak + '  , FldCreated'
                          + sLineBreak + '  , FldUpdated'
                          + sLineBreak + '  , FldOrganization'
                          + sLineBreak + '  , FldOwner'
                          + sLineBreak + '  , FldPathOriginal'
                          + sLineBreak + '  , FldFilename'
                          + sLineBreak + '  , FldRevision'
                          + sLineBreak + '  , FldContentType'
                          + sLineBreak + '  , FldModified'
                          + sLineBreak + '  , FldSizeBytes'
                          + sLineBreak + '  , FldStorage'
                          + sLineBreak + '  , FldEditingBy'
                          + sLineBreak + '  , FldNote'
                          + sLineBreak + '  , FldCanDownload'
                          + sLineBreak + '  , FldCanEdit'
                          + sLineBreak + '  , FldDownloadCount'
                          + sLineBreak + '  , FldEditCount'
  + ifthen(IvWhitByteArray, sLineBreak + '  , FldByteArray', '')
                          + sLineBreak + 'from'
                          + sLineBreak + '    DbaFile.dbo.TblFile'
                          + sLineBreak + 'where'
                          + sLineBreak + '    FldObjectId = ' + TSqlRec.Val(IvObjectId)
                          + sLineBreak + 'and FldObj      = ' + TSqlRec.Val(IvObj)
                          + sLineBreak + 'order by'
                          + sLineBreak + '    FldFilename';

  // ds
  try
    Result := TDbaRec.DsFromSql(sql, dst, aff, IvFbk, true);

    if Result then begin
      // remvectorload
      SetLength(IvFilRemVector, dst.RecordCount);
      for i := 0 to dst.RecordCount - 1 do begin
        // new
        IvFilRemVector[i] := TFilRem.Create;

        // set *** duplicated in TFilRec.DbaSelect ***
        IvFilRemVector[i].ObjectId     := dst.FieldByName('FldObjectId'     ).AsInteger ;
        IvFilRemVector[i].UId          := dst.FieldByName('FldUId'          ).AsString  ;
        IvFilRemVector[i].Obj          := dst.FieldByName('FldObj'          ).AsString  ;
        IvFilRemVector[i].Kind         := dst.FieldByName('FldKind'         ).AsString  ;
        IvFilRemVector[i].State        := dst.FieldByName('FldState'        ).AsString  ;
        IvFilRemVector[i].Created      := dst.FieldByName('FldCreated'      ).AsDateTime;
        IvFilRemVector[i].Updated      := dst.FieldByName('FldUpdated'      ).AsDateTime;
        IvFilRemVector[i].Organization := dst.FieldByName('FldOrganization' ).AsString  ;
        IvFilRemVector[i].Owner        := dst.FieldByName('FldOwner'        ).AsString  ;
        IvFilRemVector[i].PathOriginal := dst.FieldByName('FldPathOriginal' ).AsString  ;
        IvFilRemVector[i].Filename     := dst.FieldByName('FldFilename'     ).AsString  ;
        IvFilRemVector[i].Revision     := dst.FieldByName('FldRevision'     ).AsInteger ;
        IvFilRemVector[i].ContentType  := dst.FieldByName('FldContentType'  ).AsString  ;
        IvFilRemVector[i].Modified     := dst.FieldByName('FldModified'     ).AsDateTime;
        IvFilRemVector[i].SizeBytes    := dst.FieldByName('FldSizeBytes'    ).AsInteger ;
        IvFilRemVector[i].Storage      := dst.FieldByName('FldStorage'      ).AsString  ;
        IvFilRemVector[i].EditingBy    := dst.FieldByName('FldEditingBy'    ).AsString  ;
        IvFilRemVector[i].Note         := dst.FieldByName('FldNote'         ).AsString  ;
        IvFilRemVector[i].CanDownload  := dst.FieldByName('FldCanDownload'  ).AsBoolean ;
        IvFilRemVector[i].CanEdit      := dst.FieldByName('FldCanEdit'      ).AsBoolean ;
        IvFilRemVector[i].DownloadCount:= dst.FieldByName('FldDownloadCount').AsInteger ;
        IvFilRemVector[i].EditCount    := dst.FieldByName('FldEditCount'    ).AsInteger ;

        // optional
        if IvWhitByteArray then
        IvFilRemVector[i].ByteArray    :={dst.FieldByName('FldByteArray').Value} TDstRec.FieldToByteArray(dst, 'FldByteArray')
        else
        IvFilRemVector[i].ByteArray    := nil;

        // next
        dst.Next;
      end;
    end;
  finally
    FreeAndNil(dst);
  end;
end;
{$ENDREGION}

initialization

{$REGION 'Init'}
  InvRegistry.RegisterInvokableClass(TFileSoapMainService);
{$ENDREGION}

end.

