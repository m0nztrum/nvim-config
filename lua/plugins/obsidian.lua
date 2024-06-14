return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	enabled = false,

	dependencies = {
		-- Required
		"nvim-lua/plenary.nvim",
	},

	opts = {
		workspaces = {
			{
				name = "moi",
				path = "~/obsidian",
			},
		},

		completion = {
			nvim_cmp = true,
			-- trigger completion at 2 chars
			min_chars = 2,
		},
		templates = {
			folder = "templates",
		},
	},
}
