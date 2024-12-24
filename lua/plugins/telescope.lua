return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    keys = {
      { mode = "n", "<leader>pf", require("telescope.builtin").find_files },
      { mode = "n", "<C-p>", require("telescope.builtin").git_files },
      {
        mode = "n",
        "<leader>ps",
        function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("Get-ChildItem | Select-String -Pattern ") })
        end,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
    },
  },
}
