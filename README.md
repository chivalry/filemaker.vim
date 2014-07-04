FileMaker Vim
=============

Combining [FileMaker](http://www.filemaker.com) with [Vim](http://www.vim.org) may seem like an odd coupling, but I use both every day, and have been getting more and more atuned to the "Vim" way of doing things. Years ago, when I was using [TextMate](https://macromates.com) I wrote a [bundle](https://code.google.com/p/filemaker-textmate-bundle/) for it that made for easier FileMaker calculation editing in TextMate. This project has the same goal for Vim.

Intro
-----

The FileMaker Vim plugin provides syntax highlighting for FileMaker calculations to be edited in Vim. It detects the filetype for the extensions `.filemaker`, `.fmcalc` and `.fm` and also recognizes FileMaker calcs that have been opened using the [QuickCursor](https://github.com/jessegrosjean/quickcursor) app on OS X.

QuickCursor
-----------

QuickCursor is an OS X app that allows the editing of appliation text fields in an external text editor. For example, while I'm in the text field for a FileMaker calculation, I can press `Cmd-Opt-Ctrl-V` and it will open that calculation in [MacVim](https://code.google.com/p/macvim/). But this procedure has two downsides.

First of all, as nice as QuickCursor is, it's no longer being supported because of its inability to work with Apple's sandbox, but my old version does seem to work with OS X Yosemite.

Second, my version of FileMaker apparently uses DOS returns in calculation dialog boxes even though I'm running this on a Mac. Therefore when a FileMaker calculation is opened in Vim the DOS returns are automatically replaced with Unix returns. This doesn't seem to be a problem, but you should be aware that saving a Vim buffer back into a FileMaker calculation is changing the carriage returns at the end of each line.

Features
--------

Currently FileMaker Vim is sparse on features. It detects the following patterns for syntax highlighting:

- Local and global variables
- Calculation variables that begin with an underscore (i.e., `_variable`)
- Mathematical, logical and string operators
- String and number literals
- Built-in FileMaker functions
- Custom functions that begin with a prefix and a dot (i.e., `dev.MyCustomFunction`)
- Block and in-line comments

This is currently alpha version software with many features in mind for the future. Among the planned future features:

- Recognition of any calculation variable (i.e., no need to prepend an underscore)
- Recognition of any custom or external function (i.e., no need to prepend a code followed by a dot)
- Integration with one or more of the TextMate-like snippet plugins for Vim, probably [UltiSnips](https://github.com/sirver/ultisnips) to start
- Addition of an indent file that first uses my own preferences for indenting FileMaker calcs and later allows the user to set their own preferences
- Addition of a doc file to provide in-Vim help
- Confirmation of Windows compatibility, so far this has only been tested with MacVim and the command-line version of Vim

Installation
------------

FileMaker Vim is compatible with [Pathogen](http://www.vim.org/scripts/script.php?script_id=2332), so the easiest way to install it is to already have Pathogen and simply clone the `filemakervim` project into `~/.vim/bundle`.

    cd ~/.vimrc/bundle
    git@bitbucket.org:chivalry/filemakervim.git

If you don't use Pathogen, then you'll need to place the files manually as follows, creating the folders in `.vim` as needed.:

    filemakervim/ftdetect/filemakervim.vim -> ~/.vim/ftdetect/filemakervim.vim
    filemakervim/ftplugin/filemakervim.vim -> ~/.vim/ftplugin/filemakervim.vim
    filemakervim/syntax/filemakervim.vim   -> ~/.vim/syntax/filemakervim.vim

Perhaps in the future I'll look into an installer script to do this automatically. If you're using FileMaker and Vim on Windows, place the files in the analogous `vimfiles` folder (I think).
