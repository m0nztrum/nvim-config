vim.cmd([[tnoremap <ESC> <C-\><C-n>]])

return {
	"akinsho/toggleterm.nvim",
	config = function()
		local keymap = vim.keymap
		local toggleterm = require("toggleterm")
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
		keymap.set("n", "<leader>ft", vim.cmd.ToggleTerm, { desc = "Open floating term" })
	end,
}
