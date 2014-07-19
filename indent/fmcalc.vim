:" Vim indent file for FileMaker calculations
" Last Change: 2014 Jul 19
" Version: 1.0
" Language: Vimscript
" Maintainer: Charles Ross <chivalry@mac.com>
" License: The MIT License

" This file is meant to define the indent rules for the filetype. For the time
" being I'm just documenting what the indent rules should be. I'll also see if
" I can find a way to allow the user to override the indent rules.
"
" By default the indent rules should be very simple. Just intent after every
" open parenthsis or backet and outdent when they close. But These rules don't
" account for the desire to have some functions appear on a single line.
" Ideally the indent rule would be as above but don't override the user's
" entry of an entire function on a single line. This last part may be
" difficult to do, so we'll begin with the simple rule as stated above.
"
" It appears that `set smartindent` may be sufficient if we can tell Vim to
" use parentheses and brackets instead of using braces.

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1
