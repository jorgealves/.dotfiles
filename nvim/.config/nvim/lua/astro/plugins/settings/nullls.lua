local ok, nullls = pcall(require, 'null-ls')
if not ok then
    return
end

local formatting = nullls.builtins.formatting
local diagnostics = nullls.builtins.diagnostics
local code_actions = nullls.builtins.code_actions
local hover = nullls.builtins.hover



nullls.setup({
    sources = {
        code_actions.gitrebase,
        code_actions.gitsigns,
        code_actions.refactoring,
        code_actions.shellcheck,

        diagnostics.cppcheck,
        diagnostics.editorconfig_checker,
        diagnostics.flake8,
        diagnostics.jsonlint,
        diagnostics.mypy,
        diagnostics.pylint,

        formatting.autopep8,
        formatting.black,
        formatting.clang_format,
        formatting.cmake_format,
        formatting.isort,
        formatting.lua_format,

        hover.dictionary,
    }
})
