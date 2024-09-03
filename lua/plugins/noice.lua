return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        presets = {
            inc_rename = false,
            command_palette = true,
        },
        cmdline = {
            format = {
                search_replace = { kind = "search", pattern = "^:%%s/", icon = "󰛔", lang = "regex" },
            },
        },
        lsp = {
            signature = { enabled = false },
            hover = { enabled = false },
            progress = { enabled = false },
            overide = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
        },
        routes = {
            {
                view = "mini",
                filter = {
                    event = "notify",
                    any = {
                        { find = "hidden" },
                        { find = "clipboard" },
                        { find = "Deleted" },
                        { find = "Renamed" },
                        { find = "file_browser" },
                        { find = "No information available" },
                        { find = "No code actions available" },
                    },
                },
            },
            {
                view = "mini",
                filter = {
                    event = "msg_show",
                    any = {
                        { find = "written" },
                        { find = "search hit TOP" },
                        { find = "search hit BOTTOM" },
                        { find = "^E486: Pattern not found" },
                        { find = "fewer lines" },
                        { find = "No more valid diagnostics to move to" },
                    },
                },
            },
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    any = {
                        { find = "catalog" },
                    },
                },
                opts = { skip = true },
            },
        },
        views = {
            mini = {
                win_options = { winblend = 0 },
            },
            cmdline_popup = {
                position = {
                    row = 3,
                    col = "50%",
                },
            },
            popup = {
                size = {
                    width = "80%",
                    height = "70%",
                },
                border = {
                    style = "single",
                },
                win_options = {
                    wrap = true,
                },
            },
        },
        messages = {
            enabled = true,
            view_history = "popup",
        },
    },
    keys = {
        { "<leader>nt", "<cmd>NoiceTelescope<cr>", desc = "Noice Telescope" },
        { "<leader>nl", "<cmd>NoiceLast<cr>", desc = "Noice Last" },
    },
}
