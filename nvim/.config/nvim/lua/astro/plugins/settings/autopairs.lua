local ok, autopairs = pcall(require, 'nvim-autopairs')

if not ok then
  error('error loading autopairs plugin')
  return
end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "NvimTree" }
})
