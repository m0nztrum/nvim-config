local builtin = require("telescope.builtin")
local telescope = require("telescope")
local keymap = vim.keymap

telescope.setup({
	defaults = {
		path_display = { "smart" },
		layout_strategy = "horizontal",
		disable_devicons = false,
		color_devicons = true,
		layout_config = { preview_cutoff = 100, width = 0.85 },
		prompt_prefix = "   ",
		selection_caret = " ",
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

telescope.load_extension("fzf")
-- Keymaps
--      files and buffers
keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" }) --find files
keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Show old files" }) --olf files
keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Live grep" })
keymap.set("n", "<leader>bu", builtin.buffers, { desc = "Show buffers" })

--  help tags & man pages
keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
keymap.set("n", "<leader>man", builtin.man_pages, { desc = "Show builtin man-pages" })
keymap.set("n", "<leader>com", builtin.commands, { desc = "Show vim builtin commands" })

-- git stuff
keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Show git files" })
keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Show git status" })

--  view colorschemes
keymap.set("n", "<leader>cs", builtin.colorscheme, { desc = "Show available colorschemes" })

-- search history
keymap.set("n", "<leader>sh", builtin.search_history, { desc = "Open Search history" })
keymap.set("n", "<leader>re", builtin.registers, { desc = "Show registers" })
