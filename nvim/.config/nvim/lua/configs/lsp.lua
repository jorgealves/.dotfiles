local ok, mason = pcall(require, 'mason')
if not ok then
  vim.notify('mason not loaded')
end

mason.setup({
  ui = {
    check_outdated_packages_on_open = true,
    border = 'single'
  }
})


local ok, mason_installer = pcall(require, "mason-tool-installer")
if not ok then
  vim.notify("mason-tool-installer not loaded")
end

mason_installer.setup({
  auto_update = true,
  run_on_start = true,
  start_delay = 1000, -- 1 second delay
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'MasonToolsUpdateCompleted',
  callback = function()
    vim.schedule(function()
      print 'mason-tool-installer has finished'
    end)
  end,
})

local ok, nulls = pcall(require, 'null-ls')
if not ok then
  error('null ls not loaded')
end

local ok, mason_null_ls = pcall(require,'mason-null-ls')
if not ok then
  error('mason null ls not loaded')
end

mason_null_ls.setup({
  automatic_installation = true
})

mason_null_ls.setup_handlers({
  -- default
  function(source_name)
  end,
  python = function()
  end
})

nulls.setup()

local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
  error('mason-lspconfig not loaded')
end

mason_lspconfig.setup({
  ensure_installed = {'sumneko_lua','pyright'},
  automatic_installation=true
})

local ok, mason_update = pcall(require, 'mason-update-all')
if not ok then
  error('mason-update-all not loaded')
end

mason_update.setup()

vim.api.nvim_create_autocmd('User', {
    pattern = 'MasonUpdateAllComplete',
    callback = function()
        print('mason-update-all has finished')
    end,
})
local ok, nulls = pcall(require, 'null-ls')
if not ok then
  error('null-ls not loaded')
end

local formatting = nulls.builtins.formatting
local completion = nulls.builtins.completion
local diagnostics = nulls.builtins.diagnostics
local code_actions = nulls.builtins.code_actions
local hover = nulls.builtins.hover

nulls.setup({
    sources = {
        code_actions.gitrebase,
        code_actions.gitsigns,
        code_actions.shellcheck,
        code_actions.eslint,

        completion.luasnip,
        completion.spell,
        completion.tags,

        diagnostics.cppcheck,
        diagnostics.eslint,
        diagnostics.luacheck,
        diagnostics.shellcheck,
        diagnostics.yamllint,
        diagnostics.vint,
        diagnostics.zsh,
        diagnostics.flake8,
        diagnostics.jsonlint,
        diagnostics.mypy,
        diagnostics.pylint,

        formatting.autopep8,
        formatting.black,
        formatting.clang_format,
        formatting.isort,
        formatting.djhtml,
        formatting.djlint,
        formatting.eslint,
        -- formatting.luaformat,
        formatting.stylua,

        hover.dictionary,
    }
})

 local ok, mason_nulls = pcall(require, 'mason-null-ls')
 if not ok then
   error('null-ls not loaded')
 end

 mason_nulls.setup()


-- LSP+CMP configs
local ok, lspkind = pcall(require, 'lspkind')
if not ok then
  error('lspkind not loaded')
end

lspkind.init({
  mode = 'symbol_text',
  preset='codicons',
  symbol_map = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = ""
  },
})

local ok, cmp = pcall(require,'cmp')
if not ok then
  error('cmp not loaded')
end

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      if vim.tbl_contains({ 'path' }, entry.source.name) then
        local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
        if icon then
          vim_item.kind = icon
          vim_item.kind_hl_group = hl_group
          return vim_item
        end
      end
      return lspkind.cmp_format({ with_text = false })(entry, vim_item)
    end
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'nvim_lua' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, 
    {
      { name = 'buffer' },
      { name = 'path' },
      { name = 'cmdline' },
      
    }
  ), 
})

-- -- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = 'buffer' },
--   })
-- })
--
-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })


local ok, cmp_nvim_lsp = pcall(require,'cmp_nvim_lsp')
if not ok then
  error('cmp nvim lsp not loaded')
end

local capabilities = cmp_nvim_lsp.default_capabilities()


local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  error('lspconfig not loaded')
end

lspconfig.util.default_config = vim.tbl_extend(
  "force",
  lspconfig.util.default_config,
  {
    on_attach = on_attach,
    capabilities = capabilities
  }
)


