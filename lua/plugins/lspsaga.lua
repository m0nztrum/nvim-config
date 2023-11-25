return {
	"nvimdev/lspsaga.nvim", -- LSP UIs

	config = function()
		local saga = require("lspsaga")
		saga.setup({
			symbol_in_winbar = {
				enable = true,
				separator = " > ",
				show_file = true,
				delay = 400,
				color_mode = true,
			},
			outline = {
				layout = "float",
			},
			lightbulb = {
				enable = false,
				sign = false,
			},
		})
	end,
}
