unit WksPageIsapiMainWebModuleUnit;

interface

{$REGION 'Help'}
{                                request
                                    |
                                    V
  -----------------------------------------------------------------------------------
 |                           BeforeDispatch                                          |
 |  - here the event can enable or disable the actionitems suitable to the response  |
 |  - can begin filling out the response object                                      |
 |  - can provide any other necessary preprocessing objects                          |
 |  If the event finishes filling out the response object,                           |
 |  it should change the Handled parameter to True so the dispatcher                 |
 |  will not send the request on to any of the actionitems                           |
 |  If the BeforeDispatch event handler sends the response message,                  |
 |  the dispatcher will not pass the request on to any of the action items,          |
 |  even if the Handled parameter is left as False                                   |
 |  If the BeforeDispatch event handler sets the Handled parameter to True but does  |
 |  not send the response, the Web dispatcher will generate an AfterDispatch event   |
  -----------------------------------------------------------------------------------
 |                             Dispatcher                                            |
 |  the dispatcher tries to match the HTTP request                                   |
 |  PathInfo with any PathInfo of the action items                                   |
 |                                                                                   |
 |                       /  webaction1/PathInfo1                                     |
 |  request/PathInfo--->|   webaction1/PathInfo2                                     |
 |                       \  webaction1/PathInfo...                                   |
 |                                                                                   |
 |  here the dispatcher/actionitem process the request and fill out the response obj |
  -----------------------------------------------------------------------------------
 |                            AfterDispatch                                          |
 |  It is used to perform any necessary cleanup or logging                           |
  -----------------------------------------------------------------------------------
 |                             BeforeSend (non trovo nulla!)                         |
 |  The OnBeforeSend event occurs just before sending a response back to the client  |
 |  It is used to modify or add headers to a response                                |
  -----------------------------------------------------------------------------------
                                    |
                                    V
                                 response
}
{$ENDREGION}

{$REGION 'Use'}
uses
    System.SysUtils
  , System.Classes
  , Web.HTTPApp
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TMainWebModule = class(TWebModule)
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
    procedure WebModuleException(Sender: TObject; E: Exception; var Handled: boolean);
    procedure WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure WebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleInfoWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleInitWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleThemeWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleTestWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleViewWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleLoginWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleLoginTryWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleLogoutWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleAccountCreateWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleAccountRecoverWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
    procedure MainWebModuleAccountDeleteWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
  private
    { Private declarations }
  //FIni: TIniCls;
    FTic: TTicRec;
    FWrq: TWrqRec;
    FWmoRec: TWmoRec;
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  WebModuleClass: TComponentClass = TMainWebModule;
{$ENDREGION}

implementation

{$REGION 'Use'}
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

//uses
//    Data.DB
//  ;
{$ENDREGION}

{$REGION 'TMainWebModule'}

  {$REGION 'Events'}
procedure TMainWebModule.WebModuleCreate(Sender: TObject);
begin

  {$REGION 'Commands'}
  SetLength(FWmoRec.CmdRecVec, 3);
  FWmoRec.CmdRecVec[0].Cmd         := '/';
  FWmoRec.CmdRecVec[0].Description := 'Default handler';
  
  FWmoRec.CmdRecVec[1].Cmd         := '/Info';
  FWmoRec.CmdRecVec[1].Description := 'Describe module''s info and capabilities (this page)';

  FWmoRec.CmdRecVec[2].Cmd         := '/Page';
  FWmoRec.CmdRecVec[2].Description := 'Page main handler to server web pages';
  {$ENDREGION}

  {$REGION 'Objects'}
  FWmoRec.Run := 0;
//FIni := TIniCls.Create;
  {$ENDREGION}

  {$REGION 'Events'}
  FWmoRec.OnWebModuleCreate;
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleDestroy(Sender: TObject);
begin

  {$REGION 'Objects'}
