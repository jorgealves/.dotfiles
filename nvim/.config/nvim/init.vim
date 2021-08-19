au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
let mapleader = " "

syntax on
filetype plugin on 

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
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate all'}
" " Plug 'nvim-lua/completion-nvim'
" Plug 'hrsh7th/nvim-compe'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'glepnir/lspsaga.nvim'
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Plug 'hoob3rt/lualine.nvim'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tpope/vim-commentary'
" Plug 'puremourning/vimspector'
" Plug 'preservim/nerdtree'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'morhetz/gruvbox'
" Plug 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } }
call plug#end()

" colorscheme gruvbox
" highlight Normal guibg=none
" highlight ColorColumn ctermbg=red guibg=red


" lua << EOF
"  local lualine = require('lualine')
" lualine.setup{
"     options = {theme = 'gruvbox'}
" }
" local nvim_lsp = require('lspconfig')
" -- autocompletion config
" -- Use an on_attach function to only map the following keys
" -- after the language server attaches to the current buffer
" local on_attach = function(client, bufnr)
"   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
"   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

"   --Enable completion triggered by <c-x><c-o>
"   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

"   -- Mappings.
"   local opts = { noremap=true, silent=true }

"   -- See `:help vim.lsp.*` for documentation on any of the below functions
"   buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
"   buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
"   buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
"   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
"   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
"   buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
"   buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
"   buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
"   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
"   buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
"   buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
"   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
"   buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
"   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
"   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
"   buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
"   buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

" end

" -- Use a loop to conveniently call 'setup' on multiple servers and
" -- map buffer local keybindings when the language server attaches
" local servers = { 'pyright' }
" for _, lsp in ipairs(servers) do
"   nvim_lsp[lsp].setup {
"     on_attach = on_attach,
"     flags = {
"       debounce_text_changes = 150,
"     }
"   }
" end
" EOF
" Completion-nvim setup
" let g:completion_enable_snippet = 'Neosnippet'

" Vim-Plug remaps
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>pu :PlugUpdate<CR>
" LSPSaga remaps
" nnoremap <silent> gh :Lspsaga lsp_finder<CR>
" nnoremap <silent><leader>ca :Lspsaga code_action<CR>
" vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
" nnoremap <silent>K :Lspsaga hover_doc<CR>
" nnoremap <silent> gs :Lspsaga signature_help<CR>
" nnoremap <silent>gr :Lspsaga rename<CR>
" nnoremap <silent> gd :Lspsaga preview_definition<CR>
" nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
" nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
" nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
" nnoremap <silent> <C-d> :Lspsaga open_floaterm<CR>
" tnoremap <silent> <C-d> <C-\><C-n>:Lspsaga close_floaterm<CR>
" NERDTree remaps
" nnoremap <leader><TAB> :NERDTreeToggle<CR>
"Telescope remaps
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" open vimrc
" nnoremap <leader>vimrc :tabnew ~/.config/nvim/init.vim<CR>
" Better nav for omnicomplete
" inoremap <expr> <c-j> ("\<C-n>")
" inoremap <expr> <c-k> ("\<C-p>")
" new tab
nnoremap <C-t> :tabnew<CR>
" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :tabnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :taprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
