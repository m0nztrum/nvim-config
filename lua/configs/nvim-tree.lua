vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local nvimtree = require("nvim-tree")

nvimtree.setup({
	auto_reload_on_write = true,
	sort_by = "name",
	hijack_cursor = true,
	update_focused_file = {
		enable = true,
	},
	view = {
		adaptive_size = true,
		-- relativenumber = true,
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "",
					arrow_open = "",
				},
			},
		},
	},
})

vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>")
