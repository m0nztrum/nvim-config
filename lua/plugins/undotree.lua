return {
	"mbbill/undotree",

	config = function()
		local keymap = vim.keymap

		-- Toggle undotree
		keymap.set("n", "<leader>ud", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
	end,
}
