local notify = require("notify")

notify.setup({
	background_colour = "#808080",
	fps = 30,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "",
		WARN = "",
	},
})
