
local ok, treesitter = pcall(require,'nvim-treesitter.configs')
if not ok then
  error('nvim-treesitter config not loaded')
end

treesitter.setup {
  ensure_installed='all',
  auto_install=true, 
  highlight = {
    enable=true,
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = {
    enable = true
  },
  indent={
    enable = true,
  },
  -- textobjects
  textobjects = {
    select = {
      enable = true,
      lookahead=true,
      include_surrounding_whitespace=true
    },
    swap = {
      enable =true,
    },
    move = {
      enable = true,
    },
    lsp_interop={
      enable=true
    }
  }
}

local ok, tscontext = pcall(require,'treesitter-context')
if not ok then
  error('treesitter-context not loaded')
end

tscontext.setup()


local ok, filetype = pcall(require, 'filetype')

if not ok then
  error('filetype not loaded')
end
filetype.setup()
print('filetype loaded')
