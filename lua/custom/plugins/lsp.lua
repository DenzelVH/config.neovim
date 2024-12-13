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
        yamlls = {},
        jsonls = {},
        terraformls = {},
        tailwindcss = {
          settings = {
            tailwindCSS = {
              includeLanguages = {
                elixir = "html-eex",
                eelixir = "html-eex",
                heex = "html-eex",
              },
            },
          },
        },
        emmet_language_server = {
          filetypes = {
            "css",
            "eelixir",
            "elixir",
            "heex",
            "html",
            "less",
          },
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
}
