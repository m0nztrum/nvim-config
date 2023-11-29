return {
	"b0o/incline.nvim",
	event = "BufReadPre",
	priority = 1200,
	enabled = false,
	config = function()
		local incline = require("incline")
		incline.setup({})
	end,
}
