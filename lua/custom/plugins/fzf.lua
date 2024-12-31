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
            horizontal = "right:40%"
          }
        },
      })
      vim.keymap.set("n", "<space>.", fzf.files)
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
    end,
  },
}
