-- This file can be loaded by calling `lua require('plugins')` from your init.vim
vim.cmd([[
augroup updateplugins
  au!
  au BufWritePost $HOME/Projects/dotfiles/nvim/lua/plugins.lua :so % | PackerSync
]])

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- essentials
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-surround'
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use {
	    'nvim-telescope/telescope.nvim',
	      requires = {
		      {'nvim-lua/plenary.nvim'},
		      { 'nvim-telescope/telescope-live-grep-args.nvim' }
	      }
      }
  use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate'
  }
  use 'rcarriga/nvim-notify'
  -- git
  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use 'simnalamburt/vim-mundo'
  -- lsp and syntax
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use 'godlygeek/tabular'
  use 'preservim/vim-markdown'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use 'rmagatti/goto-preview'
  -- autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'kristijanhusak/vim-dadbod-completion'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'windwp/nvim-autopairs'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  -- debugging
  use { 'nvim-telescope/telescope-dap.nvim' }
  use { 'mfussenegger/nvim-dap' }
  use { "rcarriga/nvim-dap-ui" }
  -- use { 'mfussenegger/nvim-dap-python' }
  -- zettelkasten
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'renerocksai/calendar-vim'
  use 'renerocksai/telekasten.nvim'
  use {'edluffy/hologram.nvim'}
  -- focus
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- terminal
  use {'knubie/vim-kitty-navigator', run = 'cp ./*.py ~/.config/kitty/'}
  use 'akinsho/toggleterm.nvim'
  -- editor style
  use'brenoprata10/nvim-highlight-colors'
  use {
    "themaxmarchuk/tailwindcss-colors.nvim",
    -- load only on require("tailwindcss-colors")
    module = "tailwindcss-colors",
    -- run the setup function after plugin is loaded
    config = function ()
      -- pass config options here (or nothing to use defaults)
      require("tailwindcss-colors").setup()
    end
  }
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use 'folke/tokyonight.nvim'
  use 'nvim-lua/lsp-status.nvim'
  use 'nocksock/bloop-vim'
end)
