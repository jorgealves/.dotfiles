local ok, mason = pcall(require,'mason')
if not ok then
  error('mason not loaded')
end
mason.setup()

local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
  error('mason-lspconfig not loaded')
end
mason_lspconfig.setup()

local ok, mason_tool_installer = pcall(require, 'mason-tool-installer')
if not ok then
  error('mason-tool-installer not loaded')
end
mason_tool_installer.setup{
  ensure_installed = {
    'pyright',
    'lua-language-server',
  },
  auto_update = true,
  run_on_start = true,
  start_delay = 500
}
vim.api.nvim_create_autocmd('User', {
  pattern = 'MasonToolsUpdateCompleted',
  callback = function()
    vim.schedule(function()
      vim.notify('mason-tool-installer has finished')
    end)
  end,
})


local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

local servers = lspconfig.util.available_servers()
for _, server in ipairs(servers) do
  lspconfig[server].setup()
end

vim.diagnostic.config({
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = true,
})

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)

