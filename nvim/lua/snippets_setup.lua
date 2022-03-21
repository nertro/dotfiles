local opts = { noremap=true, silent=true }
vim.g.UltisnipsEditSplit = 'horizontal'
vim.g.ultisnips_python_style = 'google'
vim.api.nvim_set_keymap('n', '<space>es', '<cmd>UltiSnipsEdit<CR>', opts)
vim.g.UltiSnipsJumpForwardTrigger = '<C-l>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-h>'
