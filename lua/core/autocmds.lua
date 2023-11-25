vim.api.nvim_create_autocmd("TextYankPost", {

	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 500,
		})
	end,
})
