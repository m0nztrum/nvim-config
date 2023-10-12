local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- MY PLUGINS --

	--          [Theme]
	use("ellisonleao/gruvbox.nvim")
	use("water-sucks/darkrose.nvim")
	use("EdenEast/nightfox.nvim")
	use({ "rose-pine/neovim", as = "rose-pine" })
	use("catppuccin/nvim")
	use("davidosomething/vim-colors-meh")
	use("rebelot/kanagawa.nvim")
	use("projekt0n/github-nvim-theme")

	--        [nvim tree]
	use("nvim-tree/nvim-tree.lua")

	--        [Undo Tree]
	use("mbbill/undotree")

	--      [Web devicons]
	use("nvim-tree/nvim-web-devicons")

	--      [treesitter]
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	--lua line
	use("nvim-lualine/lualine.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	--      [Lsp signature]
	use("ray-x/lsp_signature.nvim")

	--          [LSP]
	-- LSP Support
	use("neovim/nvim-lspconfig") -- Required
	use("williamboman/mason.nvim") -- Optional
	use({ "williamboman/mason-lspconfig.nvim" }) -- Optional
	use("whoIsSethDaniel/mason-tool-installer.nvim")
	-- Autocompletion
	use("hrsh7th/nvim-cmp") -- Required
	use("hrsh7th/cmp-nvim-lsp") -- Required
	use("hrsh7th/cmp-buffer") -- Optional
	use("hrsh7th/cmp-path") -- Optional
	use("saadparwaiz1/cmp_luasnip") -- Optional
	use("hrsh7th/cmp-nvim-lua") -- Optional
	-- Snippets
	use("L3MON4D3/LuaSnip") -- Required
	use("rafamadriz/friendly-snippets") -- Optional
	use("jose-elias-alvarez/null-ls.nvim")
	use("onsails/lspkind-nvim") -- vscode like pictograms

	use("nvimdev/lspsaga.nvim") -- LSP UIs

	--          [autopair]
	use("windwp/nvim-autopairs")

	--          [Git]
	use("lewis6991/gitsigns.nvim") -- gitsigns
	use("airblade/vim-gitgutter") -- gitgutter
	use("tpope/vim-fugitive") -- fugitive
	use("tpope/vim-rhubarb")

	--       [Markdown]
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	--      [vim cool]
	use("romainl/vim-cool")

	--      [Live-server]
	-- use("manzeloth/live-server")
	use("norcalli/nvim-colorizer.lua")

	--      [Transparent - allows for toggle]
	use("xiyaowong/nvim-transparent")

	--      [diffview]
	use("sindrets/diffview.nvim")

	--          [barbar]
	use("romgrk/barbar.nvim")

	--          [Vgit]
	use({
		"tanvirtin/vgit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	--  [Terminal in the floating/popup window.]
	use("akinsho/toggleterm.nvim")

	--      [Wilder]
	use("gelguy/wilder.nvim")

	--      [Smoothie]
	use("psliwka/vim-smoothie")

	--  [Add indentation guides on even blank lines]
	use("lukas-reineke/indent-blankline.nvim")

	--      [Notify]
	use("rcarriga/nvim-notify")

	--      [Whick key]
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	})

	--      [commentry]
	use("tpope/vim-commentary")

	--      [Vim Tex]
	use("lervag/vimtex")

	--      [zen]
	use("folke/zen-mode.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
