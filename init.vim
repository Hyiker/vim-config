" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
Plug 'glepnir/lspsaga.nvim'

Plug 'luochen1990/rainbow'

Plug 'mhartington/formatter.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'jiangmiao/auto-pairs'

Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/indentLine'

Plug 'morhetz/gruvbox'

Plug 'preservim/nerdcommenter'

Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'sainnhe/sonokai'

Plug 'wakatime/vim-wakatime'

Plug 'ludovicchabant/vim-gutentags'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

lua require("global")


set relativenumber " 设置显示相对行号
set number " 设置显示行号
set expandtab " 设置TAB使用空格
set tabstop=2 " 设置TAB缩进的空格数量
set shiftwidth=2 " 自动缩进的宽度
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 " 解决中文乱码
set termencoding=utf-8
set encoding=utf-8
set shortmess+=c

syntax on

let g:rainbow_active = 1

" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 自适应不同语言的智能缩进
filetype indent on

let g:completion_enable_snippet = 'snippets.nvim'
let g:airline_theme = 'gruvbox' " 设置airline使用的主题
let g:airline_powerline_fonts = 1 " 使airline正常显示箭头

" 设置 neovim 或者 vim 的 tabline
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1


"
"*****************   gutentags   *************************************
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project'] " gutentags 搜索工程目录的标志, 当前文件路径向上递归直到碰到这些文件 / 目录名
let g:gutentags_ctags_tagfile = '.tags' " 所生成的数据文件的名称
let g:gutentags_modules = [] " 同时开启 ctags 和 gtags 支持:
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

let g:gutentags_cache_dir = expand('~/.cache/tags') " 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中
" 配置 ctags 的参数, 老的 Exuberant-ctags 不能有 --extra=+q, 注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags'] " 如果使用 universal ctags 需要增加下面一行, 老的 Exuberant-ctags 不能加下一行
let g:gutentags_auto_add_gtags_cscope = 0 " 禁用 gutentags 自动加载 gtags 数据库的行为

colorscheme gruvbox

if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

command! WQ wq
command! Wq wq
command! W w
command! Q q
