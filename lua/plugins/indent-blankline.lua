return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    enabled = false,
    main = "ibl",
    opts = {
        scope = { enabled = true },
    },
}
