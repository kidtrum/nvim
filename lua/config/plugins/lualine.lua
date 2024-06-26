return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")

        local colors = {
            blue = "#65D1FF",
            green = "#3EFFDC",
            violet = "#FF61EF",
            yellow = "#FFDA7B",
            red = "#FF4A4A",
            cyan = "#39F2FC",
            fg = "#C3CCDC",
            bg = "#112638",
            inactive_bg = "#2C3043",
        }

        local my_lualine_theme = {
            normal = {
                a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            insert = {
                a = { bg = colors.green, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            visual = {
                a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            command = {
                a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            replace = {
                a = { bg = colors.red, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            inactive = {
                a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
                b = { bg = colors.inactive_bg, fg = colors.semilightgray },
                c = { bg = colors.inactive_bg, fg = colors.semilightgray },
            },
            terminal = {
                a = { bg = colors.cyan, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            }
        }
        local modes = {
            ["n"] = " NORMAL",
            ["niI"] = " NORMAL i",
            ["niR"] = " NORMAL r",
            ["niV"] = " NORMAL v",
            ["no"] = " N-PENDING",
            ["i"] = " INSERT",
            ["ic"] = " INSERT (completion)",
            ["ix"] = " INSERT completion",
            ["t"] = " TERMINAL",
            ["nt"] = " NTERMINAL",
            ["v"] = " VISUAL",
            ["V"] = " V-LINE",
            ["Vs"] = " V-LINE (Ctrl O)",
            [""] = " V-BLOCK",
            ["R"] = " REPLACE",
            ["Rv"] = " V-REPLACE",
            ["s"] = " SELECT",
            ["S"] = " S-LINE",
            [""] = " S-BLOCK",
            ["c"] = " COMMAND",
            ["cv"] = " COMMAND",
            ["ce"] = " COMMAND",
            ["r"] = " PROMPT",
            ["rm"] = " MORE",
            ["r?"] = " CONFIRM",
            ["!"] = " SHELL",
        }

        local mode = function()
            return modes[vim.api.nvim_get_mode().mode] or "__"
        end

        local hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end

        local filename = {
            'filename',
            icon = "  ",
            file_status = true, -- Displays file status (readonly status, modified status)
            newfile_status = true, -- Display new file status (new file means no write after created)
            path = 0, -- 0: Just the filename
            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            symbols = {
                modified = ' ', -- Text to show when the file is modified.
                readonly = ' ', -- Text to show when the file is non-modifiable or readonly.
                unnamed = '[Unnamed]  ', -- Text to show for unnamed buffers.
                newfile = '[New]  ', -- Text to show for new created file before first writting
            },
        }

        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "hint" },
            symbols = { error = " ", warn = " ", hint = " " },
            colored = true,
            update_in_insert = false,
            always_visible = true,
        }

        local branch = {
            "branch",
            icons_enabled = true,
        }

        local diff = {
            "diff",
            colored = true,
            symbols = {
                added = "  ",
                modified = "  ",
                removed = "  "
            }, -- changes diff symbols
            cond = hide_in_width
        }

        -- configure lualine with modified theme 
        lualine.setup({
            options = {
                icons_enabled = true,
                theme = my_lualine_theme,
                -- theme = "tokyonight",
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                    "alpha", "dashboard"
                },
                always_divide_middle = true,
                ignore_focus = {},
                globalstatus = true,
                refresh = {
                    statusline = 500,
                    tabline = 500,
                    winbar = 500,
                }
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { branch, filename, diff, diagnostics },
                lualine_c = {},
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
            },
        })
    end,
}
