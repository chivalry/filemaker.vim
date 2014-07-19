" Vim ftdetect file for FileMaker calculations
" Last Change: 2014 Jul 11
" Version: 1.0
" Language: FileMaker Calculations
" Maintainer: Charles Ross <chivalry@mac.com>
" License: The MIT License

autocmd BufNewFile,BufRead filemaker*.txt,*.filemaker set filetype=fmcalc
autocmd BufNewFile,BufRead *.fmcalc,*.fm,*.fmfn       set filetype=fmcalc

autocmd FileType fmcalc autocmd BufReadPost <buffer> %retab!
