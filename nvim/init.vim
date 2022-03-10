" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Use relese branch (recommend)
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'junegunn/gv.vim'
call plug#end()

" Load plugins here
lua require('init')

let g:python3_host_prog = '/Users/menajacobs/.config/nvim/.nvim-venv/bin/python'
let g:ruby_host_prog = '/Users/menajacobs/.rbenv/versions/3.1.1/bin/neovim-ruby-host'

let g:db_ui_env_variable_url = 'ENV_VAR_PSQL_URL'

filetype plugin indent on

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"

let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

syntax on
set termguicolors

set fileformat=unix
set encoding=UTF-8

set cursorline
set number
set relativenumber
set scrolloff=5
set noshowmode

" au BufNewFile,BufRead *.py

"     \ set tabstop=4 |

"     \ set softtabstop=4 |

"     \ set shiftwidth=4 |
set autoindent
set smartindent
set smarttab
set breakindent
set expandtab

set textwidth=80

set splitbelow
set splitright

set hlsearch
set incsearch
set ignorecase
set smartcase

