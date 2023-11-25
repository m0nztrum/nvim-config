vim.o.timeout = true
vim.o.timeoutlen = 300

return {
	"folke/which-key.nvim",
	event = "VeryLazy",

	config = function()
		local whickkey = require("whickkey")

		whickkey.setup({

			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
			window = {
				border = "single",
				winblend = 0,
			},
		})
	end,
}
