local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'use' }
      }
    }
  }
})

lsp.configure('pylsp', {
  plugins = {
    ruff = {
      enabled = true
    }
  }
})

lsp.configure('ruff_lsp', {
  default_config = {
    cmd = {'ruff_lsp'},
    filetypes = {'python'},
    root_dir = require('lspconfig').util.find_git_ancestor,
    init_options = {
      settings = {
        args = {}
      }
    }
  }
})
lsp.nvim_workspace()
lsp.setup()

-- vim.diagnostic.config({
--   virtual_text = true,
-- })
