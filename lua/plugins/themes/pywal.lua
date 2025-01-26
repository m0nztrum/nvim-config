return {
    "AlphaTechnolog/pywal.nvim",
    name = "pywal",

    config = function()
        local pywal = require("pywal")
        pywal.setup()
    end,
}
