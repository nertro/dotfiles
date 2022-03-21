vim.cmd[[colorscheme bloop]]

local lsp_status = require('lsp-status')
-- completion_customize_lsp_label as used in completion-nvim
-- Optional: customize the kind labels used in identifying the current function.
-- g:completion_customize_lsp_label is a dict mapping from LSP symbol kind
-- to the string you want to display as a label
-- lsp_status.config { kind_labels = vim.g.completion_customize_lsp_label }

-- Register the progress handler
lsp_status.register_progress()
vim.g.tokyonight_style = "night"
require('lualine').setup{
  options = {
    theme = 'tokyonight'
  },
  sections = {
    lualine_a = {'filename'},
    lualine_b = {'FugitiveHead', 'diff'},
    lualine_c = {'diagnostics'},
    lualine_x = { 'lan_server', 'data', "require'lsp-status'.status()" },
    lualine_y = {'buffers'},
    lualine_z = {'location', 'progress'}
  }
}

