return {

	{
		"catppuccin/nvim",
		priority = 1000,
	},

	{
		"davidosomething/vim-colors-meh",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("meh")
		end,
	},
	{ "rebelot/kanagawa.nvim", priority = 1000 },
	{ "lunarvim/horizon.nvim", priority = 1000 },
	{ "rose-pine/neovim", priority = 1000 },
}
