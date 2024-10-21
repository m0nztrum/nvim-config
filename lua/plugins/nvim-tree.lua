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
                open_file = { quit_on_open = true },
            },
            update_focused_file = {
                enable = true,
            },
            view = {
                adaptive_size = true,
            },
            renderer = {
                root_folder_label = false,
                highlight_git = true,
                indent_markers = {
                    enable = true,
                },
                icons = {
                    modified_placement = "after",
                    web_devicons = {
                        file = {
                            enable = true,
                            color = true,
                        },
                        folder = {
                            enable = true,
                            color = false,
                        },
                    },
                    glyphs = {
                        symlink = "",
                        folder = {
                            arrow_closed = "",
                            arrow_open = "",
                        },

                        git = {
                            staged = "",
                            unmerged = "",
                            renamed = "󰁕",
                            untracked = "",
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
