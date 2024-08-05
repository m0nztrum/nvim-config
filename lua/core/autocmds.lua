-- HIGHLIGHT YANKED
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
    pattern = { "help", "qf", "checkhealth", "man", "query", "notify" },
    callback = function()
        vim.keymap.set("n", "q", "<cmd>bd<cr>", { silent = true, buffer = true })
    end,
})

-- OPEN HELP IN A NEW TAB
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    command = ":wincmd T",
})

-- VIM VISUAL MULTI (inlay hints)
local visual_multi_group = vim.api.nvim_create_augroup("VisualMulti", { clear = true })
vim.api.nvim_create_autocmd("User", {
    pattern = "visual_multi_start",
    callback = function()
        vim.cmd("NoiceDisable")
        vim.lsp.inlay_hint.enable(false)
    end,
    group = visual_multi_group,
})
vim.api.nvim_create_autocmd("User", {
    pattern = "visual_multi_exit",
    callback = function()
        vim.cmd("NoiceEnable")
        vim.lsp.inlay_hint.enable(true)
    end,
    group = visual_multi_group,
})
