return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        { "tpope/vim-dadbod", lazy = true },
        { "kristijanhusak/vim-dadbod-completion", lazy = true },
    },
    config = function()
        local function db_completion()
            require("plugins.completion.cmp").setup.buffer({
                sources = { { name = "vim-dadbod-completion" } },
            })
        end
        vim.g.db_ui_save_location = vim.fn.stdpath("core") .. require("plenary.path").path.sep .. "db_ui"
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "sql",
                "mysql",
                "plsql",
            },
            callback = function()
                vim.schedule(db_completion)
            end,
        })
    end,
    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
    },
}
