return {
	"stevearc/conform.nvim",

	config = function()
		local conform = require("conform")
		local keymap = vim.keymap

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				markdown = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				sh = { "beautysh" },
			},

			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 2500,
			},
			keymap.set({ "n", "v" }, "<leader>mp", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format file or range(in visual mode)" }),

			notify_on_error = false,
		})
		--  special config for prettier
		require("conform.formatters.prettier").args = function(self, ctx)
			local args = { "--stdin-filepath", "$FILENAME" }
			local localPrettierConfig = vim.fs.find(".prettierrc.json", {
				upward = true,
				path = ctx.dirname,
				type = "file",
			})[1]
			local globalPrettierConfig = vim.fs.find(".prettierrc.json", {
				path = vim.fn.expand("~/.config/nvim"),
				type = "file",
			})[1]

			-- Project config takes precedence over global config
			if localPrettierConfig then
				vim.list_extend(args, { "--config", localPrettierConfig })
			elseif globalPrettierConfig then
				vim.list_extend(args, { "--config", globalPrettierConfig })
			end

			local isUsingTailwind = vim.fs.find("tailwind.config.js", {
				upward = true,
				path = ctx.dirname,
				type = "file",
			})[1]
			local localTailwindcssPlugin = vim.fs.find("node_modules/prettier-plugin-tailwindcss/dist/index.mjs", {
				upward = true,
				path = ctx.dirname,
				type = "file",
			})[1]

			if localTailwindcssPlugin then
				vim.list_extend(args, { "--plugin", localTailwindcssPlugin })
			else
				if isUsingTailwind then
					vim.notify(
						"Tailwind was detected for your project. You can really benefit from automatic class sorting. Please run npm i -D prettier-plugin-tailwindcss",
						vim.log.levels.WARN
					)
				end
			end

			return args
		end
	end,
}
