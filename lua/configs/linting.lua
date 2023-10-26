local lint = require("lint")
local keymap = vim.keymap

lint.linters_by_ft = {
	python = { "pylint" },
	javascript = { "eslint_d" },
	-- html = { "markdownlint" },
	-- python = { "flake8" },
}

local lint_aurogroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_aurogroup,
	callback = function()
		lint.try_lint()
	end,
})

keymap.set("n", "<leader>lt", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })
