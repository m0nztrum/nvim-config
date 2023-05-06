local lualine = require("lualine")
local colorscheme = require("gruvbox")

colorscheme.setup({
    options ={
        transparent = true
    }
})

lualine.setup{
    options ={
        theme = "gruvbox"
    }
}

vim.cmd [[ colorscheme gruvbox ]]
