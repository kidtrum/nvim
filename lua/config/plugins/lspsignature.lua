return {
    "ray-x/lsp_signature.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("lsp_signature").setup({
            bind = true,
            handler_opts = {
                border = "rounded",
            },
        })
    end
}
