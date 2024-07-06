return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },

    {
        "akinsho/horizon.nvim",
        version = "*",
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("horizon")
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            local gruvbox = require("gruvbox")
            gruvbox.setup({
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = true,
                    folds = true,
                },
                strikethrough = true,
            })
            -- vim.cmd.colorscheme "gruvbox"
        end,
    },

    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
}
