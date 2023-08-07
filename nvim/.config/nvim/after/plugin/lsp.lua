
local lsp = require('lsp-zero')
lsp.preset('recommended')

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

lsp.configure('pyright', {
  settings = {
    python = {
      analysis = {
        autoSearchPaths=true,
        diagnosticMode='workspace',
        useLibraryCodeForTypes=true
      },
    }
  }
})
lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
