return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"rafamadriz/friendly-snippets",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"Jezda1337/nvim-html-css",
	},
	event = "InsertEnter",
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		--  load vscode style snippets from installed plugins(e.g. friendly snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,preview,noinsert",
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({
				-- Scroll up and down the completion docs window
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),

				-- to trigger completion menu
				["<C-Space>"] = cmp.mapping.complete(),

				-- to close completion menu
				["<C-e>"] = cmp.mapping.close(),

				-- 'Enter' key to confirm completion
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp", keyword_length = 1 },
				{ name = "nvim_lsp_signature_help" },
				{ name = "buffer", keyword_length = 3, max_item_count = 3 }, -- text within current buffer
				{ name = "path", keyword_length = 2, max_item_count = 3 }, -- file system paths
				{ name = "luasnip", keyword_length = 2 },
				{ name = "nvim_lua" },
				{ name = "npm", keyword_length = 4 },
				{ name = "html-css" },
			}),

			experimental = {
				native_menu = false,
				ghost_text = true,
			},

			formatting = {
				fields = { "abbr", "kind" },
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
					with_text = true,
				}),
			},
		})
	end,
}
