return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {},
            enabled = false,
            config = function()
                vim.keymap.set(
                    "n",
                    "<leader>oc",
                    "<cmd>TSContextToggle<cr>",
                    { desc = "Treesitter | Toggle Context", silent = true }
                )
            end,
        },
    },

    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "c",
                "cpp",
                "markdown",
                "python",
                "markdown_inline",
                "html",
                "vim",
                "javascript",
                "typescript",
                "lua",
                "css",
                "bash",
                "json",
                "tsx",
                "regex",
                "gitignore",
            },
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,
            },
        })
    end,
}
