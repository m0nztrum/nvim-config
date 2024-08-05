return {
    {
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
    },
    {
        "akinsho/horizon.nvim",
        priority = 1000,
        version = "*",
        config = function()
            -- vim.cmd("colorscheme horizon"),
        end,
    },
    {
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
            })
            -- vim.cmd("colorscheme gruvbox")
        end,
    },

    {
        "xero/miasma.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd("colorscheme miasma")
        end,
    },
    {
        {
            "slugbyte/lackluster.nvim",
            priority = 1000,
            config = function()
                -- vim.cmd.colorscheme("lackluster")
                -- vim.cmd.colorscheme("lackluster-hack")
                -- vim.cmd.colorscheme("lackluster-mint")
            end,
        },
    },
}
