vim.g.mapleader = ' '

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.o.background = 'dark'

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.cmd[[set clipboard=unnamedplus]]
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.timeout = true
vim.opt.timeoutlen = 300

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

vim.g.splitbelow = true
vim.g.splitright = true

vim.opt.winbar=[[%=%m %f]]
vim.opt.laststatus = 3

vim.opt.foldlevel = 99
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
