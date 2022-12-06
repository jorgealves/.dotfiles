local ok, lspconfig = pcall(require,'lspconfig')
if not ok then
  error('lsp python not loaded')
end

lspconfig.pyright.setup{
  settings = {
    analysis = {
      autoSearchPaths = true,
      diagnoticMode = 'workspace',
      autoImportCompletions = true,
      logLevel = 'Trace',
      typeCheckingMode = 'strict'
    }
  }
}

print('pyright loaded')
