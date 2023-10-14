local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")
-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

--  server configurations
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
})

--      [typescript]
nvim_lsp.tsserver.setup({
	capabilities = capabilities,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "\u{ea71}" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
