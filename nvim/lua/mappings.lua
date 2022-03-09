--#region Lan Server Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
-- end
-- Mappings used in lan_server_setup
--
-- ['<C-p>'] = cmp.mapping.select_prev_item(),
-- ['<C-n>'] = cmp.mapping.select_next_item(),
-- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
-- ['<C-f>'] = cmp.mapping.scroll_docs(4),
-- ['<C-Space>'] = cmp.mapping.complete(),
-- ['<C-e>'] = cmp.mapping.close(),
-- ['<CR>'] = cmp.mapping.confirm {
--   behavior = cmp.ConfirmBehavior.Replace,
--   select = true,
-- },
-- ['<Tab>'] = function(fallback)
--   if cmp.visible() then
--     cmp.select_next_item()
--   elseif luasnip.expand_or_jumpable() then
--     luasnip.expand_or_jump()
--   else
--     fallback()
--   end
-- end,
-- ['<S-Tab>'] = function(fallback)
--#endregion
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
vim.api.nvim_set_keymap( 'i', 'jj', '<Esc>', opts)
vim.api.nvim_set_keymap( 't', 'jj', '<C-\\><C-n>', opts)
vim.api.nvim_set_keymap( 'n', 'L', '$', opts)
vim.api.nvim_set_keymap( 'n', 'H', '$', opts)
vim.api.nvim_set_keymap( 'n', 'gj', 'j', opts)
vim.api.nvim_set_keymap( 'n', 'gk', 'k', opts)
vim.api.nvim_set_keymap( 'v', '<gv', '<', opts)
vim.api.nvim_set_keymap( 'v', '>gv', '>', opts)
vim.api.nvim_set_keymap( 'v', 'gj', 'j', opts)
vim.api.nvim_set_keymap( 'v', 'gk', 'k', opts)
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
vim.api.nvim_set_keymap('n', 'B', '<cmd>Telescope buffers<CR>', opts)
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
