" keyword
syn keyword     cNullptr        nullptr

" match
syn match       cPunctuation    /[{}()\[\]\:;,]/
syn match       cOperator       /->/

" hi
hi def link     cNullptr        Constant
hi def link     cPunctuation    Paren
hi def link     cTypedef        Keyword
hi def link     cStructure      Keyword
hi def link     cOperator       Operatro
