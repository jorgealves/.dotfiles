
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
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


lsp.on_attach(function(_,bufnr)
  lsp.default_keymaps({buffer=bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
