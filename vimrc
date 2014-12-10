set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nu
set autoindent
set cindent
autocmd FileType lemon set nocindent noai indentkeys=

filetype plugin indent on " 自动识别文件类型，自动匹配对应的

set wrap

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.swap
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" 打开文件时，按照 viminfo 保存的上次关闭时的光标位置重新设置光标
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set encoding=utf-8
set fileencodings=utf-8,chinese
set fileencoding=utf-8
set termencoding=utf-8
if has("gui_running")
    if has("win32")
        autocmd GUIEnter * simalt ~x
        set guifont=Bitstream_Vera_Sans_Mono:h14:cANSI
    else
        set guifont=Bitstream_Vera_Sans_Mono:h14:cANSI
    endif
endif

if has("gui_running")
    colorscheme desert "or koehler
else
    "colorscheme evening
    colorscheme morning
endif
"evening " 设定背景为夜间模式
filetype plugin indent on " 自动识别文件类型，自动匹配对应的
"" “文件类型Plugin.vim”文件，使用缩进定义文件
set ambiwidth=double " ambiwidth 默认值为 single。在其值为 single 时，
" 若 encoding 为 utf-8，gvim 显示全角符号时就会
" " 出问题，会当作半角显示。
set autochdir " 自动切换当前目录为当前文件所在的目录
set autoindent cindent cinoptions=g0
" " 打开自动缩进和 C 语言风格的缩进模式，
" " 定制 C 语言缩进风格
set backspace=indent,eol,start
" " 不设定的话在插入状态无法用退格键和 Delete
" " 键删除回车符
set backupcopy=yes " 设置备份时的行为为覆盖
"
if v:version >= 700
"set completeopt=menu,longest,preview
"     " 自动补全(ctrl-p)时的一些选项：
"     " 多于一项时显示菜单，最长选择，
"     " 显示当前选择的额外信息
endif
"
set fileformat=unix " unix|dos|mac
set confirm " 用确认对话框（对于 gvim）或命令行选项（对于
"     " vim）来代替有未保存内容时的警告信息
set display=lastline "
"     长行不能完全显示时显示当前屏幕能显示的部分。
"     " 默认值为空，长行不能完全显示时显示 @。
set expandtab " 将 tab 键转换为空格
set formatoptions=tcqro " 使得注释换行时自动加上前导的空格和星号
set hidden " 允许在有未保存的修改时切换缓冲区，
"     " 此时的修改由切换由 vim 负责保存
set history=500 " 设置冒号命令和搜索命令的命令历史列表的长度为
"     50
set hlsearch " 搜索时高亮显示被找到的文本
set ignorecase smartcase "
"     搜索时忽略大小写，但在有一个或以上大写字母时
"     " 仍保持对大小写敏感
set incsearch " 输入搜索内容时就显示搜索结果
set mouse=a " 设定在任何模式下鼠标都可用
set nobackup " 覆盖文件时不备份
set nocompatible " 设定 gvim 运行在增强模式下
set noignorecase " 默认区分大小写
set nolinebreak " 在单词中间断行
set number " 显示行号
set ruler " 打开状态栏标尺
set scrolloff=5 " 设定光标离窗口上下边界 5 行时窗口自动滚动
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set showcmd " 在状态栏显示目前所执行的指令，未完成的指令片段亦
"     " 会显示出来
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
"     " （不足 4 个时删掉所有剩下的空格）
set tabstop=4 " 设定 tab 长度为 4
set whichwrap=b,s,<,>,[,] "
"     设定退格键、空格键以及左右方向键在行首行尾时的
"     " 行为，不影响 h 和 l 键
"set nowrap " 自动换行显示
syntax on " 自动语法高亮
"
"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置命令行和状态栏
"
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=%F%m%r\ \|\ %Y,%{&fileencoding}\ \|%=\ %l/%L,%c\ \|\%f
" " 设置在状态行显示的信息如下：
" " %f 当前的文件名
" " %F 当前全路径文件名
" " %m 当前文件修改状态
" " %r 当前文件是否只读
" " %Y 当前文件类型
" " %{&fileformat}
" " 当前文件编码
" " %{&fileencoding}
" " 中文编码
" " %b 当前光标处字符的 ASCII 码值
" " %B 当前光标处字符的十六进制值
" " %l 当前光标行号
" " %c 当前光标列号
" " %V 当前光标虚拟列号 (根据字符所占字节数计算)
" " %p 当前行占总行数的百分比
" " %% 百分号
" " %L 当前文件总行数
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" " 自动命令
"
" " 读文件时自动设定当前目录为刚读入文件所在的目录
autocmd BufReadPost * cd %:p:h

" cscope
if has("cscope")
    set csprg=/usr/bin/cscope
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

"
""auto-close proview
"autocmd CursorMovedI * if pumvisible() ==
"0|pclose|endif
""autocmd InsertLeave * if pumvisible() ==0|pclose|endif

"temp"
"
" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
"
" " set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" "Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" "Plugin 'L9'
" " Git plugin not hosted on GitHub
" "Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" "Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" "Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList          - list configured plugins
" " :PluginInstall(!)    - install (update) plugins
" " :PluginSearch(!) foo - search (or refresh cache first) for foo
" " :PluginClean(!)      - confirm (or auto-approve) removal of unused
"plugins
" "
"

" 自动补全配置
"set completeopt=longest,menu
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :
"\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" :
"\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1   " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2   "
"从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0    " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1  " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> 
"force recomile with
"syntastic
"nnoremap <leader>lo :lopen<CR>   "open locationlist
"nnoremap <leader>lc :lclose<CR>  "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"跳转到定义处
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nmap <F4> :YcmDiags<CR>
