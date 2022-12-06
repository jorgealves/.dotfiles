local modules = {
  'configs.lualine',
  'configs.nvimtree',
  'configs.whichkey',
  'configs.notify',
  'configs.comment',
  'configs.telescope',
	'configs.treesitter',
  'configs.cmp',
  'configs.lsp',
  'configs.nulls',
}

for _, mod in pairs(modules) do
	local ok, config=pcall(require,mod)
	if not ok then
		vim.notify(mod..' not loaded', 'ERROR')
	end
  print(mod..' loaded')
end
