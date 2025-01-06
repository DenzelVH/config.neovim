return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-treesitter/nvim-treesitter-context" },
    config = function()
      local fzf = require("fzf-lua")

      fzf.setup({
        winopts = {
          width = 0.95,
          height = 0.90,
          preview = {
            horizontal = "right:45%"
          }
        },
      })
      vim.keymap.set("n", "<space><space>", fzf.files)
      vim.keymap.set("n", "<space>.", function()
        fzf.files({ cwd = vim.fn.expand("%:p:h") })
      end)
      vim.keymap.set("n", "<space>,", fzf.buffers)
      vim.keymap.set("n", "<space>fr", fzf.oldfiles)
      vim.keymap.set("n", "<space>/", fzf.live_grep_native)
      vim.keymap.set("n", "<space>sd", function()
        fzf.live_grep_native({ cwd = vim.fn.expand("%:p:h") })
      end)
      vim.keymap.set("n", "<space>hk", fzf.keymaps)
      vim.keymap.set("n", "<space>hm", fzf.manpages)
      vim.keymap.set("n", "<space>hi", fzf.helptags)
      vim.keymap.set("n", "<space>ct", fzf.treesitter)
      vim.keymap.set("n", "<space>gb", fzf.git_branches)
      vim.keymap.set("n", "<space>gB", function()
        fzf.git_blame({
          winopts = {
            height  = 1.0,
            width   = 1.0,
            preview = {
              layout = 'vertical'
            }
          },
        })
      end)
    end,
  },
}
