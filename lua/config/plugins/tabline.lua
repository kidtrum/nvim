return {
    'crispgm/nvim-tabline',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
    config = function()
        local tabline = require("tabline")

        tabline.setup({})

        vim.opt.showtabline = 1
    end,
}
