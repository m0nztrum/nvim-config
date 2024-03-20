return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			local lualine = require("lualine")

			lualine.setup({
				options = {
					icons_enabled = true,
					globalstatus = false,
					theme = "pywal",
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						"branch",
						{ "diff", colored = true },
						{
							"diagnostics",
							update_in_insert = true,
							symbols = { error = " " },
						},
					},
					lualine_c = { "filename", { "searchcount" } },
					lualine_x = {
						"encoding",
						"filetype",
						"fileformat",
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { { "filename", file_status = true, path = 1 } },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				extensions = { "fugitive", "nvim-tree" },
			})
		end,
	},
}
