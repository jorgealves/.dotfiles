
-- Hi!
--
-- The purpose of this config is an attempt to create the easiest way my mind can read and understand
-- how nvim config in lua work and how it should work
--
-- First, I'm going to define the order of the configs with the following structure:
--
-- 	- Editor Settings
-- 	- Scheme Settings
-- 	- Global Nvim Keymaps
-- 	- Autocommands
-- 	- Plugins
-- 	  This plugin section will define the multiple plugins I need to my workflow, and I will define
-- 	  a separated file per plugin installed, with the following structure
-- 	  - Plugin install call
-- 	  - Setup Call
-- 	  - Custom plugin configs
-- 	  - plugin keymaps
--
--

-- SETTINGS
--
vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.completeopt = [[menu,menuone,noselect]]
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 300
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.listchars.tab= "»"
vim.opt.listchars.extends="›"
vim.opt.listchars.precedes="‹"
vim.opt.listchars.nbsp="·"
vim.opt.listchars.trail="·"
vim.opt.wrap = false

-- THEME
--
vim.opt.termguicolors = true
vim.cmd('colorscheme gruvbox-material')

-- PLUGINS
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'sainnhe/gruvbox-material'
  use 'editorconfig/editorconfig-vim'
  use 'Pocco81/AutoSave.nvim'
  use 'b3nj5m1n/kommentary'
  use 'folke/which-key.nvim'
  use {
    'nvim-telescope/telescope.nvim',
     requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {
	auto_close = true,
	diagnostics = {
	  enable = true,
	},
	filters = {
	  dotfiles = true,
	},
	view = {
	  auto_resize = true,
	}
    } end
}
  use {'nvim-treesitter/nvim-treesitter',run = ':TSUpdate'}
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  use 'Pocco81/DAPInstall.nvim'
  use 'mfussenegger/nvim-dap'
  use 'nvim-telescope/telescope-dap.nvim'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'theHamsta/nvim-dap-virtual-text'
  use 'mfussenegger/nvim-dap-python'
  use 'leoluz/nvim-dap-go'
  use 'nvim-lua/lsp-status.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'folke/lsp-colors.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  use 'yamatsum/nvim-cursorline'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        use_diagnostic_signs = true,
      }
    end
  }
  use 'windwp/nvim-autopairs'
  use 'folke/todo-comments.nvim'
  use 'sbdchd/neoformat'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-nvim-lua'
  use 'akinsho/toggleterm.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Plugin Setup
require'autosave'.setup({
  auto_close = true
})
local wk = require('which-key')
wk.setup()
wk.register({
	["<leader>"] = {
    T = {
      name = "+ToggleTerm",
      T = {"<cmd>:ToggleTerm<cr>","Float"},
      h = {"<cmd>:ToggleTerm direction=horizontal<cr>","Horizontal"},
      v = {"<cmd>:ToggleTerm direction=vertical<cr>","Vertical"},
    },
		t = {
			name = "+Telescope",
			t = {"<cmd>:Telescope<cr>", "Telescope", noremap=true},
			s = {"<cmd>:Telescope live_grep<cr>", "Live Grep", noremap=true},
			r = {"<cmd>:Telescope registers<cr>", "Registers", noremap=true},
			m = {"<cmd>:Telescope marks<cr>", "Marks", noremap=true},
			j = {"<cmd>:Telescope jumplist<cr>", "Jumplist", noremap=true},
			c = {"<cmd>:Telescope commands<cr>", "Commands", noremap=true},
			h = {"<cmd>:Telescope help_tags<cr>", "Help Tags", noremap=true},
			v = {"<cmd>:Telescope vim_options<cr>", "VIM Options", noremap=true},
		},
		g = {
			name = "+Git",
			b = {"<cmd>:Telescope git_branches<cr>", "Branches"},
			s = {"<cmd>:Telescope git_status<cr>", "Status"},
			c = {"<cmd>:Telescope git_commits<cr>", "Commits"},
		},
		s = {
			name = "+Search",
			f = {"<cmd>:Telescope find_files<cr>","Find Files",noremap = true},
			F = {"<cmd>:Telescope file_browser<cr>", "File Browser", noremap=true},
			s = {"<cmd>:Telescope live_grep<cr>", "Live Grep", noremap=true},
			S = {"<cmd>:Telescope grep_string<cr>", "Grep String", noremap=true},
		},
		p = {
			name = "+Packer",
			s = {"<cmd>:PackerSync<cr>", "Sync"},
		},
		w = {"<cmd>:w<cr>", "Save"},
		["<TAB>"] = {"<cmd>:NvimTreeToggle<cr>","Toggle File Explorer"},
		C = {
      name = "+NvimConfig",
      r = {"<cmd>:so ~/.config/nvim/init.lua<cr>", "Reload Config"},
      o = {"<cmd>:tabnew ~/.config/nvim/init.lua<cr>", "Open Config"},
    },
    b = {
      name = "+Buffer",
      c = {"<cmd>:q<cr>","Close"}
    },
	},
})
local telescope = require('telescope')
telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}
telescope.load_extension('fzf')

