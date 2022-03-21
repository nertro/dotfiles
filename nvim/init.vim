lua require('init')

let g:python3_host_prog = '/Users/menajacobs/.config/nvim/.nvim-venv/bin/python'
let g:ruby_host_prog = '/Users/menajacobs/.rbenv/versions/3.1.1/bin/neovim-ruby-host'

let g:db_ui_env_variable_url = 'ENV_VAR_PSQL_URL'

" Set specific title to help vim-kitty-navigator
set title
let &titlestring='%t - nvim'

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

au BufNewFile,BufRead *.py
     \ set tabstop=4 |
     \ set softtabstop=4 |
     \ set shiftwidth=4 |
set autoindent
set smartindent
set smarttab
set breakindent
set expandtab
set shiftwidth=2

set textwidth=80

set splitbelow
set splitright

set hlsearch
set incsearch
set ignorecase
set smartcase

colorscheme bloop
