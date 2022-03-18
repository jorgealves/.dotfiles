local ok, comment = pcall(require,'Comment')

if not ok then
  error('error loading comment plugin')
  return
end

comment.setup()
