return {

    "folke/zen-mode.nvim",
    opts = {
        plugins = {

            kitty = {
                enabled = true,
                font = "+4",
            },
            options = {
                laststatus = 0,
            },
        },
        window = {
            options = {
                signcolumn = "no",
                number = false,
                relativenumber = false,
            },
        },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
}
