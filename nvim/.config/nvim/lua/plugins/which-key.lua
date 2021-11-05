local wk = require('which-key')
wk.setup()
wk.register({
	["<leader>"] = {
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
		c = {"<cmd>:so ~/.config/nvim/init.lua<cr>", "Reload Config"},
	},
})
