return {

    "aurum77/live-server.nvim",
    build = function()
        require("live_server.util").install()
    end,

    config = function()
        local live_server = require("live_server")
        live_server.setup({
            port = 8080,
            browser_command = "firefox", -- Empty string starts up with default browser
            quiet = false,
            no_css_inject = false, -- Disables css injection if true, might be useful when testing out tailwindcss
            install_path = os.getenv("HOME") .. "/.live/",
        })
    end,
}
