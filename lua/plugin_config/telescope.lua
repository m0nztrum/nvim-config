require('telescope').setup()
local builtin = require('telescope.builtin')
local telescope = require("telescope")

telescope.setup({
    defaults = {
        layout_strategy = "vertical",
        layout_config = { preview_cutoff = 0},
        file_ignore_patterns = {
            "%git/",
     }
},
    pickers = {
        buffers = {
            sort_lastused = true,
            mappings = {
                i = {
                    ["<c-d>"] = "delete_buffer",
                }
            }
        },
    },

    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    }
})

vim.keymap.set('n', '<space>ff', builtin.find_files, {}) --find files
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>lg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
vim.keymap.set('n', '<Space>gs', builtin.git_files, {})
