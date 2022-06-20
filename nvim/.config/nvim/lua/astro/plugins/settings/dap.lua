local ok, dap = pcall(require, "dap")

if not ok then
	error("error loading dap plugin")
	return
end

local ok, virtual_text = pcall(require, 'nvim-dap-virtual-text')
if not ok then
  error('error loading dap virtual text')
  return
end

virtual_text.setup()

local ok, dap_python = pcall(require, "dap-python")

if not ok then
	error("error loading dap python plugin")
	return
end

dap_python.setup()

local ok, dapui = pcall(require, "dapui")
if not ok then
	error("error loading dap ui plugin")
	return
end

dapui.setup({
  floating = {
    max_height = 0.6, -- These can be integers or a float between 0 and 1.
    max_width = 0.6, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
  }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_progressStart["progress-notifications"] = function(session, body)
	local notif_data = get_notif_data("dap", body.progressId)

	local message = format_message(body.message, body.percentage)
	notif_data.notification = vim.notify(message, "info", {
		title = format_title(body.title, session.config.type),
		icon = spinner_frames[1],
		timeout = false,
		hide_from_history = false,
	})

	notif_data.notification.spinner = 1, update_spinner("dap", body.progressId)
end

dap.listeners.before.event_progressUpdate["progress-notifications"] = function(session, body)
	local notif_data = get_notif_data("dap", body.progressId)
	notif_data.notification = vim.notify(format_message(body.message, body.percentage), "info", {
		replace = notif_data.notification,
		hide_from_history = false,
	})
end

dap.listeners.before.event_progressEnd["progress-notifications"] = function(session, body)
	local notif_data = client_notifs["dap"][body.progressId]
	notif_data.notification = vim.notify(body.message and format_message(body.message) or "Complete", "info", {
		icon = "",
		replace = notif_data.notification,
		timeout = 3000,
	})
	notif_data.spinner = nil
end

local mode = 'n'
local opts = {silent=true}
local map = vim.api.nvim_set_keymap

map(mode,'<F3>', ":lua require'dap'.toggle_breakpoint()<CR>", opts)
map(mode,'<F4>', ":lua require'dap'dap.toggle_breakpoint(vim.fn.input('Enter Condition: '))<CR>", opts)
map(mode,'<F5>', ":lua require'dap'.continue()<CR>", opts)
map(mode,'<F6>', ":lua require'dap'.step_out()<CR>", opts)
map(mode,'<F7>', ":lua require'dap'.step_over()<CR>", opts)
map(mode,'<F8>', ":lua require'dap'.step_into()<CR>" , opts)
map(mode,'<F9>', ":lua require'dap'.continue()<CR>", opts)

local function splitArgs(string, delimiter)
  result = {}
  for match in (string..delimiter):gmatch('(.-)'..delimiter) do
    table.insert(result,match)
  end
  return result
end

local function getPythonPath()

  local pwd = vim.fn.getcwd()
  local pythonexec = '/bin/python'
  if vim.fn.executable(pwd..'/venv'..pythonexec) == 1 then
    return pwd..'/venv'..pythonexec
  elseif vim.fn.executable(pwd..'/.venv/'..pythonexec) == 1 then
    return pwd..'/.venv/'..pythonexec
  else
    return '/usr/bin/python3'
  end
end

table.insert(dap.configurations.python, {
  pythonPath = getPythonPath(),
  type='python',
  request = 'launch',
  name='Pytest',
  module = 'pytest',
  args = function()
    local args = vim.fn.input('Arguments: ')
    return vim.split(args, " +")
  end;

})

table.insert(dap.configurations.python, {
  pythonPath = getPythonPath(),
  type='python',
  request = 'launch',
  name='Pytest with Docker',
  module = 'pytest',
  args = function()
    local args = vim.fn.input('Arguments: ')
    return vim.split(args, " +")
  end;

})
