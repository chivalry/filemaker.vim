" Vim syntax file for FileMaker calculations
" Last Change: 2014 Jul 3
" Version: 1.0a1
" Language: FileMaker Calculations
" Maintainer: Charles Ross <chivalry@mac.com>
" License: The MIT License

if exists("b:current_syntax")
  finish
endif

" ---------------------------------------------------
" Local and Global Variables

syntax match fmVariables "\v\$\$?[A-Za-z_.]+"

highlight link fmVariables Identifier

" ---------------------------------------------------
" Convention Variables

syntax match conVariables "\v_[A-Za-z_]+"

highlight link conVariables Identifier

" ---------------------------------------------------
" Keywords

"syntax keyword fmKeyword 

" ---------------------------------------------------
" Operators

syntax match fmOperator "\v\*"
syntax match fmOperator "\v/"
syntax match fmOperator "\v\+"
syntax match fmOperator "\v-"
syntax match fmOperator "\v\="
syntax match fmOperator "\v\&"
syntax match fmOperator "\v¶"
syntax match fmOperator "\v≤"
syntax match fmOperator "\v≥"
syntax match fmOperator "\v≠"
syntax match fmOperator "\v^"
syntax keyword fmOperator and or not xor

highlight link fmOperator Operator

" ---------------------------------------------------
" Literals

syntax region fmString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax keyword fmLiteral True False

" Integer with -, + or nothing in front
syntax match fmLiteral "\d\+" " contained display
syntax match fmLiteral "[-+]\d\+" " contained display

" Floating point number with decimal.
syntax match fmLiteral "\d\+\.\d*" " contained display
syntax match fmLiteral "[-+]\d\+\.\d*" " contained display

highlight link fmString String
highlight link fmLiteral Constant

" ---------------------------------------------------
" Built-in FileMaker functions

" Text functions
syntax keyword fmBuiltIns Char Code Exact Filter FilterValues
syntax keyword fmBuiltIns GetAsCSS GetAsDate GetAsNumber GetAsSVG GetAsText
syntax keyword fmBuiltIns GetAsTime GetAsTimestamp GetAsURLEncoded GetValue
syntax keyword fmBuiltIns Hiragana KanaHankaku KanaZenkaku KanjiNumeral Katakana
syntax keyword fmBuiltIns Left LeftValues LeftWords Length Lower Middle MiddleValues
syntax keyword fmBuiltIns MiddleWords NumToJText PatternCount Position Proper Quote
syntax keyword fmBuiltIns Replace Right RightValues RightWords RomanHankaku
syntax keyword fmBuiltIns RomanZenkaku SerialIncrement Substitute Trim TrimAll Upper
syntax keyword fmBuiltIns ValueCount WordCount

" Text formatting functions
syntax keyword fmBuiltIns RGB TextColor TextColorRemove TextFont TextFontRemove
syntax keyword fmBuiltIns TextFormatRemove TextSize TextSizeRemove TextStyleAdd
syntax keyword fmBuiltIns TextStyleRemove

" Number functions
syntax keyword fmBuiltIns Abs Ceiling Combination Div Exp Factorial Floor Int Lg Ln
syntax keyword fmBuiltIns Log Mod Random Round SetPrecision Sign Sqrt Truncate

" Date functions
syntax keyword fmBuiltIns Date Day DayName DayNameJ DayOfWeek DayOfYear Month
syntax keyword fmBuiltIns MonthName MonthNameJ WeekOfYear 

" Time functions
syntax keyword fmBuiltIns Hour Minute Seconds Time

" Timestamp functions
syntax keyword fmBuiltIns Timestamp

" Container functions
syntax keyword fmBuiltIns Base64Decode Base64Encode GetContainerAttribute
syntax keyword fmBuiltIns GetHeight GetThumbnail GetWidth VerifyContainer

" Aggregate functions
syntax keyword fmBuiltIns Average Count List Max Min StDev StDevP Sum Variance
syntax keyword fmBuiltIns VarianceP

" Summary functions
syntax keyword fmBuiltIns GetSummary

" Repeating functions
syntax keyword fmBuiltIns Extend GetRepetition Last

" Financial functions
syntax keyword fmBuiltIns FV NPV PMT PV

" Trigonometric functions
syntax keyword fmBuiltIns Acos Asin Atan Cos Degrees Pi Radians Sin Tan

" Logical functions
syntax keyword fmBuiltIns Case Choose Evaluate EvaluationError ExecuteSQL
syntax keyword fmBuiltIns GetAsBoolean GetField GetFieldName
syntax keyword fmBuiltIns GetLayoutObjectAttribute GetNthRecord If IsEmpty
syntax keyword fmBuiltIns IsValid IsValidExpression Let Lookup LookupNext Self

