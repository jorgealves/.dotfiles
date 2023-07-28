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

  {
    "folke/tokyonight.nvim",
    lazy=false,
    priority=1000,
    config = function()
      vim.cmd([[ colorscheme tokyonight ]])
    end
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {'nvim-lua/plenary.nvim'},
    opts={},
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        opts={},
      },
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      {
        "mfussenegger/nvim-lint",
        config = function()
          vim.api.nvim_create_autocmd({"BufWritePost"},{
            callback = function()
              require('lint').try_lint()
            end
          })
        end,
      },
      {
        "mhartington/formatter.nvim",
        opts={},
      },
    },
    opts={},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },
  { "folke/neodev.nvim", opts = {} },
  {"lewis6991/gitsigns.nvim", opts = {}},
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    opts={},
  },
  {"akinsho/toggleterm.nvim", version = "*", config = true},
  {
    "nvim-telescope/telescope.nvim", 
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  },
  {"nvim-treesitter/nvim-treesitter"},
})
