return {
    "nvimdev/lspsaga.nvim", -- LSP UIs

    config = function()
        local saga = require("lspsaga")
        saga.setup({
            symbol_in_winbar = {
                enable = true,
                separator = " > ",
                show_file = true,
                delay = 400,
                color_mode = true,
            },
            ui = {
                border = "rounded",
            },
            outline = {
                layout = "float",
            },
            lightbulb = {
                enable = true,
                sign = true,
            },
        })
    end,
}
