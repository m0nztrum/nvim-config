vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    auto_reload_on_write = true,
    sort_by = "name",
    hijack_cursor = true,
    update_focused_file = {
        enable = true
},
    view = {
    adaptive_size = true
  }
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
