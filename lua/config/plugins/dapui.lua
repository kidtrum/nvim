return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "Weissle/persistent-breakpoints.nvim",
    },

    config = function()
        local dapui = require("dapui")

        dapui.setup()

        local dap = require("dap")

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- Setup persistent breakpoints
        require("persistent-breakpoints").setup({
            load_breakpoints_event = "BufReadPost",
        })

        local persistent = require("persistent-breakpoints.api")

        -- Setting keymaps
        local keymap = vim.keymap   -- For conciseness

        keymap.set("n", "<F5>", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
        keymap.set("n", "<F6>", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
        keymap.set("n", "<F7>", "<cmd>DapStepOut<CR>", { desc = "Step Out" })
        keymap.set("n", "<F8>", "<cmd>DapContinue<CR>", { desc = "Start or Continue Debugging" })
        keymap.set("n", "<C-F8>", "<cmd>DapTerminate<CR>", { desc = "Terminate Debugging" })
        keymap.set("n", "<leader>cc", function()
            dapui.eval()
        end, { desc = "Step Into" })
        keymap.set("n", "<F9>", function()
            persistent.toggle_breakpoint()
        end, { desc = "Toggle breakpoints" })
        keymap.set("n", "<S-F9>", function()
            persistent.set_conditional_breakpoint(vim.fn.input(" CONDITION   "))
        end, { desc = "Set conditional breakpoints" })
        keymap.set("n", "<leader>cb", function()
            persistent.clear_all_breakpoints()
        end, { desc = "Clear all breakpoints" })

        -- Configure the different breakpoints icons
        vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939' })
        vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef' })
        vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379' })
        vim.api.nvim_set_hl(0, 'DapContinue', { ctermbg = 0, fg = '#FFB86C' })

        vim.fn.sign_define('DapBreakpoint', { text = ' ', texthl = 'DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointCondition', { text = ' ', texthl = 'DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointRejected', { text = ' ', texthl = 'DapBreakpoint' })
        vim.fn.sign_define('DapLogPoint', { text = ' ', texthl = 'DapLogPoint' })
        vim.fn.sign_define('DapStopped', { text = ' ', texthl = 'DapStopped' })
    end,
}
