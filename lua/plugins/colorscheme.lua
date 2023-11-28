return {

	{
		"catppuccin/nvim",
		priority = 1000,
	},

	{
		"davidosomething/vim-colors-meh",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("meh")
		end,
	},
	{ "rebelot/kanagawa.nvim", priority = 1000 },
	{ "lunarvim/horizon.nvim", priority = 1000 },
	{ "rose-pine/neovim", priority = 1000 },

	{
		"ellisonleao/gruvbox.nvim",
		priority = 500,

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
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = true,
				transparent_mode = true,
			})
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
