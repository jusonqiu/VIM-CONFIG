""""""""""""""""""""""""""""""""vunbke""""""""""""""""""""""""""""""

set nocompatible
syntax on
filetype off
"set rtp+=~/.vim/bundle/Vundle.vim/
"call vundle#rc()
"Bundle 'gmarik/Vundle.vim'
"filetype plugin indent on

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"﻿set nocompatible
"syntax on                   " 自动语法高亮
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

if has("cscope")
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif
:set cscopequickfix=s-,c-,d-,i-,t-,e-
"	map <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
"	map <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
"	map <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
"	map <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
"	map <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
"	map <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
"	map <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"	map <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	

"let g:miniBufExplMapWindowNavVim = 1
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
imap <C-Enter> <Esc>o

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
inoremap #inc #include "
inoremap puts puts("\n");<Esc>F\ha
inoremap printf printf("\n");<Esc>F\ha
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr>

function SyncAllTags()
	cs kill -1
    !~/.vim/bin/tags.sh
"   cs add cscope.out 
endfunction
command Sync :call SyncAllTags()

command Vimrc edit ~\.vimrc


