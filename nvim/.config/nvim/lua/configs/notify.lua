local ok, notify = pcall(require,'notify')
if not ok then
  error('notify not loaded')
end
vim.notify = notify
