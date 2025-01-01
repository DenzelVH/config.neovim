return {
  {
    "folke/todo-comments.nvim",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
      vim.keymap.set("n", "<leader>t", "<CMD>TodoFzfLua keywords=TODO,FIX<CR>")
      vim.keymap.set("n", "<leader>T", "<CMD>TodoFzfLua<CR>")
      require("todo-comments").setup()
    end,
  },
}
