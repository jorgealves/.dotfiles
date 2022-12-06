local ok, whichkey = pcall(require, 'which-key')

if not ok then
  error('whichkey not loaded')
end

whichkey.setup({
  window = {
    border = "single", -- none, single, double, shadow
  },
})


whichkey.register({
  [" "] = {
    [" "] = {
      name = "+Others",
      t = {"<cmd>Telescope<cr>", "Telescope"},
      m = {"<cmd>Mason<cr>","Mason"}
    },
    ["<tab>"] = {"<cmd>NvimTreeToggle<cr>","NvimTree"},
    t = {"<cmd>ToggleTerm<cr>", "Terminal"},
    p = {
      name = "+Packer",
      s = {"<cmd>PackerSync<cr>","PackerSync"},
    },
    f = {
      name = "+Find",
      g = {"<cmd>Telescope live_grep<cr>","Live Grep"},
      s = {"<cmd>Telescope grep_string<cr>","Search string"},
      f = {"<cmd>Telescope find_files<cr>", "Find File" },
      b = {"<cmd>Telescope file_browser<cr>", "File Browser"},
      r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      n = {"<cmd>enew<cr>", "New File" },
    },
  },
})
