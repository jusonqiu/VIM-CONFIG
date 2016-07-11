" set the runtime path to include Vundle and initialize
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'

call vundle#end()


set shell=/bin/bash
"﻿set nocompatible
filetype plugin indent on
syntax on                   " 自动语法高亮
"colorscheme solarized        " 设定配色方案
"colorscheme desert   "设定配色方案
colorscheme molokai   "设定配色方案

set number                  " 显示行号
" set cursorline              " 突出显示当前行
set ruler                   " 打开状态栏标尺
set tabstop=4               " 设定 tab 长度为 4
set shiftwidth=4
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set smartindent             " 开启新行时使用智能自动缩进
set cindent
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏工具栏
			
set backspace=2				" 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l		" 允许backspace和光标键跨越行边界

set autowrite

set mouse=a
set selection=exclusive
set selectmode=mouse,key

""""""""""""""""""""code"""""""""""""""""""""""""
set fencs=utf-8,gbk


filetype on
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
if exists("&autoread")
set autoread
endif
"set putty colortheme surppot
set fileformats=unix,dos
if has("unix")
	set t_Co=256
endif
hi Normal guifg=#f0f0f0 guibg=#303030

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Update = 1
let Tlist_Use_Right_Window = 1         " 在右侧窗口中显示taglist窗口


""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
let g:LookupFile_DisableDefaultMap=1
if filereadable("./filenametags")                "设置tag文件的名字
	let g:LookupFile_TagExpr = '"./filenametags"'
endif

map ;lf :LUTags<CR>
map ;lb :LUBufs<CR>


let g:session_autosave = 'no'
let g:session_directory= '.'

set guicursor=n-v-c:ver20-Cursor/lCursor,ve:ver35-Cursor,o:hor20-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:ver20-Cursor-blinkwait175-blinkoff150-blinkon175	

set guifont=Courier\ 10\ Pitch\ 14


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"let g:miniBufExplMapWindowNavVim = 1if has("cscope")
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 
"let g:miniBufExplVSplit = 20



imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>
imap <C-v> <Esc>pa
imap <C-i> <Esc>o
nmap <C-CR> o<Esc>
map <F11> :TlistToggle<CR>
map <F10> :LookupFile<CR>
nmap b,p :bp<CR>
nmap b,n :bn<CR>
"imap <C-Enter> <Esc>o

"""""""""""""""""""""NERDTree"""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <F12> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 20
let NERDTreeIgnore=['\.o$', '\.a$','\.so$','\~$']
"""""""""""""""""""""Cursor line """""""""""""""""

set cursorline
 "hi x235_Grey15 ctermfg=253 
hi CursorLine  cterm=NONE ctermbg=235 ctermfg=NONE

 "hi CursorColumn cterm=NONE ctermbg=darkgrey ctermfg=white
"let g:molokai_original = 1
"""""""""""""""""""""""" comment """"""""""""""""""""""
map <C-/> :s/^/#<CR> 
""""""""""""""""""""""""""YOU CONPELETC ME"""""""""""""""""""""""""""""
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

inoremap <C-u> <Esc>bgUwea

nnoremap <Space> :

nnoremap <C-p> "+P
nnoremap <C-y> "+y
" minibufferexplore
map <C-Down> :bn<CR>
map <C-Up> :bp<CR>

