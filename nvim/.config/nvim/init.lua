modules = {
	'settings',
	'plugins',
  'configs',
	'keymaps',
	'autocmds'
}

for i, module in ipairs(modules) do
	local ok, module=pcall(require,module)
	if not ok then
		error(module..' not loaded')
	end
end
