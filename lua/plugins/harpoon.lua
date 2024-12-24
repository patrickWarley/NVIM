return {
  {
    "ThePrimeagen/harpoon",
    keys = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      return {
        { mode = "n", "<leader>a", mark.add_file },
        { mode = "n", "<C-e>", ui.toggle_quick_menu },

        {
          mode = "n",
          "<C-h>",
          function()
            ui.nav_file(1)
          end,
        },
        {
          mode = "n",
          "<C-t>",
          function()
            ui.nav_file(2)
          end,
        },
        {
          mode = "n",
          "<C-n>",
          function()
            ui.nav_file(3)
          end,
        },
        {
          mode = "n",
          "<C-s>",
          function()
            ui.nav_file(4)
          end,
        },
      }
    end,
  },
}
