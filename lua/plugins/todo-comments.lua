-- TODO:
-- HACK:
-- WARN:
-- PERF:
-- NOTE:
-- TEST:
-- FIX:

return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo = require("todo-comments")
        local keymap = vim.keymap

        -- keymaps
        keymap.set("n", "]t", function()
            todo.jump_next()
        end, { desc = "Next todo comment" })

        keymap.set("n", "[t", function()
            todo.jump_prev()
        end, { desc = "Next todo comment" })

        todo.setup({})
    end,
}
