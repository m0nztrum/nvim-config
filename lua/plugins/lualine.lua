return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")

		lualine.setup({
			options = {
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {
						"NvimTree",
					},
					winbar = {
						"NvimTree",
					},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
				theme = "auto",
			},
			sections = {
				lualine_a = { { "mode", icons_enabled = true, icon = { "" } } },
				lualine_b = {
					{ "branch", icon = "\u{e725}" },
					{ "diff", colored = true },
					{
						"diagnostics",
						always_visible = false,
						update_in_insert = true,
						symbols = { error = " " },
						-- symbols = { error = " ", warn = " ", info = " ", hint = "" },
					},
				},
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
						newfile_status = true,
					},
					{ "searchcount" },
				},
				lualine_x = {
					-- "encoding",
					{ "filetype", icon_only = false, colored = true },
					"fileformat",
				},
				lualine_y = { { "progress", icon = { "", align = "left" } } },
				lualine_z = { { "location", icon = { "", align = "left" } } },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", file_status = true, path = 1 } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			inactive_winbar = {},
			extensions = { "fugitive", "nvim-tree" },
		})
	end,
}
