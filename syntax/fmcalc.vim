" Vim syntax file for FileMaker calculations
" Last Change: 2014 Jul 20
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
syntax keyword fm_built_in Char Code Exact Filter FilterValues GetAsCSS
  \ GetAsDate GetAsNumber GetAsSVG GetAsText GetAsTime GetAsTimestamp
  \ GetAsURLEncoded GetValue Hiragana KanaHankaku KanaZenkaku KanjiNumeral
  \ Katakana Left LeftValues LeftWords Length Middle MiddleValues MiddleWords
  \ NumToJText PatternCount Position Proper Quote Replace Right RightValues
  \ RightWords RomanHankaku RomanZenkaku SerialIncrement Substitute Trim
  \ TrimAll Upper ValueCount WordCount
" The Lower function is included as a regex after general custom functions
" so it will take precedence.

" Text formatting functions
syntax keyword fm_built_in RGB TextColor TextColorRemove TextFont
  \ TextFontRemove TextFormatRemove TextSize TextSizeRemove TextStyleAdd
  \ TextStyleRemove

" Number functions
syntax keyword fm_built_in Abs Ceiling Combination Div Exp Factorial Floor Int
  \ Lg Ln Log Mod Random Round SetPrecision Sign Sqrt Truncate

" Date functions
syntax keyword fm_built_in Date Day DayName DayNameJ DayOfWeek DayOfYear Month
  \ MonthName MonthNameJ WeekOfYear WeekOfYearFiscal Year YearName

" Time functions
syntax keyword fm_built_in Hour Minute Seconds Time

" Timestamp functions
syntax keyword fm_built_in Timestamp

" Container functions
syntax keyword fm_built_in Base64Decode Base64Encode GetContainerAttribute
  \ GetHeight GetThumbnail GetWidth VerifyContainer

" Aggregate functions
syntax keyword fm_built_in Average Count List Max Min StDev StDevP Sum
  \ Variance VarianceP

" Summary functions
syntax keyword fm_built_in GetSummary

" Repeating functions
syntax keyword fm_built_in Extend GetRepetition Last

" Financial functions
syntax keyword fm_built_in FV NPV PMT PV

" Trigonometric functions
syntax keyword fm_built_in Acos Asin Atan Cos Degrees Pi Radians Sin Tan

" Logical functions
syntax keyword fm_built_in Case Choose Evaluate EvaluationError ExecuteSQL
  \ GetAsBoolean GetField GetFieldName GetLayoutObjectAttribute GetNthRecord If
  \ IsEmpty IsValid IsValidExpression Let Lookup LookupNext Self

" Get functions
syntax keyword fm_built_in Get

" Design functions
syntax keyword fm_built_in DatabaseNames FieldBounds FieldComment FieldIDs
  \ FieldNames FieldRepetitions FieldStyle FieldType GetNextSerialValue
  \ LayoutIDs LayoutNames LayoutObjectNames RelationInfo ScriptIDs ScriptNames
  \ TableIDs TableNames ValueListIDs ValueListItems ValueListNames WindowNames

" Mobile functions
syntax keyword fm_built_in Location LocationValues

" External functions
syntax keyword fm_built_in External

" Get function constants
syntax keyword fm_get_constants AccountExtendedPrivileges AccountName
  \ AccountPrivilegeSetName ActiveFieldContents ActiveFieldName
  \ ActiveFieldTableName ActiveLayoutObjectName ActiveModifierKeys
  \ ActivePortalRowNumber ActiveRepetitionNumber ActiveSelectionSize
  \ ActiveSelectionStart AllowAbortState AllowFormattingBarState
  \ ApplicationLanguage ApplicationVersion CalculationRepetitionNumber
  \ ConnectionAttributes ConnectionState CurrentDate CurrentExtendedPrivileges
  \ CurrentHostTimestamp CurrentPrivilegeSetName CurrentTime CurrentTimestamp
  \ CurrentTimeUTCMilliseconds CustomMenuSetName DesktopPath Device
  \ DocumentsPath DocumentsPathListing EncryptionState ErrorCaptureState
  \ FileMakerPath FileName FilePath FileSize FoundCount HighContrastColor
  \ HighContrastState HostApplicationVersion HostIPAddress HostName
  \ InstalledFMPlugins LastError LastMessageChoice LastODBCError LayoutAccess
  \ LayoutCount LayoutName LayoutNumber LayoutTableName LayoutViewState
  \ ModifiedFields MultiUserState NetworkProtocol NetworkType PageNumber
  \ PersistentID PreferencesPath PrinterName QuickFindText RecordAccess RecordID
  \ RecordModificationCount RecordNumber RecordOpenCount RecordOpenState
  \ RequestCount RequestOmitState ScreenDepth ScreenHeight ScreenWidth
  \ ScriptAnimationState ScriptName ScriptParameter ScriptResult SortState
  \ StatusAreaState SystemDrive SystemIPAddress SystemLanguage SystemNICAddress
  \ SystemPlatform SystemVersion TemporaryPath TextRulerVisible TotalRecordCount
  \ TriggerCurrentPanel TriggerGestureInfo TriggerKeystroke TriggerModifierKeys
  \ TriggerTargetPanel UserCount UserName UseSystemFormatsState UUID
  \ WindowContentHeight WindowContentWidth WindowDesktopHeight
  \ WindowDesktopWidth WindowHeight WindowLeft WindowMode WindowName
  \ WindowOrientation WindowStyle WindowTop WindowVisible WindowWidth
  \ WindowZoomLevel

