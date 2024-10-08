return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "rafamadriz/friendly-snippets",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "Jezda1337/nvim-html-css",
        { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        local cmp_tailwind = require("tailwindcss-colorizer-cmp")

        cmp_tailwind.setup({
            color_square_width = 2,
        })
        --  load vscode style snippets from installed plugins(e.g. friendly snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = {
                completeopt = "menu,menuone,preview,noinsert",
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            mapping = cmp.mapping.preset.insert({
                -- Scroll up and down the completion docs window
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),

                -- to trigger completion menu
                ["<C-Space>"] = cmp.mapping.complete(),

                -- to close completion menu
                ["<C-e>"] = cmp.mapping.close(),

                -- Select next/prev item on the list
                ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.ConfirmBehavior.Insert }),
                ["<S-Tab>"] = cmp.mapping.select_prev_item({
                    behavior = cmp.ConfirmBehavior.Insert,
                }),

                -- 'Enter' key to confirm completion
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "nvim_lsp_signature_help" },
                { name = "nvim_lua" },
                { name = "copilot" },
            }, {
                { name = "buffer" }, -- text within current buffer
                { name = "path" }, -- file system paths
                { name = "npm" },
                { name = "html-css" },
            }),

            experimental = {
                native_menu = false,
                ghost_text = true,
            },

            formatting = {
                expandable_indicator = true,
                fields = { "abbr", "kind", "menu" },
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    menu = {
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        path = "[Path]",
                    },
                    maxwidth = 40,
                    ellipsis_char = "...",
                    -- show_labelDetails = true,
                    before = function(entry, vim_item)
                        cmp_tailwind.formatter(entry, vim_item)
                        return vim_item
                    end,
                    -- before = require("tailwind-tools.cmp").lspkind_format,
                    with_text = true,
                }),
            },
        })
    end,
}
