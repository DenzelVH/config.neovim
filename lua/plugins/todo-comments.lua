return {
  {
    "folke/todo-comments.nvim",
    enabled = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
      vim.keymap.set("n", "<leader>t", "<CMD>TodoTelescope keywords=TODO,FIX<CR>")
      vim.keymap.set("n", "<leader>T", "<CMD>TodoTelescope<CR>")
      require("todo-comments").setup()
    end,
  },
}
