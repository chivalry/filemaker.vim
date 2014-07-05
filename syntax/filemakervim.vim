" Vim syntax file for FileMaker calculations
" Last Change: 2014 Jul 4
" Version: 1.0a2
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
syntax keyword fmConstants AccountExtendedPrivileges AccountName
syntax keyword fmConstants AccountPrivilegeSetName ActiveFieldContents
syntax keyword fmConstants ActiveFieldName ActiveFieldTableName
syntax keyword fmConstants ActiveLayoutObjectName ActiveModifierKeys
syntax keyword fmConstants ActivePortalRowNumber ActiveRepetitionNumber
syntax keyword fmConstants ActiveSelectionSize ActiveSelectionStart
syntax keyword fmConstants AllowAbortState AllowFormattingBarState
syntax keyword fmConstants ApplicationLanguage ApplicationVersion
syntax keyword fmConstants CalculationRepetitionNumber ConnectionAttributes
syntax keyword fmConstants ConnectionState CurrentDate CurrentExtendedPrivileges
syntax keyword fmConstants CurrentHostTimestamp CurrentPrivilegeSetName
syntax keyword fmConstants CurrentTime CurrentTimestamp CurrentTimeUTCMilliseconds
syntax keyword fmConstants CustomMenuSetName DesktopPath Device DocumentsPath
syntax keyword fmConstants DocumentsPathListing EncryptionState ErrorCaptureState
syntax keyword fmConstants FileMakerPath FileName FilePath FileSize FoundCount
syntax keyword fmConstants HighContrastColor HighContrastState
syntax keyword fmConstants HostApplicationVersion HostIPAddress HostName
syntax keyword fmConstants InstalledFMPlugins LastError LastMessageChoice
syntax keyword fmConstants LastODBCError LayoutAccess LayoutCount LayoutName
syntax keyword fmConstants LayoutNumber LayoutTableName LayoutViewState
syntax keyword fmConstants ModifiedFields MultiUserState NetworkProtocol
syntax keyword fmConstants NetworkType PageNumber PersistentID PreferencesPath
syntax keyword fmConstants PrinterName QuickFindText RecordAccess RecordID
syntax keyword fmConstants RecordModificationCount RecordNumber RecordOpenCount
syntax keyword fmConstants RecordOpenState RequestCount RequestOmitState
syntax keyword fmConstants ScreenDepth ScreenHeight ScreenWidth ScriptAnimationState
syntax keyword fmConstants ScriptName ScriptParameter ScriptResult SortState
syntax keyword fmConstants StatusAreaState SystemDrive SystemIPAddress SystemLanguage
syntax keyword fmConstants SystemNICAddress SystemPlatform SystemVersion TemporaryPath
syntax keyword fmConstants TextRulerVisible TotalRecordCount TriggerCurrentPanel
syntax keyword fmConstants TriggerGestureInfo TriggerKeystroke TriggerModifierKeys
syntax keyword fmConstants TriggerTargetPanel UserCount UserName UseSystemFormatsState
syntax keyword fmConstants UUID WindowContentHeight WindowContentWidth
syntax keyword fmConstants WindowDesktopHeight WindowDesktopWidth WindowHeight
syntax keyword fmConstants WindowLeft WindowMode WindowName WindowOrientation
syntax keyword fmConstants WindowStyle WindowTop WindowVisible WindowWidth WindowZoomLevel

" Text formatting function constants
syntax keyword fmConstants Roman Greek Cyrillic CentralEurope ShiftJIS TraditionalChinese
syntax keyword fmConstants SimplifiedChinese OEM Symbol Other Plain Bold Italic Underline
syntax keyword fmConstants HighlightYellow Condense Extend Strikethrough SmallCaps
syntax keyword fmConstants Superscript Subscript Uppercase Lowercase Titlecase
syntax keyword fmConstants WordUnderline DoubleUnderline AllStyles

highlight link fmConstants Structure

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
