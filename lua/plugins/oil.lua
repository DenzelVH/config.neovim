return {
  {
    "stevearc/oil.nvim",
    enabled = true,
    dependencies = { { "echasnovski/mini.nvim", opts = {} } },
    config = function()
      local oil = require("oil")
      oil.setup({
        columns = {
          "icon",
          -- "permissions",
          "size",
          "mtime",
        },
        use_default_keymaps = true,
        view_options = {
          show_hidden = true,
        },
        delete_to_trash = true,
      })

      vim.keymap.set("n", "<leader>ff", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
}
