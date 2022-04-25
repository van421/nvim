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
set re=1
set lazyredraw
set synmaxcol=128
syntax sync minlines=256
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
" 设置 ruby 路径
let g:ruby_host_prog = '/usr/local/lib/ruby/gems/2.7.0/bin/neovim-ruby-host'
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

" 快速查找 visual 模式下选中的字符串
vnoremap // y/<C-r>"<CR>

" 上下移动整行或选中的行
map N ddp
map P ddkkp
" 只能逐行移动，作用不大
"vmap N dp
"vmap P dkkp

" tab 缩进
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

" 引入插件
call plug#begin('~/.config/nvim/plugged')

" 下方显示状态条
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 安装 snazzy 主题
Plug 'connorholyday/vim-snazzy'
" 显示文件树
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" Undo Tree
Plug 'mbbill/undotree/'
" vim-devicons
Plug 'ryanoasis/vim-devicons'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do' : { -> mkdp#util#install() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on' : 'TableModeToggle' }
Plug 'mzlogin/vim-markdown-toc'
Plug 'godlygeek/tabular'
"Plug 'preservim/vim-markdown'
"Plug 'vimwiki/vimwiki'
" leetcode
Plug 'ianding1/leetcode.vim'
" rnvimr
Plug 'kevinhwang91/rnvimr'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" wild-fire
Plug 'gcmt/wildfire.vim'
" vim-surround
Plug 'tpope/vim-surround'
" visincr
Plug 'JikkuJose/vim-visincr'
" 前端开发相关
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" 切换输入法
Plug 'ybian/smartim'
" 嵌套括号高亮
Plug 'luochen1990/rainbow'
" 运行代码片段
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
" 打印变量
Plug 'meain/vim-printer'

call plug#end()

" ===
" === tabular
" ===
if exists(":Tabularize")
  nmap <LEADER>a= :Tabularize /=<CR>
  vmap <LEADER>a= :Tabularize /=<CR>
  nmap <LEADER>a: :Tabularize /:\zs<CR>
  vmap <LEADER>a: :Tabularize /:\zs<CR>
endif

" ===
" === smartim
" ===
let g:smartim_default = "com.apple.keylayout.ABC"

" ===
" === visual-multi
" ===
let g:VM_maps                       = {}
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'k'
let g:VM_show_warnings              = 0

" ===
" === vimwiki (delete for temporary)
" ===
let g:vimwiki_list = [{
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '~/.config/nvim/vimwiki/wiki_html',
  \ 'path': '~/Library/Mobile Documents/com\~apple\~CloudDocs/Notes/vimwiki',
  \ 'template_path': '~/.config/nvim/vimwiki/template/',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'template_default':'markdown',
  \ 'custom_wiki2html': '~/.config/nvim/vimwiki/wiki2html.sh',
  \ 'template_ext':'.html'
\}]

" ===
" === airline
" ===
let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme                             = 'simple'

" ===
" === coc.nvim
" ===
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-vimlsp',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-actions',
  \ 'coc-diagnostic',
  \ 'coc-prettier',
  \ 'coc-syntax',
  \ 'coc-yaml',
  \ 'coc-snippets',
  \ 'coc-translator',
  \ 'coc-marketplace',
  \ 'coc-markdownlint',
  \ 'coc-pairs',
  \ 'coc-highlight',
  \ 'coc-tabnine']
" 让 coc 在 neovim 启动后 500ms 再启动
let g:coc_start_at_startup=0
function! CocTimerStart(timer)
    exec "CocStart"
endfunction
call timer_start(500,'CocTimerStart',{'repeat':1})
"解决coc.nvim大文件卡死状况
let g:trigger_size = 0.5 * 1048576

augroup hugefile
  autocmd!
  autocmd BufReadPre *
        \ let size = getfsize(expand('<afile>')) |
        \ if (size > g:trigger_size) || (size == -2) |
        \   echohl WarningMsg | echomsg 'WARNING: altering options for this huge file!' | echohl None |
        \   exec 'CocDisable' |
        \ else |
        \   exec 'CocEnable' |
        \ endif |
        \ unlet size
