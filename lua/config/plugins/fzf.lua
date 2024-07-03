return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({'fzf-native'})

        vim.cmd("FzfLua setup_fzfvim_cmds")
    end,
}
