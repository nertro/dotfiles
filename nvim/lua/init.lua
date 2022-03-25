require('plugins')
require('telescope_config')
require('trouble_setup')
require('telekasten_config')
require('color_themes')
require('lan_server_setup')
require('snippets_setup')
-- require('jupyter_setup')
require('gitsigns_setup')
require('mappings')
require('toggleterm_config')

-- old init vim.opt.tent
-- use https://icyphox.sh/blog/nvim-lua/ for vim.opt.lua reference
local g = vim.g
local cmd = vim.cmd

g.python3_host_prog = '/Users/menajacobs/.config/nvim/.nvim-venv/bin/python'
g.ruby_host_prog = '/Users/menajacobs/.rbenv/versions/3.1.1/bin/neovim-ruby-host'

g.db_ui_env_variable_url = 'env_var_psql_user'

-- Set specific title to help vim-kitty-navigator
vim.opt.title = true
cmd([[
let &titlestring='%t - nvim'
]])

-- enable italics
-- let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
-- let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

cmd('syntax on')
vim.opt.termguicolors = true

vim.opt.fileformat= 'unix'

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.showmode = false

cmd([[
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
     ]])

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2

vim.opt.textwidth=80

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
