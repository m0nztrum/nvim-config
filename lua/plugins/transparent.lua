return {
    "xiyaowong/nvim-transparent",
    config = function()
        require("transparent").setup({

            groups = {
                "Normal",
                "NormalNC",
                "Comment",
                "Constant",
                "Special",
                "Identifier",
                "Statement",
                "PreProc",
                "Type",
                "Underlined",
                "Todo",
                "String",
                "Function",
                "Conditional",
                "Repeat",
                "Operator",
                "Structure",
                "LineNr",
                "NonText",
                "SignColumn",
                "CursorLine",
                "CursorLineNr",
                "StatusLine",
                "StatusLineNC",
                "EndOfBuffer",
                "VertSplit",
                "Float",
                "NormalFloat",
            },
            extra_groups = {},
            exclude_groups = {},
        })
        require("transparent").clear_prefix("BufferLine")
        require("transparent").clear_prefix("NvimTree")
        require("transparent").clear_prefix("whichkey")
        require("transparent").clear_prefix("Lazy")
        require("transparent").clear_prefix("Mason")
        -- require("transparent").clear_prefix("LuaLine")
    end,
}
