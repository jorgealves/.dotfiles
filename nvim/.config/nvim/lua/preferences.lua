vim.cmd('colorscheme gruvbox')
vim.cmd('set termguicolors')
vim.g.filetype='plugin indent on'
vim.g.gruvbox_material_background='hard'
vim.g.gruvbox_material_pallete='material'
vim.g.mapleader=' '
vim.opt.background = 'dark'
vim.opt.backup=false
vim.opt.clipboard=[[unnamed,unnamedplus]]
vim.opt.cmdheight=2
vim.opt.colorcolumn='80'
vim.opt.completeopt=[[menuone,noinsert,noselect]]
vim.opt.cursorline=true
vim.opt.expandtab=true
vim.opt.foldmethod='marker'
vim.opt.hidden=true
vim.opt.ignorecase=true
vim.opt.incsearch=true
vim.opt.listchars={eol = '↲', tab = '▸ ', trail = '·'}
vim.opt.mouse='a'
vim.opt.number=true
vim.opt.path:append('*/**')
vim.opt.relativenumber=true
vim.opt.scrolloff=10
vim.opt.shiftwidth=4
vim.opt.shortmess:append('c')
vim.opt.showmode=true
vim.opt.showtabline=4
vim.opt.signcolumn='yes'
vim.opt.smartcase=true
vim.opt.smartindent=true
vim.opt.softtabstop=4
vim.opt.splitbelow=true
vim.opt.splitright=true
vim.opt.swapfile=false
vim.opt.syntax='enable'
vim.opt.tabstop=4
vim.opt.timeoutlen=300
vim.opt.undofile=true
vim.opt.updatetime=200
vim.opt.wildmode=[[longest,list,full]]
vim.opt.wrap=false
-- VIMSPECTOR
vim.g.vimspector_enable_mappgins='HUMAN'
vim.g.dap_virtual_text=true

-- NVIM_TREE
 vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
 vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }
 vim.g.nvim_tree_quit_on_open = 1
 vim.g.nvim_tree_follow_upate_path = 1
 vim.g.nvim_tree_indent_markers = 1
 vim.g.nvim_tree_git_hl = 1
 vim.g.nvim_tree_highlight_opened_files = 1
 vim.g.nvim_tree_root_folder_modifier = ':~'
 vim.g.nvim_tree_tab_open = 1
 vim.g.nvim_tree_auto_resize = 0
 vim.g.nvim_tree_disable_netrw = 0
 vim.g.nvim_tree_hijack_netrw =0
 vim.g.nvim_tree_add_trailing = 1
 vim.g.nvim_tree_group_empty = 1
 vim.g.nvim_tree_lsp_diagnostics = 1
 vim.g.nvim_tree_disable_window_picker = 1
 vim.g.nvim_tree_hijack_cursor = 0
 vim.g.nvim_tree_icon_padding = ' '
 vim.g.nvim_tree_symlink_arrow = ' >> '
 vim.g.nvim_tree_update_cwd = 1
 vim.g.nvim_tree_respect_buf_cwd = 1
 vim.g.nvim_tree_refresh_wait = 500
 vim.g.nvim_tree_window_picker_exclude = [[{
        'filetype': [
          'notify',
          'packer',
          'qf'
        ],
        'buftype': [
          'terminal'
        ]
      }
 ]]
 vim.g.nvim_tree_special_files = [[{ 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 }]]
 vim.g.nvim_tree_show_icons = [[{
      'git': 1,
      'folders': 0,
      'files': 0,
      'folder_arrows': 0,
      }
 ]]
 vim.g.nvim_tree_icons = [[{
      'default': '',
      'symlink': '',
      'git': {
        'unstaged': "✗",
        'staged': "✓",
        'unmerged': "",
        'renamed': "➜",
        'untracked': "★",
        'deleted': "",
        'ignored': "◌"
        },
      'folder': {
        'arrow_open': "",
        'arrow_closed': "",
        'default': "",
        'open': "",
        'empty': "",
        'empty_open': "",
        'symlink': "",
        'symlink_open': "",
        },
        'lsp': {
          'hint': "",
          'info': "",
          'warning': "",
          'error': "",
        }
      }
 ]]

-- UltiSnips
vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.ultisnipssnippetsdir = '~/.dotfiles/nvim/snips/'
vim.g.ultisnipssnippetdirectories = 'snips'
vim.g.UltiSnipsExpandTrigger = '<C-j>'
vim.g.UltiSnipsJumpForwardTrigger = '<C-j>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-k>'
vim.g.UltiSnipsEditSplit = 'vertical'
vim.g.UltiSnipsListSnippets = '<C-Space>'
vim.g.UltiSnipsExpandTrigger="<tab>"
vim.g.UltiSnipsJumpForwardTrigger="<c-n>"
vim.g.UltiSnipsJumpBackwardTrigger="<c-p>"
vim.g.UltiSnipsEditSplit = 'horizontal'
