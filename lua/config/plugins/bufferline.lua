return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
        options = {
            mode = "buffers",
            -- style_preset = require("bufferline").style_preset.default, -- or bufferline.style_preset.minimal,
            separator_style = "padded_slant",
            themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default

            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match("error") and " " or level:match("warning") and " " or " "

                return " " .. icon .. count
            end,
            indicator = {
                icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'icon',
            },
            buffer_close_icon = '󰅖',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',

            max_name_length = 18,
            max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
            truncate_names = true, -- whether or not tab names should be truncated
            tab_size = 18,

            color_icons = true, -- whether or not to add the filetype icon highlights

            show_buffer_icons = true, -- disable filetype icons for buffers
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = true,
            show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
            duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            enforce_regular_tabs = false,
            always_show_bufferline = true,
            auto_toggle_bufferline = true,
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
        },
    },
}
