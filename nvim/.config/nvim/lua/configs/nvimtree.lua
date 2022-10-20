local ok, tree = pcall(require,'nvim-tree')
if not ok then 
  error('nvim-tree not loaded')
end

tree.setup { -- BEGIN_DEFAULT_OPTS
  disable_netrw = true,
  open_on_tab = false,
  ignore_buf_on_tab_change = {},
  sort_by = "type,case_sensitive",
  view = {
    adaptive_size = true,
  },
  diagnostics = {
    enable = true,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true,
    },
  },
}
