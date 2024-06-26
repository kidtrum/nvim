return {
    "matbme/JABS.nvim",
    event = "VeryLazy",

    config = function()
        require("jabs").setup({
            -- Options for the main window
            position = { 'center', 'bottom' },
            relative = 'editor', -- win, editor, cursor. Default win
            clip_popup_size = true, -- clips the popup size to the win (or editor) size. Default true
            width = 60, -- default 50
            height = 10, -- default 10
            border = 'rounded', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default shadow
            offset = { -- window position offset
                top    = 2, -- default 0
                bottom = 3, -- default 0
                left   = 2, -- default 0
                right  = 8, -- default 0
            },

            sort_mru = true, -- Sort buffers by most recently used (true or false). Default false
            split_filename = true, -- Split filename into separate components for name and path. Default false
            split_filename_path_width = 20, -- If split_filename is true, how wide the column for the path is supposed to be, Default 0 (don't show path)

            -- Options for preview window
            preview_position = 'top', -- top, bottom, left, right. Default top
            preview = {
                width  = 70, -- default 70
                height = 30, -- default 30
                border = 'rounded', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
            },

            -- Default highlights (must be a valid :highlight)
            highlight = {
                current   = "Title", -- default StatusLine
                hidden    = "ModeMsg", -- default ModeMsg
                split     = "StatusLine", -- default StatusLine
                alternate = "WarningMsg" -- default WarningMsg
            },

            -- Default symbols
            symbols = {
                current      = "󰽏",
                split        = "",
                alternate    = "󰬲",
                hidden       = "󰌨",
                locked       = "",
                ro           = "",
                edited       = "",
                terminal     = "",
                default_file = "",
            },

            -- Keymaps
            keymap = {
                close   = "d", -- Close buffer. Default D
                jump    = "<cr>", -- Jump to buffer. Default <cr>
                h_split = "h", -- Horizontally split buffer. Default s
                v_split = "v", -- Vertically split buffer. Default v
                preview = "<space>", -- Open buffer preview. Default P
            },

            -- Whether to use nvim-web-devicons next to filenames
            use_devicons = true -- true or false. Default true
        })

        vim.keymap.set("n", "<leader>ls", "<cmd>JABSOpen<CR>", { desc = "Open Buffers List" })
    end
}
