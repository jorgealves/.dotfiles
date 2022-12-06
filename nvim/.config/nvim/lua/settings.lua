-- Settings

-- line number
vim.o.number=true
vim.o.relativenumber=true
vim.o.scrolloff = 8
-- code folding 
vim.o.foldmethod = 'expr'
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel= 99

-- mouse
vim.o.mouse = 'a'

-- swapfile and undofile and undodir 
vim.g.backup = false
vim.g.swapfile = false
vim.g.undofile = false
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

-- completion
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

--theme
vim.o.termguicolors=true
vim.o.background='dark'
vim.cmd('colorscheme gruvbox')

print('settings loaded')
