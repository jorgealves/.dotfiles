local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- My plugins here
	use {
    "wbthomason/packer.nvim",
    requires = {
	    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	    "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
    }
  } -- Have packer manage itself


  -- Editor utilities
	use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "akinsho/bufferline.nvim",
      "nvim-lualine/lualine.nvim",
      "numToStr/Comment.nvim", -- Easily comment stuff
      "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
      "yamatsum/nvim-cursorline",
      "folke/which-key.nvim",
      "akinsho/toggleterm.nvim",
      "lewis6991/gitsigns.nvim",
	    'editorconfig/editorconfig-vim',
	    'Pocco81/AutoSave.nvim',
      'j-hui/fidget.nvim',
    }
  }

  -- GO
  use {'fatih/vim-go'}
	-- Colorschemes
	use("lunarvim/colorschemes") -- A bunch of colorschemes you can try out
	use("lunarvim/darkplus.nvim")
	use("sainnhe/gruvbox-material") -- theme
	use({ "dracula/vim", as = "dracula" })
  use('EdenEast/nightfox.nvim')

	-- cmp plugins
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'octaltree/cmp-look',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'f3fora/cmp-spell',
      'hrsh7th/cmp-emoji',
      {'tzachar/cmp-tabnine', run = './install.sh'},
      'hrsh7th/cmp-cmdline',
      "hrsh7th/lspkind-nvim",
    }
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      "williamboman/nvim-lsp-installer" ,
      "folke/lsp-colors.nvim",
      'tamago324/nlsp-settings.nvim',
      "glepnir/lspsaga.nvim",
	    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    }
  }

	-- Telescope
	use "nvim-telescope/telescope.nvim"
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use 'nvim-telescope/telescope-dap.nvim'

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use "JoosepAlviste/nvim-ts-context-commentstring"

	-- DAP
	use {
    'mfussenegger/nvim-dap',
    requires = {
      'Pocco81/DAPInstall.nvim',
      "rcarriga/nvim-dap-ui",
      'nvim-telescope/telescope-dap.nvim',
      'theHamsta/nvim-dap-virtual-text',
      'mfussenegger/nvim-dap-python',
      'leoluz/nvim-dap-go',
    }
  }
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
