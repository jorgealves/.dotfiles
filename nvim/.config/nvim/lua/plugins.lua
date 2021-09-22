-- Packer init
vim.cmd('packadd packer.nvim')

require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    use 'sainnhe/gruvbox-material'
    use 'norcalli/nvim-colorizer.lua'
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'b3nj5m1n/kommentary'
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    use 'nvim-lua/plenary.nvim'

    use 'simrat39/symbols-outline.nvim'
    use 'kosayoda/nvim-lightbulb'
    use 'RishabhRD/popfix'
    use 'RishabhRD/nvim-lsputils'

    use 'folke/which-key.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    } 

    use 'glepnir/lspsaga.nvim'
    use 'neovim/nvim-lspconfig'
    use 'ray-x/lsp_signature.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'kabouzeid/nvim-lspinstall'

    use 'nvim-treesitter/nvim-treesitter'
    use 'romgrk/nvim-treesitter-context'


    -- DAP
    
    use "Pocco81/DAPInstall.nvim"
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'sakhnik/nvim-gdb'
    use 'mfussenegger/nvim-dap'

end)
local lsp_status = require('lsp-status')
lsp_status.register_progress()

local lspconfig = require('lspconfig')
lspconfig.pyright.setup({
  handlers = lsp_status.extensions.pyls_ms.setup(),
  settings = { python = { workspaceSymbols = { enabled = true }}},
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})
lsp_status.status()

require'lualine'.setup({
    options = { theme = 'gruvbox' }
})

require'kommentary.config'.setup()
require'todo-comments'.setup()
require'telescope'.setup()


require'dap-install'.setup({
    installation_path=vim.fn.stdpath('data') .. '/dapinstall/',
})
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    open_on_start = true,
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    open_on_start = true,
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})

-- require'lspsaga'.init_lsp_saga()
require'which-key'.setup()
require'colorizer'.setup({'all'})
-- require'lspconfig'.setup()
-- require'lsp_signature'.setup({
    -- bind=true,
    -- handler_opts={
        -- border='single'
    -- }
-- })
-- local lsp_status = require('lsp-status')
-- lsp_status.register_progress()

-- require'lspinstall'.setup()
--[[ require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
} ]]

--[[ require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
} ]]
