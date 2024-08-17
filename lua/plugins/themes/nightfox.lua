return {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
        local nightfox = require("nightfox")
        nightfox.setup({
            options = {
                transparent = true,
                styles = {
                    comments = "italic",
                    keywords = "bold",
                },
            },
        })
        vim.cmd("colorscheme duskfox")
    end,
}
