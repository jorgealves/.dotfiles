-- Packer init
vim.cmd('packadd packer.nvim')

local packer=require'packer'.startup(function()
        use 'wbthomason/packer.nvim'
        use 'tpope/vim-commentary'
     	
        use 'nvim-lua/plenary.nvim'
     	use 'nvim-lua/popup.nvim'
        
        use 'hoob3rt/lualine.nvim'
        use 'kyazdani42/nvim-web-devicons'
        use 'kyazdani42/nvim-tree.lua'
        use 'ryanoasis/vim-devicons'
        
        use 'Pocco81/DAPInstall.nvim'
        
        use 'mfussenegger/nvim-dap'
        use 'nvim-telescope/telescope-dap.nvim'
        use 'theHamsta/nvim-dap-virtual-text'
        
        use 'neovim/nvim-lspconfig'
        use 'kabouzeid/nvim-lspinstall'
        
        use 'nvim-lua/completion-nvim'
        use {
            'nvim-telescope/telescope.nvim',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        use { 
            "rcarriga/nvim-dap-ui", 
            requires = {"mfussenegger/nvim-dap"} 
        }
        
        use 'nvim-telescope/telescope-fzy-native.nvim'
end)
