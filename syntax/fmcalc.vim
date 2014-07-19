" Vim syntax file for FileMaker calculations
" Last Change: 2014 Jul 18
" Version: 1.0
" Language: Vimscript
" Maintainer: Charles Ross <chivalry@mac.com>
" License: The MIT License

if exists("b:current_syntax")
  finish
endif

" Add the tilde to the keyword characters
set iskeyword+=126
" Add the colon to the keyword characters
set iskeyword+=58

" ---------------------------------------------------
" Local and Global Variables

" TODO: Find more accurate regular expression
" TODO: Find a way to abstract repeated sub regexes
"       Found, but it involves the `execute` command
" Regex: Match 1 or 2 dollar signs followed by
"        characters other than a space and semicolon
syntax match fm_script_variable "\v\${1,2}[^ ;]+"

" ---------------------------------------------------
" Convention Variables

" TODO: Find more accurate regular expression.
" TODO: Find a way to abstract repeated sub regexes
"       Found, but it involves the `execute` command
" Regex: Match either an underscore or tilde at the
"        beginning of a word followed by characters
"        other than a space and semicolon
syntax match fm_standard_variable "\v<[_~][^ ;]+"

" ---------------------------------------------------
" Fully Qualified Field Variables

" Regex: Match any alphabetical character at the
"        beginning of a word followed by characters
"        other than a space and semicolon
syntax match fm_fully_qualified_field "\<\a[^ ;]*\>"

" ---------------------------------------------------
" Non-Convention Variables Field Variables

" Regex: Match any alphabetical character at the
"        beginning of a word followed by characters
"        other than a space, color or semicolon
syntax match fm_let_variable "\<\a[^: ;]*\>"

" ---------------------------------------------------
" Operators

syntax match fm_multiplication_op   "\v\*"
syntax match fm_division_op         "\v/"
syntax match fm_addition_op         "\v\+"
syntax match fm_subtraction_op      "\v-"
syntax match fm_equals_op           "\v\="
syntax match fm_concat_op           "\v\&"
syntax match fm_paragraph_mark      "\v¶"
syntax match fm_lessequal_op        "\v\<\="
syntax match fm_less_op             "\v\<"
syntax match fm_lessequal_op        "\v≤"
syntax match fm_greatequal_op       "\v\>\="
syntax match fm_great_op            "\v\>"
syntax match fm_greatequal_op       "\v≥"
syntax match fm_notequal_op         "\v≠"
syntax match fm_power_op            "\v\^"
syntax keyword fm_logical_op and or not xor

" ---------------------------------------------------
" Literals

" Regex: This was copied and pasted from another syntax
"        file. The start and end regexes are obvious, but
"        I don't understand what the skip is doing yet.
syntax region fm_string_literal start=/\v"/ skip=/\v\\./ end=/\v"/
syntax keyword fm_bool_literal True False

" Regex: Match an optional sign followed by digits
syntax match fm_int_literal "[-+]\=\d\+" " contained display

" Regex: Match an optional sign followed by optional digits,
"        a dot and more optional digits
syntax match fm_float_literal "[-+]\=\d*\.\d*" " contained display

" ---------------------------------------------------
" Built-in FileMaker functions

" Text functions
syntax keyword fm_built_ins Char Code Exact Filter FilterValues
syntax keyword fm_built_ins GetAsCSS GetAsDate GetAsNumber GetAsSVG GetAsText
syntax keyword fm_built_ins GetAsTime GetAsTimestamp GetAsURLEncoded GetValue
syntax keyword fm_built_ins Hiragana KanaHankaku KanaZenkaku KanjiNumeral Katakana
syntax keyword fm_built_ins Left LeftValues LeftWords Length Middle MiddleValues
syntax keyword fm_built_ins MiddleWords NumToJText PatternCount Position Proper Quote
syntax keyword fm_built_ins Replace Right RightValues RightWords RomanHankaku
syntax keyword fm_built_ins RomanZenkaku SerialIncrement Substitute Trim TrimAll Upper
syntax keyword fm_built_ins ValueCount WordCount
" Regex: Match the word Lower so long as it's followed by
"        zero or more whitespaces that end in an open
"        parenthsis.
syntax match   fm_built_ins "Lower(\@="
syntax match   fm_built_ins "Lower\(\s*(\)\@="

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
syntax keyword fm_constants Higher
" Regex: Match the word Lower so long as it's not followed
"        by an optional space and an opening parenthesis
syntax match   fm_constants "Lower[^ (]\@="

" ---------------------------------------------------
" Conventional Custom Functions

" Regex: Match lower case alphabetical letters followed by
"        a dot and upper or lower case letters.
syntax match fm_convention_custom_functions "[a-z]\+\.[A-Za-z]\+"

" ---------------------------------------------------
" Comments

" Regex: Match two slashes to the end of the line.
syntax match fm_comment "//.*$"
syntax region fm_comment start="/\*" end="\*/"

" ---------------------------------------------------
" Links

highlight link fm_script_variable     Identifier
highlight link fm_standard_variable   Special
highlight link fm_let_variable        Special

highlight link fm_fully_qualified_field Type

highlight link fm_multiplication_op   Operator
highlight link fm_division_op         Operator
highlight link fm_addition_op         Operator
highlight link fm_subtraction_op      Operator
highlight link fm_equals_op           Operator
highlight link fm_concat_op           Operator
highlight link fm_paragraph_mark      Operator
highlight link fm_lessequal_op        Operator
highlight link fm_less_op             Operator
highlight link fm_greatequal_op       Operator
highlight link fm_great_op            Operator
highlight link fm_notequal_op         Operator
highlight link fm_power_op            Operator
highlight link fm_logical_op          Operator

highlight link fm_string_literal  String
highlight link fm_bool_literal    Constant
highlight link fm_int_literal     Constant
highlight link fm_float_literal   Constant

highlight link fm_built_ins Function
highlight link fm_constants Structure
highlight link fm_convention_custom_functions Function
highlight link fm_comment Comment

let b:current_syntax = "fmcalc"
