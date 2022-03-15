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
-- window navigation mapping for knubie/vim-kitty-navigator
-- set it up manually because the default is not working

vim.g.kitty_navigator_no_mappings = 1
vim.api.nvim_set_keymap( 'n', '<C-h>', '<cmd>KittyNavigateLeft<CR>', opts)
vim.api.nvim_set_keymap( 'n', '<C-j>', '<cmd>KittyNavigateDown<CR>', opts)
vim.api.nvim_set_keymap( 'n', '<C-k>', '<cmd>KittyNavigateUp<CR>', opts)
vim.api.nvim_set_keymap( 'n', '<C-l>', '<cmd>KittyNavigateRight<CR>', opts)
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
-- Telekasten
vim.api.nvim_set_keymap('n', '<leader>zf', '<cmd>lua require("telekasten").find_notes()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zF', '<cmd>lua require("telekasten").find_friends()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zb', '<cmd>lua require("telekasten").show_backlinks()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zg', '<cmd>lua require("telekasten").search_notes()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zlf', '<cmd>lua require("telekasten").follow_link()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zli', '<cmd>lua require("telekasten").insert_link()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zT', '<cmd>lua require("telekasten").goto_today()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zW', '<cmd>lua require("telekasten").goto_thisweek()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zw', '<cmd>lua require("telekasten").find_weekly_notes()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zn', '<cmd>lua require("telekasten").new_note()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zN', '<cmd>lua require("telekasten").new_templated_note()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zy', '<cmd>lua require("telekasten").yank_notelink()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zc', '<cmd>lua require("telekasten").show_calendar()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zC', '<cmd>CalendarT<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zi', '<cmd>lua require("telekasten").paste_img_and_link()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zt', '<cmd>lua require("telekasten").toggle_todo()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zI', '<cmd>lua require("telekasten").insert_img_link', opts)
vim.api.nvim_set_keymap('n', '<leader>zp', '<cmd>lua require("telekasten").preview_img()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zm', '<cmd>lua require("telekasten").browse_media()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>z3', '<cmd>lua require("telekasten").show_tags()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>zr', '<cmd>lua require("telekasten").rename_note()<CR>', opts)

-- " on hesitation, bring up the panel
-- vim.api.nvim_set_keymap('n', '<leader>z', '<cmd>Telekasten panel<CR>', opts)

-- " we could define [[ in **insert mode** to call insert link
-- " inoremap [[ <cmd>:lua require('telekasten').insert_link()<CR>
-- " alternatively: leader [
-- inoremap <leader>[ <cmd>:lua require('telekasten').insert_link(opts)<CR>
-- inoremap <leader>zt <cmd>:lua require('telekasten').toggle_todo(opts)<CR>
-- inoremap # <cmd>lua require('telekasten').show_tags(opts)<cr>
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
