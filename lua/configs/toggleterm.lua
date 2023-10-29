local keymap = vim.keymap
local toggleterm = require("toggleterm")

keymap.set("n", "<leader>ft", vim.cmd.ToggleTerm)

local Direction = {
	horizontal = "horizontal",
	vertical = "vertical",
	tab = "tab",
	float = "float",
}

toggleterm.setup({
	direction = Direction.float,
	hide_numbers = true,
	start_in_insert = true,
	close_on_exit = true,
	float_opts = {
		border = "curved",
	},
})

vim.cmd([[
tnoremap <ESC> <C-\><C-n>
]])
