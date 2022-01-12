local ok , lspconfig = pcall(require, 'lspconfig')

if not ok then
  return
end

local ok, nvim_lsp_installer = pcall(require,'nvim-lsp-installer')

if not ok then
  return
end

local ok, nlspsettings = pcall(require,'nlspsettings')

if not ok then
  return
end

-- LSP SETTINGS
nlspsettings.setup({
  config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
  local_settings_root_markers = {'.git'},
  jsonls_append_default_schema = true,
})

function on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }


  buf_set_keymap('n','gw', ':lua vim.lsp.buf.document_symbol()<cr>',opts)
  buf_set_keymap('n','gw', ':lua vim.lsp.buf.workspace_symbol()<cr>',opts)

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not ok then
  return
end

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp_installer.on_server_ready(function(server)

  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }

  }
  if server.name == 'sumneko_lua' then
      opts = vim.tbl_deep_extend("force",{
        settings = {
		      Lua = {
			      diagnostics = {
				      globals = { "vim", "use" },
			      },
			      workspace = {
				      library = {
					      [vim.fn.expand("$VIMRUNTIME/lua")] = true,
					      [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					      [vim.fn.stdpath("config") .. "/lua"] = true,
				      },
			      },
		      },
        }
      },opts)
  end
  server:setup(opts)
end)

local ok, lspsaga = pcall(require, "lspsaga")
if not ok then
  return
end

lspsaga.init_lsp_saga()

