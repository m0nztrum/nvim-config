return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "whoIsSethDaniel/mason-tool-installer.nvim",
    },

    config = function()
        local mason = require("mason")
        local mason_tool = require("mason-tool-installer")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
                border = "rounded",
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "marksman",
                "ts_ls",
                "html",
                "bashls",
                "cssls",
                "clangd",
                "tailwindcss",
                "eslint",
            },
            automatic_installation = true,
        })
        mason_tool.setup({
            run_on_start = true,
            ensure_installed = {
                "stylua", -- lua formatter
                "isort", -- formatter for sorting import python
                "black", -- formatter for python
                "prettier", -- formatter
                "flake8", -- linting for python
                "beautysh", -- for bash
            },
        })
    end,
}
