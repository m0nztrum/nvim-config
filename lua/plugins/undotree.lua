

return{
	"mbbill/undotree",
	
	config = function()
		--      keybinds
		local keymap = vim.keymap

		-- Toggle undotree
		keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })

	end

}
