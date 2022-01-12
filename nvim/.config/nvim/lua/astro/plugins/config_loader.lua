  local plugin_configs = {
    'bbye',
    'bufferline',
    'cmp',
    'filetype',
    'fixcursorhold',
    'impatient',
    'lsp',
    'lualine',
    'nullls',
    'nvimtree',
    'nvimtreesitter',
  }


  for id, plugin in pairs(plugin_configs) do
    require('astro.plugins.settings.' .. plugin)
  end

