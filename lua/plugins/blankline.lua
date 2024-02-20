return {
	"lukas-reineke/indent-blankline.nvim",
	opts = {},
	config = function()
		local ibl = require("ibl")

		ibl.setup({
			scope = { enabled = true },
		})
	end,
}
