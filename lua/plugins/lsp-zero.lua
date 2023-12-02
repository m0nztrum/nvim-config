return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	enabled = false,
	config = function()
		local lsp_zero = require("lsp-zero")
		local keymap = keymap
		-- Lsp_zero Keybindings:  On attach, if there's an LSP to use, use it, otherwise vim defaults
		lsp_zero.on_attach(function(client, bufnr)
			local opts = { noremap = true, silent = true }
			opts.buffer = bufnr

			keymap.set("n", "<leader>fd", function()
				vim.lsp.buf.definition()
			end, opts)

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Show available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action <cr>", opts) -- see available code actions

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- shows diagnostics for a line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Rename current buffer"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Signature help"
			keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		end)

		-- call non customized servers here
		lsp_zero.setup_servers({ "lua_ls", "rust_analyzer", "tsserver" })
		--]]

		--if you want mason to handle the servers
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "rust_analyzer", "lua_ls", "clangd", "pyright" },
			handlers = {
				lsp_zero.default_setup,
				clangd = function()
					require("lspconfig").clangd.setup({
						capabilities = {
							offsetEncoding = "utf-16",
						},
					})
				end,
			},
		})

		vim.diagnostic.config({
			virtual_text = { spacing = 1, prefix = "\u{ea71}" },
			float = {
				border = "rounded",
				source = "if_many",
			},
			update_in_insert = false,
			underline = true,
		})

		-- lsp hover
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		-- Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for severity, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. severity:sub(1, 1) .. severity:sub(2):lower()
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
	end,
}
