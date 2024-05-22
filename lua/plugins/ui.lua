return {

	-- transparent nvim
	{ "xiyaowong/nvim-transparent" },

	-- animations
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		config = function()
			local minianimate = require("mini.animate")
			minianimate.setup({})
		end,
	},

	-- zenmode
	{

		"folke/zen-mode.nvim",
		opts = {
			plugins = {

				kitty = {
					enabled = true,
					font = "+4",
				},
				options = {
					laststatus = 0,
				},
			},
			window = {
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = false,
				},
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},

	-- indent blankline
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			scope = { enabled = true },
		},
	},

	-- Twilight
	{
		"folke/twilight.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
