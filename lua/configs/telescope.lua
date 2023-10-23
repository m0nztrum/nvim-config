local builtin = require("telescope.builtin")
local telescope = require("telescope")
local keymap = vim.keymap

telescope.setup({
	defaults = {
		layout_strategy = "horizontal",
		disable_devicons = false,
		color_devicons = true,
		layout_config = { preview_cutoff = 0 },
		file_ignore_patterns = {
			"%git/",
		},
	},
	pickers = {
		buffers = {
			sort_lastused = true,
			mappings = {
				i = {
					["<c-d>"] = "delete_buffer",
				},
			},
		},
	},

	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

-- Keymaps
keymap.set("n", "<space>ff", builtin.find_files, { desc = "find files" }) --find files
keymap.set("n", "<Space><Space>", builtin.oldfiles, {}) --olf files
keymap.set("n", "<Space>lg", builtin.live_grep, {})
keymap.set("n", "<Space>fh", builtin.help_tags, { desc = "help tags" })
keymap.set("n", "<Space>gs", builtin.git_files, {})
keymap.set("n", "<leader>com", builtin.commands, {})
keymap.set("n", "<leader>bu", builtin.buffers, { desc = "show buffers" })
keymap.set("n", "<leader>man", builtin.man_pages, {})