augroup END
" 使用 tab 选择补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 触发 coc 补全
inoremap <silent><expr> <c-space> coc#refresh()
" 使用 enter 选中补全
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `<space>-` and `<space>+` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>+ <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use <space>h to show documentation in preview window.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor. not worked
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

function! s:cocActionOpenFromSeleted(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' .visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionOpenFromSeleted<CR>g@
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" coc translator
nnoremap <LEADER>t :CocCommand translator.popup<CR>
" snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<C-n>'
let g:coc_snippet_prev = '<C-p>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'liufan'

" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable   = 1
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

" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === leetcode
" ===
let g:leetcode_browser           = "chrome"
let g:leetcode_china             = 1
let g:leetcode_solution_filetype = "javascript"
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen       = 0
noremap U :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen       = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators    = 1
let g:undotree_WindowLayout       = 2
let g:undotree_DiffpanelHeight    = 8
let g:undotree_SplitWidth         = 24
function g:Undotree_CustomMap()
  nmap <buffer> n <plug>UndotreeNextState
  nmap <buffer> p <plug>UndotreePreviousState
  nmap <buffer> N 5<plug>UndotreeNextState
  nmap <buffer> P 5<plug>UndotreePreviousState
endfunc

" ===
" === markdown-preview
" ===
"function! g:OpenNewWindow(url)
    "silent exe 'silent !open -na "Google Chrome" ' . a:url
"endfunction
"let g:mkdp_browserfunc = 'g:OpenNewWindow'
let g:mkdp_browser = 'Google Chrome'
"let g:mkdp_path_to_chrome = "open -a Google Chrome"
let g:mkdp_echo_preview_url = 1
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
autocmd Filetype markdown inoremap <buffer> <silent> ,k <kbd></kbd><++><Esc>F/hi
autocmd Filetype markdown inoremap <buffer> <silent> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> <silent> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> <silent> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,t <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
autocmd Filetype markdown inoremap <buffer> <silent> ,d <C-R>=strftime("%Y-%m-%d")<CR>
autocmd Filetype markdown inoremap <buffer> <silent> ,w <C-R>=strftime("%Y-week%V")<CR>

" 插入模式下移动光标
inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>0i
inoremap <C-f> <Esc>la
inoremap <C-b> <Esc>ha
inoremap <C-p> <Esc>ka
inoremap <C-n> <Esc>ja
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i

" ===
" === fzf
" ===
noremap <C-s> :FZF<CR>
noremap <C-f> :Ag<CR>

" ===
" === snazzy
" ===
let g:SnazzyTransparent = 1
colorscheme snazzy

" ===
" === NERDTree
" ===
map ff :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl      = ""
let NERDTreeMapUpdir         = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit     = ""
let NERDTreeOpenVSplit       = ""
let NERDTreeMapActivateNode  = "i"
let NERDTreeMapOpenInTab     = "o"
let NERDTreeMapPreview       = ""
let NERDTreeMapCloseDir      = "n"
let NERDTreeMapChangeRoot    = "y"

" ==
" == NERDTree-git
" ==
let g:NERDTreeGitStatusUseNerdFonts       = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
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

" ==
" == rainbow
" ==
let g:rainbow_active = 1
let g:rainbow_conf   = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" ==
" == sniprun
" ==
map <LEADER>r <Plug>SnipRun
map <LEADER>rw ggvG<Plug>SnipRun
map <LEADER>rc <Plug>SnipClose

" ==
" == vim-printer
" ==
let g:vim_printer_print_below_keybinding = '<LEADER>p'
let g:vim_printer_print_above_keybinding = '<LEADER>P'

" 设置 ruby 和 perl 语言的支持
let g:ruby_host_prog = "/usr/local/lib/ruby/gems/3.1.0/bin/neovim-ruby-host"
"let g:loaded_perl_provider = 0
