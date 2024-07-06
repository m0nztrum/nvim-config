return {

    "tanvirtin/vgit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local vgit = require("vgit")
        vgit.setup({
            settings = {
                live_blame = {
                    enabled = true,
                },
            },
        })
    end,
}
