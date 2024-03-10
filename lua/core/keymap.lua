-- Set leader key to space

local keymap = vim.keymap -- for conciseness

-- Toggle line numbers
keymap.set("n", "<leader>n", ":set invnumber invrelativenumber<CR>")

-- Disable the arrow keys
keymap.set("n", "<Left>", ":echo 'use h twat'<CR>")
keymap.set("n", "<Right>", ":echo 'use l twat'<CR>")
keymap.set("n", "<Up>", ":echo 'use k twat'<CR>")
keymap.set("n", "<Down>", ":echo 'use j twat'<CR>")

-- some line movement
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")

-- Split window
keymap.set("n", "se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { desc = "Make vertical split" }, { silent = true })
keymap.set("n", "ss", ":split<Return>", { desc = "Make horizontal split" }, { silent = true })

-- Move to window
keymap.set("n", "sh", "<C-w>h", { desc = "Move window left" })
keymap.set("n", "sk", "<C-w>k", { desc = "Move window up" })
keymap.set("n", "sj", "<C-w>j", { desc = "Move window down" })
keymap.set("n", "sl", "<C-w>l", { desc = "Move window right" })

--  Lazy UI and Mason UI
keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Open Lazy UI" })
keymap.set("n", "<leader>M", "<cmd>Mason<CR>", { desc = "Open Mason UI" })

--  Some base stuff exit and quit
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save current buffer" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "quit current buffer" })

-- select all
keymap.set("n", "<C-s>", "gg<S-v>G")

--  Resizing windows
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Do not yank when x is pressed
keymap.set("n", "x", '"_x')

-- Render markdown using Markdown preview
keymap.set("n", "<leader>md", "<cmd>MarkdownPreview<CR>", { desc = "Render current markdown file" })
