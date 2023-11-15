local status, cmp = pcall(require, "cmp")
if not status then
	return
end

local lspkind = require("lspkind")
local luasnip = require("luasnip")

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
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "nvim_lsp_signature_help" },
		{ name = "buffer", keyword_length = 3 }, -- text within current buffer
		{ name = "path", keyword_length = 2 }, -- file system paths
		{ name = "luasnip", keyword_length = 3 },
		{ name = "nvim_lua" },
		{ name = "npm", keyword_length = 4 },
		{ name = "html-css" },
	}),

	experimental = {
		native_menu = false,
		ghost_text = true,
	},

	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