" Text formatting function constants
syntax keyword fm_text_formatting_constant Roman Greek Cyrillic CentralEurope
  \ ShiftJIS TraditionalChinese SimplifiedChinese OEM Symbol Other Plain Bold
  \ Italic Underline HighlightYellow Condense Extend Strikethrough SmallCaps 
  \ Superscript Subscript Uppercase Lowercase Titlecase WordUnderline 
  \ DoubleUnderline AllStyles


" ---------------------------------------------------
" Conventional Custom Functions

" Regex: Match lower case alphabetical letters followed by
"        a dot and upper or lower case letters.
syntax match fm_convention_custom_function "[a-z]\+\.[A-Za-z]\+"

" ---------------------------------------------------
" Comments

" Regex: Match two slashes to the end of the line.
syntax match fm_line_comment "//.*$"
syntax region fm_block_comment start="/\*" end="\*/"

" ---------------------------------------------------
" Non-Convention Custom Functions

" Regex: Match a head-of-word character, any number of word
"        characters, underscores or dots, followed by optional
"        whitespace and an opening paren, but don't include
"        the paren in the match
syntax match   fm_custom_function "\h[0-9a-zA-Z_\.]*\(\s\=(\)\@="

" ---------------------------------------------------
" The Lower Function

" Placed here to override its capture with fm_custom_function

" Regex: Match the word Lower so long as it's followed by
"        zero or more whitespaces that end in an open
"        parenthsis.
syntax match   fm_built_in "Lower\(\s*(\)\@="

" ---------------------------------------------------
" LookupNext function constants

syntax keyword fm_lookup_constant Higher
" Regex: Match the word Lower so long as it's not followed
"        by an optional space and an opening parenthesis
"        and ends as a word
syntax match   fm_lookup_constant "Lower[^ (]\@=\>"

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

highlight link fm_built_in Function
highlight link fm_convention_custom_function Function
highlight link fm_custom_function Function

highlight link fm_text_formatting_constant  Structure
highlight link fm_get_constants             Structure
highlight link fm_lookup_constant           Structure

highlight link fm_line_comment  Comment
highlight link fm_block_comment Comment

let b:current_syntax = "fmcalc"

" ---------------------------------------------------
" Embedded Syntax Highlighting

let csyn = b:current_syntax
unlet b:current_syntax
syntax include @sql syntax/sql.vim
syntax region fm_sql start='\(\)\(/\* *lang=sql *\*/\)\@=' end='\(\)"\@='
      \ contains=@sql containedin=ALL
let b:current_syntax = csyn

let csyn = b:current_syntax
unlet b:current_syntax
syntax include @groovy syntax/groovy.vim
syntax region fm_groovy start='\(\)\(/\* *lang=groovy *\*/\)\@=' end='\(\)"\@='
      \ contains=@groovy containedin=ALL
let b:current_syntax = csyn

let csyn = b:current_syntax
unlet b:current_syntax
syntax include @php syntax/php.vim
syntax region fm_php start='\(\)\(/\* *lang=php *\*/\)\@=' end='\(\)"\@='
      \ contains=@php containedin=ALL
let b:current_syntax = csyn

let csyn = b:current_syntax
unlet b:current_syntax
syntax include @javascript syntax/javascript.vim
syntax region fm_javascript start='\(\)\(/\* *lang=javascript *\*/\)\@=' end='\(\)"\@='
      \ contains=@javascript containedin=ALL
let b:current_syntax = csyn
