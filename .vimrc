set nocompatible " be iMproved, required
filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')
  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
  Plugin 'tpope/vim-fugitive'
  " plugin from http://vim-scripts.org/vim/scripts.html
  " Plugin 'L9'
  " Git plugin not hosted on GitHub
  " Plugin 'git://git.wincent.com/command-t.git'
  " git repos on your local machine (i.e. when working on your own plugin)
  " Plugin 'file://home/cuishang/.vim/plugin'
  " The sparkup vim script is in a subdirectory of this repo called vim.
  " Pass the path to set the runtimepath properly.
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Install L9 and avoid a Naming conflict if you've already installed a
  " different version somewhere else.
  " Plugin 'ascenator/L9', {'name': 'newL9'}
  " All of your Plugins must be added before the following line

  Plugin 'git://github.com/scrooloose/nerdtree.git'

  Plugin 'git://github.com/ctrlpvim/ctrlp.vim.git'
  
  Plugin 'git://github.com/majutsushi/tagbar.git'
  
  Plugin 'git://github.com/rking/ag.vim.git'

  Plugin 'git://github.com/vim-airline/vim-airline.git'
  Plugin 'git://github.com/vim-airline/vim-airline-themes.git'
  Plugin 'git://github.com/jlanzarotta/bufexplorer.git'
  Plugin 'git://github.com/jeetsukumaran/vim-buffergator.git'
  Plugin 'git://github.com/bling/vim-bufferline.git'
  Plugin 'git://github.com/Vimjas/vim-python-pep8-indent.git'
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" for easy using sliver search
" Set mapleader
let mapleader = ","

set nu
set hlsearch "搜索高亮
set incsearch
set ignorecase "忽略大小写

let g:startify_change_to_dir = 0 

" set nerdtree mapping
" " map <F3> :NERDTreeMirror<cr>
nmap <F3> :NERDTreeToggle<cr>
map <F4> :NERDTreeToggle<cr>:NERDTreeCWD<cr>

"tagbar
nmap <F8> :TagbarToggle<CR>

"去空行  
" nnoremap <F2> :g/^\s*$/d<CR> 

" Treat long lines as bread lines(useful when moving around in them)
map j gj
map k gk

" Turn backup off,since most stuff is in SVN,git et.c anyway...
set nobackup
set nowb
set noswapfile

" ctrl c and v to clipboard
vmap <C-c> "+y
nmap <C-a> ggVG
nmap <C-v> "+p
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>

"撤销和恢复用win键
nmap <C-z> u<cr>
nmap <C-y> <C-r>

" auto change working dir
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

"ag.vim
"set runtimepath^=/home/cuishang/.vim/bundle/ag.vim/plugin
"let g:ag_prg="~/.vim/bundle/ag --vimgrep"
"let g:ag_working_path_mode="r"
nmap <leader>f :norm yiw<CR>:Ag! -t -Q "<C-R>""
"Locate and return character "above" current cursor position.
function! LookUpwards()
    let column_num = virtcol('.')
    let target_pattern = '\%' . column_num . 'v.'
    let target_line_num = search(target_pattern . '*\S', 'bnW')


    if !target_line_num
        return ""
    else
        return matchstr(getline(target_line_num), target_pattern)
    endif
endfunction


imap <silent> <C-Y> <C-R><C-R>=LookUpwards()<CR>


"ctrlp
" ctrlp.vim setting
set runtimepath^=~/.vim/bundle/ctrlp.vim
""<Leader>p搜索当前目录下文件
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
"<Leader>搜索MRU文件
nmap <Leader>e :CtrlPMRUFiles<CR>
""<Leader>h显示缓冲区文件，并可通过序号进行跳转
nmap <Leader>h :CtrlPBuffer<CR>
"设置搜索时忽略的文件
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
"修改QuickFix窗口显示的最大条目数
let g:ctrlp_max_height = 30
let g:ctrlp_match_window_reversed = 0
"设置MRU最大条目数为500
let g:ctrlp_mruf_max = 500
let g:ctrlp_follow_symlinks = 1
"默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
let g:ctrlp_by_filename = 1
"默认不使用正则表达式，置1改为默认使用正则表达式，可以用<C-r>进行切换
let g:ctrlp_regexp = 0
"自定义搜索列表的提示符
let g:ctrlp_line_prefix = '♪ '

"切换窗口
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
"w!!强制保存没有加sudo的文件
cnoremap w!! w !sudo tee % >/dev/null

"jj 退出编辑模式
inoremap jj <Esc>`^

" Fast saving
nmap <leader>w :w!<cr>
 " Fast quit
nmap <leader>q :qa<cr>

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax on  "语法高亮

filetype on                              "检测文件的类型

" Custom setting
set nu
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set whichwrap+=<,>,h,l
set splitright

" map tab
nmap tn :tabn<cr>
nmap tp :tabp<cr>

" set tabstop=4                        "设置tab键为4个空格，
" set ts=4
" set expandtab
" set autoindent

" set showmatch                     "设置匹配模式，类似当输入一个左括号时会匹配相应的右括号     

" 状态栏
" set laststatus=2      " 总是显示状态栏
" highlight StatusLine cterm=bold ctermfg=white ctermbg=black
" 获取当前路径，将$HOME转化为~
" function! CurDir()
        " let curdir = substitute(getcwd(), $HOME, "~", "g")
        " return curdir
" endfunction
" set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\
						  
" set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
" set ruler "在编辑过程中，在右下角显示光标位置的状态行

" set airline to use powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='cool'

"set mouse=a "使能鼠标

"设置tags
set tags=~/.vim/systags
set tags=~/as/m4/ctags
set tags=tags;

function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++,java --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q
        TlistUpdate
    endif
    execute ":cd " . curdir
endfunction

nmap <F10> :call UpdateCtags()<CR>

" comment and uncomment
function! Docomment(comment)
    let lnum = line('.')
    let str_line = getline('.')
    let comm_ident = "\/\/"
    let syntax_type = &syntax
    if syntax_type == "vim"
        let comm_ident = "\""
    elseif syntax_type == "cpp" || syntax_type == "c" || syntax_type == "java"
        let comm_ident = "\/\/"
    elseif syntax_type == "sh" || syntax_type == "rc"
        let comm_ident = "#"
    else
        return
    endif

    if a:comment
        let str_line = substitute(str_line, "\\(\\S.*$\\)", comm_ident . " \\1", "")
        call setline(lnum, str_line)
    else
        let str_line = substitute(str_line, "\\(^\\s*\\)" . comm_ident ." \\?", "\\1", "")
        call setline(lnum, str_line)
    endif
endfunction

nmap <leader>c :call Docomment(1)<CR>
nmap <leader>x :call Docomment(0)<CR>

