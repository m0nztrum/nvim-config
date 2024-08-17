return {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- vim.cmd.colorscheme("bamboo")
        require("bamboo").setup({
            transparent = true,
            dim_inactive = true,
        })
    end,
}
