vim.opt.tabstop=4

local dap_install = require "dap-install"
dap_install.config('python', {})

local dap_python = require "dap-python"
dap_python.setup()

local dap = require('dap')
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
  {
    type = "server";
    host = "localhost";
    port = tonumber(5678);
  },
  {
    type = "python";
    request = "attach";
    connect = {
      port = tonumber(5678);
      host = "localhost";
    };
    mode = "remote";
    name = "Remote Attached Debugger";
    cwd = vim.fn.getcwd();
    pathMappings = {
      {
        localRoot = vim.fn.getcwd(); -- Wherever your Python code lives locally.
        remoteRoot = "/workspace"; -- Wherever your Python code lives in the container.
      }
    }
  }
}
