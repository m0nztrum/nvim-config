return {

	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{ "windwp/nvim-ts-autotag" },
	},
	build = ":TSUpdate",

	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			-- A list of parser names, or "all"
			ensure_installed = {
				"c",
				"cpp",
				"markdown",
				"python",
				"markdown_inline",
				"html",
				"vim",
				"javascript",
				"lua",
				"css",
				"bash",
				"json",
				"regex",
				"tsx",
				"gitignore",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = true,
			auto_install = false,
			highlight = {
				enable = true,
			},

			autotag = {
				enable = true,
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = true,
			},
		})
	end,
}
