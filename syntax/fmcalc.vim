" Vim syntax file for FileMaker calculations
" Last Change: 2014 Jul 7
" Version: 1.0
" Language: Vimscript
" Maintainer: Charles Ross <chivalry@mac.com>
" License: The MIT License

if exists("b:current_syntax")
  finish
endif

" ---------------------------------------------------
" Local and Global Variables

syntax match fm_variables "\v\${1,2}[^ ]+"

" ---------------------------------------------------
" Convention Variables

syntax match convention_variables "\v[_~][^ ]+"

" ---------------------------------------------------
" Operators

syntax match fm_operator "\v\*"
syntax match fm_operator "\v/"
syntax match fm_operator "\v\+"
syntax match fm_operator "\v-"
syntax match fm_operator "\v\="
syntax match fm_operator "\v\&"
syntax match fm_operator "\v¶"
syntax match fm_operator "\v\<\="
syntax match fm_operator "\v\<"
syntax match fm_operator "\v≤"
syntax match fm_operator "\v\>\="
syntax match fm_operator "\v\>"
syntax match fm_operator "\v≥"
syntax match fm_operator "\v≠"
syntax match fm_operator "\v\^"
syntax keyword fm_operator and or not xor

" ---------------------------------------------------
" Literals

syntax region fm_string start=/\v"/ skip=/\v\\./ end=/\v"/
syntax keyword fm_literal True False

" Integer with -, + or nothing in front
syntax match fm_literal "\d\+" " contained display
syntax match fm_literal "[-+]\d\+" " contained display

" Floating point number with decimal.
syntax match fm_literal "\d\+\.\d*" " contained display
syntax match fm_literal "[-+]\d\+\.\d*" " contained display

" ---------------------------------------------------
" Built-in FileMaker functions

" Text functions
syntax keyword fm_built_ins Char Code Exact Filter FilterValues
syntax keyword fm_built_ins GetAsCSS GetAsDate GetAsNumber GetAsSVG GetAsText
syntax keyword fm_built_ins GetAsTime GetAsTimestamp GetAsURLEncoded GetValue
syntax keyword fm_built_ins Hiragana KanaHankaku KanaZenkaku KanjiNumeral Katakana
syntax keyword fm_built_ins Left LeftValues LeftWords Length Lower Middle MiddleValues
syntax keyword fm_built_ins MiddleWords NumToJText PatternCount Position Proper Quote
syntax keyword fm_built_ins Replace Right RightValues RightWords RomanHankaku
syntax keyword fm_built_ins RomanZenkaku SerialIncrement Substitute Trim TrimAll Upper
syntax keyword fm_built_ins ValueCount WordCount

" Text formatting functions
syntax keyword fm_built_ins RGB TextColor TextColorRemove TextFont TextFontRemove
syntax keyword fm_built_ins TextFormatRemove TextSize TextSizeRemove TextStyleAdd
syntax keyword fm_built_ins TextStyleRemove

" Number functions
syntax keyword fm_built_ins Abs Ceiling Combination Div Exp Factorial Floor Int Lg Ln
syntax keyword fm_built_ins Log Mod Random Round SetPrecision Sign Sqrt Truncate

" Date functions
syntax keyword fm_built_ins Date Day DayName DayNameJ DayOfWeek DayOfYear Month
syntax keyword fm_built_ins MonthName MonthNameJ WeekOfYear WeekOfYearFiscal Year
syntax keyword fm_built_ins YearName

" Time functions
syntax keyword fm_built_ins Hour Minute Seconds Time

" Timestamp functions
syntax keyword fm_built_ins Timestamp

" Container functions
syntax keyword fm_built_ins Base64Decode Base64Encode GetContainerAttribute
syntax keyword fm_built_ins GetHeight GetThumbnail GetWidth VerifyContainer

" Aggregate functions
syntax keyword fm_built_ins Average Count List Max Min StDev StDevP Sum Variance
syntax keyword fm_built_ins VarianceP

" Summary functions
syntax keyword fm_built_ins GetSummary

" Repeating functions
syntax keyword fm_built_ins Extend GetRepetition Last

" Financial functions
syntax keyword fm_built_ins FV NPV PMT PV

" Trigonometric functions
syntax keyword fm_built_ins Acos Asin Atan Cos Degrees Pi Radians Sin Tan

" Logical functions
syntax keyword fm_built_ins Case Choose Evaluate EvaluationError ExecuteSQL
syntax keyword fm_built_ins GetAsBoolean GetField GetFieldName
syntax keyword fm_built_ins GetLayoutObjectAttribute GetNthRecord If IsEmpty
syntax keyword fm_built_ins IsValid IsValidExpression Let Lookup LookupNext Self

" Get functions
syntax keyword fm_built_ins Get

