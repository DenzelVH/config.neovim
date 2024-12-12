return {
  {
    "NeogitOrg/neogit",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local neogit = require("neogit")
      neogit.setup({
        graph_style = "unicode",
      })

      vim.keymap.set("n", "<leader>gg", "<CMD>Neogit<CR>")
    end,
  },
}
