return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-smart-history.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-frecency.nvim",
      "kkharji/sqlite.lua",
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

        defaults = {

          history = {
            path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
            limit = 500,
          },
        },
        extensions = {
          fzf = {},
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      local telescope = require("telescope")
      telescope.load_extension("frecency")
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
      telescope.load_extension("smart_history")

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<space>.", builtin.find_files)
      vim.keymap.set("n", "<space>,", builtin.buffers)
      vim.keymap.set("n", "<space>/", builtin.live_grep)
      vim.keymap.set("n", "<space><space>", builtin.git_files)
      vim.keymap.set("n", "<space>fR", builtin.oldfiles)
      vim.keymap.set("n", "<space>fr", "<CMD>Telescope frecency<CR>")
      vim.keymap.set("n", "<space>hi", builtin.help_tags)
      vim.keymap.set("n", "<space>sf", builtin.current_buffer_fuzzy_find)

      vim.keymap.set("n", "<space>sd", function()
        require("telescope.builtin").live_grep({
          cwd = require("telescope.utils").buffer_dir(),
        })
      end)

      vim.keymap.set("n", "<space>fp", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end)

      vim.keymap.set("n", "<space>fP", function()
        require("telescope.builtin").find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        })
      end)
    end,

    vim.keymap.set("n", "<space>pp", function()
      require("telescope.builtin").find_files({
        cwd = "~/Projects/Verihubs/",
      })
    end),
  },
}
