" Vim syntax file
" Language:     MIX (Donald Knuth's assembly language used in TAOCP)
" Maintainer:   Wu Yongwei <wuyongwei@gmail.com>
" Filenames:    *.mixal *.mix
" Last Change:  2017-11-26 15:21:36 +0800

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" Identifier; must go before literals
syn match littleIdentifier         "\<[a-zA-Z_][a-zA-Z0-9_]\+\>"

" Integer number
syn match  littleNumber            "\<\d\+\>"
syn match  littleNumber            "\<\d\+\.\d*\%([eE][-+]\=\d\+\)\="
syn match  littleNumber            "\.\d\+\%([eE][-+]\=\d\+\)\=\>"
syn match  littleNumber            "\<\d\+[eE][-+]\=\d\+\>"

syn keyword littleTodo             contained TODO FIXME XXX
syn match   littleComment          ";.*$" contains=luaTodo

" strings
syn match  littleSpecial contained #\\[\\abfnrtv'"[\]]\|\\[[:digit:]]\{,3}#
syn region littleString start=+'+ end=+'+ skip=+\\\\\|\\'+ contains=luaSpecial,@Spell
syn region littleString start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=luaSpecial,@Spell


" Directives
syn keyword littleKeyword          fn var if elseif else is for in return

" Opcodes
" syn keyword littleOpcode           + - * / %

syn match   littleFunc /\<io\.require\>/
syn match   littleFunc /\<io\.print\>/
syn match   littleFunc /\<io\.clock\>/

syn match   littleFunc /\<array\.each\>/
syn match   littleFunc /\<array\.range\>/
syn match   littleFunc /\<array\.len\>/
syn match   littleFunc /\<array\.last\>/
syn match   littleFunc /\<array\.pop\>/
syn match   littleFunc /\<array\.push\>/
syn match   littleFunc /\<array\.remove\>/

syn match   littleFunc /\<string\.from\>/
syn match   littleFunc /\<string\.concat\>/
syn match   littleFunc /\<string\.len\>/
syn match   littleFunc /\<string\.sub\>/
syn match   littleFunc /\<string\.format\>/

" The default highlighting
hi def link littleKeyword          Keyword
hi def link littleOpcode           Keyword

hi def link littleNumber           Number
hi def link littleString           String
hi def link littleIdentifier       Identifier

hi def link littleTodo             Todo
hi def link littleComment          Comment

hi def link littleFunc             Function

let b:current_syntax = "little"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8
