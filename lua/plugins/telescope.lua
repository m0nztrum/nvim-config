return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
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
        telescope.load_extension("ui-select")

        --                      [Keymaps]
        --      files and buffers
        keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files" }) --find files
        keymap.set("n", "<leader>so", builtin.oldfiles, { desc = "Show old files" }) --olf files
        keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
        keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Show buffers" })
        keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Fzf Current Buffer" })

        --  help tags & man pages
        keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help tags" })
        keymap.set("n", "<leader>sm", builtin.man_pages, { desc = "Show builtin man-pages" })
        keymap.set("n", "<leader>sco", builtin.commands, { desc = "Show vim builtin commands" })

        -- git stuff
        keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Show git files" })
        keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Show git status" })

        --  view colorschemes
        keymap.set("n", "<leader>scs", builtin.colorscheme, { desc = "Show available colorschemes" })
    end,
}
