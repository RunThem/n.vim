" Vim syntax file
" Language:     Lelwel (LL(1) parser generator grammar)
" Maintainer:   iccy
" Filenames:    *.llw
" Last Change:  2026-06-29

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match

" Comments (must be defined before ordered choice '/')
syn match   lelwelDocComment   +///.*$+ contains=lelwelTodo,@Spell
syn region  lelwelComment      start=+/\*+ end=+\*/+ contains=lelwelTodo,@Spell
syn match   lelwelComment      +//[^/].*$+ contains=lelwelTodo,@Spell
syn match   lelwelComment      +//$+ contains=lelwelTodo,@Spell
syn keyword lelwelTodo         contained TODO FIXME XXX

" Strings (single-quoted token symbols)
syn region  lelwelString       start=+'+ end=+'+ skip=+\\\\\|\\'+

" Keywords
syn keyword lelwelKeyword      token skip right start

" CST node controls (rename, elision, marker, creation) — before Token/Rule
syn match   lelwelCST          "[@][a-zA-Z_][a-zA-Z0-9_]*"
syn match   lelwelCST          "\^"
syn match   lelwelCST          "<\d\+"
syn match   lelwelCST          "\d\+>[a-z_][a-zA-Z0-9_]*"
syn match   lelwelCST          "\d\+>"

" Token names (uppercase start)
syn match   lelwelToken        "\<[A-Z][a-zA-Z0-9_]*\>"

" Rule names (lowercase start, excluding keywords)
syn match   lelwelRule         "\<\%(token\|skip\|right\|start\)\@![a-z_][a-zA-Z0-9_]*\>"

" Semantic operators (predicates, actions, assertions)
syn match   lelwelSemantic     "?[0-9t]"
syn match   lelwelSemantic     "#[0-9]\+"
syn match   lelwelSemantic     "![0-9]\+"

" Control flow (commit, return)
syn match   lelwelControl      "\~"
syn match   lelwelControl      "&"

" Ordered choice
syn match   lelwelOrderedChoice "/"

" Alternation
syn match   lelwelOperator     "|"

" Quantifiers
syn match   lelwelQuantifier   "\*"
syn match   lelwelQuantifier   "+"

" Delimiters
syn match   lelwelDelimiter    "[()\[\]]"

" Punctuation
syn match   lelwelPunctuation  "[;:=]"

" Highlight links
hi def link lelwelKeyword       Keyword
hi def link lelwelToken         Type
hi def link lelwelRule          Function
hi def link lelwelString        String
hi def link lelwelComment       Comment
hi def link lelwelDocComment    SpecialComment
hi def link lelwelTodo          Todo
hi def link lelwelSemantic      PreProc
hi def link lelwelCST           Constant
hi def link lelwelControl       Statement
hi def link lelwelOrderedChoice PreProc
hi def link lelwelOperator      Operator
hi def link lelwelQuantifier    Operator
hi def link lelwelDelimiter    Delimiter
hi def link lelwelPunctuation   Delimiter

let b:current_syntax = "lelwel"

let &cpo = s:cpo_save
unlet s:cpo_save
