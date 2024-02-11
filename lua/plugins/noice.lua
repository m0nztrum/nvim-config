return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		-- enabled = false,

		config = function()
			local noice = require("noice")
			noice.setup({
				lsp = {
					override = {
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = false,
					},
					hover = { enabled = false },
					progress = {
						enabled = true,
						throttle = 1000 / 30, -- frequency to update lsp progress message
						view = "mini",
					},
					signature = { enabled = false },
				},

				presets = {
					bottom_search = false,
					command_palette = true,
					long_message_to_split = true,
					lsp_doc_border = false,
				},
				routes = {
					{ filter = { event = "notify", find = "No information available" }, skip = true },
					{ filter = { event = "msg_show", find = "search hit BOTTOM" }, skip = true },
					{ filter = { event = "msg_show", find = "search hit TOP" }, skip = true },
					{ filter = { event = "msg_show", find = "^E486: Pattern not found" }, view = "mini" },
				},
				views = {
					mini = {
						win_options = { winblend = 0 },
						timeout = 2000,
					},
					virtualtext = {
						backend = "virtualtext",
					},
				},
				popupmenu = {
					enabled = true,
					backend = "nui",
				},
			})
		end,
	},

	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")
			notify.setup({
				background_colour = "#808080",
				fps = 30,
				icons = {
					DEBUG = "",
					ERROR = "",
					INFO = "",
					TRACE = "✎",
					WARN = "",
				},
				timeout = 1500,
				stages = "slide",
			})
			vim.notify = notify
		end,
	},
}
