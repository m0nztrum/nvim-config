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
        vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>", { silent = true })

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
}
