  local plugin_configs = {
    'autopairs',
    'bbye',
    'betterescape',
    'bufferline',
    'cmp',
    'comment',
    'dap',
    'editorconfig',
    'fidget',
    'filetype',
    'fixcursorhold',
    'gitsigns',
    'impatient',
    'indentblankline',
    'lsp',
    'lualine',
    'neoscroll',
    'nullls',
    'nvimcolorizer',
    'nvimcursorline',
    'nvimtree',
    'nvimtreesitter',
    'telescope',
    'toggleterm',
    'whichkey'
  }


  for _, plugin in pairs(plugin_configs) do
    require('astro.plugins.settings.' .. plugin)
  end

