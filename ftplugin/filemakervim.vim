" Vim ftplugin file for FileMaker calculations
" Last Change: 2014 Jul 7
" Version: 1.0
" Language: FileMaker Calculations
" Maintainer: Charles Ross <chivalry@mac.com>
" License: The MIT License

" Replace the ^M characters with actual cariage returns. FileMaker apparently
" uses DOS returns within the calculation dialog by default.
:silent! %s/\r/\r/g
