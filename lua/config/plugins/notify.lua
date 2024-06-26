---@diagnostic disable: missing-fields
return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",

    config = function()
        require("notify").setup({
            background_colour = "Normal",
            fps = 60,
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                TRACE = "✎",
                WARN = ""
            },
            level = 2,
            minimum_width = 35,
            render = "compact",
            stages = "fade_in_slide_out",
            time_formats = {
                notification = "%T",
                notification_history = "%FT%T"
            },
            timeout = 5000,
            top_down = true
        })
    end,
}
