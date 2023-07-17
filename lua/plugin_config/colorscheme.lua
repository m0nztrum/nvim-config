local lualine = require("lualine")

local colorscheme = require("darkrose")


colorscheme.setup({
    options ={
        transparent = true
    }
})

lualine.setup{
    options ={
        theme = "auto",
        transparent = true
    }
}

vim.cmd [[ colorscheme darkrose ]]

vim.o.termguicolors = true

