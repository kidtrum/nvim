---@diagnostic disable: missing-fields
return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",

    dependencies = {
        "windwp/nvim-ts-autotag",
    },

    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({  -- enable syntax highlighting
            highlight = {
                enable = true,
            },
            -- enable indentation
            indent = { enable = true },

            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = {
                enable = true,
            },

            -- ensure these language parsers are installed
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "yaml",
                "html",
                "css",
                "prisma",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "luadoc",
                -- "lua_patterns",
                "vim",
                "vimdoc",
                "dockerfile",
                "gitignore",
                "query",
                "cmake",
                "c",
                "cpp",
                "devicetree",
                "doxygen",
                "java",
                "make",
                "python",
                "xml",
                "comment",
                "regex",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-b>",
                    node_incremental = "<C-b>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },

        })
    end,
}
