return {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    config = function()
        local colorizer = require("colorizer")

        colorizer.setup({
            -- filetypes = { "*" },
            user_default_options = {
                RGB = true,
                RRGGBB = true,
                names = true,
                RRGGBBAA = true,
                AARRGGBB = true,
                rgb_fn = true,
                hsl_fn = true,
                css = true,
                css_fn = true,
                -- modes: foreground, background, virtualtext
                mode = "background",
                method = "lsp",
                virtualtext = "■",
                always_update = true,
            },
            filetypes = {
                css = {
                    RGB = true, -- #RGB hex codes
                    RRGGBB = true, -- #RRGGBB hex codes
                    names = true, -- "Name" codes like Blue
                    RRGGBBAA = true, -- #RRGGBBAA hex codes
                    rgb_fn = true, -- CSS rgb() and rgba() functions
                    hsl_fn = true, -- CSS hsl() and hsla() functions
                    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                },
                html = { mode = "background" },
                markdown = { names = false },
                "*",
            },
        })
    end,
}
