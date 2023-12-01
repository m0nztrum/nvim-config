return {
	"VonHeikemen/lsp-zero.nvim",

	enabled = false,
	config = function()
		local lsp_zero = require("lsp-zero")

		-- Lsp_zero Keybindings:  On attach, if there's an LSP to use, use it, otherwise vim defaults
		lsp_zero.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set("n", "<leader>fr", ":Telescope lsp_references<CR>")
			vim.keymap.set("n", "<leader>fd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "K", function()
				--require("lsp_signature").toggle_float_win()
				-- vim.lsp.buf.signature_help()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "<leader>]", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "<leader>[", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, opts)
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
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
			virtual_text = true,
		})
	end,
}
