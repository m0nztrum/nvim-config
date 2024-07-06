return {
    "sindrets/diffview.nvim",
    config = function()
        local keymap = vim.keymap
        keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Open diffview" })
        keymap.set("n", "<leader>gx", "<cmd>DiffviewClose<CR>", { desc = "Close diffview" })
    end,
}
