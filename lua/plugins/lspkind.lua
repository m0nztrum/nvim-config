return {
    "onsails/lspkind-nvim", -- vscode like pictograms
    event = "InsertEnter",
    config = function()
        local lspkind = require("lspkind")

        lspkind.init({
            -- enables text annotations
            --
            -- default: true
            mode = "symbol_text",

            -- default symbol map
            -- can be either 'default' (requires nerd-fonts font) or
            -- 'codicons' for codicon preset (requires vscode-codicons font)
            --
            -- default: 'default'
            preset = "codicons",

            -- override preset symbols
            --
            -- default: {}
            symbol_map = {
                Array = "",
                Boolean = "",
                Constructor = "",
                Color = "󰏘",
                Constant = "󰏿",
                Class = "",
                EnumMember = "",
                Enum = "",
                Function = "󰊕",
                File = "",
                Field = "󰜢",
                Folder = "󰉋",
                Interface = "",
                Method = "󰆧",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Keyword = "󰌋",
                Snippet = "",
                Number = "",
                Reference = "󰈇",
                Struct = "󰙅",
                Event = "",
                Text = "󰉿",
                Variable = "󰀫",
                Operator = "󰆕",
                TypeParameter = "",
            },
        })
    end,
}
