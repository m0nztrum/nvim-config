local lualine = require("lualine")

local colorscheme = require("gruvbox")


colorscheme.setup({
    options ={
        transparent = true
    }
})

lualine.setup{
    options ={
        theme = "gruvbox",
        transparent = true
    }
}

vim.cmd [[ colorscheme gruvbox ]]

vim.o.termguicolors = true

