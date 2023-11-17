local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	--          [Theme]
	{ "ellisonleao/gruvbox.nvim", priority = 500 },
	{ "water-sucks/darkrose.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "rose-pine/neovim", name = "rose-pine", priority = 1000 },
	{ "catppuccin/nvim" },
	{ "davidosomething/vim-colors-meh" },
	{ "rebelot/kanagawa.nvim" },
	{ "projekt0n/github-nvim-theme" },
	{ "akinsho/horizon.nvim", version = "*" },

	--      [startup page]
	{ "goolord/alpha-nvim" },

	--        [nvim tree]
	"nvim-tree/nvim-tree.lua",

	--        [Undo Tree]
	"mbbill/undotree",

	--      [Web devicons]
	"nvim-tree/nvim-web-devicons",

	--      [treesitter]
	{
		{
			"nvim-treesitter/nvim-treesitter",
			dependencies = {
				{ "windwp/nvim-ts-autotag" },
			},
			build = ":TSUpdate",
		},
	},
	--lua line
	"nvim-lualine/lualine.nvim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.3",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	--          [LSP & Completion]
	--      [LSP Support]
	{ "neovim/nvim-lspconfig" }, -- Required
	{ "williamboman/mason.nvim" }, -- Optional
	{ "williamboman/mason-lspconfig.nvim" }, -- Optional
	{ "whoIsSethDaniel/mason-tool-installer.nvim" },
	-- { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp", -- Required
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional
			{ "hrsh7th/cmp-nvim-lsp-signature-help" }, -- Optional
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
		event = "InsertEnter",
	},

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
	-- Snippets Icons
	"onsails/lspkind-nvim", -- vscode like pictograms

	"nvimdev/lspsaga.nvim", -- LSP UIs

	--      [conform nvim]
	{ "stevearc/conform.nvim" },

	{ "jose-elias-alvarez/null-ls.nvim" }, -- (for backup)
	--      [nvim lint]
	{ "mfussenegger/nvim-lint", event = { "BufReadPre", "BufNewFile" } },

	--      [autopairs]
	{ "windwp/nvim-autopairs", event = "InsertEnter" },

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

	--      [Live-server]
	{
		"aurum77/live-server.nvim",
		build = function()
			require("live_server.util").install()
		end,
		cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	},

	--      [colorizer]
	{ "norcalli/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" } },

	--      [Transparent - allows for toggle]
	{ "xiyaowong/nvim-transparent" },

	--      [diffview]
	{ "sindrets/diffview.nvim" },

	--          [barbar]
	{ "romgrk/barbar.nvim" },

	--          [Vgit]
	{
		"tanvirtin/vgit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	--  [Terminal in the floating/popup window.]
	"akinsho/toggleterm.nvim",

	--      [Wilder]
	"gelguy/wilder.nvim",

	--      [Smoothie]
	"psliwka/vim-smoothie",

	--  [Add indentation guides on even blank lines]
	{ "lukas-reineke/indent-blankline.nvim" },

	--      [Notify]
	"rcarriga/nvim-notify",

	--      [Whick key]
	{ "folke/which-key.nvim", event = "VeryLazy" },

	--      [commentry]
	"tpope/vim-commentary",

	--      [Vim Tex]
	"lervag/vimtex",

	--      [zen]
	"folke/zen-mode.nvim",

	{
		"David-Kunz/cmp-npm",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = "json",
		config = function()
			require("cmp-npm").setup({})
		end,
	},
}

local opts = {}

require("lazy").setup({ plugins, opts }, {
	checker = {
		enabled = true,
		notify = true,
	},
	ui = { border = "rounded" },
})
