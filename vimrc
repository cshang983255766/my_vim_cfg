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

  Plugin 'git://github.com/scrooloose/nerdtree.git'

  Plugin 'git://github.com/ctrlpvim/ctrlp.vim.git'
  
  Plugin 'git://github.com/majutsushi/tagbar.git'
  
  Plugin 'git://github.com/rking/ag.vim.git'

  "Plugin 'git://github.com/vim-airline/vim-airline.git'
  "Plugin 'git://github.com/vim-airline/vim-airline-themes.git'
  Plugin 'git://github.com/jlanzarotta/bufexplorer.git'
  Plugin 'git://github.com/jeetsukumaran/vim-buffergator.git'
  Plugin 'git://github.com/bling/vim-bufferline.git'
  Plugin 'git://github.com/Vimjas/vim-python-pep8-indent.git'
  Plugin 'git://github.com/altercation/vim-colors-solarized.git'
  Plugin 'git://github.com/vim-scripts/SuperTab.git'
  Plugin 'Yggdroot/LeaderF'
  "Plugin 'vim-scripts/AutoComplPop'
  "Plugin 'vim-scripts/OmniCppComplete'
  Plugin 'vim-syntastic/syntastic'
  " All of your Plugins must be added before the following line
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

"leaderf
"搜索本文件下的所有函数
nmap ;f :LeaderfFunction<cr>
"当次vim打开的所有文件
nmap ;b :LeaderfBuffer<cr>
"最近打开的文件
nmap ;m :LeaderfMru<cr>

"tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_ctags_bin = '/home/cuishang/bin/ctags' "tagbar以来ctags插件
let g:tagbar_autofocus = 1 "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
let g:tagbar_sort = 0 "设置标签不排序，默认排序
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() "在某些情况下自动打开tagbar

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

"列编辑模式
nmap <leader>v <C-v>

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
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"<Leader>搜索MRU文件
nmap <Leader>e :CtrlPMRUFiles<CR>
""<Leader>h显示缓冲区文件，并可通过序号进行跳转
nmap <Leader>h :CtrlPBuffer<CR>
"工程目录较大时使用这个
nmap <Leader>p :CtrlP getcwd()<cr>
set wildignore+=*.so,*.class,*.swp,*.zip,*.png,*.jpg,*.gif,*.apk,*.dex,*.ap_,*/HTML/*,HTML/*,*.bin,*/bin/*,*.o,*.JPG
"设置搜索时忽略的文件
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
let g:ctrlp_working_path_mode = 'ra'
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
"退出当前文件
nmap ;q :q<cr>
"不保存强制退出当前文件
nmap ;1 :q!<cr>

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"let g:solarized_termcolors=256
syntax enable  "语法高亮
"set background=light
"colorscheme solarized

filetype on                              "检测文件的类型

"取消行号
nmap <leader>h :set nonu<cr>
nmap <leader>g :set nu<cr>
" Custom setting
set nu
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set whichwrap+=<,>,h,l
set splitright

" map tab
"nmap tn :tabn<cr>
"nmap tp :tabp<cr>

"buff中文件跳转
nmap ;u :bp<cr>
nmap ;n :bn<cr>

" set tabstop=4                        "设置tab键为4个空格，
" set ts=4
" set expandtab
" set autoindent

" set showmatch                     "设置匹配模式，类似当输入一个左括号时会匹配相应的右括号     

" 状态栏
set laststatus=2      " 总是显示状态栏
 highlight StatusLine cterm=bold ctermfg=white ctermbg=black
 " 获取当前路径，将$HOME转化为~
 function! CurDir()
         let curdir = substitute(getcwd(), $HOME, "~", "g")
         return curdir
 endfunction
 set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\
						  
" set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
" set ruler "在编辑过程中，在右下角显示光标位置的状态行

" set airline to use powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='cool'
"let g:airline#extensions#tabline#enabled = 1

"set mouse=a "使能鼠标

"设置tags
set tags=~/.vim/systags
set tags=/home/cuishang/P_hisiv811/sourcecode/trunk/Android_V811/.tags
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