" Get functions
syntax keyword fmBuiltIns Get

" Design functions
syntax keyword fmBuiltIns DatabaseNames FieldBounds FieldComment FieldIDs
syntax keyword fmBuiltIns FieldNames FieldRepetitions FieldStyle FieldType
syntax keyword fmBuiltIns GetNextSerialValue LayoutIDs LayoutNames
syntax keyword fmBuiltIns LayoutObjectNames RelationInfo ScriptIDs ScriptNames
syntax keyword fmBuiltIns TableIDs TableNames ValueListIDs ValueListItems
syntax keyword fmBuiltIns ValueListNames WindowNames

" Mobile functions
syntax keyword fmBuiltIns Location LocationValues

" External functions
syntax keyword fmBuiltIns External

highlight link fmBuiltIns Function

" Get function constants
syntax keyword fmGetConstants AccountExtendedPrivileges AccountName
syntax keyword fmGetConstants AccountPrivilegeSetName ActiveFieldContents
syntax keyword fmGetConstants ActiveFieldName ActiveFieldTableName
syntax keyword fmGetConstants ActiveLayoutObjectName ActiveModifierKeys
syntax keyword fmGetConstants ActivePortalRowNumber ActiveRepetitionNumber
syntax keyword fmGetConstants ActiveSelectionSize ActiveSelectionStart
syntax keyword fmGetConstants AllowAbortState AllowFormattingBarState
syntax keyword fmGetConstants ApplicationLanguage ApplicationVersion
syntax keyword fmGetConstants CalculationRepetitionNumber ConnectionAttributes
syntax keyword fmGetConstants ConnectionState CurrentDate CurrentExtendedPrivileges
syntax keyword fmGetConstants CurrentHostTimestamp CurrentPrivilegeSetName
syntax keyword fmGetConstants CurrentTime CurrentTimestamp CurrentTimeUTCMilliseconds
syntax keyword fmGetConstants CustomMenuSetName DesktopPath Device DocumentsPath
syntax keyword fmGetConstants DocumentsPathListing EncryptionState ErrorCaptureState
syntax keyword fmGetConstants FileMakerPath FileName FilePath FileSize FoundCount
syntax keyword fmGetConstants HighContrastColor HighContrastState
syntax keyword fmGetConstants HostApplicationVersion HostIPAddress HostName
syntax keyword fmGetConstants InstalledFMPlugins LastError LastMessageChoice
syntax keyword fmGetConstants LastODBCError LayoutAccess LayoutCount LayoutName
syntax keyword fmGetConstants LayoutNumber LayoutTableName LayoutViewState
syntax keyword fmGetConstants ModifiedFields MultiUserState NetworkProtocol
syntax keyword fmGetConstants NetworkType PageNumber PersistentID PreferencesPath
syntax keyword fmGetConstants PrinterName QuickFindText RecordAccess RecordID
syntax keyword fmGetConstants RecordModificationCount RecordNumber RecordOpenCount
syntax keyword fmGetConstants RecordOpenState RequestCount RequestOmitState
syntax keyword fmGetConstants ScreenDepth ScreenHeight ScreenWidth ScriptAnimationState
syntax keyword fmGetConstants ScriptName ScriptParameter ScriptResult SortState
syntax keyword fmGetConstants StatusAreaState SystemDrive SystemIPAddress SystemLanguage
syntax keyword fmGetConstants SystemNICAddress SystemPlatform SystemVersion TemporaryPath
syntax keyword fmGetConstants TextRulerVisible TotalRecordCount TriggerCurrentPanel
syntax keyword fmGetConstants TriggerGestureInfo TriggerKeystroke TriggerModifierKeys
syntax keyword fmGetConstants TriggerTargetPanel UserCount UserName UseSystemFormatsState
syntax keyword fmGetConstants UUID WindowContentHeight WindowContentWidth
syntax keyword fmGetConstants WindowDesktopHeight WindowDesktopWidth WindowHeight
syntax keyword fmGetConstants WindowLeft WindowMode WindowName WindowOrientation
syntax keyword fmGetConstants WindowStyle WindowTop WindowVisible WindowWidth WindowZoomLevel

highlight link fmGetConstants Structure

" ---------------------------------------------------
" Conventional Custom Functions

syntax match fmCustomFunctions "[a-z]\+\.[A-Za-z]\+"

highlight link fmCustomFunctions Function

" ---------------------------------------------------
" Comments

syntax match fmComment "//.*$"
syntax region fmComment start="/\*" end="\*/"

highlight link fmComment Comment

let b:current_syntax = "filemakercalc"
