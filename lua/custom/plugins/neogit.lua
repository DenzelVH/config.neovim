return {
  {
    "NeogitOrg/neogit",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      -- "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
    },
    config = function()
      local neogit = require("neogit")
      neogit.setup({
        graph_style = "unicode",
        mappings = {
          popup = {
            -- Make it similar to Magit
            ["p"] = "PushPopup",
            ["F"] = "PullPopup",
          },
        },
      })

      vim.keymap.set("n", "<leader>gg", "<CMD>Neogit<CR>")
    end,
  },
}
