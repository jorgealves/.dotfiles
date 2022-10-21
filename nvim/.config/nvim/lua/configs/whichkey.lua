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
    ["<tab>"] = {"<cmd>NvimTreeToggle<cr>","NvimTree"},
    P = {
      name = "+Packer",
      s = {"<cmd>PackerSync<cr>","PackerSync"},
    },
    s  = {}, 
    f = {
      name = "+File",
      b = {'<cmd>Telescope file_browser<cr>', "File Browser"},
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      n = { "<cmd>enew<cr>", "New File" },
    },
  },
})
