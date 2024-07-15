return {
    "echasnovski/mini.animate",
    version = "*",
    config = function()
        require("mini.animate").setup({
            cursor = {
                enable = true,
            },
            open = {
                enable = true,
            },
            close = {
                enable = true,
            },
        })
    end,
}