noremap \si oif (  ) {<CR>}<Esc>kf(la
noremap \sie oif (  ) {<CR>} else {<CR>}<Esc>kkf(la
noremap \sf   ofor (  )<CR>{<CR>}<Esc>kkf(la

inoremap unsi unsigned 
inoremap #inc #include 
inoremap puts puts("\n");<Esc>F\ha
inoremap printf printf("\n");<Esc>F\ha
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr>

function SyncAllTags()
	cs kill -1
    !~/.vim/bin/tags.sh
	cs add cscope.out
endfunction

command Sync :call SyncAllTags()

command Vimrc edit ~\.vimrc


func SetComment()
    call setline(1,"/******************************************************************************")
    call append(line("."),   "*   Copyright (C) ".strftime("%Y")." All rights reserved.")
    call append(line(".")+1, "*   ")  
    call append(line(".")+2, "*   File: ".expand("%:t")) 
    call append(line(".")+3, "*   Author: Zhaosheng Qiu <juson163@yeah.net>")
    call append(line(".")+4, "*   Time: ".strftime("%Y/%m/%d")) 
    call append(line(".")+5, "*   Descriptions: ") 
    call append(line(".")+6, "*")
    call append(line(".")+7, "******************************************************************************/") 
endfunction

command SetC :call SetComment()

func SetTitle()
     call SetComment()
     if expand("%:e") == 'hpp' 
  call append(line(".")+8, "#ifndef _".toupper(expand("%:t:r"))."_H") 
  call append(line(".")+9, "#define _".toupper(expand("%:t:r"))."_H")
  call append(line(".")+10, "#ifdef __cplusplus")
  call append(line(".")+11, "extern \"C\"")
  call append(line(".")+12, "{")
  call append(line(".")+13, "#endif")
  call append(line(".")+14, "")
  call append(line(".")+15, "#ifdef __cplusplus")
  call append(line(".")+16, "}")
  call append(line(".")+17, "#endif") 
  call append(line(".")+18, "#endif //".toupper(expand("%:t:r"))."_H") 
     elseif expand("%:e") == 'h' 
  call append(line(".")+8, "#pragma once") 
     elseif &filetype == 'c' 
  call append(line(".")+8,"#include \"".expand("%:t:r").".h\"") 
     elseif &filetype == 'cpp' 
  call append(line(".")+8, "#include \"".expand("%:t:r").".h\"") 
     endif
endfunction

command SetHeaderT :call SetTitle()


map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nmap <leader>T :GotoSymbol


""YCM""

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

let g:ycm_global_ycm_extra_conf = '~/.vim/data/.ycm_extra_conf.py'
" 开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=1
let g:ycm_auto_trigger = 1
"
" " 开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files=1
" "注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" " 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" " 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
" "在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" "在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" " 设置在下面几种格式的文件上屏蔽ycm
"
 let g:ycm_filetype_whitelist = { '*': 1 }
"
 ""let g:ycm_filetype_blacklist = {
 ""      \ 'tagbar' : 1,
 ""      \ 'qf' : 1,
 ""      \ 'notes' : 1,
 ""      \ 'markdown' : 1,
 ""      \ 'unite' : 1,
 ""      \ 'text' : 1,
 ""      \ 'vimwiki' : 1,
 ""      \ 'pandoc' : 1,
 ""      \ 'infolog' : 1,
 ""      \ 'mail' : 1
 ""      \}
"
" <leader> = C-\
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>kk :echo "goto >>> \ngl: GoToDeclaration \ngf: GoToDefinition \ngg: GoToDefinitionElseDeclaration"<CR>


"""""""""""" markdown """"""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_emphasis_multiline = 0
set conceallevel=2
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['csharp=cs']
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1

"" ge: open the link under the cursor in Vim for editing. Useful for relative markdown links. <Plug>Markdown_EditUrlUnderCursor
"" The rules for the cursor position are the same as the gx command.
"" ]]: go to next header. <Plug>Markdown_MoveToNextHeader
"" [[: go to previous header. Contrast with ]c. <Plug>Markdown_MoveToPreviousHeader
"" ][: go to next sibling header if any. <Plug>Markdown_MoveToNextSiblingHeader
"" []: go to previous sibling header if any. <Plug>Markdown_MoveToPreviousSiblingHeader
"" ]c: go to Current header. <Plug>Markdown_MoveToCurHeader
"" ]u: go to parent header (Up). <Plug>Markdown_MoveToParentHeader
