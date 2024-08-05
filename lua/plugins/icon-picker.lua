return {
    "ziontee113/icon-picker.nvim",
    config = function()
        require("icon-picker").setup({ disable_legacy_commands = true })

        local opts = { noremap = true, silent = true }

        opts.desc = "Insert Emoji"
        vim.keymap.set("n", "<leader>se", "<cmd>IconPickerInsert emoji<cr>", opts)

        opts.desc = "Insert Symbol"
        vim.keymap.set("n", "<leader>si", "<cmd>IconPickerInsert symbols<cr>", opts)
    end,
}
