local default_keymap_options={noremap=true}
vim.api.nvim_set_keymap('n', '<leader>ps', ':PackerSync<cr>', default_keymap_options)
vim.api.nvim_set_keymap('n', '<leader><tab>', ':NvimTreeToggle<cr>', default_keymap_options)
vim.api.nvim_set_keymap('n', '<leader>bk', ':lua require\'dap\'.toggle_breakpoint()<cr>', default_keymap_options)
