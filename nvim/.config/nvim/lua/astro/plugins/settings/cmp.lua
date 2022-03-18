local ok, cmp = pcall(require, 'cmp')

if not ok then
  error('error loading cmp plugin')
  return
end 

local ok, luasnip = pcall(require, 'luasnip')
if not ok then
  error('error loading luasnip')
  return
end

local ok, vscode_snippets = pcall(require, 'luasnip.loaders.from_vscode')
if not ok then
  return
end

vscode_snippets.load()

cmp.setup {
    -- formatting = {
    --   format = function(entry, vim_item)
    --     -- fancy icons and a name of kind
    --     vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
    --     -- set a name for each source
    --     vim_item.menu = ({
    --       buffer = "[Buffer]",
    --       nvim_lua = "[Lua]",
    --       nvim_lsp = "[LSP]",
    --       luasnip = "[Luasnip]",
    --       path = "[Path]",
    --       look = "[Look]",
    --       spell = "[Spell]",
    --       calc = "[Calc]",
    --       emoji = "[Emoji]"
    --     })[entry.source.name]
    --     return vim_item
    --   end
    -- },
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    sources = {
        {name = "nvim_lua"},
        {name = 'nvim_lsp'},
        {name = "luasnip"},
        {name = 'buffer', keyword_length=4},
        {name = "path"},
        {name = "look", max_item_count = 5, keyword_length=4},
        {name = "calc"},
        {name = "spell", max_item_count = 5, keyword_length=4},
        {name = "emoji"}
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    completion = {completeopt = 'menu,menuone,noinsert'},
    view = {
      entries = 'native',
    },
    experimental = {
      ghost_text=true,
    }
}

local ok, autopairs_completion = pcall(require, 'nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done',autopairs_completion.on_confirm_done({map_char = {text = ''}}))
