return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    enabled = true,
    main = "ibl",
    opts = {
        indent = {
            char = "|",
            -- char = "┊",
            repeat_linebreak = false,
        },
        scope = {
            enabled = true,
            show_start = true,
            show_end = true,
            injected_languages = true,
        },
    },
}
