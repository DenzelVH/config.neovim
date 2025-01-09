return {
  {
    "alexghergh/nvim-tmux-navigation",
    enabled = true,
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")

      nvim_tmux_nav.setup({
        disable_when_zoomed = true,
      })

      vim.keymap.set("n", "<M-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<M-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<M-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<M-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set("n", "<M-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set("n", "<M-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        callback = function()
          local cwd = vim.fn.getcwd()
          local root_folder = vim.fn.fnamemodify(cwd, ":t")
          if root_folder ~= "" then
            vim.fn.system("tmux rename-window " .. root_folder)
          end
        end,
      })

      vim.api.nvim_create_autocmd({ "BufDelete", "VimLeave" }, {
        pattern = "*",
        callback = function()
          vim.fn.system("tmux rename-window ''")
        end,
      })
    end,
  },
}
