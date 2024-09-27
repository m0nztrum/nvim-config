return {
    {
        "tamton-aquib/duck.nvim",
        config = function()
            vim.keymap.set("n", "<leader>mdd", function()
                require("duck").hatch()
            end, {})
            vim.keymap.set("n", "<leader>mdk", function()
                require("duck").cook()
            end, {})
            vim.keymap.set("n", "<leader>mda", function()
                require("duck").cook_all()
            end, {})
        end,
    },
}
