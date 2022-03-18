local ok, nullls = pcall(require, 'null-ls')
if not ok then
    return
end

local formatting = nullls.builtins.formatting
local completion = nullls.builtins.completion
local diagnostics = nullls.builtins.diagnostics
local code_actions = nullls.builtins.code_actions
local hover = nullls.builtins.hover



nullls.setup({
    sources = {
        code_actions.gitrebase,
        code_actions.gitsigns,
        code_actions.shellcheck,
        code_actions.eslint,
        
        completion.luasnip,
        completion.spell,

        diagnostics.cppcheck,
        diagnostics.eslint,
        diagnostics.luacheck,
        diagnostics.shellcheck,
        diagnostics.yamllint,
        diagnostics.vint,
        diagnostics.zsh,
        diagnostics.flake8,
        diagnostics.jsonlint,
        diagnostics.mypy,
        diagnostics.pylint,

        formatting.autopep8,
        formatting.black,
        formatting.clang_format,
        formatting.isort,
        formatting.djhtml,
        formatting.djlint,
        formatting.eslint,
        formatting.luaformat,
        formatting.stylua,

        hover.dictionary,
    }
})
