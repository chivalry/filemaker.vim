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

" Don't do anything for now
finish

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetFMCalcIndent()
setlocal indentkeys=0{,0},!^F,o,O

" This may do more than is needed. Probably only need to undo what we do.
let b:undo_indent = 'setlocal autoindent< smartindent< expandtab< softtabstop< shiftwidth< indentexpr< indentkeys<'

if exists("*GetFMCalcIndent")
  finish
endif

" I don't think this is needed if we are never going to worry about vi
" compatibility.
let s:cpo_bu= &cpo
set cpo&vim

function GetFMCalcIndent()
  let line = getline(v:lnum)
  let prev_line = getline(v:lnum - 1)
  let prev_indent = indent(v:lnum - 1)

  " If the previous line is blank use it's indent
  if prev_line =~ "^\s*$"
    return prev_indent
  endif

  " If the previous line began with an open paren, increment the indent
  if prev_line =~ "^.*(\s*$"
    return prev_indent + &sw
  endif

  " If the current line begins with a closing paren, decrement the indent
  if line =~ "^\s*)$"
    return prev_indent - $sw
  endif
endfunction

function GetCSSIndent()
  let line = getline(v:lnum)
  if line =~ '^\s*\*'
    return cindent(v:lnum)
  endif

  let pnum = s:prevnonblanknoncomment(v:lnum - 1)
  if pnum == 0
    return 0
  endif

  return indent(pnum) + s:count_braces(pnum, 1) * &sw
        \ - s:count_braces(v:lnum, 0) * &sw
endfunction

let &cpo = s:cpo_bu
unlet s:cpo_bu
