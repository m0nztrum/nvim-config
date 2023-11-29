return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	enabled = false,

	config = function()
		local noice = require("noice")
		noice.setup({
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
			},
			popupmenu = {
				enabled = true,
				backend = "cmp",
			},
			notify = {
				enabled = true,
				view = "notify",
			},
			presets = {
				lsp_doc_border = true,
				command_palette = true,
			},
		})
	end,
}
