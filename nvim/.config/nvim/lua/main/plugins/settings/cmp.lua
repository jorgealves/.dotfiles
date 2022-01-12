-- CMP
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local ok, luasnip = pcall(require, 'luasnip')
if not ok then
  return
end

local ok, vscode_snippets = pcall(require, 'luasnip.loaders.from_vscode')
if not ok then
	return
end
vscode_snippets.load()
local ok, lspkind = pcall(require, 'lspkind')
if not ok then
  return
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end
cmp.setup {
    formatting = {
      format = function(entry, vim_item)
        -- fancy icons and a name of kind
        vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
        -- set a name for each source
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lua = "[Lua]",
          nvim_lsp = "[LSP]",
          luasnip = "[Luasnip]",
          path = "[Path]",
          look = "[Look]",
          spell = "[Spell]",
          calc = "[Calc]",
          emoji = "[Emoji]"
        })[entry.source.name]
        return vim_item
      end
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    snippet = {expand = function(args) require('luasnip').lsp_expand(args.body) end},
    sources = {
        {name = 'nvim_lsp'},
        --{name = 'cmp_tabnine'},
        {name = "luasnip"},
        {name = 'buffer', keyword_length=4},
        {name = "nvim_lua"},
        {name = "path"},
        {name = "look", max_item_count = 5, keyword_length=4},
        {name = "calc"},
        {name = "spell", max_item_count = 5, keyword_length=4},
        {name = "emoji"}
    },
    completion = {completeopt = 'menu,menuone,noinsert'},
    view = {
      entries = 'native',
    },
    experimental = {
      ghost_text=true,
    }
}

-- TabNine
--local ok, tabnine = pcall(require, 'cmp_tabnine.config')
--if not ok then
--  return
--end
--tabnine:setup({max_lines = 1000, max_num_results = 20, sort = true})

-- Database completion
vim.api.nvim_exec([[
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
]], false)


