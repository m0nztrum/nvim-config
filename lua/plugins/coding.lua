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

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local autopairs = require("nvim-autopairs")

			autopairs.setup({
				disable_filetype = { "TelescopePrompt", "vim" },
				enable_check_bracket_line = true,
			})
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}