//FIni.Free;
  {$ENDREGION}

  {$REGION 'Events'}
  FWmoRec.OnWebModuleDestroy;
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleException(Sender: TObject; E: Exception; var Handled: boolean);
begin
  FWmoRec.OnWebModuleException(Response, E);
  Handled := true;
end;

procedure TMainWebModule.WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  Inc(FWmoRec.Run);                                      // comment if useless
  FWmoRec.BeforeDispatch(Request, Response, FWrq, FTic); // comment to skip session/request flow
//gwrq.WebRequestOrig := Request; // cagnolina           // uncomment if revious is commented

  {$REGION 'CustomHeader'}
  // handle here specific CustomHeader for all webactions or at beginning of each specific webaction
  // standard ones like "Expires" and "Access-Control-Allow-Origin" are already handled in TWmoRec.BeforeDispatch

  // client no page cache (date in the past for not caching, date in the future a little bit for chaching in the client)
  //Response.SetCustomHeader('???', '???');
  {$ENDREGION}

  {$REGION 'ActionAvailabilityLogic'}
//TMainWebModule(Sender).Actions.Items[0].Enabled := false; // /      DefaultHandler
//TMainWebModule(Sender).Actions.Items[1].Enabled := false; // /Info  InfoWebAction
//TMainWebModule(Sender).Actions.Items[2].Enabled := false; // /Xxx   Xxx main handler
  {$ENDREGION}

end;

procedure TMainWebModule.WebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  FWmoRec.AfterDispatch(Request, Response, FWrq, FTic); // comment to skip session/request flow
end;
  {$ENDREGION}

  {$REGION 'Actions'}

    {$REGION 'Standard'}
procedure TMainWebModule.MainWebModuleDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  pid: integer;
  str: string;
begin
//TWrsRec.ResponseSet(Response, THtmRec.PageDefault);

  if not FWrq.Error.IsEmpty then begin
    str := THtmRec.PageWarning('Wrong url address', FWrq.Error);
    TWrsRec.ResponseSet(Response, str);
  end else begin
    pid := FWrq.PageId;
    str := THtmRec.Page(pid);
    TWrsRec.ResponseSet(Response, str);
  end;
end;

procedure TMainWebModule.MainWebModuleInfoWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  vec: TArray<string>;
  i: integer;
begin
  SetLength(vec, Length(FWmoRec.CmdRecVec));
  for i := 0 to High(FWmoRec.CmdRecVec) do
    vec[i] := FWmoRec.CmdRecVec[i].Cmd;

  TWrsRec.ResponseSet(Response, TJteRec.ServerInfo('Serves dynamic web Page''s', 'Web Broker Isapi', vec), TCtyRec.CTY_APP_JSON);
end;

procedure TMainWebModule.MainWebModuleViewWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
begin
  TWrsRec.ResponseSet(Response, THtmRec.Page(FWrq.PageId));
end;
    {$ENDREGION}

    {$REGION 'Utils'}
procedure TMainWebModule.MainWebModuleInitWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  sbu: TSbuRec;
  uin: string; // userinput
