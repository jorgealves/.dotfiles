local ok, whichkey = pcall(require, 'which-key')

if not ok then
  error('error loading whichkey')
  return
end

whichkey.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  W = {"<cmd>Bdelete!<cr>", "Force close buffer"},
	c = {
		name = "+Code",
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    s = {
      name = "+Saga",
		  S = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics" },
		  c = { "<cmd>Lspsaga code_action<cr>", "Code Actions" },
		  h = { "<cmd>Lspsaga hover_doc<cr>", "Hover" },
		  s = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
		  p = { "<cmd>Lspsaga preview_signature<cr>", "Preview" },
		  r = { "<cmd>Lspsaga rename<cr>", "Rename" },
    },
	},
	T = {
		name = "+ToggleTerm",
		T = { "<cmd>ToggleTerm<cr>", "Float" },
		h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm direction=vertical<cr>", "Vertical" },
	},
	t = {
		name = "+Telescope",
		t = { "<cmd>Telescope<cr>", "Telescope", noremap = true },
		f = { "<cmd>Telescope find_files<cr>", "Files", noremap = true },
		s = { "<cmd>Telescope live_grep<cr>", "Live Grep", noremap = true },
		r = { "<cmd>Telescope registers<cr>", "Registers", noremap = true },
		m = { "<cmd>Telescope marks<cr>", "Marks", noremap = true },
		j = { "<cmd>Telescope jumplist<cr>", "Jumplist", noremap = true },
		c = { "<cmd>Telescope commands<cr>", "Commands", noremap = true },
		h = { "<cmd>Telescope help_tags<cr>", "Help Tags", noremap = true },
		v = { "<cmd>Telescope vim_options<cr>", "VIM Options", noremap = true },
		b = { "<cmd>Telescope colorscheme<cr>", "Themes", noremap = true },
	},
	g = {
		name = "+Git",
		b = { "<cmd>Telescope git_branches<cr>", "Branches" },
		s = { "<cmd>Telescope git_status<cr>", "Status" },
		c = { "<cmd>Telescope git_commits<cr>", "Commits" },
	},
	s = {
		name = "+Search",
		f = { "<cmd>Telescope find_files<cr>", "Find Files", noremap = true },
		F = { "<cmd>Telescope file_browser<cr>", "File Browser", noremap = true },
		s = { "<cmd>Telescope live_grep<cr>", "Live Grep", noremap = true },
		S = { "<cmd>Telescope grep_string<cr>", "Grep String", noremap = true },
	},
	p = {
		name = "+Packer",
		s = { "<cmd>PackerSync<cr>", "Sync" },
	},
	e = { "<cmd>NvimTreeToggle<cr>", "Toggle File Explorer" },
	C = {
		name = "+NvimConfig",
		r = { "<cmd>so ~/.config/nvim/init.lua<cr>", "Reload Config" },
		o = { "<cmd>tabnew ~/.config/nvim/init.lua<cr>", "Open Config" },
	},
}

whichkey.register(mappings,opts)
