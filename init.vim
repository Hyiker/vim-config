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


let g:nvim_tree_side = 'left'
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_auto_open = 1 
let g:nvim_tree_auto_close = 1
let g:nvim_tree_follow = 1

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
