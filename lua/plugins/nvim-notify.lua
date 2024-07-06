return {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        notify.setup({
            background_colour = "#808080",
            fps = 30,
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                TRACE = "✎",
                WARN = "",
            },
            timeout = 200,
            stages = "fade_in_slide_out",
        })
        vim.notify = notify
    end,
}
