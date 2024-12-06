return {
    "zbirenbaum/copilot-cmp",
    event = "insertenter",
    enabled = false,
    config = function()
        require("copilot_cmp").setup()
    end,
    dependencies = {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = true },
                panel = { enabled = false },
            })
        end,
    },
}
