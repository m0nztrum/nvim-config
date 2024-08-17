return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        local gruv = require("gruvbox")
        gruv.setup({
            undercurl = true,
            underline = true,
            bold = true,
            strikethrough = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = true,
                folds = true,
            },
            transparent_mode = true,
        })
        -- vim.cmd("colorscheme gruvbox")
    end,
}
