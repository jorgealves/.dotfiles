  local plugin_configs = {
    'autopairs',
    'autosave',
    'bbye',
    -- 'betterescape',
    'bufferline',
    'cmp',
    'comment',
    'dap',
    'editorconfig',
    'fidget',
    'filetype',
    'fixcursorhold',
    'gitsigns',
    -- 'impatient',
    -- 'indentblankline',
    'lsp',
    'lualine',
    --'neoscroll',
    'notify' ,
    'nullls',
    'nvimcolorizer',
    'nvimcursorline',
    'nvimtree',
    'nvimtreesitter',
    'pymode',
    'telescope',
    'toggleterm',
    'whichkey'
  }


  for _, plugin in pairs(plugin_configs) do
    require('astro.plugins.settings.' .. plugin)
  end

