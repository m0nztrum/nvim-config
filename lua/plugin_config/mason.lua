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
		border = "none",
	},
})

local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
	return
end

lspconfig.setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "pylsp" },
	automatic_installation = true,
})

local status3, mason_tool = pcall(require, "mason-tool-installer")
if not status3 then
	return
end

mason_tool.setup({
	run_on_start = true,
})
