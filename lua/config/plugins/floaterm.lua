return {
    "voldikss/vim-floaterm",
    event = "VeryLazy",

    cmd = { "FloatermToggle", "FloatermNew", "FloatermShow" },

    config = function()
        local floaterm = {
            floaterm_wintype = "float",
            floaterm_borderchars = "─│─│╭╮╯╰",
            floaterm_opener = "vsplit",
            floaterm_width = 0.9,
            floaterm_height = 0.3,
            floaterm_position = "bottom",
        }

        for k, v in pairs(floaterm) do
            vim.g[k] = v
        end

        if vim.fn.has("win32") == 1 then
            vim.g["floaterm_shell"] = "pwsh.exe"
        end

        local keymap = vim.keymap -- for conciseness

        keymap.set(
            { "n", "t" },
            "<leader>oo",
            "<cmd>FloatermToggle<CR>",
            { silent = true, desc = "Toggle Float terminal" }
        )
        keymap.set(
            { "n", "t" },
            "<leader>ot",
            "<cmd>FloatermNew<CR>",
            { silent = true, desc = "Open new Float terminal" }
        )
        keymap.set(
            { "n", "t" },
            "<leader>ox",
            "<cmd>FloatermKill<CR>:FloatermPrev<CR>",
            { silent = true, desc = "Toggle Float terminal" }
        )
        keymap.set({ "n", "t" }, "<leader>on", "<cmd>FloatermNext<CR>", { silent = true, desc = "Next terminal" })
        keymap.set({ "n", "t" }, "<leader>op", "<cmd>FloatermPrev<CR>", { silent = true, desc = "Previous terminal" })
        keymap.set({ "n", "t" }, "<leader>os", "<cmd>FloatermShow<CR>", { silent = true, desc = "Show terminal" })
        keymap.set(
            { "n", "t" },
            "<leader>of",
            "<cmd>FloatermNew --width=0.9 --height=0.9 --position=center --wintype=float<CR>",
            { silent = true, desc = "Open full screen terminal" }
        )
        keymap.set(
            { "n", "t" },
            "<leader>or",
            "<cmd>FloatermNew --width=0.4 --height=0.9 --position=right --wintype=float<CR>",
            { silent = true, desc = "Open right position terminal" }
        )
        keymap.set("t", "<leader>ou", "<C-\\><C-N>", { desc = "Exit terminal mode" })
    end,
}
