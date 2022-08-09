local ok, autosave = pcall(require,'autosave')

if not ok then
  error('error loading autosave plugin')
  return
end

autosave.setup()
