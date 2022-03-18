local ok, indent = pcall(require, 'indent_blankline')

if not ok then
  error('error loading indent plugin')
  return
end

indent.setup {
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true
}
