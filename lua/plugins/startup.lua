-- local function pick_color()
-- 	local colors = { "String", "Identifier", "Keyword", "Number" }
-- 	return colors[math.random(#colors)]
-- end

-- dashboard.section.header.opts.hl = pick_color()

-- dashboard.section.footer.val = "It's not a bug its a feature"

return {
	"goolord/alpha-nvim",

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = require("utils.logos")["random"]
		dashboard.section.buttons.val = {
			dashboard.button("e", " File Explorer", ":Telescope find_files<CR>"),
			dashboard.button("r", " Old Files", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "  Quit", ":qa<cr>"),
			dashboard.button("u", "  Update plugins", ":Lazy sync<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
