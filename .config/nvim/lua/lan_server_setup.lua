---- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"
-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	view = {
		-- entries = 'native'
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-Space>'] = cmp.mapping.confirm(),
		['<Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		-- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- ["<CR>"] = cmp.mapping({
		--   i = function(fallback)
		--     if cmp.visible() and cmp.get_active_entry() then
		--       cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
		--     else
		--       fallback()
		--     end
		--   end,
		--   s = cmp.mapping.confirm({ select = true }),
		--   c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true
		--   }),
		-- }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		{ name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

cmp.setup.filetype('sql', {
	sources = cmp.config.sources({
		{ name = 'vim-dadbod-completion' },
		{ name = 'ultisnips' }, -- For ultisnips users.
	}, {
		{ name = 'buffer' },
	}
	)
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	view = {
		entries = 'window'
	},
	sources = {
		{ name = 'buffer' },
		{ name = 'path' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	view = { entries = 'window' },
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Use autocomplete
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Set up lspconfig.
local lspconfig = require('lspconfig')
lspconfig.util.default_config.capabilities = capabilities
local lsp_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function on_attach(client, buffer)
	-- Enable completion triggered by <c-x><c-o>
	vim.bo[buffer].omnifunc = 'v:lua.vim.lsp.omnifunc'

	-- Buffer local mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local opts = { buffer = buffer }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	vim.keymap.set('n', '<space>f', function()
		vim.lsp.buf.format { async = true }
	end, opts)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = lsp_augroup, buffer = buffer })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = lsp_augroup,
			buffer = buffer,
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end
end

-- Setup different languages
-- rust
lspconfig.rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "rs", "rust" },
	settings = {
		["rust-analyzer"] = {
			inlayHints = {
				bindingModeHints = { enable = true }
			},
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			checkOnSave = {
				command = "clippy",
			},
			procMacro = {
				enable = true
			},
		}
	}
}

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "typescript-language-server", "--stdio", "-V" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
		"typescript.tsx",
		"astro" },
	hostInfo = "neovim",
	singe_file_support = true,
	root_dir = function(fname)
		local root_files = {
			"package.json", "tsconfig.json", "jsconfig.json", ".git"
		}
		return lspconfig.util.root_pattern(unpack(root_files))(fname) or lspconfig.util.find_git_ancestor(fname)
	end,
})
lspconfig.astro.setup({
	on_attach = on_attach,
})
lspconfig.emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "astro", "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte",
		"pug", "typescriptreact", "vue" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	}
})
lspconfig.tailwindcss.setup({
	on_attach = on_attach,
})
lspconfig.lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME
				} -- server aware of Neovim runtime files
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

lspconfig.pylsp.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	--   root_dir = function(fname)
	--   local root_files = {
	--     'pyproject.toml',
	--     'setup.py',
	--     'setup.cfg',
	--   }
	--   return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
	-- end,
	singe_file_support = true,
	cmd = { "/Users/neomena/.config/nvim/.nvim_venv/bin/pylsp" },
	plugins = {
		ruff = { --This plugin will disable pycodestyle, pyflakes, mccabe and pyls_isort by default, unless they are explicitly enabled
			enabled = true,
			extendSelect = { "I" },
		},
		rope = {
			enabled = true
		},
		jedi_completion = {
			enabled = true,
			include_params = true, -- this line enables snippets
			cache_for = { "pandas", "numpy", "tensorflow", "matplotlib", "pandera" }
		}
	}
}
--     }
-- }
-- -- Use LspAttach autocommand to only map the following keys
-- -- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--     -- Buffer local mappings.
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     local opts = { buffer = ev.buf }
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wl', function()
--       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, opts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--     vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--     vim.keymap.set('n', '<space>f', function()
--       vim.lsp.buf.format { async = true }
--     end, opts)
--   end,
-- })


-- If you want insert `(` after select function or method item
require('nvim-autopairs').setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)

require('goto-preview').setup {
	width = 80, -- Width of the floating window
	height = 15, -- Height of the floating window
	border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
	default_mappings = false, -- Bind default mappings
	debug = false, -- Print debug information
	opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
	resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
	post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
	references = { -- Configure the telescope UI for slowing the references cycling window.
		telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
	},
	-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
	focus_on_open = true,                                  -- Focus the floating window when opening it.
	dismiss_on_move = false,                               -- Dismiss the floating window when moving the cursor.
	force_close = true,                                    -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
	bufhidden = "wipe",                                    -- the bufhidden option to set on the floating window. See :h bufhidden
	stack_floating_preview_windows = true,                 -- Whether to nest floating windows
	preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
}

--
