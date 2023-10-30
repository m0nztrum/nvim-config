local conform = require("conform")
local keymap = vim.keymap

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettier" },
		markdown = { "markdownlint" },
		html = { "prettier" },
		css = { "prettier" },
		-- c = { "clang_format" }, -- commented because not really needed
	},

	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
	keymap.set({ "n", "v" }, "<leader>mp", function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		})
	end, { desc = "Format file or range(in visual mode)" }),
})
