return {

	--      Incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},
	{ "tpope/vim-commentary" },

	{ "nvim-tree/nvim-web-devicons" },

	{
		"folke/flash.nvim",
		enabled = false,
		opts = {
			search = {
				foward = true,
				multi_window = false,
				wrap = false,
				incremental = true,
			},
		},
	},

	{
		"simrat39/symbols-outline.nvim",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		cmd = "SymbolsOutline",
		opts = {
			position = "right",
		},
	},
}
