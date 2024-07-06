-- TODO research stuff here
return {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opt = {
        signs = true,
    },
}
