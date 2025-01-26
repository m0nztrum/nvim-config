return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")
        nvimtree.setup({
            auto_reload_on_write = true,
            sort_by = "name",
            hijack_cursor = true,
            actions = {
                open_file = { quit_on_open = false },
            },
            update_focused_file = {
                enable = true,
            },
            view = {
                adaptive_size = true,
            },

            filters = {
                enable = true,
                git_ignored = false,
                dotfiles = false,
                git_clean = false,
                no_buffer = false,
                no_bookmark = false,
                custom = {},
                exclude = {},
            },

            renderer = {
                root_folder_label = false,
                highlight_git = true,
                indent_markers = {
                    enable = true,
                },
                icons = {
                    modified_placement = "after",
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                        folder_arrow = true,
                    },
                    web_devicons = {
                        file = {
                            enable = true,
                            color = true,
                        },
                        folder = {
                            enable = true,
                            color = true,
                        },
                    },
                    glyphs = {
                        symlink = "",
                        folder = {
                            arrow_closed = "",
                            arrow_open = "",
                        },

                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "",
                            renamed = "󰁕",
                            untracked = "★",
                            deleted = "",
                            ignored = "",
                        },
                    },
                },
            },
        })
        vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>", { silent = true })

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
}
