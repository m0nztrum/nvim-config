return {
	"goolord/alpha-nvim",

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = require("utils.logos")["random"]
		dashboard.section.buttons.val = {
			dashboard.button("e", " File Explorer", ":Telescope find_files<CR>"),
			dashboard.button("r", " Old Files", ":Telescope oldfiles<CR>"),
			dashboard.button("u", "  Update plugins", ":Lazy sync<CR>"),
			dashboard.button("q", "  Quit", ":qa<cr>"),
		}
		dashboard.section.buttons.opts = {
			spacing = 1,
			position = "center",
		}

		alpha.setup(dashboard.opts)
	end,
}
