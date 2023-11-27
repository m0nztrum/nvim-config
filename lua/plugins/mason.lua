return {

	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- Optional
		"whoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		local mason = require("mason")
		local mason_tool = require("mason-tool-installer")
		local mlspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "rounded",
			},
		})

		mlspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"html",
				"tsserver",
				"cssls",
				"clangd",
				"biome",
				"tailwindcss",
			},
			automatic_installation = true,
		})
		mason_tool.setup({
			run_on_start = true,
			ensure_installed = {
				"stylua", -- lua formatter
				"isort", -- formatter for sorting import python
				"black", -- formatter for python
				"pylint", -- linter for python
				"prettier", -- formatter
			},
		})
	end,
}
