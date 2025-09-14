////////////////////////////////////////////////////////////////////////////////
//
// Wks include file
//
////////////////////////////////////////////////////////////////////////////////


// multiple instances
//{$DEFINE DEF_MULTIPLE_INSTANCE_ALLOW_TO_RUN_OFF}

// complete boolean evaluation off
//{$B-}

// range checking off
//{$R-}

// overflow checking off
//{$Q-}

// var string checking off
//{$V-}

// typed @ operator off
//{$T-}

// extended syntax on
//{$X+}

// open string params on
//{$P+}

// optimization on
//{$O+}

// use long strings by default
//{$H+}

// checks
//{$OVERFLOWCHECKS OFF}

// checks
//{$RANGECHECKS OFF}

// ???
//{$TYPEDADDRESS OFF}

// silent hints showing
//{$HINTS OFF}                          // default is ON

// silent warnings showing
//{$WARNINGS OFF}                       // default is ON

// silent warning like FileCtrl is specific to a platform
//{$WARN UNIT_PLATFORM OFF}             // default is ON

// silent warning like "%s is specific to a platform"
//{$WARN SYMBOL_PLATFORM OFF}             // default is ON

// warn if you create an instance of a class that contains astract procedures
// creating instances of a class which contains abstract procedures is dangerous!
//{$WARN CONSTRUCTING_ABSTRACT OFF} 

// avoid extended rtti compiled in the exe or dll
{$IF Defined(RELEASE)}
  {$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
  {$WEAKLINKRTTI ON}
{$ENDIF}



