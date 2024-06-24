return {
    "szw/vim-maximizer",

    -- keys = {
    --     { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
    -- },
    
    -- vim.cmd("let g:maximizer_default_mapping_key = ''"),

    config = function()
        -- keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>", {desc = "Maximize/minimize a split" }) -- toggle file explorer
    end,

}
