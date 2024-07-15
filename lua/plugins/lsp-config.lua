return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local nvim_lsp = require("lspconfig")

        local keymap = vim.keymap

        -- Set up completion using nvim_cmp with LSP source
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local opts = { noremap = true, silent = true }

        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            opts.desc = "Restart Lsp"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope  diagnostics bufnr=0<CR>", opts) -- show diagnostics for file

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- shows diagnostics for a line

            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Show available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action <cr>", opts) -- see available code actions

            opts.desc = "Show lsp definitions"
            keymap.set("n", "gi", "<cmd>Lspsaga goto_definition <cr>", opts)

            opts.desc = "Show Lsp type definitions"
            keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition <cr>", opts)

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
        end

        --  server configurations
        local servers = {
            "bashls",
            "html",
            "cssls",
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

        vim.diagnostic.config({
            virtual_text = { spacing = 1, prefix = "\u{ea71}" },
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
            virtual_text = { spacing = 1, prefix = "\u{ea71}" },
        })
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
            title = "hover",
        })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "single",
            title = "Sig help",
        })

        -- Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for severity, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. severity:sub(1, 1) .. severity:sub(2):lower()
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
    end,
}
