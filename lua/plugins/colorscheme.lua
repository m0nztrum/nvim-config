return {

	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},

	{
		"davidosomething/vim-colors-meh",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("meh")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("kanagawa")
		end,
	},
	{
		"lunarvim/horizon.nvim",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("horizon")
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,

		config = function()
			local gruv = require("gruvbox")
			gruv.setup({
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "soft", -- can be "hard", "soft" or empty string
				paletteoverrides = {},
				overrides = {},
				dim_inactive = true,
				transparent_mode = true,
			})
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local solarized = require("solarized-osaka")
			solarized.setup({
				transparent_ = true,
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = true },

					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "transparent", -- style for sidebars, see below
					floats = "transparent", -- style for floating windows
				},
			})
		end,
	},
}
