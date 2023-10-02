local python_executable = vim.fn.system('pyenv which python'):gsub('\n', '')
if python_executable ~= '' then
  vim.g.python3_host_prog = python_executable
  vim.g.python_host_prog = python_executable
end

require('dap-python').setup(python_executable)
local dap_repl = require('nvim-dap-repl-highlights')
dap_repl.setup()
dap_repl.setup_highlights('python')
