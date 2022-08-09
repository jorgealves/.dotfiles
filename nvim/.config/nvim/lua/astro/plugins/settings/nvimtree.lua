local ok, nvim_tree = pcall(require, "nvim-tree")

if not ok then
	error("error loading nvim tree plugin")
	return
end

nvim_tree.setup {
	hijack_cursor = true,
	hijack_netrw = true,
	open_on_setup = true,
	sort_by = "type, name",
	view = {
		adaptive_size = true,
		signcolumn = "yes",
	},
  renderer = {
    group_empty = true,
    add_trailing = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
	diagnostics = {
		enable = true,
	},
  filesystem_watchers = {
    enable = true,
  },
	-- filters = {
	-- 	dotfiles = true,
	-- },
}
