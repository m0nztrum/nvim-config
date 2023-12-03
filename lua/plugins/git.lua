return {

	--      git stuff
	{
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signcolumn = true, -- Toggle with ':Gitsigns toggle_signs'
				current_line_blame = true,
			})
		end,
	},
	{ "tpope/vim-fugitive" },
	{

		"airblade/vim-gitgutter", -- gitgutter
		config = function()
			local keymap = vim.keymap
			-- Keybindings
			keymap.set("n", "<leader>gg", "<cmd>GitGutterToggle<CR>")
		end,
	},
	{

		"tanvirtin/vgit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local vgit = require("vgit")
			vgit.setup({
				settings = {
					live_blame = {
						enabled = true,
					},
				},
			})
		end,
	},

	{ "tpope/vim-rhubarb" },
}
