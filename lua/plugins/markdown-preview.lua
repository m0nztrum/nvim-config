return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
}

-- keymap.set("n", "<leader>map", "<cmd>MarkdownPreview<CR>", { desc = "[M][a]rkdown [P]review" })
