return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    dependencies = {
      -- LSP Support
      {
        "neovim/nvim-lspconfig",
        opts = {
          -- make sure mason installs the server
          servers = {
            jsonls = {
              -- lazy-load schemastore when needed
              on_new_config = function(new_config)
                new_config.settings.json.schemas = new_config.settings.json.schemas or {}
                vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
              end,
              settings = {
                json = {
                  format = {
                    enable = true,
                  },
                  validate = { enable = true },
                },
              },
            },
          },
        },
      }, -- Required
      {
        "williamboman/mason.nvim",
        opts = {
          ensure_installed = {
            "lua-language-server",
            "stylua",
            "html-lsp",
            "css-lsp",
            "prettier",
            "eslint-lsp",
            "gopls",
            "js-debug-adapter",
            "typescript-language-server",
            "tailwindcss-language-server",
            "angular-language-server",
          },
        },
      }, -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      {
        "hrsh7th/cmp-nvim-lsp",
      }, -- Required
      { "hrsh7th/cmp-buffer" }, -- Optional
      { "hrsh7th/cmp-path" }, -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" }, -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
    },
    opts = function()
      local lsp = require("lsp-zero")

      lsp.preset("recommended")

      lsp.ensure_installed({
        "tsserver",
        "eslint",
        "lua_ls",
        "rust_analyzer",
      })

      local cmp = require("cmp")

      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })

      lsp.set_preferences({
        sign_icons = {},
      })

      lsp.setup_nvim_cmp({
        mapping = cmp_mappings,
      })

      lsp.on_attach(function(client, bufnr)
        print(client.name)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "<leader>gd", function()
          vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>vws", function()
          vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>vd", function()
          vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "[d", function()
          vim.diagnotic.goto_next()
        end, opts)
        vim.keymap.set("n", "d]", function()
          vim.diagnotic.goto_prev()
        end, opts)

        vim.keymap.set("n", "<leader>vca", function()
          vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>vrr", function()
          vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>vrn", function()
          vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("n", "<C-h>", function()
          vim.lsp.buf.signature_help()
        end, opts)
      end)

      lsp.setup()

      vim.diagnostic.config({
        virtual_text = true,
      })
    end,
  },
}
