local keymap = vim.keymap -- for conciseness

-- Set leader key
vim.g.mapleader = " "

-- Toggle line numbers
keymap.set("n", "<leader>n", ":set invnumber invrelativenumber<CR>")

-- Run the current line as a shell command, replace with the output
keymap.set("n", "Q", "!!zsh<CR>")

--vim.keymap.set("n", "<leader><TAB>", ":set invlist<CR>")
-- Disable the arrow keys
keymap.set("n", "<Left>", ":echo 'use h twat'<CR>")
keymap.set("n", "<Right>", ":echo 'use l twat'<CR>")
keymap.set("n", "<Up>", ":echo 'use k twat'<CR>")
keymap.set("n", "<Down>", ":echo 'use j twat'<CR>")

-- window management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
