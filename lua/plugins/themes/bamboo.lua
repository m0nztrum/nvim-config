return {
    "ribru17/bamboo.nvim",
    enabled = false,
    priority = 1000,
    config = function()
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
        vim.cmd.colorscheme("bamboo")
    end,
}
