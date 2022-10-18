local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup({
  function(use)
    use {'wbthomason/packer.nvim'} -- packer
    -- helpers
    use {'nvim-lua/plenary.nvim'}
    -- themes
    use { 
      "ellisonleao/gruvbox.nvim",
      "rebelot/kanagawa.nvim",
      'nvim-tree/nvim-web-devicons',
    }

    --Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'nvim-treesitter/nvim-treesitter-context',
        'nvim-treesitter/nvim-treesitter-textobjects'
      }
    }

    -- Code (Mason + LSP + DAP + Linters + Formatters)
    use {'numToStr/Comment.nvim'}
    use {'L3MON4D3/LuaSnip'}
    use {
      'williamboman/mason.nvim',
      requires = {
        {'WhoIsSethDaniel/mason-tool-installer.nvim'},
        {'jayp0521/mason-null-ls.nvim'},
        -- LSP
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason-lspconfig.nvim'},
        -- DAP
        {
          'mfussenegger/nvim-dap',
          requires={
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
            'mfussenegger/nvim-dap-python',
            'leoluz/nvim-dap-go',
          },
        },
        -- Linters + Formatters
        {'jose-elias-alvarez/null-ls.nvim'}
      }
    }
    -- Keymaps
    use {'folke/which-key.nvim'}

    -- UI
    use {'rcarriga/nvim-notify'}
    -- telescope
      use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-file-browser.nvim'},
        {'nvim-telescope/telescope-dap.nvim'},
        {'nvim-telescope/telescope-packer.nvim'},
        --'nvim-telescope/telescope-frecency.nvim',
        --'kkharji/sqlite.lua',
        --{'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },

      },
    }

    -- nvimTree
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
    }


    -- lualine
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({border='single'})
      end
    }
  }
})

print('plugins loaded')
