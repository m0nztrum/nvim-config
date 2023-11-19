local status, saga = pcall(require, "lspsaga")
if not status then
	print("Lspsaga not installed")
	return
end

saga.setup({
	symbol_in_winbar = {
		enable = true,
		separator = " > ",
		show_file = true,
		delay = 400,
		color_mode = true,
	},
	outline = {
		layout = "float",
	},
	lightbulb = {
		enable = false,
		sign = false,
	},
})
