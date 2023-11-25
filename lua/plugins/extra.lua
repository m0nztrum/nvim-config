return {
	--          [Theme]
	{ "EdenEast/nightfox.nvim" },
	{ "catppuccin/nvim" },
	{ "davidosomething/vim-colors-meh" },
	{ "rebelot/kanagawa.nvim" },
	{ "akinsho/horizon.nvim", version = "*" },

	--        [Undo Tree]

	--      [Web devicons]
	"nvim-tree/nvim-web-devicons",

	--      [treesitter]

	-- Telescope

	{
		"Jezda1337/nvim-html-css",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("html-css"):setup()
		end,
	},

	{ "jose-elias-alvarez/null-ls.nvim" }, -- (for backup)

	--          [Git]
	"lewis6991/gitsigns.nvim", -- gitsigns
	"airblade/vim-gitgutter", -- gitgutter
	"tpope/vim-fugitive", -- fugitive
	"tpope/vim-rhubarb",

	--       [Markdown preview]
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	--      [vim cool]
	"romainl/vim-cool",

	--      [Transparent - allows for toggle]
	{ "xiyaowong/nvim-transparent" },

	--      [diffview]
	{ "sindrets/diffview.nvim" },

	--      [Smoothie]
	"psliwka/vim-smoothie",

	--      [commentry]
	"tpope/vim-commentary",

	--      [Vim Tex]
	"lervag/vimtex",

	{
		"David-Kunz/cmp-npm",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = "json",
		config = function()
			require("cmp-npm").setup({})
		end,
	},
}
