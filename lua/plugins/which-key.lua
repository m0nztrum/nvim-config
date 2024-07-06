return {
    "folke/which-key.nvim",
    event = "VeryLazy",

    config = function()
        local whichkey = require("which-key")

        whichkey.setup({

            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "➜", -- symbol used between a key and it's label
                group = "+", -- symbol prepended to a group
            },
            window = {
                border = "single",
                winblend = 0,
            },
        })
        -- whick key
        whichkey.register(mappings, opts)
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
}
