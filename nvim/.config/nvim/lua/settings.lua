-- Settings

-- line number
vim.o.number=true
vim.o.relativenumber=true

-- mouse
vim.o.mouse = 'a'

-- search
vim.o.ignorecase=true
vim.o.smartcase=true
vim.o.hlsearch=true

-- indentation
vim.o.breakindent=true
vim.o.tabstop=2
vim.o.shiftwidth=2
vim.o.expandtab=true

--statusline
vim.o.laststatus=3

-- winbar
vim.o.winbar="%=%m %f"

--theme
vim.o.termguicolors=true
vim.o.background='dark'
vim.cmd('colorscheme kanagawa')
print('settings loaded')
