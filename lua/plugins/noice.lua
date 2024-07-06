return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {

            -- you can enable a preset for easier configuration
            presets = {
                inc_rename = true,
                lsp_doc_border = false,
                long_message_to_split = true,
            },
            lsp = {
                signature = { enabled = false },
                hover = { enabled = false },
                overide = {
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = false,
                },
                progress = {
                    enabled = false,
                    throttle = 1000 / 30,
                    view = "mini",
                },
            },
            cmdline = {
                format = {
                    cmdline = { icon = ">" },
                    search_down = { icon = "🔍⌄" },
                    search_up = { icon = "🔍⌃" },
                    filter = { icon = "$" },
                    lua = { icon = "☾" },
                    help = { icon = "?" },
                },
            },
            routes = {
                { filter = { event = "msg_show", find = "written" }, view = "mini" },
                { filter = { event = "notify", find = "No information available" }, skip = true },
                { filter = { event = "msg_show", find = "search hit TOP" }, skip = true },
                { filter = { event = "msg_show", find = "^E486: Pattern not found" }, view = "mini" },
                { filter = { event = "msg_show", find = "search hit BOTTOM" }, skip = true },
            },
            views = {
                mini = {
                    win_options = { winblend = 0 },
                },
            },
        },
    },
}
