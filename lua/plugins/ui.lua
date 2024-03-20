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

			kitty = {
				enabled = false,
				font = "+4",
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		opts = {},
		config = function()
			local ibl = require("ibl")

			ibl.setup({
				scope = { enabled = true },
			})
		end,
	},
}
