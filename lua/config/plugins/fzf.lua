return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({'fzf-native'})

        vim.cmd("FzfLua setup_fzfvim_cmds")
        if vim.fn.has('win32') == 0 then
            -- set keymaps
            local keymap = vim.keymap -- for conciseness

            keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Fuzzy find files in cwd" })
            keymap.set("n", "<leader>fr", "<cmd>FzfLua oldfiles<CR>", { desc = "Fuzzy find recent files" })
            keymap.set("n", "<leader>fs", "<cmd>FzfLua live_grep<CR>", { desc = "Find string in cwd" })
            keymap.set("n", "<leader>fc", "<cmd>FzfLua grep_cword<CR>", { desc = "Find string under cursor in cwd" })
            keymap.set("n", "<leader>/", "<cmd>FzfLua blines<CR>", { desc = "Find string in current buffer" })
            keymap.set("n", "<leader>fb", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Find current document symbols" })
        end
    end,
}
