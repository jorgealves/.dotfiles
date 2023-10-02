local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazyvim = require('lazy')

lazyvim.setup({
  -- Colorscheme
  {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },

  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
  },

  -- Language Support
  -- Added this plugin.
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },           -- Required
      { 'williamboman/mason.nvim' },         -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },       -- Required
      { 'hrsh7th/cmp-nvim-lsp' },   -- Required
      { 'hrsh7th/cmp-buffer' },     -- Optional
      { 'hrsh7th/cmp-path' },       -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },   -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },           -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  },

  {
    {'mfussenegger/nvim-dap'},
    {'LiadOz/nvim-dap-repl-highlights'},
    {'nvim-telescope/telescope-dap.nvim'},
    {'theHamsta/nvim-dap-virtual-text'},
    {'rcarriga/nvim-dap-ui'},
    {'mfussenegger/nvim-dap-python'},
  },

  -- Nvimtree (File Explorer)
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   lazy = true,
  --   dependencies = {
  --       'nvim-tree/nvim-web-devicons',
  --   },
  -- },

  -- Telescope (Fuzzy Finder)
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    }
  },


  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
  },

  -- Which-key
  {
    'folke/which-key.nvim',
    lazy = true,
  },

})
