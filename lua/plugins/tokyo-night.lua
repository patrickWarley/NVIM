return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd("colorscheme rose-pine")
      require("tokyonight").setup({
        style = "night",
        transparent = true,
      })
    end,
  },
}
