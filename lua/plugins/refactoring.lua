return {
    "ThePrimeagen/refactoring.nvim",
    cmd = "Refactor",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        {
            "<leader>rf",
            function()
                require("refactoring").select_refactor()
            end,
            mode = "v",
            noremap = true,
            silent = true,
            expr = false,
        },
    },
    opts = {},
}
