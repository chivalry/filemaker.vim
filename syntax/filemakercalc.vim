" Vim Syntax File
" Language: FileMaker Calculations
" Maintainer: Charles Ross <chivalry@mac.com>

if exists("b:current_syntax")
  finish
endif

syntax match fmOperator "\v\*"
syntax match fmOperator "\v/"
syntax match fmOperator "\v\+"
syntax match fmOperator "\v-"
syntax match fmOperator "\v\="
syntax match fmOperator "\v\&"
syntax match fmOperator "\v¶"
syntax match fmOperator "\v≤"
syntax match fmOperator "\v≥"
syntax match fmOperator "\v≠"
syntax match fmOperator "\v^"
syntax keyword fmOperator and or not xor

highlight link fmOperator Operator

let b:current_syntax = "filemakercalc"
