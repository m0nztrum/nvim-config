vim.cmd([[tnoremap <ESC> <C-\><C-n>]])

return {
    "akinsho/toggleterm.nvim",
    config = function()
        local toggleterm = require("toggleterm")
        toggleterm.setup({
            direction = "float", -- float | vertical | horizontal | tab
            hide_numbers = true,
            start_in_insert = true,
            close_on_exit = true,
            float_opts = {
                width = 125,
                height = 35,
                border = "single",
                title_pos = "center",
            },
        })
        vim.keymap.set("n", "<leader>tf", vim.cmd.ToggleTerm, { desc = "Toggle floating term" })
    end,
}
