local dap = require('dap')
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🔵', texthl='', linehl='', numhl=''})
require('dap-python').setup()
-- local dap = require('dap')
-- dap.adapters.python = {
--     type='executable';
--     command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
--     args = {'-m','debugpy.adapter'};
-- }
-- dap.configurations.python = {
--     {
--         type = 'python';
--         request = 'launch';
--         name = "Launch file";
--         program = "${file}";
--         pythonPath = function()
--           return '/usr/bin/python'
--         end;
--     },

-- }

