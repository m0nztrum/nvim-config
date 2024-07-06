return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "c",
                "markdown",
                "python",
                "markdown_inline",
                "html",
                "vim",
                "javascript",
                "lua",
                "css",
                "bash",
                "json",
                "tsx",
                "regex",
                "gitignore",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = true,
            auto_install = false,
            highlight = {
                enable = true,
            },
        })
    end,
}
