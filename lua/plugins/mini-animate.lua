return {
    "echasnovski/mini.animate",
    version = "*",
    config = function()
        require("mini.animate").setup({
            cursor = {
                enable = false,
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
