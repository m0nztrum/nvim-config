return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
        local builtin = require("telescope.builtin")
        local telescope = require("telescope")
        local actions = require("telescope.actions")
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
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                    },
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

        --                      [Keymaps]
        --      files and buffers
        keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" }) --find files
        keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Show old files" }) --olf files
        keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Live grep" })
        keymap.set("n", "<leader>bu", builtin.buffers, { desc = "Show buffers" })

        --  help tags & man pages
        keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
        keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Show builtin man-pages" })
        keymap.set("n", "<leader>fco", builtin.commands, { desc = "Show vim builtin commands" })

        -- git stuff
        keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Show git files" })
        keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Show git status" })

        --  view colorschemes
        keymap.set("n", "<leader>fcs", builtin.colorscheme, { desc = "Show available colorschemes" })
    end,
}
