a name="FileMakerVim-description"></a><a name="FMV-description"></a>
# Description

filemaker.vim provides syntax highlighting and snippet support for FileMaker calculations to be edited in Vim. It detects the filetype for the extensions `filemaker`, `fmcalc`, `fm`, and `fmfn`. It also recognizes calculations that have been opened using the [QuickCursor](#FileMakerVim-quickcursor) app on OS X.

The following features are supported:

- Syntax highlighting of the following:
  - Local and global variables
  - FileMaker operators (i.e., `+`, `-`, `&`, etc.)
  - String and number literals
  - Built-in FileMaker functions
  - Built-in FileMaker constants (such as Get function parameters)
  - Block and in-line comments
  - Calculation variables that begin with an underscore or tilde (i.e., `_foo` or `~bar`)
  - Custom functions that begin with a prepended code and dot (i.e., `code.CustomFunction`)
- With the installation of UltiSnips, intelligent snippet insertion for all of the built-in FileMaker functions

<a name="FileMakerVim-requirements"></a><a name="FMV-requirements"></a>
## Requirements

Currently there are two main feature sets included with filemaker.vim: syntax highlighting and snippets. Syntax highlighting has no additional requirements. filemaker.vim has been tested with MavVim snapshot 74 (which runs Vim 7.4) and command-line Vim 7.4 running within a terminal on Mac OS X. It will probably work with Vim 7 or above on any platform Vim supports, but not testing of this has been performed yet.

<a name="FileMakerVim-ultisnips"></a><a name="FMV-ultisnips"></a>
### UltiSnips

UltiSnips is a snippet system required by the snippets feature from [TextMate](https://macromates.com). Using the snippets feature requires [UltiSnips](https://github.com/SirVer/ultisnips). See the [the instructions below](#FMV-sultisnipsinstall) for additional details.

<a name="FileMakerVim-quickcursor"></a><a name="FMV-quickcursor"></a>
### QuickCursor

QuickCursor is in now way required for using filemaker.vim, but if you're using a Mac and you have a version of it, it can make life much easier by allowing you to press a key combination and open a FileMaker calculation directly in MacVim.

Unfortunately QuickCursor is no longer being actively sold because of incompatibility woth Apple's sandboxing. If you were fortunate enough to get version 1 from before it entered the Mac App Store or version 2 before it was taken down, you're good to go.

The [publisher](http://www.hogbaysoftware.com) of QuickCursor has made the [source code](https://github.com/jessegrosjean/quickcursor) available, but all attempts to build and run it under OS X Yosemit have failed to demonstrate that it works successfully.

In the future we hope to make either version 1 available for a free download or edit the source code of version 2 and make it available. In the meantime, if you're interested in a workaround, check out what some others have done by replacing QuickCursor with [custom-built](http://rocketink.net/2013/05/quickcursor-keyboard-maestro.html) routines using [Keyboard Maestro](http://www.keyboardmaestro.com).

If neither of these solutions work for you, there are two final options I can recommend. If you place the following line at the end of your calcuatation before you copy and paste it into a Vim buffer, Vim will read it to set the filetype:

// vim:ft=fmcalc

Alternative you can enter the following command while in normal mode to manually set the file type:

    :set ft=fmcalc

<a name="FileMakerVim-acknowledgments"></a><a name="FMV-acknowledgments"></a>
## Acknowledgments

A great deal of assistance with the snippets was kindly provided by [Holger Rapp](https://github.com/SirVer), whose help made the included snippets much more concise and useful.

<a name="FileMakerVim-install"></a><a name="FMV-install"></a>
# Installation

If you're already familiar with using [Vundle](https://github.com/gmarik/Vundle.vim) to manage plugins in Vim, just add these three lines to your `.vimrc` file between the calls to `vundle#begin` and `vundle#end`.

    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'chivalry/filemaker.vim'

Then enter the `:PluginInstall` command while in normal mode in Vim.

If you need a bit more granular instructions, keep reading.

<a name="FileMakerVim-vundle"></a><a name="FMV-vundle"></a>
## Vundle Installation

Vundle is the recommended method for installing filemaker.vim. Either read the [complete installation instructions](https://github.com/gmarik/Vundle.vim/blob/master/README.md#quick-start) or follow these steps:

1. Create a `.vim` directory in your home folder if it doesn't already exist.
2. Create a `bundle` directory in the `.vim` directory.
3. Run the following command from your terminal application:

        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

4. Create a `.vimrc` file in your home directory and add the following lines to it:

        set runtimepath+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
        Plugin 'gmarik/Vundle.vim'
        call vundle#end()
        filetype plugin indent on

5. Quit Vim if it's already running and relaunch it.

<a name="FileMakerVim-ultisnipsinstall"></a><a name="FMV-ultisnipsinstall"></a>
## UltiSnips Installation

Now that Vundle is installed, installing UltiSnips is trivial. In your `.vimrc` file, after the first call to `Plugin`, add the following lines:

    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'

Save your `.vimrc` and run the `:PluginInstall` command.

The second plugin is completely optional, but will add many useful snippets for other languages (PHP, JavaScript, etc.) as well as snippets for writting snippets. See the UltiSnips documentation for more information.

<a name="FileMakerVim-filemaker.vim"></a><a name="FMV-filemaker.vim"></a>
## filemaker.vim Installation

Installing filemaker.vim is just as easy as installing UltiSnips. Add this line to your `.vimrc` file after your previous lines and before the call to `vundle#end`:

    Plugin 'chivalry/filemaker.vim'

Again, run the `:PluginInstall` command.

<a name="FileMakerVim-Settings"></a><a name="FMV-Settings"></a>
# Settings

<a name="FileMakerVim-defaultconventions"></a><a name="FMV-defaultconventions"></a>
## Default Conventions

Conventions in FileMaker are notoriously varried. By default the snippets included with filemaker.vim conform to very specific conventions for formatting FileMaker calculations. These include the following:

- No space between a function name and its opening parenthesis
- A space between the opening and closing parentheses and the nearest parameter
- Functions with a single parameter are inserted on a single line
- Functions with multiple parameters are (generally) placed with each parameter on its own line

Note the word "generally" above. Some functions often take a single parameter but can take multiple parameters, especially the [Aggregate](#FMV-aggregate) functions, such as [Count](#VFMV-count). These multi-parameter functions are placed ona single line with their optional parameters included as optional tab stops.

<a name="FileMakerVim-overridingconventions"></a><a name="FMV-overridingconventions"></a>
## Overriding Conventions

Most of the conventions above can be overridden by setting global variables in your `.vimrc` file.

<a name="FileMakerVim-g:FMVAddApaceAfterFunction"></a><a name="FMV-g:FMVAddApaceAfterFunction"></a>
g:FMVAddSpaceAfterFunction
: Defaults to false (0). If set to true (1) a space will appear between function names and their opening parenthsis. For example, by default functions are inserted with the following format:

        Func( param )

:By setting this variable to 1, functions will be inserted with the following format:

        Func ( param )

<a name="FileMakerVim-g:FMVPadSpacesWithinParens"></a><a name="FMV-g:FMVPadSpacesWithinParens"></a>
g:FMVPadSpacesWithinParens
: Defaults to true (1). If set to false (0) there will be no space between a funciton's parentheses and its parameters. For example, by default functions are inserted with the following format:

        Func( param )

:If this variable is set to 0, functions will be inserted with the following format:

        Func(param)

<a name="FileMakerVim-g:FMVSeparateParamsWithSpace"></a><a name="FMV-g:FMVSeparateParamsWithSpace"></a>
Defaults to false (0). If set to true (1) multi-parameter functions will have all of their parameters appear on the same line. For example, by default multi-parameter functions are inserted with the following format:

        Func(
          param1;
          param2
        )

:If this variable is set to 1, multi-parameter functions will be inserted with the following format:

        Func( param1; param2 )o

:Note that this does not yet apply to the [Let](#FMV-let) function.

<a name="FileMakerVim-g:FMVFillInGetFileName"></a><a name="FMV-g:FMVFillInGetFileName"></a>
g:FMVFillInGetFileName
:Defaults to true (1). If set to false (0), functions that which have a `fileName` parameter will set this parameter to `Get( FileName )`. For example, such a function would have the following format:

        Func( Get( FileName ) )

: with the `Get( FileName )` portion being a snippet tab stop. If this variable is set to 0, such a function would have the following format:

        Func( fileName )

:with `fileName` acting as the snippet's tab stop.

All of these settings are cumulative. For example, with their default values the `FieldBounds` snippet will insert the following:

    FieldBounds(
      Get( FileName );
      layoutName;
      fieldName
    )

Overriding all of the defaults results in the following:

    FieldBound (Get (FileName); layoutName; fieldName)

<a name="FileMakerVim-triggers"></a><a name="FMV-triggers"></a>
# Triggers

<a name="FileMakerVim-triggerstandards"></a><a name="FMV-triggerstandards"></a>
## Trigger Standards

An UltiSnips trigger is included for every built-in FileMaker function except `Pi`. Every included function has a snippet that is the same as the function's name (except the `Get` function parameters and `DatabaseNames`, for which such a snippet is pretty useless). So you know right away that the trigger for `RightValues` is `rightvalues`, but most functions have abbreviated but unique triggers (`ritv` in this case). Although UltiSnips supports duplicate triggers, using them seriously reduces the time savings, so if a function has an abbreviated trigger, that trigger is unique. When multiple functions could have a competing trigger, the one that is more likely to be used has received the default trigger.

The trigges for `Get` functions are generally `get` followed by the letters in the words making up the parameter, such as `getfp` for `Get( FilePath )`, but using that technique does result in some duplicates. When that's the case the default is attached to the more common function and a logical letter is added to the alternative.

Finally, triggers are case-insensitive. In other words, `getv`, `Getv`, and `GETV` are all triggers for the `GetValue` function.

<a name="FileMakerVim-optionalparameters"</a><a name="FMV-optionalparameters"></a>
## Optional Parameters

Many FileMaker functions include optional parameters that can be ommitted. When parameters are all required each parameter is matched with a snippet tab stop. When a parameter is optional, the optional parameters as a while, including the last semi-colon, are an enclosing tabstop.

A prime example are a few of the [Aggregate functions](#FMV-aggregate) functions. The [`Average`](#FMV-Average) function for example needs at least one parameter but could take a series of parameters. The trigger therefore has three tabstops, one for the first parameter, one for the semi-colon and optional sections parameter, and a third for the second parameter. Triggering this snippet results in the following steps, where the currently active tabstop is between pipes (`|`):

    Average( |field|; field )

Filling in the first tab stop and pressing UltiSnips' "next tab stop" key selects the semi-colon and the second parameter:

    Average( TO::field|; field| )

At this point pressing the delete key will remove the entire tab stop and using UltiSnips' "next tab stop" key will move outside the snippet. If there are additional parameters to pass to `Average` then pressing the "next tab stop" key will retain the semi-colon and move to the third tab stop, which is the second parameter:

    Average( TO::field; |field| )

This is the method for tab stops whenever a function accepts optional parameters.

<a name="FileMakerVim-standardparameters"></a><a name="FMV-standardparameters"></a>
## Standard Parameters

A few FileMaker functions accept only a specific set of options for their parameters. The most common case of this is the `Get` function, but a few of the [Text Formatting](#FMV-textformatting`) functions fall under this category. Sometimes the parameters are constants, as is the case with `Get`, and sometimes they're strings ([GetLayoutObjectAttribute](#FMV-getlayoutobjectattribute) for example.

While standard parameters are case-insenstivie (i.e., within the `Get` function you can type `account` to narrow the list of available options to those that begin with `Account`), the case won't be replaced with the option's case. In other words, typing `accounte` will end up with `Get( accountextendedPrivileges )`. FileMaker will correct this when the calculation is saved. Given the tools being used having optional values replace entered text with appropriate character cases isn't possible yet.

When a function only takes a set of standard parameters the snippet for that function will allow any of the standard parameters to be filled in based on the first few characters. For example, the [`TextStyleRemove`](#FMV-textstyleremove) function takes a number of styles for its second parameter. Triggering this snippet and navigating to the second tab stop initially looks something like this (with the current tabstop surrounded by pipes (`|`)):

    TextStyleRemove(
      "some text";
      |(Plain|Bold|Italic|Underline|HighlightYellow|Condense|Extend|Strikethrough|SmallCaps|Superscript|Subscript|Uppercase|Lowercase|Titlecase|WordUnderline|DoubleUnderline|AllStyles)|
    )

Typing `Su` reduces the matching possible parameters to display the following:

    TextStyleRemove(
      "some text";
      Su|(perscript|bscript)|
    )

Only two of the options begin with `Su`, so the available options have been reduced. Typing a third letter that matches one of the remaining choices reduces the option to one, and using the "next tab stop" key will move you out of the snippet:

    TextStyleRemove(
      "some text";
      Subscript
    )|

Some functions take string options instead of constant options. When this is the case the enclosing double-quote are an enclosing tabstop so that the entire tabstop, including the double quotes, can be replaced, perhaps by a variable or field name. Or, while on the tabstop that includes the double quotes you can press the "next tab stop" key and move to the quoted options. The following state was arrived at by pressing `getcatt<tab>"source Field"<next stop>`:

    GetContainerAttribute(
      "source Field";
	    |"(filename|MD5|storageType|fileSize|internalSize|externalSize|externalFiles|width|height|dpiWidth|dpiHeight|transparency|orientation|created|modified|latitude|longitude|make|model|title|artist|album|year|track|genre|composer|coverArt|duration|bitRate|barcodeText|barcodeType|signed|general|audio|image|photo|barcode|signature|all)"|
)

Note that the tabstop is selecting the quotes including the available options. At this point typing can overwrite all of the available options. On the other hand, pressing `<next stop>` again leads to only the available options being selected within the double quotes.

    GetContainerAttribute(
      "source Field";
	    "|(filename|MD5|storageType|fileSize|internalSize|externalSize|externalFiles|width|height|dpiWidth|dpiHeight|transparency|orientation|created|modified|latitude|longitude|make|model|title|artist|album|year|track|genre|composer|coverArt|duration|bitRate|barcodeText|barcodeType|signed|general|audio|image|photo|barcode|signature|all)|"
)

Finally, once the options without the double quotes are selected, typing a few letters will narrow down the available options.

    GetContainerAttribute(
      "source Field";
      "file|(name|Size)|"
    )

<a name="FileMakerVim-builtinfunctiontriggers"></a><a name=FMV-builtinfunctiontriggers"></a>
## Built-In Function Triggers

<a name="FileMakerVim-text"></a><a name=FMV-text></a>
### Text Functions

Function | Snippets
---------|---------
<a name=FileMakerVim-char></a><a name=FMV-char></a>`Char` | `char`, `cha`
<a name="FileMakerVim-code"></a><a name="FMV-code"></a>`Code` | `code`, `cod`
<a name="FileMakerVim-exact"></a><a name="FMV-exact"></a>`Exact` | `exact`, `exa`
<a name="FileMakerVim-filter"></a><a name="FMV-filter"></a>`Filter` | `filter`, `fil`
<a name="FileMakerVim-filtervalues"></a><a name="FMV-filtervalues"></a>`FilterValues` | `filtervalues`, `filv`
<a name="FileMakerVim-getascss"></a><a name="FMV-getascss"></a>`GetAsCSS` | `getascss`, `getc`
<a name="FileMakerVim-getasdate"></a><a name="FMV-getasdate"></a>`GetAsDate` | `getasdate`, `getd`
<a name="FileMakerVim-getasnumber"></a><a name="FMV-getasnumber"></a>`GetAsNumber` | `getasnumber`, `getn`
<a name="FileMakerVim-getassvg"></a><a name="FMV-getassvg"></a>`GetAsSVG` | `getassvg`, `gets`
<a name="FileMakerVim-getastext"></a><a name="FMV-getastext"></a>`GetAsText` | `getastext`, `gett`
<a name="FileMakerVim-getastime"></a><a name="FMV-getastime"></a>`GetAsTime` | `getastime`, `geti`
<a name="FileMakerVim-getastimestamp"></a><a name="FMV-getastimestamp"></a>`GetAsTimestamp` | `getastimestamp`, `getm`
<a name="FileMakerVim-getasurlencoded"></a><a name="FMV-getasurlencoded"></a>`GetAsURLEncoded` | `getasurlencoded`, `getu`
<a name="FileMakerVim-getvalue"></a><a name="FMV-getvalue"></a>`GetValue` | `getvalue`, `getv`
<a name="FileMakerVim-hiragana"></a><a name="FMV-hiragana"></a>`Hiragana` | `hiragana`, `hir`
<a name="FileMakerVim-kanahankaku"></a><a name="FMV-kanahankaku"></a>`KanaHankaku` | `kanahankaku`, `kanah`
<a name="FileMakerVim-kanazenkaku"></a><a name="FMV-kanazenkaku"></a>`KanaZenkaku` | `kanazenkaku`, `kanaz`
<a name="FileMakerVim-kanjinumeral"></a><a name="FMV-kanjinumeral"></a>`KanjiNumeral` | `kanjinumeral`, `kanj`
<a name="FileMakerVim-katakana"></a><a name="FMV-katakana"></a>`Katakana` | `katakana`, `kata`
<a name="FileMakerVim-left"></a><a name="FMV-left"></a>`Left` | `left`, `lef`
<a name="FileMakerVim-leftvalues"></a><a name="FMV-leftvalues"></a>`LeftValues` | `leftvalues`, `leftv`
<a name="FileMakerVim-leftwords"></a><a name="FMV-leftwords"></a>`LeftWords` | `leftwords`, `leftw`
<a name="FileMakerVim-length"></a><a name="FMV-length"></a>`Length` | `length`, `len`
<a name="FileMakerVim-lower"></a><a name="FMV-lower"></a>`Lower` | `lower`, `low`
<a name="FileMakerVim-middle"></a><a name="FMV-middle"></a>`Middle` | `middle`, `mid`
<a name="FileMakerVim-middlevalues"></a><a name="FMV-middlevalues"></a>`MiddleValues` | `middlevalues`, `midv`
<a name="FileMakerVim-middlewords"></a><a name="FMV-middlewords"></a>`MiddleWords` | `middlewords`, `midw`
<a name="FileMakerVim-numtojtext"></a><a name="FMV-numtojtext"></a>`NumToJText` | `numtojtext`, `numj`
<a name="FileMakerVim-patterncount"></a><a name="FMV-patterncount"></a>`PatternCount` | `patterncount`, `pat`
<a name="FileMakerVim-position"></a><a name="FMV-position"></a>`Position` | `position`, `pos`
<a name="FileMakerVim-proper"></a><a name="FMV-proper"></a>`Proper` | `proper`, `pro`
<a name="FileMakerVim-quote"></a><a name="FMV-quote"></a>`Quote` | `quote`, `quo`
<a name="FileMakerVim-replace"></a><a name="FMV-replace"></a>`Replace` | `replace`, `repl`
<a name="FileMakerVim-right"></a><a name="FMV-right"></a>`Right` | `right`, `rit`
<a name="FileMakerVim-rightvalues"></a><a name="FMV-rightvalues"></a>`RightValues` | `rightvalues`, `ritv`
<a name="FileMakerVim-rightwords"></a><a name="FMV-rightwords"></a>`RightWords` | `rightwords`, `ritw`
<a name="FileMakerVim-romanhankaku"></a><a name="FMV-romanhankaku"></a>`RomanHankaku` | `romanhankaku`, `romh`
<a name="FileMakerVim-romankenkaku"></a><a name="FMV-romankenkaku"></a>`RomanZenkaku` | `romankenkaku`, `romz`
<a name="FileMakerVim-serialincrement"></a><a name="FMV-serialincrement"></a>`SerialIncrement` | `serialincrement`, `seri`
<a name="FileMakerVim-substitute"></a><a name="FMV-substitute"></a>`Substitute` | `substitute`, `sub`
<a name="FileMakerVim-trim"></a><a name="FMV-trim"></a>`Trim` | `trim`
<a name="FileMakerVim-trimall"></a><a name="FMV-trimall"></a>`TrimAll` | `trimall`, `trima`
<a name="FileMakerVim-upper"></a><a name="FMV-upper"></a>`Upper` | `upper`, `upp`
<a name="FileMakerVim-valuecount"></a><a name="FMV-valuecount"></a>`ValueCount` | `valuecount`, `valc`
<a name="FileMakerVim-wordcount"></a><a name="FMV-wordcount"></a>`WordCount` | `wordcount`, `wordc`

<a name="FileMakerVim-textformatting"></a><a name="FMV-textformatting"></a>
### Text Formatting Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-rgb"></a><a name="FMV-rgb"></a>`RGB` | `rgb`
<a name="FileMakerVim-textcolor"></a><a name="FMV-textcolor"></a>`TextColor` | `textcolor`, `textc`
<a name="FileMakerVim-textcolorremove"></a><a name="FMV-textcolorremove"></a>`TextColorRemove` | `textcolorremove`, `textcr`
<a name="FileMakerVim-textfont"></a><a name="FMV-textfont"></a>`TextFont` | `textfont`, `textf`
<a name="FileMakerVim-textfontremove"></a><a name="FMV-textfontremove"></a>`TextFontRemove` | `textfontremove`, `textfr`
<a name="FileMakerVim-textsize"></a><a name="FMV-textsize"></a>`TextSize` | `textsize`, `texts`
<a name="FileMakerVim-textsizeremove"></a><a name="FMV-textsizeremove"></a>`TextSizeRemove` | `textsizeremove`, `textsr`
<a name="FileMakerVim-textstyleadd"></a><a name="FMV-textstyleadd"></a>`TextStyleAdd` | `textstyleadd`, `textsts`
<a name="FileMakerVim-textstyleremove"></a><a name="FMV-textstyleremove"></a>`TextStyleRemove` | `textstyleremove`, `textstr`

<a name="FileMakerVim-number"></a><a name="FMV-number"></a>
### Number Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-abs"></a><a name="FMV-abs"></a>`Abs` | `abs`
<a name="FileMakerVim-ceiling"></a><a name="FMV-ceiling"></a>`Ceiling` | `ceiling`, `ceil`
<a name="FileMakerVim-combination"></a><a name="FMV-combination"></a>`Combination` | `combination`, `comb`
<a name="FileMakerVim-div"></a><a name="FMV-div"></a>`Div` | `div`
<a name="FileMakerVim-exp"></a><a name="FMV-exp"></a>`Exp` | `exp`
<a name="FileMakerVim-factorial"></a><a name="FMV-factorial"></a>`Factorial` | `factorial`, `fact`
<a name="FileMakerVim-floor"></a><a name="FMV-floor"></a>`Floor` | `floor`, `flo`
<a name="FileMakerVim-int"></a><a name="FMV-int"></a>`Int` | `int`
<a name="FileMakerVim-lg"></a><a name="FMV-lg"></a>`Lg` | `lg`
<a name="FileMakerVim-ln"></a><a name="FMV-ln"></a>`Ln` | `ln`
<a name="FileMakerVim-log"></a><a name="FMV-log"></a>`Log` | `log`
<a name="FileMakerVim-mod"></a><a name="FMV-mod"></a>`Mod` | `mod`
<a name="FileMakerVim-random"></a><a name="FMV-random"></a>`Random` | `random`, `rand`
<a name="FileMakerVim-round"></a><a name="FMV-round"></a>`Round` | `round`, `rou`
<a name="FileMakerVim-setprecision"></a><a name="FMV-setprecision"></a>`SetPrecision` | `setprecision`, `setp`
<a name="FileMakerVim-sign"></a><a name="FMV-sign"></a>`Sign` | `sign`
<a name="FileMakerVim-sqrt"></a><a name="FMV-sqrt"></a>`Sqrt` | `sqrt`
<a name="FileMakerVim-truncate"></a><a name="FMV-truncate"></a>`Truncate` | `truncate`, `trunc`

<a name="FileMakerVim-date"></a><a name="FMV-date"></a>
### Date Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-date"></a><a name="FMV-date"></a>`Date` | `date`
<a name="FileMakerVim-day"></a><a name="FMV-day"></a>`Day` | `day`
<a name="FileMakerVim-dayname"></a><a name="FMV-dayname"></a>`DayName` | `dayname`, `dayn`
<a name="FileMakerVim-daynamej"></a><a name="FMV-daynamej"></a>`DayNameJ` | `daynamej`, `daynj`
<a name="FileMakerVim-dayofweek"></a><a name="FMV-dayofweek"></a>`DayOfWeek` | `dayofweek`, `dow`
<a name="FileMakerVim-dayofyear"></a><a name="FMV-dayofyear"></a>`DayOfYear` | `dayofyear`, `doy`
<a name="FileMakerVim-month"></a><a name="FMV-month"></a>`Month` | `month`, `mon`
<a name="FileMakerVim-monthname"></a><a name="FMV-monthname"></a>`MonthName` | `monthname`, `monn`
<a name="FileMakerVim-monthnamej"></a><a name="FMV-monthnamej"></a>`MonthNameJ` | `monthnamej`, `monnj`
<a name="FileMakerVim-weekofyear"></a><a name="FMV-weekofyear"></a>`WeekOfYear` | `weekofyear`, `woy`
<a name="FileMakerVim-weekofyearfiscal"></a><a name="FMV-weekofyearfiscal"></a>`WeekOfYearFiscal` | `weekofyearfiscal`, `woyf`
<a name="FileMakerVim-year"></a><a name="FMV-year"></a>`Year` | `year`, `yr`
<a name="FileMakerVim-yearname"></a><a name="FMV-yearname"></a>`YearName` | `yearname`, `yrn`

<a name="FileMakerVim-time"></a><a name="FMV-time"></a>
### Time Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-hour"></a><a name="FMV-hour"></a>`Hour` | `hour`, `hr`
<a name="FileMakerVim-minute"></a><a name="FMV-minute"></a>`Minute` | `minute`, `minu`
<a name="FileMakerVim-seconds"></a><a name="FMV-seconds"></a>`Seconds` | `seconds`, `secs`
<a name="FileMakerVim-time"></a><a name="FMV-time"></a>`Time` | `time`

<a name="FileMakerVim-timestamp"></a><a name="FMV-timestamp"></a>
### Timestamp Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-timestamp"></a><a name="FMV-timestamp"></a>`Timestamp` | `timestamp`, `ts`

<a name="FileMakerVim-container"></a><a name="FMV-container"></a>
### Container Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-base64decode"></a><a name="FMV-base64decode"></a>`Base64Decode` | `base64decode`, `based`
<a name="FileMakerVim-base64encode"></a><a name="FMV-base64encode"></a>`Base64Encode` | `base64encode`, `basee`
<a name="FileMakerVim-getcontainerattribute"></a><a name="FMV-getcontainerattribute"></a>`GetContainerAttribute` | `getcontainerattribute`, `getcatt`
<a name="FileMakerVim-getheight"></a><a name="FMV-getheight"></a>`GetHeight` | `getheight`, `geth`
<a name="FileMakerVim-getthumbnail"></a><a name="FMV-getthumbnail"></a>`GetThumbnail` | `getthumbnail`, `getth`
<a name="FileMakerVim-getwidth"></a><a name="FMV-getwidth"></a>`GetWidth` | `getwidth`, `getw`
<a name="FileMakerVim-verifycontainer"></a><a name="FMV-verifycontainer"></a>`VerifyContainer` | `verifycontainer`, `ver`

<a name="FileMakerVim-aggregate"></a><a name="FMV-aggregate"></a>
### Aggregate Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-average"></a><a name="FMV-average"></a>`Average` | `average`, `avg`
<a name="FileMakerVim-count"></a><a name="FMV-count"></a>`Count` | `count`, `cnt`
<a name="FileMakerVim-list"></a><a name="FMV-list"></a>`List` | `list`
<a name="FileMakerVim-max"></a><a name="FMV-max"></a>`Max` | `max`
<a name="FileMakerVim-min"></a><a name="FMV-min"></a>`Min` | `min`
<a name="FileMakerVim-stdev"></a><a name="FMV-stdev"></a>`StDev` | `stdev`, `std`
<a name="FileMakerVim-stdevp"></a><a name="FMV-stdevp"></a>`StDevP` | `stdevp`, `stdp`
<a name="FileMakerVim-sum"></a><a name="FMV-sum"></a>`Sum` | `sum`
<a name="FileMakerVim-variance"></a><a name="FMV-variance"></a>`Variance` | `variance`, `var`
<a name="FileMakerVim-variancep"></a><a name="FMV-variancep"></a>`VarianceP` | `variancep`, `varp`

<a name="FileMakerVim-summary"></a><a name="FMV-summary"></a>
### Summary Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-getsummary"></a><a name="FMV-getsummary"></a>`GetSummary` | `getsummary`, `getsum`

<a name="FileMakerVim-repeating"></a><a name="FMV-repeating"></a>
### Repeating Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-extend"></a><a name="FMV-extend"></a>`Extend` | `extend`, `extd`
<a name="FileMakerVim-getrepetition"></a><a name="FMV-getrepetition"></a>`GetRepetition` | `getrepetition`, `getrep`
<a name="FileMakerVim-last"></a><a name="FMV-last"></a>`Last` | `last`

<a name="FileMakerVim-financial"></a><a name="FMV-financial"></a>
### Financial Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-fv"></a><a name="FMV-fv"></a>`FV` | `fv`
<a name="FileMakerVim-npv"></a><a name="FMV-npv"></a>`NPV` | `npv`
<a name="FileMakerVim-pmt"></a><a name="FMV-pmt"></a>`PMT` | `pmt`
<a name="FileMakerVim-pv"></a><a name="FMV-pv"></a>`PV` | `pv`

<a name="FileMakerVim-trigonometric"></a><a name="FMV-trigonometric"></a>
### Trigonometric Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-acos"></a><a name="FMV-acos"></a>`Acos` | `acos`
<a name="FileMakerVim-asin"></a><a name="FMV-asin"></a>`Asin` | `asin`
<a name="FileMakerVim-atan"></a><a name="FMV-atan"></a>`Atan` | `atan`
<a name="FileMakerVim-cos"></a><a name="FMV-cos"></a>`Cos` | `cos`
<a name="FileMakerVim-degrees"></a><a name="FMV-degrees"></a>`Degrees` | `degrees`, `deg`
<a name="FileMakerVim-radians"></a><a name="FMV-radians"></a>`Radians` | `radians`, `rad`
<a name="FileMakerVim-sin"></a><a name="FMV-sin"></a>`Sin` | `sin`
<a name="FileMakerVim-tan"></a><a name="FMV-tan"></a>`Tan` | `tan`

<a name="FileMakerVim-logical"></a><a name="FMV-logical"></a>
### Logical Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-case"></a><a name="FMV-case"></a>`Case` | `case`
<a name="FileMakerVim-choose"></a><a name="FMV-choose"></a>`Choose` | `choose`, `cho`
<a name="FileMakerVim-evaluate"></a><a name="FMV-evaluate"></a>`Evaluate` | `evaluate`, `eval`
<a name="FileMakerVim-evaluationerror"></a><a name="FMV-evaluationerror"></a>`EvaluationError` | `evaluationerror`, `evalerr`
<a name="FileMakerVim-executesql"></a><a name="FMV-executesql"></a>`ExecuteSQL` | `executesql`, `sql`
<a name="FileMakerVim-getasboolean"></a><a name="FMV-getasboolean"></a>`GetAsBoolean` | `getasboolean`, `getb`
<a name="FileMakerVim-getfield"></a><a name="FMV-getfield"></a>`GetField` | `getfield`, `getf`
<a name="FileMakerVim-getfieldname"></a><a name="FMV-getfieldname"></a>`GetFieldName` | `getfieldname`, `getfn`
<a name="FileMakerVim-getlayoutobjectattribute"></a><a name="FMV-getlayoutobjectattribute"></a>`GetLayoutObjectAttribute` | `getlayoutobjectattribute`, `getloa`
<a name="FileMakerVim-getnthrecord"></a><a name="FMV-getnthrecord"></a>`GetNthRecord` | `getnthrecord`, `getnth`
<a name="FileMakerVim-if"></a><a name="FMV-if"></a>`If` | `if`
<a name="FileMakerVim-isempty"></a><a name="FMV-isempty"></a>`IsEmpty` | `isempty`, `ise`
<a name="FileMakerVim-isvalid"></a><a name="FMV-isvalid"></a>`IsValid` | `isvalid`, `isv`
<a name="FileMakerVim-isvalidexpression"></a><a name="FMV-isvalidexpression"></a>`IsValidExpression` | `isvalidexpression`, `isve`
<a name="FileMakerVim-let"></a><a name="FMV-let"></a>`Let` | `let`
<a name="FileMakerVim-lookup"></a><a name="FMV-lookup"></a>`Lookup` | `lookup`, `look`
<a name="FileMakerVim-lookupnext"></a><a name="FMV-lookupnext"></a>`LookupNext` | `lookupnext`, `lookn`

<a name="FileMakerVim-design"></a><a name="FMV-design"></a>
### Design Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-dbn"></a><a name="FMV-dbn"></a>`DatabaseNames` | `dbn`
<a name="FileMakerVim-fieldbounds"></a><a name="FMV-fieldbounds"></a>`FieldBounds` | `fieldbounds`, `fb`
<a name="FileMakerVim-fieldcomment"></a><a name="FMV-fieldcomment"></a>`FieldComment` | `fieldcomment`, `fc`
<a name="FileMakerVim-fieldids"></a><a name="FMV-fieldids"></a>`FieldIDs` | `fieldids`, `fid`
<a name="FileMakerVim-fieldnames"></a><a name="FMV-fieldnames"></a>`FieldNames` | `fieldnames`, `fn`
<a name="FileMakerVim-fieldrepetitions"></a><a name="FMV-fieldrepetitions"></a>`FieldRepetitions` | `fieldrepetitions`, `frep`
<a name="FileMakerVim-fieldstyle"></a><a name="FMV-fieldstyle"></a>`FieldStyle` | `fieldstyle`, `fst`
<a name="FileMakerVim-fieldtype"></a><a name="FMV-fieldtype"></a>`FieldType` | `fieldtype`, `fty`
<a name="FileMakerVim-getnextserialvalue"></a><a name="FMV-getnextserialvalue"></a>`GetNextSerialValue` | `getnextserialvalue`, `gnsv`
<a name="FileMakerVim-layoutids"></a><a name="FMV-layoutids"></a>`LayoutIDs` | `layoutids`, `lid`
<a name="FileMakerVim-layoutnames"></a><a name="FMV-layoutnames"></a>`LayoutNames` | `layoutnames`, `lon`
<a name="FileMakerVim-layoutobjectnames"></a><a name="FMV-layoutobjectnames"></a>`LayoutObjectNames` | `layoutobjectnames`, `loon`
<a name="FileMakerVim-location"></a><a name="FMV-location"></a>`Location` | `location`, `loc`
<a name="FileMakerVim-locationvalues"></a><a name="FMV-locationvalues"></a>`LocationValues` | `locationvalues`, `locv`
<a name="FileMakerVim-relationinfo"></a><a name="FMV-relationinfo"></a>`RelationInfo` | `relationinfo`, `ri`
<a name="FileMakerVim-scriptids"></a><a name="FMV-scriptids"></a>`ScriptIDs` | `scriptids`, `sid`
<a name="FileMakerVim-tableids"></a><a name="FMV-tableids"></a>`TableIDs` | `tableids`, `tid`
<a name="FileMakerVim-tablenames"></a><a name="FMV-tablenames"></a>`TableNames` | `tablenames`, `tn`
<a name="FileMakerVim-valuelistids"></a><a name="FMV-valuelistids"></a>`ValueListIDs` | `valuelistids`, `vid`
<a name="FileMakerVim-valuelistitems"></a><a name="FMV-valuelistitems"></a>`ValueListItems` | `valuelistitems`, `vli`
<a name="FileMakerVim-valuelistnames"></a><a name="FMV-valuelistnames"></a>`ValueListNames` | `valuelistnames`, `vln`
<a name="FileMakerVim-windownames"></a><a name="FMV-windownames"></a>`WindowNames` | `windownames`, `wn`

<a name="FileMakerVim-external"></a><a name="FMV-external"></a>
### External Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-external"></a><a name="FMV-external"></a>`External` | `external`

<a name="FileMakerVim-get"></a><a name="FMV-get"></a>
### Get Functions

Function | Snippets
---------|---------
<a name="FileMakerVim-getaep"></a><a name="FMV-getaep"></a>`Get( AccountExtendedPrivileges )` | `getaep`
<a name="FileMakerVim-getan"></a><a name="FMV-getan"></a>`Get( AccountName )` | `getan`
<a name="FileMakerVim-getapsn"></a><a name="FMV-getapsn"></a>`Get( AccountPrivilegeSetName )` | `getapsn`
<a name="FileMakerVim-getafc"></a><a name="FMV-getafc"></a>`Get( ActiveFieldContents )` | `getafc`
<a name="FileMakerVim-getafn"></a><a name="FMV-getafn"></a>`Get( ActiveFieldName )` | `getafn`
<a name="FileMakerVim-getaftn"></a><a name="FMV-getaftn"></a>`Get( ActiveFieldTableName )` | `getaftn`
<a name="FileMakerVim-getalon"></a><a name="FMV-getalon"></a>`Get( ActiveLayoutObjectName )` | `getalon`
<a name="FileMakerVim-getafk"></a><a name="FMV-getafk"></a>`Get( ActiveModifierKeys )` | `getafk`
<a name="FileMakerVim-getaprn"></a><a name="FMV-getaprn"></a>`Get( ActivePortalRowNumber )` | `getaprn`
<a name="FileMakerVim-getarn"></a><a name="FMV-getarn"></a>`Get( ActiveRepetitionNumber )` | `getarn`
<a name="FileMakerVim-getass"></a><a name="FMV-getass"></a>`Get( ActiveSelectionState )` | `getass`
<a name="FileMakerVim-getasst"></a><a name="FMV-getasst"></a>`Get( ActiveSelectionStart )` | `getasst`
<a name="FileMakerVim-getaas"></a><a name="FMV-getaas"></a>`Get( AllowAbortState )` | `getaas`
<a name="FileMakerVim-getafbs"></a><a name="FMV-getafbs"></a>`Get( AllowFormattingBarState )` | `getafbs`
<a name="FileMakerVim-getal"></a><a name="FMV-getal"></a>`Get( ApplicationLanguage )` | `getal`
<a name="FileMakerVim-getav"></a><a name="FMV-getav"></a>`Get( ApplicationVersion )` | `getav`
<a name="FileMakerVim-getcrn"></a><a name="FMV-getcrn"></a>`Get( CalculationRepetitionNumber )` | `getcrn`
<a name="FileMakerVim-getca"></a><a name="FMV-getca"></a>`Get( ConnectionAttributes )` | `getca`
<a name="FileMakerVim-getcs"></a><a name="FMV-getcs"></a>`Get( ConnectionState )` | `getcs`
<a name="FileMakerVim-getcd"></a><a name="FMV-getcd"></a>`Get( CurrentDate )` | `getcd`, `cd`
<a name="FileMakerVim-getcap"></a><a name="FMV-getcap"></a>`Get( CurrentExtendedPrivileges )` | `getcap`
<a name="FileMakerVim-getcht"></a><a name="FMV-getcht"></a>`Get( CurrentHostTimestamp )` | `getcht`
<a name="FileMakerVim-getcpsn"></a><a name="FMV-getcpsn"></a>`Get( CurrentPrivilegeSetName )` | `getcpsn`
<a name="FileMakerVim-getct"></a><a name="FMV-getct"></a>`Get( CurrentTime )` | `getct`, `ct`
<a name="FileMakerVim-getcts"></a><a name="FMV-getcts"></a>`Get( CurrentTimestamp )` | `getcts`, `cts`
<a name="FileMakerVim-getutc"></a><a name="FMV-getutc"></a>`Get( CurrentTimeUTCMilliseconds )` | `getutc`
<a name="FileMakerVim-getcmsn"></a><a name="FMV-getcmsn"></a>`Get( CustomMenuSetName )` | `getcmsn`
<a name="FileMakerVim-getdp"></a><a name="FMV-getdp"></a>`Get( DesktopPath )` | `getdp`
<a name="FileMakerVim-getdv"></a><a name="FMV-getdv"></a>`Get( Device )` | `getdv`
<a name="FileMakerVim-getdocp"></a><a name="FMV-getdocp"></a>`Get( DocumentsPath )` | `getdocp`
<a name="FileMakerVim-getdpl"></a><a name="FMV-getdpl"></a>`Get( DocumentsPathListing )` | `getdpl`
<a name="FileMakerVim-getes"></a><a name="FMV-getes"></a>`Get( EncryptionState )` | `getes`
<a name="FileMakerVim-geters"></a><a name="FMV-geters"></a>`Get( ErrorCaptureState )` | `geters`
<a name="FileMakerVim-getfmp"></a><a name="FMV-getfmp"></a>`Get( FileMakerPath )` | `getfmp`
<a name="FileMakerVim-getfn"></a><a name="FMV-getfn"></a>`Get( FileName )` | `getfn`
<a name="FileMakerVim-getfp"></a><a name="FMV-getfp"></a>`Get( FilePath )` | `getfp`
<a name="FileMakerVim-getfs"></a><a name="FMV-getfs"></a>`Get( FileSize )` | `getfs`
<a name="FileMakerVim-getfc"></a><a name="FMV-getfc"></a>`Get( FoundCount )` | `getfc`
<a name="FileMakerVim-gethcc"></a><a name="FMV-gethcc"></a>`Get( HighContrastColor )` | `gethcc`
<a name="FileMakerVim-gethcs"></a><a name="FMV-gethcs"></a>`Get( HighContrastState )` | `gethcs`
<a name="FileMakerVim-gethav"></a><a name="FMV-gethav"></a>`Get( HostApplicationVersion )` | `gethav`
<a name="FileMakerVim-gethipa"></a><a name="FMV-gethipa"></a>`Get( HostIPAddress )` | `gethipa`
<a name="FileMakerVim-gethn"></a><a name="FMV-gethn"></a>`Get( HostName )` | `gethn`
<a name="FileMakerVim-getifmp"></a><a name="FMV-getifmp"></a>`Get( InstalledFMPlugins )` | `getifmp`
<a name="FileMakerVim-getle"></a><a name="FMV-getle"></a>`Get( LastError )` | `getle`
<a name="FileMakerVim-getlmc"></a><a name="FMV-getlmc"></a>`Get( LastMessageChoice )` | `getlmc`
<a name="FileMakerVim-getloe"></a><a name="FMV-getloe"></a>`Get( LastODBCError )` | `getloe`
<a name="FileMakerVim-getla"></a><a name="FMV-getla"></a>`Get( LayoutAccess )` | `getla`
<a name="FileMakerVim-getlc"></a><a name="FMV-getlc"></a>`Get( LayoutCount )` | `getlc`
<a name="FileMakerVim-getln"></a><a name="FMV-getln"></a>`Get( LayoutName )` | `getln`
<a name="FileMakerVim-getlnu"></a><a name="FMV-getlnu"></a>`Get( LayoutNumber )` | `getlnu`
<a name="FileMakerVim-getltn"></a><a name="FMV-getltn"></a>`Get( LayoutTableName )` | `getltn`
<a name="FileMakerVim-getlvs"></a><a name="FMV-getlvs"></a>`Get( LayoutViewState )` | `getlvs`
<a name="FileMakerVim-getmf"></a><a name="FMV-getmf"></a>`Get( ModifiedFields )` | `getmf`
<a name="FileMakerVim-getmus"></a><a name="FMV-getmus"></a>`Get( MultiUserState )` | `getmus`
<a name="FileMakerVim-getnp"></a><a name="FMV-getnp"></a>`Get( NetworkProtocol )` | `getnp`
<a name="FileMakerVim-getnt"></a><a name="FMV-getnt"></a>`Get( NetworkType )` | `getnt`
<a name="FileMakerVim-getpn"></a><a name="FMV-getpn"></a>`Get( PageNumber )` | `getpn`
<a name="FileMakerVim-getpid"></a><a name="FMV-getpid"></a>`Get( PersistentID )` | `getpid`
<a name="FileMakerVim-getpp"></a><a name="FMV-getpp"></a>`Get( PreferencesPath )` | `getpp`
<a name="FileMakerVim-getprn"></a><a name="FMV-getprn"></a>`Get( PrinterName )` | `getprn`
<a name="FileMakerVim-getqft"></a><a name="FMV-getqft"></a>`Get( QuickFindText )` | `getqft`
<a name="FileMakerVim-getra"></a><a name="FMV-getra"></a>`Get( RecordAccess )` | `getra`
<a name="FileMakerVim-getrid"></a><a name="FMV-getrid"></a>`Get( RecordID )` | `getrid`
<a name="FileMakerVim-getrmc"></a><a name="FMV-getrmc"></a>`Get( RecordModificationCount )` | `getrmc`
<a name="FileMakerVim-getrn"></a><a name="FMV-getrn"></a>`Get( RecordNumber )` | `getrn`
<a name="FileMakerVim-getroc"></a><a name="FMV-getroc"></a>`Get( RecordOpenCount )` | `getroc`
<a name="FileMakerVim-getros"></a><a name="FMV-getros"></a>`Get( RecordOpenState )` | `getros`
<a name="FileMakerVim-getrqc"></a><a name="FMV-getrqc"></a>`Get( RequestCount )` | `getrqc`
<a name="FileMakerVim-getrqos"></a><a name="FMV-getrqos"></a>`Get( RequestOmitState )` | `getrqos`
<a name="FileMakerVim-getsd"></a><a name="FMV-getsd"></a>`Get( ScreenDepth )` | `getsd`
<a name="FileMakerVim-getsh"></a><a name="FMV-getsh"></a>`Get( ScreenHeight )` | `getsh`
<a name="FileMakerVim-getsw"></a><a name="FMV-getsw"></a>`Get( ScreenWidth )` | `getsw`
<a name="FileMakerVim-getsas"></a><a name="FMV-getsas"></a>`Get( ScriptAnimationState )` | `getsas`
<a name="FileMakerVim-getsn"></a><a name="FMV-getsn"></a>`Get( ScriptName )` | `getsn`
<a name="FileMakerVim-getsp"></a><a name="FMV-getsp"></a>`Get( ScriptParameter )` | `getsp`
<a name="FileMakerVim-getsr"></a><a name="FMV-getsr"></a>`Get( ScriptResult )` | `getsr`
<a name="FileMakerVim-getss"></a><a name="FMV-getss"></a>`Get( SortState )` | `getss`
<a name="FileMakerVim-getsars"></a><a name="FMV-getsars"></a>`Get( StatusAreaState )` | `getsars`
<a name="FileMakerVim-getsdv"></a><a name="FMV-getsdv"></a>`Get( SystemDrive )` | `getsdv`
<a name="FileMakerVim-getsipa"></a><a name="FMV-getsipa"></a>`Get( SystemIPAddress )` | `getsipa`
<a name="FileMakerVim-getsl"></a><a name="FMV-getsl"></a>`Get( SystemLanguage )` | `getsl`
<a name="FileMakerVim-getsna"></a><a name="FMV-getsna"></a>`Get( SystemNICAddress )` | `getsna`
<a name="FileMakerVim-getspl"></a><a name="FMV-getspl"></a>`Get( SystemPlatform )` | `getspl`
<a name="FileMakerVim-getsv"></a><a name="FMV-getsv"></a>`Get( SystemVersion )` | `getsv`
<a name="FileMakerVim-gettp"></a><a name="FMV-gettp"></a>`Get( TemporaryPath )` | `gettp`
<a name="FileMakerVim-gettrv"></a><a name="FMV-gettrv"></a>`Get( TextRulerVisible )` | `gettrv`
<a name="FileMakerVim-gettrc"></a><a name="FMV-gettrc"></a>`Get( TotalRecordCount )` | `gettrc`
<a name="FileMakerVim-gettcp"></a><a name="FMV-gettcp"></a>`Get( TriggerCurrentPanel )` | `gettcp`
<a name="FileMakerVim-gettgi"></a><a name="FMV-gettgi"></a>`Get( TriggerGestureInfo )` | `gettgi`
<a name="FileMakerVim-gettk"></a><a name="FMV-gettk"></a>`Get( TriggerKeystroke )` | `gettk`
<a name="FileMakerVim-gettmk"></a><a name="FMV-gettmk"></a>`Get( TriggerModifierKeys )` | `gettmk`
<a name="FileMakerVim-getttp"></a><a name="FMV-getttp"></a>`Get( TriggerTargetPanel )` | `getttp`
<a name="FileMakerVim-getuc"></a><a name="FMV-getuc"></a>`Get( UserCount )` | `getuc`
<a name="FileMakerVim-getun"></a><a name="FMV-getun"></a>`Get( UserName )` | `getun`
<a name="FileMakerVim-getusfs"></a><a name="FMV-getusfs"></a>`Get( UseSystemFormatsState )` | `getusfs`
<a name="FileMakerVim-getuuid"></a><a name="FMV-getuuid"></a>`Get( UUID )` | `getuuid`, `getuu`
<a name="FileMakerVim-getwch"></a><a name="FMV-getwch"></a>`Get( WindowContentHeight )` | `getwch`
<a name="FileMakerVim-getwcw"></a><a name="FMV-getwcw"></a>`Get( WindowContentWidth )` | `getwcw`
<a name="FileMakerVim-getwdh"></a><a name="FMV-getwdh"></a>`Get( WindowDesktopHeight )` | `getwdh`
<a name="FileMakerVim-getwdw"></a><a name="FMV-getwdw"></a>`Get( WindowDesktopWidth )` | `getwdw`
<a name="FileMakerVim-getwh"></a><a name="FMV-getwh"></a>`Get( WindowHeight )` | `getwh`
<a name="FileMakerVim-getwl"></a><a name="FMV-getwl"></a>`Get( WindowLeft )` | `getwl`
<a name="FileMakerVim-getwm"></a><a name="FMV-getwm"></a>`Get( WindowMode )` | `getwm`
<a name="FileMakerVim-getwn"></a><a name="FMV-getwn"></a>`Get( WindowName )` | `getwn`
<a name="FileMakerVim-getwo"></a><a name="FMV-getwo"></a>`Get( WindowOrientation )` | `getwo`
<a name="FileMakerVim-getws"></a><a name="FMV-getws"></a>`Get( WindowStyle )` | `getws`
<a name="FileMakerVim-getwt"></a><a name="FMV-getwt"></a>`Get( WindowTop )` | `getwt`
<a name="FileMakerVim-getwv"></a><a name="FMV-getwv"></a>`Get( WindowVisible )` | `getwv`
<a name="FileMakerVim-getww"></a><a name="FMV-getww"></a>`Get( WindowWidth )` | `getww`
<a name="FileMakerVim-getwzl"></a><a name="FMV-getwzl"></a>`Get( WindowZoomLevel )` | `getwzl`

<a name="FileMakerVim-helping"></a><a name="FMV-helping"></a>
# Helping Out

filemaker.vim needs the help of the FileMaker community to keep improving. Please consider joining this effort by providing new snippets, new features or bug reports.

You can contribute snippets or patches in various ways. The methods are listed below in order of convenience for me. Please be as convenient as you can be. :)

- Clone the repository on GitHub (`git clone git@github.com:chivalry/filemaker.vim.git`), make your changes and send a pull request on GitHub.
- Make a patch, [report a bug/feature request](https://github.com/chivalry/filemaker.vim/issues) and attach the patch to it.
- Send me an email with a patch (see [Contact](#FMV-contact) section below).
- Send me an email with the changed files only.

<a name="FileMakerVim-contact"></a><a name="FMV-contact"></a>
# Contact

You can reach me at chivalry -AT- mac -DOT- com. This project aims to be a complete solution for working with FileMaker calculations within Vim. If you miss a feature or find a bug, please contact me or add an issue to our [issues tracker](https://github.com/chivalry/filemaker.vim/issues).

<a name="FileMakerVim-contributors"></a><a name="FMV-contributors"></a>
# Contributors

The maintainer and primary developer of filemaker.com is Charles Ross ([GitHub](https://github.com/chivalry), [Twitter](https://twitter.com/chivalrysoft)). Matt Petrowski ([GitHub](https://github.com/petrowsky), [Twitter](https://twitter.com/filemakermag)) was of enormous help not only in developing this plugin but also in providing valueable insight into which features to include and how they should be implemented.
