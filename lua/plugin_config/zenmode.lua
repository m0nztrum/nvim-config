--- Zen Mode
----------------
--
local ok, zenmode = pcall(require, "zen-mode")
if not ok then
	return
end

zenmode.setup({
	kitty = {
		enabled = false,
		font = "+4",
	},
})

vim.keymap.set("n", "<leader>z", function()
	zenmode.toggle()
end)
