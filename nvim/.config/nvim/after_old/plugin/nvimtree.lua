local ok, nvimtree = pcall(require, "nvim-tree")

if not ok then
    error('nvim tree not loaded')
end

nvimtree.setup({
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_cursor = true,
    hijack_netrw = true,
    sort_by = "name",
    view = {
        adaptive_size = true,
        cursorline = true,
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    filters = {
        dotfiles = true,
    },
    modified = {
        enable = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
        remove_file = {
            close_window = false,
        },
    },
})
