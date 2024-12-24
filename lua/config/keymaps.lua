-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

--used to execute Ex commands
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--used to move the selection and indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- moves up and centralizes the cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--move down and centralize the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")

--Moves to the next search result and centralizes the line
vim.keymap.set("n", "n", "nzzzv")
--Moves to the anterior search result and centralizes the line
vim.keymap.set("n", "N", "Nzzzv")

-- appends the current line with the line below
vim.keymap.set("n", "J", "mzJ`z")
--delete the selection and pastes the value of the register
--does not change the value on the register
--meaning that you don`t change what is going to be pasted when you press p
--Well, pasted the value over the selection without losing it
--so you can paste it again
vim.keymap.set("x", "<leader>p", [["_dP]])

--copy the text selected to the clipboard so you can past outside nvim
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

--copy the whole line to the clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- deletes selection without changing the default register
-- it means that you can delete a selection and not paste it if press p
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- deactivate Q function
vim.keymap.set("n", "Q", "<nop>")

--format the code of the current buffer
--using the language server
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--goes to the next item in the quickfix list and central the cursor
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

--goes to the anterior item in the quickfix list and centralizes the cursor
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

--goes to the next error in the list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

--goes to the anterior error in the list
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--allows you to search the a word and change all occurrencies
--it searchs for the word the cursor is over
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--used to turn the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--load and executes an config file
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
