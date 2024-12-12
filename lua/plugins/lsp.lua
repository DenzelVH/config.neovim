return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },

      {
        "saghen/blink.cmp",
        lazy = false,
        version = "v0.*",
        dependencies = "rafamadriz/friendly-snippets",
        opts = {
          keymap = { preset = "default" },
          completion = { accept = { auto_brackets = { enabled = true } } },
        },
      },
    },
    -- Setup language server here
    opts = {
      servers = {
        lua_ls = {},
        elixirls = {
          cmd = { "elixir-ls" },
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        lspconfig[server].setup(config)
      end
    end,
  },
}
