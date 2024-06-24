return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            view = {
                relativenumber = false,
                adaptive_size = true,
                centralize_selection = false,
                side = "left",
                number = false,
                signcolumn = "yes",
                preserve_window_proportions = true,
                float = {
                    enable = true,
                    open_win_config = {
                        relative = "editor",
                        border = "rounded",
                        width = 50,
                        height = 50,
                        row = 1,
                        col = 1,
                    },
                },
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
                timeout = 700,
            },
        })

        -- keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
        keymap.set(
            "n",
            "<leader>ef",
            "<cmd>NvimTreeFindFileToggle<CR>",
            { desc = "Toggle file explorer on current file" }
        ) -- toggle file explorer on current file
        keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- toggle file explorer
        keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- toggle file explorer

        -- fast keymaps
        -- keymap.set("n", "<F4>", "<cmd>NvimTreeToggle<CR>", {desc = "Toggle file explorer" }) -- toggle file explorer
        -- keymap.set("n", "<F4>", "<cmd>NvimTreeFocus<CR>", {desc = "Focus file explorer" }) -- toggle file explorer
    end,
}
