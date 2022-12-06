local ok, lualine = pcall(require, 'lualine')
if not ok then
  error('lualine not loaded')
end

lualine.setup()

print('lualine loaded')
