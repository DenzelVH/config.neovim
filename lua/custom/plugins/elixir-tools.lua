return {
  {
    "elixir-tools/elixir-tools.nvim",
    enable = false,
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup({
        nextls = { enable = false },
        elixirls = {
          cmd = "elixir-ls",
          enable = true,
          settings = elixirls.settings({
            dialyzerEnabled = false,
            enableTestLenses = true,
          }),
          on_attach = function(client, bufnr)
            -- vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            -- vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        },
        projectionist = {
          enable = true,
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "tpope/vim-projectionist",
    },
  },
}
