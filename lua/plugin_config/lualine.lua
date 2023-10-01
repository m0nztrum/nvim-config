-- LUALINE
----------

require("lualine").setup({
	options = {
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
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
		lualine_a = { { "mode", icons_enabled = true } },
		lualine_b = { "branch", { "diff", colored = true } },
		lualine_c = { { "filename", file_status = true, path = 0, newfile_status = true }, "searchcount" },
		lualine_x = {
			{
				"diagnostics",
				always_visible = false,
				update_in_insert = true,
				symbols = { error = " " },
				-- symbols = { error = " ", warn = " ", info = " ", hint = "" },
			},
			"encoding",
			{ "filetype", icon_only = false, colored = true },
			"fileformat",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {
		lualine_a = {},
		lualine_b = { "buffer_number" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_winbar = {},
	extensions = { "fugitive", "nvim-tree" },
})
