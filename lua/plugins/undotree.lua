--      keybinds
local keymap = vim.keymap

-- Toggle undotree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
