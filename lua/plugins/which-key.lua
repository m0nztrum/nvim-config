return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local whichkey = require("which-key")
        whichkey.setup({
            win = {
                border = "single",
                no_overlap = false,
                title_pos = "center",
            },
        })
        whichkey.add({
            {
                mode = { "n", "v" },
                { "<leader>g", group = "git" },
                { "<leader>t", group = "toggle" },
                { "<leader>c", group = "code" },
                { "<leader>s", group = "file/find" },
                { "<leader>r", group = "lsp rename" },
            },
        })
    end,
}
