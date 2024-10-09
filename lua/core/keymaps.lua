local keymap = vim.keymap -- for conciseness
local opts = { silent = true }

-- Disable the arrow keys
-- keymap.set("n", "<Left>", ":echo 'use h'<CR>")
-- keymap.set("n", "<Right>", ":echo 'use l'<CR>")
-- keymap.set("n", "<Up>", ":echo 'use k'<CR>")
-- keymap.set("n", "<Down>", ":echo 'use j'<CR>")

--  Some base stuff: exit and quit
keymap.set("n", "<leader>ws", "<cmd>w<CR>", { desc = "Save current buffer" })
keymap.set("n", "<leader>wq", "<cmd>q<CR>", { desc = "[W]indow [Q]uit" })

-- Split window
keymap.set("n", "<leader>we", "<C-w>=", { desc = "[W]indow [E]qual" })
keymap.set("n", "<leader>wv", ":vsplit<Return><C-w>w", { desc = "[W]indow [V]ertical split" }, opts)
keymap.set("n", "<leader>wh", ":split<Return>", { desc = "[W]indow [H]orizontal split" }, opts)

-- Move to window
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move window left" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move window up" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move window down" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move window right" })

--  Resizing windows
keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- select all
keymap.set("n", "<C-s>", "gg<S-v>G")

-- Do not yank when x is pressed
keymap.set("n", "x", '"_x')

--
keymap.set("n", "<C-/>", "<cmd>noh<CR>")

--  Lazy UI and Mason UI
keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Open Lazy UI" })
keymap.set("n", "<leader>M", "<cmd>Mason<CR>", { desc = "Open Mason UI" })

-- Render markdown using Markdown preview
keymap.set("n", "<leader>map", "<cmd>MarkdownPreview<CR>", { desc = "[M][a]rkdown [P]review" })
