return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			-- you can enable a preset for easier configuration
			presets = {
				inc_rename = true,
				lsp_doc_border = false,
				long_message_to_split = true,
			},
			lsp = {
				signature = { enabled = false },
				hover = { enabled = false },
				overide = {
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = false,
				},
				progress = {
					enabled = false,
					throttle = 1000 / 30,
					view = "mini",
				},
			},
			routes = {
				{ filter = { event = "notify", find = "No information available" }, skip = true },
				{ filter = { event = "msg_show", find = "written" }, view = "mini" },
				{ filter = { event = "msg_show", find = "search hit TOP" }, skip = true },
				{ filter = { event = "msg_show", find = "^E486: Pattern not found" }, view = "mini" },
				{ filter = { event = "msg_show", find = "search hit BOTTOM" }, skip = true },
			},
			messages = {
				enabled = true,
				view = "notify", -- default view for messages
				view_error = "notify", -- view for errors
				view_warn = "notify", -- view for warnings
				view_history = "messages", -- view for :messages
				view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
			},
			views = {
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
						width = 25,
						height = "auto",
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = {
							Normal = "Normal",
							FloatBorder = "DiagnosticInfo",
						},
					},
				},
				mini = {
					win_options = { winblend = 0 },
				},
				virtualtext = {
					backend = "virtualtext",
				},
			},
		},
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
				timeout = 200,
				stages = "fade_in_slide_out",
			})
			vim.notify = notify
		end,
	},
}
