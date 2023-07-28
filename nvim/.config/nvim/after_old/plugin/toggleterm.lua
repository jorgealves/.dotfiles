local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
    error('toggleterm not loaded')
end

toggleterm.setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
    return 20
  end,
  direction = 'horizontal' ,
  shell = vim.o.shell, -- change the default shell
  float_opts = {
    border = 'curved'
  },
  winbar = {
    enabled = true,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
}
