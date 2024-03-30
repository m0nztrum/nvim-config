return {
	"folke/flash.nvim",
	enabled = true,
	opts = {
		search = {
			foward = true,
			multi_window = false,
			wrap = false,
			incremental = true,
		},
	},
	keys = {
		{
			"<leader>ls",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"<leader>lS",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
	},
}
