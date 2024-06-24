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

        local keymap = vim.keymap -- for conciseness

        keymap.set(
            { "n", "t" },
            "<leader>tt",
            "<cmd>FloatermToggle<CR>",
            { silent = true, desc = "Toggle Float terminal" }
        )
        keymap.set(
            { "n", "t" },
            "<leader>to",
            "<cmd>FloatermNew pwsh.exe<CR>",
            { silent = true, desc = "Open new Float terminal" }
        )
        keymap.set(
            { "n", "t" },
            "<leader>tx",
            "<cmd>FloatermKill<CR>:FloatermPrev<CR>",
            { silent = true, desc = "Toggle Float terminal" }
        )
        keymap.set({ "n", "t" }, "<leader>tn", "<cmd>FloatermNext<CR>", { silent = true, desc = "Next terminal" })
        keymap.set({ "n", "t" }, "<leader>tp", "<cmd>FloatermPrev<CR>", { silent = true, desc = "Previous terminal" })
        keymap.set({ "n", "t" }, "<leader>ts", "<cmd>FloatermShow<CR>", { silent = true, desc = "Show terminal" })
        keymap.set(
            { "n", "t" },
            "<leader>tf",
            "<cmd>FloatermNew --width=0.9 --height=0.9 --position=center --wintype=float pwsh.exe<CR>",
            { silent = true, desc = "Open full screen terminal" }
        )
        keymap.set(
            { "n", "t" },
            "<leader>tr",
            "<cmd>FloatermNew --width=0.4 --height=0.9 --position=right --wintype=float pwsh.exe<CR>",
            { silent = true, desc = "Open right position terminal" }
        )
    end,
}
