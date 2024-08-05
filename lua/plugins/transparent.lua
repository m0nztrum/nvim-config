return {
    "xiyaowong/nvim-transparent",
    config = function()
        require("transparent").clear_prefix("NeoTree")
        require("transparent").clear_prefix("WhichKey")
        require("transparent").clear_prefix("Noice")
        require("transparent").clear_prefix("Notify")
    end,
}
