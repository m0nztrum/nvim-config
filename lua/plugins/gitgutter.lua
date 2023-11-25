return{
	config = function()
		local keymap = vim.keymap
		-- Keybindings
		keymap.set("n", "<leader>gg", "<cmd>GitGutterToggle<CR>")
	end
}
