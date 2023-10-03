local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

--      [Lua]
nvim_lsp.lua_ls.setup({
	capabilities = capabilities,
})

--      [C/C++]
nvim_lsp.clangd.setup({
	capabilities = capabilities,
})

--      [css]
nvim_lsp.cssls.setup({
	capabilities = capabilities,
})

--      [rust]
nvim_lsp.rust_analyzer.setup({
	capabilities = capabilities,
})

--      [html]
nvim_lsp.html.setup({
	capabilities = capabilities,
})

--      [bash]
nvim_lsp.bashls.setup({
	capabilities = capabilities,
})

--      [python]
nvim_lsp.pylsp.setup({
	capabilities = capabilities,
	autostart = true,
})

--      [typescript]
nvim_lsp.tsserver.setup({
	capabilities = capabilities,
})