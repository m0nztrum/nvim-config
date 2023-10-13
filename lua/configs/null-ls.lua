-- FORMATTER
-- code action sources
-- local code_actions = null_ls.builtins.code_actions
-- local hover = null_ls.builtins.hover
-- local completion = null_ls.builtins.completion
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting -- formatting sources
local diagnostics = null_ls.builtins.diagnostics -- diagnostics sources

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({
			group = augroup,
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

null_ls.setup({
	sources = {
		--  formatting
		formatting.black, -- python
		-- formatting.autopep8,
		formatting.clang_format, -- c/cpp
		formatting.deno_fmt, -- ts ,js , ts<REACT> , js<REACT>, md ,json , jsonc
		formatting.stylua,
		formatting.latexindent, -- latex
		formatting.rustfmt, -- rust
		formatting.shfmt.with({
			filetypes = { "sh", "zsh" },
		}),
		--  diagnostic
		diagnostics.pylint, -- python
	},
	on_attach = on_attach,
})
