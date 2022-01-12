local ok, filetype = pcall(require,'filetype')

if not ok then
    error('error loading filetype plugin')
    return
end

  filetype.setup {}
