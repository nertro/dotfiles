--# See lan server mappings in lan_server_setup.lua
local opts = { noremap=true, silent=true }
-- require('gitsigns').setup{
--   ...
--   on_attach = function(bufnr)
--     local gs = package.loaded.gitsigns

--     local function map(mode, l, r, gs_opts)
--       gs_opts = gs_opts or {}
--       gs_opts.buffer = bufnr
--       vim.keymap.set(mode, l, r, gs_opts)
--     end
-- -- Navigation
--     map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
--     map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

--     -- Actions
--     map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
--     map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
--     map('n', '<leader>hS', gs.stage_buffer)
--     map('n', '<leader>hu', gs.undo_stage_hunk)
--     map('n', '<leader>hR', gs.reset_buffer)
--     map('n', '<leader>hp', gs.preview_hunk)
--     map('n', '<leader>hb', function() gs.blame_line{full=true} end)
--     map('n', '<leader>tb', gs.toggle_current_line_blame)
--     map('n', '<leader>hd', gs.diffthis)
--     map('n', '<leader>hD', function() gs.diffthis('~') end)
--     map('n', '<leader>td', gs.toggle_deleted)

--     -- Text object
--     map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
--   end
-- }
--# Personal Mappings
-- Keys
vim.g.mapleader = " "
vim.g.maplocalleader = ';'
vim.api.nvim_set_keymap( 'i', 'jf', '<Esc>', opts)
vim.api.nvim_set_keymap( 't', 'jf', '<C-\\><C-n>', opts)
vim.api.nvim_set_keymap( 'n', 'j', 'gj', opts)
vim.api.nvim_set_keymap( 'n', 'k', 'gk', opts)
vim.api.nvim_set_keymap( 'v', '<', '<gv', opts)
vim.api.nvim_set_keymap( 'v', '>', '>gV', opts)
vim.api.nvim_set_keymap( 'v', 'j', 'gj', opts)
vim.api.nvim_set_keymap( 'v', 'k', 'gk', opts)
-- window navigation
vim.api.nvim_set_keymap( 'n', 'vv', '<C-w>v', opts)
vim.api.nvim_set_keymap( 'n', 'ss', '<C-w>s', opts)
vim.api.nvim_set_keymap( 'n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap( 'n', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap( 'n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap( 'n', '<C-l>', '<C-w>l', opts)
-- M.project_fr = function (source, target)
--   vim.api.nvim_call_function("Ag", {source})
--   vim.cmd([[
--     terminal A-a
--     <CR>
--   ]])
--   vim.cmd("cfdo! %s/" .. source .. "/" .. target .. "/g")
-- end
-- Commands
vim.api.nvim_set_keymap('n', '<leader>;', '<cmd>botright 70vsp term://zsh<CR>ia', opts)
vim.api.nvim_set_keymap( 'n', '<leader>q', '<cmd>q<CR>', opts)
vim.api.nvim_set_keymap( 'n', '<C-s>', '<cmd>w<CR>', opts)
vim.api.nvim_set_keymap( 'i', '<C-s>', '<Esc><cmd>w<CR>i', opts)
-- Telescope
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fgr', '<cmd>lua require("telescope").extensions.live_grep_raw.live_grep_raw()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>Telescope find_files<CR>', opts)
-- dadbod
vim.api.nvim_set_keymap('n', '<leader>du', '<cmd>DBUIToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>df', '<cmd>DBUIFindBuffer<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>DBUIRenameBuffer<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>DBUILastQueryInfo<CR>', opts)
-- git 
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>G<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gv', '<cmd>GV<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gp', '<cmd>G push<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gpl', '<cmd>G pull<CR>', opts)
--
--#endregion
