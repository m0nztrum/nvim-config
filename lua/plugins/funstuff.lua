return {
    {
        "tamton-aquib/duck.nvim",
        config = function()
            vim.keymap.set("n", "<leader>mdd", function()
                require("duck").hatch()
            end, { desc = "Hatch Duck" })
            vim.keymap.set("n", "<leader>mdk", function()
                require("duck").cook()
            end, { desc = "Cook Duck" })
            vim.keymap.set("n", "<leader>mda", function()
                require("duck").cook_all()
            end, { desc = "Cook All Ducks" })
        end,
    },
}
