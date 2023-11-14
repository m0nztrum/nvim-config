local lsp_zero = require("lsp-zero")
local keymap = vim.keymap
local diagnostic = vim.diagnostic

-- Lsp_zero Keybindings:  On attach, if there's an LSP to use, use it, otherwise vim defaults
lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	keymap.set("n", "<leader>fr", ":Telescope lsp_references<CR>")
	keymap.set("n", "<leader>fd", function()
		vim.lsp.buf.definition()
	end, opts)
	keymap.set("n", "K", function()
		--require("lsp_signature").toggle_float_win()
		-- vim.lsp.buf.signature_help()
		vim.lsp.buf.hover()
	end, opts)
	keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	keymap.set("n", "<leader>vd", function()
		diagnostic.open_float()
	end, opts)
	keymap.set("n", "<leader>]", function()
		diagnostic.goto_next()
	end, opts)
	keymap.set("n", "<leader>[", function()
		diagnostic.goto_prev()
	end, opts)
	keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

--[[  Mannual Config
lsp_zero.clangd.setup({
    capabilities.offsetEncoding = { "utf-16" },
    cmd = {"clangd"},
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_dir = root_pattern(
          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'
        ),
    single_file_support = true,
})
-- call non customized servers here
lsp_zero.setup_servers({'lua_ls', 'rust_analyzer', 'tsserver'})
--]]

--if you want mason to handle the servers
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "rust_analyzer", "lua_ls", "clangd", "pyright" },
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
