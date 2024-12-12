return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            theme = "ivy",
          },

          git_files = {
            theme = "ivy",
          },

          help_tags = {},

          live_grep = {
            theme = "ivy",
          },

          current_buffer_fuzzy_find = {
            theme = "ivy",
          },

          buffers = {
            theme = "ivy",
          },
        },
        extensions = {
          fzf = {},
        },
      })

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<space>.", builtin.find_files)
      vim.keymap.set("n", "<space>,", builtin.buffers)
      vim.keymap.set("n", "<space>/", builtin.live_grep)
      vim.keymap.set("n", "<space><space>", builtin.git_files)
      vim.keymap.set("n", "<space>fr", builtin.oldfiles)
      vim.keymap.set("n", "<space>hi", builtin.help_tags)
      vim.keymap.set("n", "<space>sf", builtin.current_buffer_fuzzy_find)
    end,
  },
}
