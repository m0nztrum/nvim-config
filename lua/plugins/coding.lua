return {
	{ "nvim-tree/nvim-web-devicons" },

	{ "tpope/vim-commentary" },

	{
		"smjonas/inc-rename.nvim",
		config = true,
		keys = { { "<leader>rw", ":IncRename " } },
	},

	-- nvim surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	{
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

	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		keys = {
			{
				"<leader>r",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
		},
		opts = {},
	},
}
