--- Zen Mode
----------------
--
local ok, zenmode = pcall(require, "zen-mode")
if not ok then
	return
end

zenmode.setup({})

vim.keymap.set("n", "<leader>z", function()
	zenmode.toggle()
end)
