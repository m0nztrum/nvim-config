return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	enabled = false,

	config = function()
		local noice = require("noice")
		noice.setupe({
			lsp = {
				override = {
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},

			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
		})
	end,
}
