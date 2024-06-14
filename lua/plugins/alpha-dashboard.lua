return {
	"goolord/alpha-nvim",
	event = "VimEnter",

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Banner
		dashboard.section.header.val = require("ascii-headers")["random"]

		-- Menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "󰈔 New file", ":ene <BAR> startinsert<CR>"),
			dashboard.button("f", "󰱼 File Explorer", ":Telescope find_files<CR>"),
			dashboard.button("r", "󱔗 Recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button("u", " Update plugins", ":Lazy sync<CR>"),
			dashboard.button("q", " Quit", ":qa<CR>"),
		}

		-- Footer
		local function footer()
			local version = vim.version()
			local pluginCount = vim.fn.len(vim.fn.globpath(vim.fn.stdpath("data") .. "/lazy", "*", 0, 1))
			local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
			local date = os.date("%d.%m.%Y")
			--local datetime = os.date '%d.%m.%Y %H:%M'
			return " " .. print_version .. "   " .. pluginCount .. "   " .. date
		end

		dashboard.section.footer.val = footer()

		dashboard.section.buttons.opts = {
			spacing = 1,
			position = "center",
		}

		alpha.setup(dashboard.opts)
	end,
}
