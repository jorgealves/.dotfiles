local ok, telescope = pcall(require, 'telescope')
if not ok then
  error('error loading telescope plugin')
  return
end

telescope.setup {}
