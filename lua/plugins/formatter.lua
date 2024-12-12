-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#lazy-loading-with-lazynvim
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      elixir = { "elixirls" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = { timeout_ms = 500 },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
