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
	use({
		"wbthomason/packer.nvim",
		requires = {
			"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
			"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
			"lewis6991/impatient.nvim",
			"nathom/filetype.nvim",
			"antoinemadec/FixCursorHold.nvim",
		},
	}) -- Have packer manage itself

	-- UI
	use({
		"kyazdani42/nvim-web-devicons",
		{ "akinsho/bufferline.nvim", tag = "v2.*" },
		"moll/vim-bbye",
		"kyazdani42/nvim-tree.lua",
		"nvim-lualine/lualine.nvim",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		"p00f/nvim-ts-rainbow",
		"windwp/nvim-ts-autotag",
		"JoosepAlviste/nvim-ts-context-commentstring",
	})

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
	})

	-- LSP
	use({
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig",
		"tami5/lspsaga.nvim",
		"simrat39/symbols-outline.nvim",
	})

	-- Format & Lint
	use({
		"jose-elias-alvarez/null-ls.nvim",
	})

	-- Editor utilities
	use({
	  "Pocco81/AutoSave.nvim",
    "lewis6991/gitsigns.nvim",
		"norcalli/nvim-colorizer.lua",
		"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
		"akinsho/toggleterm.nvim",
		"numToStr/Comment.nvim", -- Easily comment stuff
		-- "lukas-reineke/indent-blankline.nvim",
		"folke/which-key.nvim",
		-- "karb94/neoscroll.nvim",
		-- "max397574/better-escape.nvim",
		"yamatsum/nvim-cursorline",
		"editorconfig/editorconfig-vim",
		"j-hui/fidget.nvim",
		-- "github/copilot.vim",
		"rcarriga/nvim-notify",
	})

	-- Colorschemes
	use({
		"lunarvim/colorschemes", -- A bunch of colorschemes you can try out
		"lunarvim/darkplus.nvim",
		"sainnhe/gruvbox-material", -- theme
		{ "dracula/vim", as = "dracula" },
		"EdenEast/nightfox.nvim",
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- use("nvim-telescope/telescope-dap.nvim")

	-- Python
	use({
		"psf/black",
		-- "petobens/poet-v",
		"python-mode/python-mode",
	})
	-- DAP
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"Pocco81/DAPInstall.nvim",
			"rcarriga/nvim-dap-ui",
			"nvim-telescope/telescope-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
			"mfussenegger/nvim-dap-python",
			-- 'leoluz/nvim-dap-go',
		},
	})
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
