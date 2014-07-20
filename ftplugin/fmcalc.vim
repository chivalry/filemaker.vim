" Vim ftplugin file for FileMaker calculations
" Last Change: 2014 Jul 20
" Version: 1.0
" Language: Vimscript
" Maintainer: Charles Ross <chivalry@mac.com>
" License: The MIT License

" Replace the ^M characters with actual cariage returns. FileMaker apparently
" uses DOS returns within the calculation dialog by default.
:silent! %s/\r/\r/g

" Retab to desired tab settings
:silent! %retab!

" FileMaker calcs should use hard indents
setlocal noexpandtab
setlocal autoindent

" Store the absolute path to this script's parent directory
let s:path = expand('<sfile>:p:h')

" ------------------------------------------------------------------------------
" Map the completion key unless the user has overridden this feature
function! SetMapKeys()
  if !exists('g:FMVMapKeys')
    let g:FMVMapKeys = 1
  endif

  if g:FMVMapKeys
    " let g:UltiSnipsListSnippets="<c-s-tab>"
    " call UltiSnips#map_keys#MapKeys()
    inoremap <buffer> <c-tab> <c-x><c-u>
  endif
endfunction
call SetMapKeys()

" ------------------------------------------------------------------------------
" Test function to see if using a complete function works
function! CompleteFunctions(findstart, base)
  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start-=1
    endwhile
    return start
  else
    " find functions matching with "a:base"
    let res = []
    let months = readfile(s:path . '/builtins.txt')
    for m in months
      if m =~ '^' . a:base
        call add(res, m)
      endif
    endfor
    return res
  endif
endfunction
set completefunc=CompleteFunctions
