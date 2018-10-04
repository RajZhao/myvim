set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on
set nocompatible "不兼容vi
set termguicolors "24位真彩
set title "显示标题
"set mouse=a "启用鼠标
set number
set belloff=all "不发出滴滴声
set ttimeoutlen=100 "等待时间
set history=1024 "历史
set nobackup "不备份
set showcmd "输入的命令显示出来
set showmode "显示当前模式
set ruler "显示右下角
set nonu "不显示行号
set cursorline "高亮当前行
set linebreak "更智能的自动折行显示
set wildmenu "更好的命令补全
set display=lastline "不显示@
set completeopt=menu "不显示补全预览窗口
set scrolloff=3 "滚动时光标与边界的距离
set listchars=tab:\|\ ,trail:· "空白字符
set fillchars=vert:·,fold:- "分割线
set encoding=utf-8 "编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,latin1 "编码解析顺序
set number
set tabstop=4 "tab的大小
set softtabstop=4 "一次删除多少空格
set shiftwidth=4 "缩进大小
set noexpandtab "不把tab转换成空格
set smartindent "自动缩进，一般缩进与上一行一样，但遇到括号时清除缩进

"设置缩进风格为两个空格
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.tsx setlocal ts=2 sts=2 sw=2 expandtab

""没有补全时使用高亮关键字补全
autocmd Filetype *
	\	if &omnifunc == "" |
	\		setlocal omnifunc=syntaxcomplete#Complete |
	\	endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plguin area
Plugin 'VundleVim/Vundle.vim'
Plugin 'jstemmer/gotags'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'wincent/wincent.git'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'h2non/filetype'
Plugin 'Blackrush/vim-gocode'
Plugin 'Shougo/neocomplete.vim'
Plugin 'jiangmiao/auto-pairs'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




"Plugin config
"vim-go config
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
	\ }

"tag-bar config
nmap <F8> :TagbarToggle<CR>

"nerdtree config
map <C-n> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree

"syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"ycm config
let g:ycm_min_num_of_chars_for_completion = 2  "开始补全的字符数
let g:ycm_python_binary_path = 'python'  "jedi模块所在python解释器路径
let g:ycm_seed_identifiers_with_syntax = 1  "开启使用语言的一些关键字查询
let g:ycm_autoclose_preview_window_after_completion=1 "补全后自动关闭预览窗口
let g:ycm_auto_trigger = 1   "turn on

"gocode config
imap <F6> <C-x><C-o>


"gotag config
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
	\ }

"syntasic config
"Govim config
nmap <F5> :w<CR>:!go run %<CR>
imap <F5> <ESC>:w<CR>:!go run %<CR>
