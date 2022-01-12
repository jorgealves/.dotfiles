local ok, lualine = pcall(require,'lualine')

if not ok then
  error('error loading lualine')
  return
end

lualine.setup {
  options = {
    theme = 'nightfox',
  }
}
