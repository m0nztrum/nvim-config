-- To show Macro recording message in Lualine
local function show_macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == "" then
        return ""
    else
        return "recording @" .. recording_register
    end
end

local function virtual_env()
    if vim.bo.filetype ~= "python" then
        return ""
    end

    local venv_path = os.getenv("VIRTUAL_ENV")
    if venv_path then
        local venv_name = vim.fn.fnamemodify(venv_path, ":t")
        return string.format(" %s", venv_name)
    end
end

return {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")
        lualine.setup({
            options = {
                icons_enabled = true,
                globalstatus = false,
                theme = "auto",
                component_separators = "",
                section_separators = "",
                always_divide_middle = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = {
                    {
                        "branch",
                        icon = { "", color = { fg = "#fc5603" } },
                    },
                },
                lualine_b = {
                    {
                        "mode",
                    },
                    {
                        "diff",
                        symbols = { added = " ", modified = " ", removed = " " },
                        diff_color = {
                            added = { fg = "#98be65" },
                            modified = { fg = "orange" },
                            removed = { fg = "red" },
                        },
                    },
                    {
                        virtual_env,
                        color = { fg = "grey" },
                    },
                },
                lualine_c = {
                    {
                        "filename",
                        symbols = { readonly = " " },
                        icon = "",
                    },
                    {
                        "diagnostics",
                        update_in_insert = true,
                        symbols = { error = " ", warn = " ", hint = " ", info = " " },
                        diagnostics_color = {
                            error = { fg = "red" },
                        },
                    },

                    "searchcount",
                },
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e75" },
                    },
                    {
                        "macro_recording",
                        fmt = show_macro_recording,
                        color = { fg = "red" },
                    },
                    "encoding",
                    "filetype",
                    "fileformat",
                },
                lualine_y = { "progress" },
                lualine_z = { { "location", icon = { "󰍒", align = "right" } } },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { "filename", file_status = true, path = 1 } },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            disabled_filetypes = { "alpha", "NvimTree" },
            extensions = { "fugitive", "nvim-tree", "lazy" },
        })
    end,
}
