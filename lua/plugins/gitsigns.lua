return {
	"lewis6991/gitsigns.nvim",
	event = "BufEnter",
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true, -- Toggle with ':Gitsigns toggle_signs'
			current_line_blame = true,
		})
	end,
}
