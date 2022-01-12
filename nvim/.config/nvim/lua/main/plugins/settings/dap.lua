local ok, dap = pcall(require, 'dap')

if not ok then
  return
end

local ok, dapui = pcall(require, 'dapui')
if not ok then
  return
end

dapui.setup()

local events_after = dap.listeners.after
local events_before = dap.listeners.before

events_after.event_initialized['dapui_config'] = function ()
  dapui.open()
end

events_before.event_terminated['dapui_config'] = function ()
  dapui.close()
end
events_before.event_exited['dapui_config'] = function()
  dapui.close()
end


local ok, dap_virtual_text = pcall(require, 'nvim-dap-virtual-text')
if not ok then
  return
end

dap_virtual_text.setup {
  enabled = true,
  all_frames = true,
  highlight_changed_variables = true,
  highlight_new_as_changed = true,
}


local ok, telescope = pcall(require,'telescope')
if not ok then
  return
end

telescope.load_extension('dap')

local ok, dap_python = pcall(require,'dap-python')
if not ok then
  return
end
dap_python.setup()

function SetupDapPython(path)
  dap_python.setup(path)
end

local ok, dap_go = pcall(require, 'dap-go')
if not ok then
  return
end

dap_go.setup()


-- Python Configurations

function AttachPythonDebugger(host, port)
  pythonAttachAdapter = {
    type = 'server';
    host = host;
    port = tonumber(port)
  }
  pythonAttachConfig = {
    type =  'python';
    request = 'attach';
    connect = {
      port = tonumber(port);
      host = host;
    },
    mode = 'remote';
    name = 'Python Remote Interpreter';
    cwd = vim.fn.getcwd();
    pathMappings = {
      {
        localRoot = vim.fn.getcwd();
        remoteRoot = '/workspace';
      };
    };
  }
  local session = dap.attach(host,tonumber(port),pythonAttachConfig)
  if session == nil then
    io.write('Error launching adapter')
  end
  dap.repl.open()
end
