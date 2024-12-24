return {
  { "nvim-treesitter/playground" },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "javascript",
          "typescript",
          "c",
          "python",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "json5",
        },

        sync_install = false,

        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
}
