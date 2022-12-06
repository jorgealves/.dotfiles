local ok, nulls = pcall(require, 'null-ls')
if not ok then
  error('nulls not loaded')
end


local ok, mason_null_ls = pcall(require,'mason-null-ls')
if not ok then
  error('mason-null-ls')
end

mason_null_ls.setup{
  ensure_installed = {
    'cspell',
    'refactoring',
    'proselint',
    'shellcheck',
    'editorconfig_checker',
    'gitlint',
    'hadolint',
    'jsonlint',
    'markdownlint',
    'luasnip',
    'zsh',
    'flake8',
    'mypy',
    'pycodestyle',
    'pydocstyle',
    'pylama',
    'pylint',
    'pyproject_flake8',
    'vulture',
    'autopep8',
    'black',
    'blue',
    'djhtml',
    'djlint',
    'isort',
    'reorder_python_imports',
    'usort',
    'yapf',
    'luacheck',
    'selene',
    'lua_format',
    'stylua',
  },
  automatic_installation=true
}


local function register_to_null_ls(sources)
  for _,source in ipairs(sources) do
    nulls.register(source)
  end
end

mason_null_ls.setup_handlers {
  function(source_name)
    local to_register = {
      nulls.builtins.code_actions.cspell,
      nulls.builtins.code_actions.refactoring,
      nulls.builtins.code_actions.proselint,
      nulls.builtins.code_actions.shellcheck,
      nulls.builtins.diagnostics.gitlint,
      nulls.builtins.diagnostics.hadolint,
      nulls.builtins.diagnostics.jsonlint,
      nulls.builtins.diagnostics.markdownlint,
      nulls.builtins.completion.luasnip,
      nulls.builtins.diagnostics.zsh,
    }
    register_to_null_ls(to_register)
  end,
  python = function ()
    local register = {
      nulls.builtins.diagnostics.flake8,
      nulls.builtins.diagnostics.mypy,
      nulls.builtins.diagnostics.pycodestyle,
      nulls.builtins.diagnostics.pydocstyle,
      nulls.builtins.diagnostics.pylama,
      nulls.builtins.diagnostics.pylint,
      nulls.builtins.diagnostics.pyproject_flake8,
      nulls.builtins.diagnostics.vulture,
      nulls.builtins.formatting.autopep8,
      nulls.builtins.formatting.black,
      nulls.builtins.formatting.blue,
      nulls.builtins.formatting.djhtml,
      nulls.builtins.formatting.djlint,
      nulls.builtins.formatting.isort,
      nulls.builtins.formatting.reorder_python_imports,
      nulls.builtins.formatting.usort,
      nulls.builtins.formatting.yapf,
    }
    register_to_null_ls(register)
  end,
  lua = function()
    local register = {
      nulls.builtins.diagnostics.luacheck,
      nulls.builtins.diagnostics.selene,
      nulls.builtins.formatting.lua_format,
      nulls.builtins.formatting.stylua,
    }
    register_to_null_ls(register)
  end
}

nulls.setup()

print('nulls loaded')

