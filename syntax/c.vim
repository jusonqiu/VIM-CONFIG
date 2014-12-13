"========================================================
" Highlight All Function
"========================================================
syn match cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunction gui=bold guifg=DarkYellow
hi cFunction cterm=bold ctermfg=DarkGreen

"hi Normal ctermfg=White
hi Normal guibg=#202020 guifg=White

"========================================================
" Highlight All Math Operator
"========================================================
" C math operators
syn match cMathOperator display "[-+\*/%=]"
" C pointer operators
syn match cPointerOperator display "->\|\."
" C logical operators - boolean results
syn match cLogicalOperator display "[!<>]=\="
syn match cLogicalOperator display "=="
" C bit operators
syn match cBinaryOperator display "\(&\||\|\^\|<<\|>>\)=\="
syn match cBinaryOperator display "\~"
syn match cBinaryOperatorError display "\~="
" More C logical operators - highlight in preference to binary
syn match cLogicalOperator display "&&\|||"
syn match cLogicalOperatorError display "\(&&\|||\)="

" Math Operator
hi cMathOperator ctermfg=Yellow
hi cPointerOperator ctermfg=Yellow
hi cLogicalOperator ctermfg=Yellow
hi cBinaryOperator ctermfg=Yellow
hi cBinaryOperatorError ctermfg=Yellow
hi cLogicalOperator ctermfg=Yellow
hi cLogicalOperatorError ctermfg=Yellow

hi cMathOperator guifg=Orange
hi cPointerOperator guifg=Orange
hi cLogicalOperator guifg=Orange
hi cBinaryOperator guifg=Orange
hi cBinaryOperatorError guifg=Orange
hi cLogicalOperator guifg=Orange
hi cLogicalOperatorError guifg=Orange
