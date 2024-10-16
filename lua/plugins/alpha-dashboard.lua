return {
    "goolord/alpha-nvim",
    event = "VimEnter",

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local datetime = tonumber(os.date(" %H "))

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
            local pluginCount = require("lazy").stats().count
            local print_version = "v"
                .. version.major
                .. "."
                .. version.minor
                .. "."
                .. version.patch
            local footer_datetime = os.date("   %m-%d-%Y   %H:%M:%S")
            --local datetime = os.date '%d.%m.%Y %H:%M'
            return " " .. print_version .. "   " .. pluginCount .. footer_datetime
        end

        local greeting = function()
            local mesg
            local username = os.getenv("USER")
            if datetime >= 0 and datetime < 6 then
                mesg = "Dreaming..󰒲 󰒲 "
            elseif datetime >= 6 and datetime < 12 then
                mesg = "🌅 Hi " .. username .. ", Good Morning ☀️"
            elseif datetime >= 12 and datetime < 18 then
                mesg = "🌞 Hi " .. username .. ", Good Afternoon ☕️"
            elseif datetime >= 18 and datetime < 21 then
                mesg = "🌆 Hi " .. username .. ", Good Evening 🌙"
            else
                mesg = "Hi " .. username .. ", it's getting late, get some sleep 😴"
            end
            return mesg
        end

        dashboard.section.footer.val = footer()

        dashboard.section.buttons.opts = {
            spacing = 1,
            position = "center",
        }

        local bottom_section = {
            type = "text",
            val = greeting,
            opts = {
                position = "center",
            },
        }
        local section = {
            header = dashboard.section.header,
            bottom_section = bottom_section,
            buttons = dashboard.section.buttons,
            footer = dashboard.section.footer,
        }

        local opts = {
            layout = {
                { type = "padding", val = 1 },
                section.header,
                { type = "padding", val = 3 },
                section.buttons,
                { type = "padding", val = 1 },
                section.bottom_section,
                { type = "padding", val = 1 },
                section.footer,
            },
        }

        alpha.setup(opts)
    end,
}
