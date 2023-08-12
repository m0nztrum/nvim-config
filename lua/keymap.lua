-- Set leader key
vim.g.mapleader = " "

-- Toggle line numbers
vim.keymap.set("n", "<leader>n", ":set invnumber invrelativenumber<CR>")

-- Run the current line as a shell command, replace with the output
vim.keymap.set("n", "Q", "!!zsh<CR>")

--vim.keymap.set("n", "<leader><TAB>", ":set invlist<CR>")
-- Disable the arrow keys
vim.keymap.set("n", "<Left>", ":echo 'use h twat'<CR>")
vim.keymap.set("n", "<Right>", ":echo 'use l twat'<CR>")
vim.keymap.set("n", "<Up>", ":echo 'use k twat'<CR>")
vim.keymap.set("n", "<Down>", ":echo 'use j twat'<CR>")
