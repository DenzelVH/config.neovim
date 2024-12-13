return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    opts = {
      servers = {
        lua_ls = {},
        -- elixirls = {
        --   cmd = { "elixir-ls" },
        -- },
        lexical = {
          cmd = { "~/.local/share/nvim/mason/bin/lexical" },
        },
        yamlls = {},
        jsonls = {},
        terraformls = {},
        tailwindcss = {
          init_options = {
            userLanguages = {
              elixir = "phoenix-heex",
              eruby = "erb",
              heex = "phoenix-heex",
            },
          },
          settings = {
            tailwindCSS = {
              includeLanguages = {
                elixir = "phoenix-heex",
                eelixir = "phoenix-heex",
                heex = "phoenix-heex",
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

      require("mason").setup()
      require("mason-lspconfig").setup()

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function()
          local builtin = require("telescope.builtin")

          vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
          vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
          vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
          vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
          vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = 0 })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
          vim.keymap.set("n", "<leader>wd", builtin.lsp_document_symbols, { buffer = 0 })
        end,
      })
    end,
  },
}