require'nvim-treesitter.configs'.setup {
	ensure_install = 'all',
	sync_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end


local lsp_installer = require("nvim-lsp-installer")
local lsp_servers = {
  "angularls",
  "ansiblels",
  "bashls",
  "clangd",
  "cmake",
  "cssmodules_ls",
  "denols",
  "diagnosticls",
  "dockerls",
  "dotls",
  "eslint",
  "emmet_ls",
  "gopls",
  "grammarly",
  "graphql",
  "html",
  "hls",
  "jsonls",
  "jdtls",
  "jsonnet_ls",
  "sumneko_lua",
  "remark_ls",
  "ocamlls",
  "spectral",
  "pyright",
  "rust_analyzer",
  "sqlls",
  "sqls",
  "esbonio",
  "stylelint_lsp",
  "svelte",
  "taplo",
  "tailwindcss",
  "terraformls",
  "tflint",
  "tsserver",
  "vimls",
  "vuels",
  "yamlls"
}

for _, name in pairs(lsp_servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in ipairs(lsp_servers) do
  if lsp == 'sumneko_lua' then
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")
    nvim_lsp[lsp].setup {
      on_attach=on_attach,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    }
  else
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end

end

local dap_install = require("dap-install")

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

function Launch_go_debugger(args)
    local dap = require "dap"
    -- The adapter has not been started yet.
    -- Spin it up.
    goLaunchAdapter = {
        type = "executable";
        command = "node";
        args = {os.getenv("HOME") .. "/vscode-go/dist/debugAdapter.js"};
    }

    goLaunchConfig = {
        type = "go";
        request = "attach";
        mode = "remote";
        name = "Remote Attached Debugger";
        dlvToolPath = os.getenv('HOME') .. "/go/bin/dlv";  -- Or wherever your local delve lives.
        remotePath = "/workspace";
        port = 8080;
        cwd = vim.fn.getcwd();
   }
   -- If you want you can even have nvim be responsible for the `delve` launch step above:
   --  vim.fn.system({"${some_script_that_starts_dlv_in_your_container}", ${script_args})
   local session = dap.launch(goLaunchAdapter, goLaunchConfig);
    if session == nil then
        io.write("Error launching adapter");
    end
    dap.repl.open()
end

function Attach_python_debugger(args)
    local dap = require "dap"
    local host = vim.fn.input('Host: ','','0.0.0.0')
    local port = vim.fn.input('Port: ','','8080')
    -- You can even make nvim responsible for starting the debugpy server/adapter:
    --  vim.fn.system({"${some_script_that_starts_debugpy_in_your_container}", ${script_args}})
    pythonAttachAdapter = {
        type = "server";
        host = host;
        port = tonumber(port);
    }
    pythonAttachConfig = {
        type = "python";
        request = "attach";
        connect = {
            port = tonumber(port);
            host = host;
        };
        mode = "remote";
        name = "Remote Attached Debugger";
        cwd = vim.fn.getcwd();
        pathMappings = {
            {
                localRoot = vim.fn.getcwd(); -- Wherever your Python code lives locally.
                remoteRoot = "/workspace"; -- Wherever your Python code lives in the container.
            };
        };
    }
    local session = dap.attach(host, tonumber(port), pythonAttachConfig)
    if session == nil then
        io.write("Error launching adapter");
    end
    dap.repl.open()
end

require'nvim-dap-virtual-text'.setup()
require'dapui'.setup()
require'dap-python'.setup()
require'dap-go'.setup()
require'lsp-status'.register_progress()
require'lualine'.setup()
require'lsp-colors'.setup()
require'colorizer'.setup()
require'gitsigns'.setup()
require'null-ls'.setup()

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
for _,name in ipairs(lsp_servers) do
nvim_lsp[name].setup{
  capabilities = capabilities
}
end


require'toggleterm'.setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    elseif term.direction == "float" then
      return 20
    end
  end,
  open_mapping = [[<c-t>]],
  -- on_open = fun(t: Terminal), -- function to run when the terminal opens
  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved',
    width = 150,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

require'nvim-autopairs'.setup {
  check_ts = true,
}



