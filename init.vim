" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===
" === All vim config
" ===

" 将 leader 键映射到空格键上
let mapleader = " " " 终端特殊字符显示
let &t_ut=''
" 打开语法高亮 
syntax on
" 显示行号及相对行号
set number
set relativenumber
" 光标所在行显示下划线
set cursorline
" 自动换行
set wrap
" 状态栏显示当前执行的命令
set showcmd
" 自动补全命令时候使用菜单式匹配列表
set wildmenu
" 高亮搜索结果 
set hlsearch
" 重新打开文件时删除所有高亮搜索结果
exec "nohlsearch"
" 实时高亮搜索结果
set incsearch
" 忽略大小写搜索
set ignorecase
" 智能大小写搜索，即全小写情况下忽略大小写，大小写都有的话则精确搜索
set smartcase
" 空格+回车删除所有高亮搜索结果
noremap <LEADER><CR> :nohlsearch<CR>
" 自动读取文件被外部修改的内容
set autoread
" 允许使用鼠标定位
" set mouse=a
" 取消VI兼容
set nocompatible
" 打开文件类型检测功能
filetype on
" 不同文件类型采用不同缩进
filetype indent on
" 允许使用插件
filetype plugin on
filetype plugin indent on
" 设定编码
set enc=utf-8
" tab 操作
set expandtab
set tabstop=2
" 统一缩进为4
set softtabstop=2
set shiftwidth=2
" 显示行尾空格
set list
set listchars=tab:▸\ ,trail:▫
" 光标移动到buffer的顶部和底部时保持5行距离
set scrolloff=5
" 缩进相关
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
" 设置光标在不同模式下显示不同状态
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" 总是显示状态行
set laststatus=2
" 设置上下 5 行的距离
set scrolloff=5
" 在当前目录下执行命令
set autochdir
" 启用 fzf
set rtp+=/usr/local/opt/fzf
" 重新进入 vim 文件时光标放在上一次的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 查找时快速定位匹配项
noremap = nzz
noremap - Nzz

" 保存、退出、刷新配置快捷键设置
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

" 快速定位行
map J 5j
map K 5k

" 分屏操作
map <LEADER>h :set nosplitright<CR>:vsplit<CR>:e 
map <LEADER>l :set splitright<CR>:vsplit<CR>:e 
map <LEADER>j :set splitbelow<CR>:split<CR>:e 
map <LEADER>k :set nosplitbelow<CR>:split<CR>:e 
map fh <C-w>h
map fl <C-w>l
map fj <C-w>j
map fk <C-w>k
" 修改分屏方式
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" 窗口对比
map <LEADER>di :windo difft<CR>
map <LEADER>df :vert diffsplit 

" tab 相关操作
map ta :tabe<CR>
map tn :+tabnext<CR>
map tp :-tabnext<CR>

" 针对在上面的窗口以及在左边的窗口是正向的
map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" buffer 相关操作
map <LEADER>bn :bn<CR>
map <LEADER>bd :bd<CR>
map <LEADER>bl :buffers<CR>

" open lazygit
map <C-g> :tabe<CR>:ter lazygit<CR><C-w>w:q<CR>

" 查找重复单词
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" 打开或关闭拼写检查
map <LEADER>sp :set spell!<CR>
" 引入插件
call plug#begin('~/.vim/plugged')

" 下方显示状态条
Plug 'vim-airline/vim-airline'
" 安装 snazzy 主题
Plug 'connorholyday/vim-snazzy'
" 显示文件树
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" 语法检查
Plug 'w0rp/ale'
" Undo Tree
Plug 'mbbill/undotree/'
" vim-devicons
Plug 'ryanoasis/vim-devicons'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim', { 'do' : { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on' : 'TableModeToggle' }
Plug 'mzlogin/vim-markdown-toc'
Plug 'vimwiki/vimwiki'
" leetcode
Plug 'ianding1/leetcode.vim'
" rnvimr
Plug 'kevinhwang91/rnvimr'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ===
" === coc.nvim
" ===
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-tsserver']

" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> <LEADER>ra :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

" vim-table-mode
map <LEADER>tm :TableModeToggle<CR>

" leetcode
let g:leetcode_browser = "chrome"
let g:leetcode_china = 1
let g:leetcode_solution_filetype = "javascript"
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> n <plug>UndotreeNextState
	nmap <buffer> p <plug>UndotreePreviousState
	nmap <buffer> N 5<plug>UndotreeNextState
	nmap <buffer> P 5<plug>UndotreePreviousState
endfunc

" markdown
let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
" let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
autocmd Filetype markdown map mp :MarkdownPreview<CR>
autocmd Filetype markdown map mps :MarkdownPreviewStop<CR>
autocmd Filetype markdown inoremap <buffer> <silent> ,, <++>
autocmd Filetype markdown inoremap <buffer> <silent> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap <buffer> <silent> ,- ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> <silent> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> <silent> ,x ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> <silent> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> <silent> ,q `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> <silent> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> <silent> ,g - [ ] <Enter><++><ESC>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,u <u></u><++><Esc>F/hi
autocmd Filetype markdown inoremap <buffer> <silent> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> <silent> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> <silent> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,t <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
inoremap <buffer> <silent> <C-e> <Esc>$a
inoremap <buffer> <silent> <C-a> <Esc>0i
inoremap <buffer> <silent> <C-f> <Esc>la
inoremap <buffer> <silent> <C-b> <Esc>ha

" fzf plug
noremap <C-s> :FZF<CR>
noremap <C-f> :Ag<CR>

" snazzy 配置
let g:SnazzyTransparent = 1
colorscheme snazzy

" ===
" === NERDTree
" ===
map ff :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" ==
" == NERDTree-git
" ==
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map U :UndotreeToggle<CR>
