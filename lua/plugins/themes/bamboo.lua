return {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- vim.cmd.colorscheme("bamboo")
        require("bamboo").setup({
            style = "vulgaris",
            transparent = true,
            dim_inactive = true,
            code_style = {
                comments = { italic = true },
                parameters = { italic = true },
                strings = { italic = true },
            },
            lualine = { transparent = true },
        })
    end,
}