begin
  // input
  uin := FWrq.FieldContentGet('CoConfirm', 'No');

  // execute
  if uin.Equals('Ok') then begin
    // filesgenerate
    TW3fRec.W3WebFilesGenerate;   // w3.js, w3.css, w3-theme-name.css with name=[amber,silver,...]
    TSysRec.WksWebFilesGenerate;  // wks.js, wks.css, default.htm
  sbu.Add('<script>wks.fbkOk("Files generated at %s");</script>'                      , [TDatRec.DatNowStr]);
  end;

  // gui
  sbu.Add('<br><br>'                                                                                        );
  sbu.Add('<div class="w3-container w3-card-4 w3-auto w3-round w3-left-align">'                             );
  sbu.Add(  '<form class="w3-container" id="CoForm" method="post" action="/WksPageIsapiProject.dll/Init">'  );
  sbu.Add(    '<h2>Create the following W3 files:</h2>'                                                     );
  sbu.Add(    THtmRec.List(TW3fRec.FILE_VEC)                                                                );
  sbu.Add(    '<h2>Create the following WKS files:</h2>'                                                    );
  sbu.Add(    THtmRec.List(TSysRec.FILE_VEC)                                                                );
  sbu.Add(    '<h2>Please confirm</h2>'                                                                     );
  sbu.Add(    THtmRec.Choice('radio', 'CoConfirm', 'Confirm', ['No', 'Ok'], ['No', 'Ok'], '', '', '', [uin]));
  sbu.Add(    '<br>'                                                                                        );
  sbu.Add(    '<input class="w3-btn w3-round-xxlarge w3-blue" type="button" value="Cancel" onclick="window.location=''/WksPageIsapiProject.dll'';return false;">');
  sbu.Add(    '<input class="w3-btn w3-round-xxlarge w3-red" type="submit" value="Submit">'                 );
  sbu.Add(  '</form>'                                                                                       );
  sbu.Add(  '<br>'                                                                                          );
  sbu.Add('</div>'                                                                                          );
  sbu.Add('<br><br>'                                                                                        );

  TWrsRec.ResponseSet(Response, THtmRec.Page('Init', '', sbu.Text));
end;

procedure TMainWebModule.MainWebModuleThemeWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  sbu: TSbuRec;
  ths, uin, sql, fbk: string; // themeselected, userinput
  aff: integer;
begin
  // input
  uin := FWrq.FieldContentGet('CoConfirm', 'No');

  // execute
  if uin.Equals('Ok') then begin
    // themeset
    ths := FWrq.FieldContentGet('CoTheme', 'White');
    sql := Format('update DbaOrganization.dbo.TblTheme set FldTheme = ''%s'' where FldObjectId = %d', [ths, gorg.ObjectId]);
    TDbaRec.CmdExec(sql, aff, fbk);
    gthe.Theme := ths;
  sbu.Add('<script>wks.fbkOk("Theme set to %s at %s");</script>'          , [gthe.Theme, TDatRec.DatNowStr]);
  end;

  // gui
  sbu.Add('<br>'                                                                                            );
  sbu.Add(TW3fRec.W3ThemeTestHtmlGenerate                                                                   );

  sbu.Add('<br><br>'                                                                                        );
  sbu.Add('<div class="w3-container w3-card-4 w3-auto w3-round w3-left-align">'                             );
  sbu.Add(  '<form class="w3-container" id="CoForm" method="post" action="/WksPageIsapiProject.dll/Theme">' );
  sbu.Add(    '<h2>Select Theme:</h2>'                                                                      );
  sbu.Add(    THtmRec.Choice('select', 'CoTheme', 'Theme', TW3fRec.THEME_NAME_VEC, TW3fRec.THEME_NAME_VEC, '', '', '', [gthe.Theme]));
  sbu.Add(    '<h2>Please confirm</h2>'                                                                     );
  sbu.Add(    THtmRec.Choice('radio', 'CoConfirm', 'Confirm', ['No', 'Ok'], ['No', 'Ok'], '', '', '', [uin]));
  sbu.Add(    '<br>'                                                                                        );
  sbu.Add(    '<input class="w3-btn w3-round-xxlarge w3-blue" type="submit" value="Cancel">'                );
  sbu.Add(    '<input class="w3-btn w3-round-xxlarge w3-red" type="submit" value="Submit">'                 );
  sbu.Add(  '</form>'                                                                                       );
  sbu.Add(  '<br>'                                                                                          );
  sbu.Add('</div>'                                                                                          );
  sbu.Add('<br><br>'                                                                                        );

  TWrsRec.ResponseSet(Response, THtmRec.Page('Theme', '', sbu.Text));
end;

