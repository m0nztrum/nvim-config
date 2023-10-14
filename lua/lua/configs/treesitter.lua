require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
      "c",
      "cpp",
      "lua",
      "rust",
      "ruby",
      "vim",
      "javascript",
      "typescript",
      "css",
      "bash",
      "html",
      "python",
      "markdown",
      "tsx",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

