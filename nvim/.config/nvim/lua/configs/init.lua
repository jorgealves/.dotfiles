modules = {
	'configs.treesitter',
  'configs.whichkey',
  'configs.comment'
}

for _, mod in pairs(modules) do 
	local ok, module=pcall(require,mod)
	if not ok then
		error(mod..' not loaded')
	end
  print(mod..' loaded')
end