procedure TMainWebModule.MainWebModuleTestWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  jes, con: string;
begin
  jes := TTblRec.TblEditJsonStr('DbaAaa.dbo.TblTest', ['FldId'], ['FldA', 'FldB', 'FldC', 'FldD']);

  con := THtmRec.TableFromSql(
    'select * From DbaAaa.dbo.TblTest order by 1 desc' // sql
  , NO_DATA_STR                                        // default
  , 'w3-table-all w3-hoverable'                        // class
  , ''                                                 // style
  , true                                               // editable
  , jes                                                // jsoneditstr
  , hvHorizontal                                       // dir
//, false                                              // recordcountoff
//, false                                              // headeroff
  );
  con := THtmRec.Page('Test', '', con);

  TWrsRec.ResponseSet(Response, con);
end;
    {$ENDREGION}

    {$REGION 'Login'}
procedure TMainWebModule.MainWebModuleLoginWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  con: string;                // content
  usr, pas, rmb, rid: string; // username, password, rememberme, redirecttopageid
begin
  // input
  usr := FWrq.FieldCookieGet('CoUsername', '');
  pas := FWrq.FieldCookieGet('CoPassword', '');
  rmb := giif.Str(FWrq.FieldCookieGet('CoRememberMe', false), ' checked="checked"', '');
  rid := giif.ExP(FWrq.FieldGet('CoRedirectToPageId', ''), '?CoRedirectToPageId=');

  {$REGION 'Go'}
  // login creation form (once submitted the form pass the controll to /LoginTry)
  con := THtmRec.FormModal(
    'Login'                                // IvTitle          \
  , '[RvOrganizationLogo]'                 // IvFaIcon          |
  , ['AccountRecover', 'AccountCreate' ]   // IvCtrlButtonVec   |
  , 'CoLoginForm'                          // IvCoName          |__form
  , gwrq.ScriptNameUrl + '/LoginTry' + rid // IvAction          |
  , 'post'                                 // IvMethod          |
  , 'Login'                                // IvSubmitCaption   |
  , 80                                     // IvLabelWidth      |
  , 140                                    // IvHelpWidth      /
  , ['Username'      , 'Password'      ]   // IvTitleVec       \
  , ['Username'      , 'Password'      ]   // IvKindVec         |
  , ['CoUsername'    , 'CoPassword'    ]   // IvCoNameVec       |
  , [usr             , pas             ]   // IvValueVec        |
  , ['enter username', 'enter password']   // IvPlaceholderVec  |--controls
  , [''              , ''              ]   // IvClassVec        |
  , [''              , ''              ]   // IvStyleVec        |
  , [''              , ''              ]   // IvTailVec         |
  , [true            , true            ]   // IvRequiredVec     /
  , ''                                     // IvClass           \
  , 'padding-bottom: 32px'                 // IvStyle            |__form
  , ''                                     // IvEnctype          |
  , ''                                     // IvValidatorCsv    /
  );
  {$ENDREGION}

  con := THtmRec.Page('Login', '', con);

  TWrsRec.ResponseSet(Response, con);
end;

