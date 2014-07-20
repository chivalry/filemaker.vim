:" Vim indent file for FileMaker calculations
" Last Change: 2014 Jul 20
" Version: 1.0
" Language: Vimscript
" Maintainer: Charles Ross <chivalry@mac.com>
" License: The MIT License

" Rules for indentation:
"   - If the previous line ended in a paren or bracket, increment indent
"   - If the current line starts with a paren or bracket, decrement indent
"   - Otherwise keep the indent of the previous line
"   - The previous line is the most recent non-blank, non-comment line

echom "indent/fmcalc.vim"
if exists('b:did_indent')
"  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetFMCalcIndent()

if exists('*GetFMCAlcIndent')
  " finish
endif

" ------------------------------------------------------------------------------
function! s:get_prev_non_comment_line(lnum)
  let comment_regex = '^\s*//'
  let nline = a:lnum

  while nline > 0
    let nline = prevnonblank(nline-1)
    if getline(nline) !~? comment_regex
      break
    endif
  endwhile

  return nline
endfunction

" ------------------------------------------------------------------------------
function! GetFMCalcIndent()
  echom "\r entered GetFMCalcIndent"
  let line_num = v:lnum
  if line_num == 0
    echom "line_num == 0"
    return 2
    return 0
  endif

  let this_codeline = getline(line_num)

  " If in the middle of a multi line comment, return the default
  if this_codeline =~ '^\s*\*'
    echom "this_codeline =~ '^\s*\*'"
    return 4
    return indent(line_num)
  endif

  let prev_codeline_num = s:get_prev_non_comment_line(line_num)
  let prev_codeline = getline(prev_codeline_num)
  let indnt = indent(prev_codeline_num)
  echom "this_codeline = " . this_codeline
  echom "prev_codeline_num = " . prev_codeline_num
  echom "prev_codeline = " . prev_codeline
  echom "indnt = " . indnt

  " If the previous line ended with an opening paren or bracket,
  " increment indent.
  if prev_codeline =~ '.*('
    return indnt + &shiftwidth
  endif
  if prev_codeline =~ '.*['
    return indnt + &shiftwidth
  endif

  " If the current line began with a closing paren or bracket,
  " decrement indent.
  if this_codeline =~ '^\s*];'
    echom "this_codeline =~ '\s*\()|];\)'"
    return 8
    return indnt - &shiftwidth
  endif

  if getline(v:lnum) =~ '^\s*\(ene\@!\|cat\|fina\|el\|aug\%[roup]\s*!\=\s\+END\)'
    return 8
    return indnt - &shiftwidth
  endif

  echom "default"
  return indnt
endfunction
















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
