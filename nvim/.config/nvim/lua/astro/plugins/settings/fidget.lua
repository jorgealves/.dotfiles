local ok, fidget = pcall(require,'fidget')

if not ok then
  error('error loading fidget')
  return
end

fidget.setup()