procedure TMainWebModule.MainWebModuleLoginTryWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  usr, pas, rem, rid, fbk: string; // username, password, rememberme, redirecttopageid
begin

  {$REGION 'go'}
  // user-validation-process and member-creation
  // if success, then the already generated session (during FWmoRec.BeforeDispatch) will be recorded into DbaUser.dbo.TblUser
  // also create the member assigning rights/levels accesses to it

  // usersessionvalid (loggedinalready)
  if          gses.IsValid(fbk) then begin
    Response.Content := THtmRec.PageWarning('Already logged in', 'You have already a valid active session.');
    Exit;

  // noorganization
  end else if gorg.Obj.&Object.IsEmpty then begin
    Response.Content := THtmRec.PageWarning('No Organization', 'The organization is empty.'); // *** never happens! ***
    Exit;

  // nousername
  end else if not gwrq.FieldGet('CoUsername', usr, '') then begin
    Response.Content := THtmRec.PageWarning('Invalid Username', 'The username you have entered is not valid.');
    Exit;

  // nopassword
  end else if not gwrq.FieldGet('CoPassword', pas, '') then begin
    Response.Content := THtmRec.PageWarning('Invalid Password', 'The password you have entered is not valid.');
    Exit;
  end;

  // authenticationfail
  if not gusr.IsAuthenticated(usr, pas, fbk) then begin
    // gobaluservarupdate
  //gusr.LoggedIn := false; // *** unreliable --> use gses.IsValid(fbk) ***

    Response.Content := THtmRec.PageWarning('Invalid Credentials', 'The username and/or password you have entered are not valid.');
    Exit;

  // authenticationok
  end else begin
    // gobaluservarupdate
  //gusr.LoggedIn := true; // *** unreliable --> use gses.IsValid(fbk) ***

    // sessionupdateondba
    gses.Organization := gorg.Obj.&Object;
    gses.Username := usr;
    gses.Update(fbk);

    // writeonclient-browser
    rem := gwrq.FieldContentGet('CoRememberMe', 'false');
    if rem = 'true' then begin
      TWrsRec.FieldCookieSet(Response, 'CoUsername', usr);
      TWrsRec.FieldCookieSet(Response, 'CoPassword', pas);
      TWrsRec.FieldCookieSet(Response, 'CoRememberMe', 'true');
  //end else begin
    //TWrsRec.FieldCookieDelete(Response, 'CoUsername');
    //TWrsRec.FieldCookieDelete(Response, 'CoPassword');
    //TWrsRec.FieldCookieDelete(Response, 'CoRememberMe');
    end;
  end;
  {$ENDREGION}

  {$REGION 'redirect'}
  rid := gwrq.FieldGet('CoRedirectToPageId', '');
  if rid.IsEmpty then
    rid := gwrq.ScriptNameUrl + '/' // redirect to the main page
  else
    rid := gwrq.ScriptNameUrl + '/Page?CoId=' + rid;
//Response.SendRedirect(rid); // *** not working *** we have to use js to forward the request because if we use the standard Response.SendRedirect then the cookies will not be sent/set
  Response.Content := TWrsRec.SendRedirectJsStr(rid);
  {$ENDREGION}

end;

procedure TMainWebModule.MainWebModuleLogoutWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  fbk: string;
begin

  // session
  gses.Close(fbk);

  // removefromclientbrowser (if user just Quit then leave the cookies) note: these cookies are deleted if the server-session expire
  TWrsRec.FieldCookieDelete(Response, 'CoDateTime');
  TWrsRec.FieldCookieDelete(Response, 'CoSessionId');
  TWrsRec.FieldCookieDelete(Response, 'CoFingerprintId');

  // redirect
  Response.Content := TWrsRec.SendRedirectJsStr('/Default.htm');
end;
    {$ENDREGION}

    {$REGION 'Account'}
procedure TMainWebModule.MainWebModuleAccountCreateWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  con: string;
begin
  con := THtmRec.PageInfo(NOT_IMPLEMENTED_STR, 'This page is actually under development');
  TWrsRec.ResponseSet(Response, con);
end;

procedure TMainWebModule.MainWebModuleAccountRecoverWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  con: string;
begin
  con := THtmRec.PageInfo(NOT_IMPLEMENTED_STR, 'This page is actually under development');
  TWrsRec.ResponseSet(Response, con);
end;

procedure TMainWebModule.MainWebModuleAccountDeleteWebActionAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: boolean);
var
  con: string;
begin
  con := THtmRec.PageInfo(NOT_IMPLEMENTED_STR, 'This page is actually under development');
  TWrsRec.ResponseSet(Response, con);
end;
    {$ENDREGION}

  {$ENDREGION}

{$ENDREGION}

end.
