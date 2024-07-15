-- HIGHLIGHT SELECTED
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 500,
        })
    end,
})

-- QUIT SOME WINDOWS WITH Q
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "qf", "checkhealth", "man", "query" },
    callback = function()
        vim.keymap.set("n", "q", "<cmd>bd<cr>", { silent = true, buffer = true })
    end,
})

-- OPEN HELP IN A NEW TAB
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    command = ":wincmd T",
})
