return {

	"williamboman/mason.nvim",
	event = "VeryLazy",
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
				"marksman",
				"tsserver",
				"eslint",
				"html",
				"bashls",
				"cssls",
				"clangd",
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
				"prettier", -- formatter
				"flake8", -- linting for python
			},
		})
	end,
}
