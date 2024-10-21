return {
    "vague2k/vague.nvim",
    priority = 1000,
    config = function()
        require("vague").setup({
            transparent = true,
            style = {
                comments = "italic",
                headings = "bold",
                functions = "italic",
            },
            colors = {
                func = "#bc96b0",
                keyword = "#787bab",
                number = "#8f729e",
                string = "#8a739a",
            },
        })
        -- vim.cmd.colorscheme("vague")
    end,
}
