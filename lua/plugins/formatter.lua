return {
  {
    "stevearc/conform.nvim",
    enabled = true,
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          ex = { "mix" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end,
  },
}
