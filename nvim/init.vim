"
"    __  __  __   __  _   _  __     __  ___   __  __
"   |  \/  | \ \ / / | \ | | \ \   / / |_ _| |  \/  |
"   | |\/| |  \ V /  |  \| |  \ \ / /   | |  | |\/| |
"   | |  | |   | |   | |\  |   \ V /    | |  | |  | |
"   |_|  |_|   |_|   |_| \_|    \_/    |___| |_|  |_|
"
"基本配置
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set t_Co=256
" 设置自动加载和保存代码折叠
set foldmethod=manual
" au BufWinLeave * silent mkview
" 设置光标下方总有多余的五行
set scrolloff=5
" 设置leader键为空格
let mapleader=" "
"设置代码高亮
syntax on
"显示行尾空格
set list
"行尾是tab显示►，是空格显示▫
set listchars=tab:►\ ,trail:▫
" 设置tab键的空格数
set tabstop=4
" 显示行号
set nu
" 显示特殊形式行号
set relativenumber
"突出显示当前行
set cursorline
"让字不会超出屏幕显示
set wrap
"让命令可以补全
set wildmenu
"显示输入的命令
set showcmd
"设置使用backspace键可以回退到上一行
set backspace=indent,eol,start
"设置编码格式
"let &termencoding=&encoding
"set fileencodings=utf-8
set encoding=utf-8
set langmenu=zh_CN.UTF-8
"设置搜索高亮
set hlsearch
"搜索字符串时忽略大小写
set ignorecase
"开启新行时使用智能缩进
set smartcase
"使得退格键可以一次删除4个空格
set softtabstop=4
"设定左右移动时的宽度为4
set shiftwidth=4
"自动切换当前目录为当前文件所在目录
set autoindent
"设置i使用c/c++语言的自动缩进方式
set cindent
"设置c/c++语言的自动缩进方式（win风格）
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s)}
" 让每次进入vim时回到上一次退出的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"打开状态栏标尺
set ruler
" 拼写检查
map sp :set spell!<CR>
"设置左分屏和下分屏
map sj :set nosplitright<CR>:vsplit<CR>
map si :set splitbelow<CR>:split<CR>
" 设置调整分屏宽度
map <up> :res+5 <CR>
map <down> :res-5 <CR>
map <left> :vertical resize-5 <CR>
map <right> :vertical resize+5 <CR>
" 设置输文件树
map <C-t> :NERDTreeToggle<CR>
" 设置新标签和切换标签
map tu :tabe<CR>
map tj :-tabnext<CR>
map tl :+tabnext<CR>
"加载折叠
map zz :loadview<CR>
" 更改方向键
noremap j h
noremap k j
noremap i k
noremap h i
noremap H I
"设置按下空格加回车取消搜索结果高亮
noremap <LEADER><CR> :nohlsearch<CR>
"设置按ctrl+s保存
map <C-s> :w<CR>
"设置按ctrl+q退出
map <C-q> :q<CR>
"设置按ctrl+p预览md文件效果
map <C-p> :MarkdownPreview<CR>
"设置按下;等同按下:
map ; :
"设置按大写T打开控制台
map T :terminal<CR>h
"打开函数列表
map fl :TagbarToggle<CR><C-w><C-w>
"设置编译快捷键
map <f5> :make<CR>

"共享剪切板
set clipboard+=unnamedplus

" 设置加载插件
call plug#begin('~/.config/nvim/plugged')
" 显示文件树插件
Plug 'preservim/nerdtree'
" vim的一种配色方案
Plug 'connorholyday/vim-snazzy'
" 自动配对插件
Plug 'jiangmiao/auto-pairs'
" vim的状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 书写markdown插件
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
" markdown书写表格插件
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'
" 代码报错插件
Plug 'w0rp/ale'
" 代码补全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 代码片段
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'

call plug#end()

"=============
"=====vim-airline
"=============

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='violet'
let g:airline_powerline_fonts=1
let g:airlineextensions#tabline#enabled=1
nmap <tab> :bn<CR>
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
"let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

"=============
"=====vim-snazzy
"=============

let g:SnazzyTransparent=1
color snazzy

"=============
"=====vim-table-mode
"=============

let g:table_mode_corner='|'

"=============
"=====coc.nvim
"=============

let g:coc_global_extensions = [
    \'coc-json',
    \'coc-vimlsp',
    \'coc-python',
    \'coc-markdownlint',
    \'coc-clangd',
    \'coc-snippets',
    \'coc-sh',
    \'coc-html',
    \'coc-css']
" TextEdit might fail if hidden is not set
set hidden
set updatetime=100
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-o> coc#refresh()
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>#
