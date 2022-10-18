-- require("luasnip.loaders.from_vscode").lazy_load()
local ok, mason = pcall(require, 'mason')
if not ok then
  error('mason not loaded')
end

mason.setup({
  ui = {
    check_outdated_packages_on_open = true,
    border = 'single'
  }
})


local ok, mason_installer = pcall(require, "mason-tool-installer")
if not ok then
  error("mason-tool-installer not loaded")
end

mason_installer.setup({
  auto_update = true,
  run_on_start = true,
  start_delay = 1000, -- 1 second delay
})

local ok, nulls = pcall(require, 'null-ls')
if not ok then
  error('null-ls not loaded')
end

nulls.setup()


local ok, nulls = pcall(require, 'mason-null-ls')
if not ok then
  error('null-ls not loaded')
end

local formatting = nulls.builtins.formatting
local completion = nulls.builtins.completion
local diagnostics = nulls.builtins.diagnostics
local code_actions = nulls.builtins.code_actions
local hover = nulls.builtins.hover

nulls.setup({
    sources = {
        code_actions.gitrebase,
        code_actions.gitsigns,
        code_actions.shellcheck,
        code_actions.eslint,

        completion.luasnip,
        completion.spell,
        completion.tags,

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
        -- formatting.luaformat,
        formatting.stylua,

        hover.dictionary,
    }
})
