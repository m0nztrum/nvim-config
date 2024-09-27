return {
    "nvimdev/lspsaga.nvim",
    lazy = true,
    event = "LspAttach",
    config = function()
        local saga = require("lspsaga")
        saga.setup({
            ui = {
                theme = "round",
                border = "rounded",
                winblend = 0,
                expand = "",
                collaspe = "",
                preview = " ",
                code_action = "󱧣 ",
                diagnostic = " ",
                hover = " ",
            },
            symbol_in_winbar = {
                enable = true,
                separator = " > ",
                show_file = true,
                delay = 300,
                color_mode = true,
                folder_level = 1,
            },
            outline = {
                win_position = "right",
                show_detail = true,
                auto_preview = true,
                auto_refresh = true,
                auto_close = true,
            },
            lightbulb = {
                enable = true,
                sign = true,
                virtual_text = true,
            },
        })
    end,
}