" Design functions
syntax keyword fm_built_ins DatabaseNames FieldBounds FieldComment FieldIDs
syntax keyword fm_built_ins FieldNames FieldRepetitions FieldStyle FieldType
syntax keyword fm_built_ins GetNextSerialValue LayoutIDs LayoutNames
syntax keyword fm_built_ins LayoutObjectNames RelationInfo ScriptIDs ScriptNames
syntax keyword fm_built_ins TableIDs TableNames ValueListIDs ValueListItems
syntax keyword fm_built_ins ValueListNames WindowNames

" Mobile functions
syntax keyword fm_built_ins Location LocationValues

" External functions
syntax keyword fm_built_ins External

" Get function constants
syntax keyword fm_constants AccountExtendedPrivileges AccountName
syntax keyword fm_constants AccountPrivilegeSetName ActiveFieldContents
syntax keyword fm_constants ActiveFieldName ActiveFieldTableName
syntax keyword fm_constants ActiveLayoutObjectName ActiveModifierKeys
syntax keyword fm_constants ActivePortalRowNumber ActiveRepetitionNumber
syntax keyword fm_constants ActiveSelectionSize ActiveSelectionStart
syntax keyword fm_constants AllowAbortState AllowFormattingBarState
syntax keyword fm_constants ApplicationLanguage ApplicationVersion
syntax keyword fm_constants CalculationRepetitionNumber ConnectionAttributes
syntax keyword fm_constants ConnectionState CurrentDate CurrentExtendedPrivileges
syntax keyword fm_constants CurrentHostTimestamp CurrentPrivilegeSetName
syntax keyword fm_constants CurrentTime CurrentTimestamp CurrentTimeUTCMilliseconds
syntax keyword fm_constants CustomMenuSetName DesktopPath Device DocumentsPath
syntax keyword fm_constants DocumentsPathListing EncryptionState ErrorCaptureState
syntax keyword fm_constants FileMakerPath FileName FilePath FileSize FoundCount
syntax keyword fm_constants HighContrastColor HighContrastState
syntax keyword fm_constants HostApplicationVersion HostIPAddress HostName
syntax keyword fm_constants InstalledFMPlugins LastError LastMessageChoice
syntax keyword fm_constants LastODBCError LayoutAccess LayoutCount LayoutName
syntax keyword fm_constants LayoutNumber LayoutTableName LayoutViewState
syntax keyword fm_constants ModifiedFields MultiUserState NetworkProtocol
syntax keyword fm_constants NetworkType PageNumber PersistentID PreferencesPath
syntax keyword fm_constants PrinterName QuickFindText RecordAccess RecordID
syntax keyword fm_constants RecordModificationCount RecordNumber RecordOpenCount
syntax keyword fm_constants RecordOpenState RequestCount RequestOmitState
syntax keyword fm_constants ScreenDepth ScreenHeight ScreenWidth ScriptAnimationState
syntax keyword fm_constants ScriptName ScriptParameter ScriptResult SortState
syntax keyword fm_constants StatusAreaState SystemDrive SystemIPAddress SystemLanguage
syntax keyword fm_constants SystemNICAddress SystemPlatform SystemVersion TemporaryPath
syntax keyword fm_constants TextRulerVisible TotalRecordCount TriggerCurrentPanel
syntax keyword fm_constants TriggerGestureInfo TriggerKeystroke TriggerModifierKeys
syntax keyword fm_constants TriggerTargetPanel UserCount UserName UseSystemFormatsState
syntax keyword fm_constants UUID WindowContentHeight WindowContentWidth
syntax keyword fm_constants WindowDesktopHeight WindowDesktopWidth WindowHeight
syntax keyword fm_constants WindowLeft WindowMode WindowName WindowOrientation
syntax keyword fm_constants WindowStyle WindowTop WindowVisible WindowWidth WindowZoomLevel

" Text formatting function constants
syntax keyword fm_constants Roman Greek Cyrillic CentralEurope ShiftJIS TraditionalChinese
syntax keyword fm_constants SimplifiedChinese OEM Symbol Other Plain Bold Italic Underline
syntax keyword fm_constants HighlightYellow Condense Extend Strikethrough SmallCaps
syntax keyword fm_constants Superscript Subscript Uppercase Lowercase Titlecase
syntax keyword fm_constants WordUnderline DoubleUnderline AllStyles

" LookupNext function constants
syntax keyword fm_constants Lower Higher

" ---------------------------------------------------
" Conventional Custom Functions

syntax match fm_convention_custom_functions "[a-z]\+\.[A-Za-z]\+"

" ---------------------------------------------------
" Comments

syntax match fm_comment "//.*$"
syntax region fm_comment start="/\*" end="\*/"

highlight link fm_variables Identifier
highlight link convention_variables Special
highlight link fm_operator Operator
highlight link fm_string String
highlight link fm_literal Constant
highlight link fm_built_ins Function
highlight link fm_constants Structure
highlight link fm_convention_custom_functions Function
highlight link fm_comment Comment

let b:current_syntax = "fmcalc"
