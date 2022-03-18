local ok, betterescape = pcall(require, 'better_escape')

if not ok then
  error('error loading better_scape plugin')
  return
end

betterescape.setup()
