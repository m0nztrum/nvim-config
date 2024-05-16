return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
	},

	keys = {
		{ "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", "window left" },
		{ "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>", "window right" },
		{ "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>", "window down" },
		{ "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>", "window up" },
	},
}
