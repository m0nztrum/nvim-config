-- FORMATTER
local null_ls = require("null-ls")
-- code action sources
-- local code_actions = null_ls.builtins.code_actions
-- diagnostic sources
-- local diagnostics = null_ls.builtins.diagnostics
-- formatting sources
-- hover sources
-- local hover = null_ls.builtins.hover
-- completion sources
-- local completion = null_ls.builtins.completion
local formatting = null_ls.builtins.formatting

--[[
should echo 1 if available (and 0 if not)
:echo executable("stylua")
--]]

local sources = {
	formatting.asmfmt.with({ -- asm
		filetypes = { "asm", "S", "nasm", "fasm", "yasm" },
	}),
	formatting.black, -- python
	formatting.autopep8, -- python
	-- formatting.clang_format, -- c/cpp
	formatting.deno_fmt, -- ts ,js , ts<REACT> , js<REACT>, md ,json , jsonc
	formatting.stylua,
	formatting.latexindent, -- latex
	formatting.rustfmt, -- rust
	-- formatting.pylsp, -- work to be done here
	--    formatting
	formatting.shfmt.with({
		filetypes = { "sh", "zsh" },
	}),
	formatting.prettierd.with({
		disabled_filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"json",
			"jsonc",
			"markdown",
		},
	}),
}

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
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

require("null-ls").setup({
	sources = sources,
	on_attach = on_attach,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
