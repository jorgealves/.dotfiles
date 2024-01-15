return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function ()
      require('toggleterm').setup()
      vim.keymap.set('n', "<c-t>" ,"<cmd>:ToggleTerm<cr>", {})
    end
  },
}
