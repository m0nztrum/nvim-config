return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},

		config = function()
			local noice = require("noice")
			noice.setup({
				lsp = {
					hover = { enabled = false },
					signature = { enabled = false },
					progress = {
						enabled = true,
						throttle = 1000 / 30,
						view = "mini",
					},
					override = {
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = false,
					},
				},
				presets = {
					inc_rename = true,
					lsp_doc_border = false,
					long_message_to_split = true,
				},
				routes = {
					{ filter = { event = "notify", find = "No information available" }, skip = true },
					{ filter = { event = "msg_show", find = "search hit BOTTOM" }, skip = true },
					{ filter = { event = "msg_show", find = "written" }, skip = true },
					{ filter = { event = "msg_show", find = "search hit TOP" }, skip = true },
					{ filter = { event = "msg_show", find = "^E486: Pattern not found" }, view = "mini" },
					{ view = "cmdline", filter = { event = "msg_showmode" } },
				},
				views = {
					mini = {
						win_options = { winblend = 0 },
						timeout = 2000,
					},
					virtualtext = {
						backend = "virtualtext",
					},
					cmdline_popup = {
						position = {
							row = 5,
							col = "50%",
						},
						size = {
							width = "auto",
							height = "auto",
						},
					},
					popupmenu = {
						relative = "editor",
						position = {
							row = 8,
							col = "50%",
						},
						size = {
							width = "auto",
							height = "auto",
						},

						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
						},
					},
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
