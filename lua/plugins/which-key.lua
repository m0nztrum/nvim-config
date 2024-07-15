return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local whichkey = require("which-key")
        whichkey.setup({
            win = {
                border = "single",
                no_overlap = false,
                title_pos = "center",
            },
        })
    end,
}
