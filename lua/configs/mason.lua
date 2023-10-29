local status, mason = pcall(require, "mason")
if not status then
	return
end
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

local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
	return
end

lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"pylsp",
		"html",
		"cssls",
		"clangd",
	},
	automatic_installation = true,
})

local status3, mason_tool = pcall(require, "mason-tool-installer")
if not status3 then
	return
end

mason_tool.setup({
	run_on_start = true,
	ensure_installed = {
		"stylua", -- lua formatter
		"isort", -- formatter for sorting import python
		"black", -- formatter for python
		"pylint", -- linter for python
		"prettier", -- formatter
		"clang-format",
		"eslint_d",
	},
})
