
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- use {
	    -- 'lewis6991/gitsigns.nvim',
	      -- requires = {
		          -- 'nvim-lua/plenary.nvim'
			    -- },
  --       config = function()
		      -- require('gitsigns').setup()
	  -- end
  --   }
  use {
	    'nvim-telescope/telescope.nvim',
	      requires = { 
		      {'nvim-lua/plenary.nvim'},
		      { 'nvim-telescope/telescope-live-grep-raw.nvim' }
	      }
      }
  use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate'
  }
  use 'rcarriga/nvim-notify'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'williamboman/nvim-lsp-installer'
  use 'plasticboy/vim-markdown' -- Markdown
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'kristijanhusak/vim-dadbod-completion'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use 'folke/tokyonight.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'jiangmiao/auto-pairs'
end)

