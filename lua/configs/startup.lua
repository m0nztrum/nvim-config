local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

-- local function pick_color()
-- 	local colors = { "String", "Identifier", "Keyword", "Number" }
-- 	return colors[math.random(#colors)]
-- end
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = require("utils.logo")["random"]
-- dashboard.section.header.opts.hl = pick_color()

dashboard.section.buttons.val = {
	dashboard.button("e", "  File Explorer", ":Telescope find_files<CR>"),
	dashboard.button("r", " Old Files", ":Telescope oldfiles<CR>"),
	dashboard.button("q", "  Quit", ":qa<cr>"),
	dashboard.button("u", "  Update plugins", ":Lazy sync<CR>"),
}

alpha.setup(dashboard.opts)
