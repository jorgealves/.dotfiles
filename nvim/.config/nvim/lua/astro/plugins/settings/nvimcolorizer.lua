local ok, colorizer = pcall(require, 'colorizer')

if not ok then
  error('error loading colorizer plugin')
  return
end

colorizer.setup()
