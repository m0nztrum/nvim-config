return {
    "2giosangmitom/nightfall.nvim",
    priority = 1000,
    config = function()
        require("nightfall").setup({})
        -- vim.cmd.colorscheme("deepernight") -- Variants: deepernight. maron
    end,
}
