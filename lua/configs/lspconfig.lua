local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
	opts.buffer = bufnr

	opts.desc = "Restart Lsp"
	keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

	opts.desc = "Show buffer diagnostics"
	keymap.set("n", "<leader>D", "<cmd>Telescope  diagnostics bufnr=0<CR>", opts)
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
	on_attach = on_attach,
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
-- nvim_lsp.rust_analyzer.setup({
-- 	capabilities = capabilities,
-- })

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
	filetypes = { "python" },
})

--      [typescript]
nvim_lsp.tsserver.setup({
	capabilities = capabilities,
})

--      [SQL]
-- nvim_lsp.sqlls.setup({
-- 	capabilities = capabilities,
-- })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = true,
	virtual_text = { spacing = 4, prefix = "\u{ea71}" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
