vim.o.timeout = true
vim.o.timeoutlen = 300

local status_ok, whickkey = pcall(require, "which-key")
if not status_ok then
	return
end

whickkey.setup({

	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	window = {
		border = "single",
		winblend = 0,
	},
})
