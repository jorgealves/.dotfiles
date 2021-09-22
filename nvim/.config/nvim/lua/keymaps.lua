local function map(mode, keystroke, command, extra_opts)
    local opts = {noremap = true}
    if extra_opts then opts:append(extra_opts) end
    vim.api.nvim_set_keymap(mode,keystroke,command,opts)
end
-- Disable arrows
-- map('n','<Up>','<Nop>')
-- map('n','<Down>','<Nop>')
-- map('n','<Left>','<Nop>')
-- map('n','<Right>','<Nop>')
-- Packer
map('n', '<leader>ps', ':PackerSync<cr>')
-- NvimTree
map('n', '<leader><tab>', ':NvimTreeToggle<cr>')
map('n', '<leader><s-tab>', ':NvimTreeRefresh<cr>')
-- Basic Editing
map('n','<leader>s',':w<cr>')
map('n','<leader>q',':wq<cr>')
map('n','<leader>Q',':q!<cr>')
-- Debugging with DAP
map('n', '<F5>', ":lua require'dap'.continue()<CR>")
map('n', '<F6>',":lua require'dap'.step_over()<CR>")
map('n', '<F7>', ":lua require'dap'.step_into()<CR>")
map('n', '<F8>', ":lua require'dap'.step_out)<CR>")
map('n', '<leader>b', ':lua require\'dap\'.toggle_breakpoint()<cr>')
map('n', '<leader>B', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- LUA NVIM CONFIGS
map('n', '<leader>vrc', ':tabnew $HOME/.config/nvim/init.lua<cr>')
map('n', '<leader>evrc', ':so $HOME/.config/nvim/init.lua | echo "Reloaded!"<cr>')
map('n', '<leader>kvrc', ':tabnew $HOME/.config/nvim/lua/keymaps.lua<cr>')
-- Telescope
map('n', '<leader>t', ':Telescope<cr>')
map('n', '<leader>tf', ':Telescope find_files<cr>')
map('n', '<leader>th', ':Telescope help_tags<cr>')
map('n', '<leader>gd', ':Telescope lsp_definitions<cr>')
-- UltiSnips
map ('n', '<leader>u', ':UltiSnipsEdit<cr>')

