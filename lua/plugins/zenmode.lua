return {

	"folke/zen-mode.nvim",
	config = function()
		local keymap = vim.keymap
		local zenmode = require("zenmode")

		zenmode.setup({
			kitty = {
				enabled = false,
				font = "+4",
			},
		})
		keymap.set("n", "<leader>z", function()
			zenmode.toggle()
		end, { desc = "Toggle zenmode" })
	end,
}
