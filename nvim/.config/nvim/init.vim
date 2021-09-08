let mapleader = " "

syntax on
filetype plugin on 

set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set encoding=utf-8 fileencoding=utf-8
set pumheight=10
set ruler
set cmdheight=3
set exrc
set t_Co=256
set conceallevel=0
set iskeyword+=-
set mouse=a
set laststatus=0
set cursorline
set background=dark
set showtabline=3
set splitbelow splitright
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smartindent autoindent
set number relativenumber
set noswapfile nobackup undodir=~/.vim/undodir undofile
set incsearch
set termguicolors
set scrolloff=10
set signcolumn=yes
set updatetime=100 timeoutlen=500
set formatoptions-=cro
set clipboard=unnamedplus
set shortmess+=c
set colorcolumn=80
set completeopt=menuone,noselect


call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate all'}
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'puremourning/vimspector'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'morhetz/gruvbox'
Plug 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } }
Plug 'christoomey/vim-tmux-navigator'
call plug#end()
