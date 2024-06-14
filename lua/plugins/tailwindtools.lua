return {
	"luckasRanarison/tailwind-tools.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		document_color = {
			enabled = true,
			kind = "inline", -- "inline" | "foreground" | "background"
			inline_symbol = "󰝤 ", -- only used in inline mode
		},
		conceal = {
			enabled = false, -- can be toggled by commands
			symbol = "󱏿", -- only a single character is allowed
			highlight = { -- extmark highlight options, see :h 'highlight'
				fg = "#38BDF8",
			},
		},
	},
}
