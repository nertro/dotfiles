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

-- old init vim content
-- use https://icyphox.sh/blog/nvim-lua/ for vim to lua reference
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

vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.showmode = false

cmd([[
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
     ]])

vim.bo.autoindent = true
vim.bo.smartindent = true
vim.opt.smarttab = true
vim.wo.breakindent = true
vim.bo.expandtab = true
vim.bo.shiftwidth=2

vim.bo.textwidth=80

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
