function _G.ReloadConfig()
    local hls_status = vim.v.hlsearch
    for name, _ in pairs(package.loaded) do
        if name:match('^cnull') then
            package.loaded[name] = nil
        end
    end
    dofile(vim.env.MYVIMRC)
    if hls_status == 0 then 
        vim.opt.hlsearch = false
    end
end


local function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command('augroup '..group_name)
        vim.api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd',def}, ' ')
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command('augroup END')
    end
end

local autocmds = {
    reload_nvim = {
        {"BufWritePost", "*.lua", [[ :source % | :PackerSync ]]};
        -- {"BufWritePost", "$MYVIMRC", [[ :lua ReloadConfig() | :PackerSync ]]};
    };
    terminal_job = {
        { "TermOpen", "*", [[tnoremap <buffer> <Esc> <c-\><c-n>]] };
        { "TermOpen", "*", "startinsert" };
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" };
    };
    toggle_search_highlighting = {
        { "InsertEnter", "*", "setlocal nohlsearch" };
    };
    lua_highlight = {
        { "TextYankPost", "*", [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=40}]] };
    };
    ansi_esc_log = {
        { "BufEnter", "*.log", ":AnsiEsc" };
    };
    --[[ completion_nvim = {
        { "BufEnter", "*", "lua require'completion'.on_attach()" }
    }; ]]
    whenOpenVim = {
        {"VimEnter","*", ":Telescope file_browser"}
    };
}

nvim_create_augroups(autocmds)
