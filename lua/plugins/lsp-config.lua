return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local nvim_lsp = require("lspconfig")

        local keymap = vim.keymap

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local opts = { noremap = true, silent = true }

        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            opts.desc = "Restart Lsp"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show diagnostics for file

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- shows diagnostics for a line

            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Show available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions

            opts.desc = "Show lsp definitions"
            keymap.set("n", "gD", "<cmd>Lspsaga goto_definition <cr>", opts)

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts)

            opts.desc = "Rename all ref of symbol under cursor"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

            opts.desc = "Sig help"
            keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)

            if client.server_capabilities.inlayHintProvider then
                -- vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                vim.lsp.inlay_hint.enable(true)
            else
                vim.lsp.inlay_hint.enable(false)
            end
        end

        --  default server configurations
        local servers = {
            "bashls",
            "html",
            "clangd",
            "tsserver",
            "lua_ls",
            "eslint",
            "marksman",
            "tailwindcss",
            "pyright",
            "rust_analyzer",
            "texlab",
        }

        for _, lsp in ipairs(servers) do
            nvim_lsp[lsp].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end

        -- [C/C++]
        nvim_lsp.clangd.setup({
            capabilities = {
                offsetEncoding = { "utf-16" },
                capabilities, -- for cmp stuff
            },
            on_attach = on_attach,
            cmd = { "clangd" },
        })

        -- [CSS]
        nvim_lsp.cssls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "css", "less", "scss", "sass" },
        })

        vim.diagnostic.config({
            virtual_text = { spacing = 1, prefix = "󰊠 " },

            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
                source = "if_many",
                header = "  Diagnostics",
            },
            update_in_insert = false,
            severity_sort = true,
            underline = true,
        })
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            virtual_text = { spacing = 1, prefix = "󰊠 " },
        })
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
            title = "hover",
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "single",
            title = "Sig help",
        })

        -- INLAY HINTS
        -- vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#a0a0a0", italic = true })
        if vim.lsp.inlay_hint then
            vim.keymap.set("n", "<Space>ih", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, { desc = "Toggle Inlay Hints" })
        end

        -- Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for severity, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. severity:sub(1, 1) .. severity:sub(2):lower()
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
    end,
}
