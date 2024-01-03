return {
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

	{

		"folke/zen-mode.nvim",
		opts = {

			kitty = {
				enabled = false,
				font = "+4",
			},
		},
	},

	-- filename
	{
		"b0o/incline.nvim",
		dependencies = { "craftzdog/solarized-osaka.nvim" },
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local colors = require("solarized-osaka.colors").setup()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
						InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},

	--      wilder
	{
		"gelguy/wilder.nvim",
		enabled = true,
		config = function()
			local wilder = require("wilder")
			wilder.setup({
				modes = { ":", "/", "?" },
			})

			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
					highlighter = wilder.basic_highlighter(),
					left = { " ", wilder.popupmenu_devicons() },
					right = { " ", wilder.popupmenu_scrollbar() },
					-- 'single', 'double', 'rounded' or 'solid'
					max_height = "50%",
					min_height = "0",
					pumblend = 0,
					border = "rounded",
					prompt_position = "bottom",
					reverse = 0,
				}))
			)
		end,
	},

	{ "romainl/vim-cool" },

	{ "xiyaowong/nvim-transparent" },

	{ "psliwka/vim-smoothie" },
	{
		"folke/twilight.nvim",
		config = function()
			local twilight = require("twilight")
			twilight.setup({
				dimming = {
					alpha = 0.6,
				},
			})
		end,
	},
}
