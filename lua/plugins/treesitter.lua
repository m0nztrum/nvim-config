return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
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
            -- ensure these language parsers are installed
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
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end,
}
