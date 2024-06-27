return {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "Weissle/persistent-breakpoints.nvim",
    },

    config = function()
        local dapui = require("dapui")

        dapui.setup()

        local dap = require("dap")

        -- dap.listeners.before.attach.dapui_config = function()
        --     dapui.open()
        -- end

        dap.listeners.after.event_initialized.dapui_config = function()
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
        local keymap = vim.keymap -- For conciseness

        keymap.set("n", "<F5>", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
        keymap.set("n", "<F6>", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
        keymap.set("n", "<F7>", "<cmd>DapStepOut<CR>", { desc = "Step Out" })
        keymap.set("n", "<F8>", "<cmd>DapContinue<CR>", { desc = "Start or Continue Debugging" })
        keymap.set("n", "<C-F8>", "<cmd>DapTerminate<CR>", { desc = "Terminate Debugging" })
        keymap.set("n", "<F10>", function()
            dap.run_to_cursor()
        end, { desc = "Run to Cursor" })
        keymap.set("n", "<leader>cc", function()
            dapui.eval()
        end, { desc = "Evaluate" })
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
        vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939" })
        vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef" })
        vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379" })
        vim.api.nvim_set_hl(0, "DapContinue", { ctermbg = 0, fg = "#FFB86C" })

        vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DapBreakpoint" })
        vim.fn.sign_define("DapBreakpointCondition", { text = " ", texthl = "DapBreakpoint" })
        vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "DapBreakpoint" })
        vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "DapLogPoint" })
        vim.fn.sign_define("DapStopped", { text = " ", texthl = "DapStopped" })

        -- Setup for Dap adapters
        dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            command = "C:\\Users\\a5068511\\AppData\\Local\\nvim-data\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe",
            -- command = "C:/tools/cpptools-win64/extension/debugAdapters/bin/OpenDebugAD7.exe",
            options = {
                detached = false,
            },
        }

        dap.adapters.lldb = {
            type = "executable",
            command = "C:\\Renesas\\LLVM\\bin\\lldb-vscode.exe", -- adjust as needed, must be absolute path
            name = "lldb",
        }

        dap.adapters.codelldb = {
            type = "server",
            port = "13000",
            executable = {
                -- CHANGE THIS to your path!
                command = "C:\\Users\\a5068511\\AppData\\Local\\nvim-data\\mason\\packages\\codelldb\\extension\\adapter\\codelldb.exe",
                args = { "--port", "13000" },

                -- On windows you may have to uncomment this:
                detached = false,
            },
        }

        dap.adapters.python = function(cb, config)
            if config.request == "attach" then
                ---@diagnostic disable-next-line: undefined-field
                local port = (config.connect or config).port
                ---@diagnostic disable-next-line: undefined-field
                local host = (config.connect or config).host or "127.0.0.1"
                cb({
                    type = "server",
                    port = assert(port, "`connect.port` is required for a python `attach` configuration"),
                    host = host,
                    options = {
                        source_filetype = "python",
                    },
                })
            else
                cb({
                    type = "executable",
                    command = "C:\\Users\\a5068511\\AppData\\Local\\nvim-data\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe",
                    args = { "-m", "debugpy.adapter" },
                    options = {
                        source_filetype = "python",
                    },
                })
            end
        end

        -- Setup for Debug configurations
        dap.configurations.python = {
            {
                -- The first three options are required by nvim-dap
                type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
                request = "launch",
                name = "Launch file (Python)",

                -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

                program = "${file}", -- This configuration will launch the current file if used.
                pythonPath = "C:\\Program Files\\Python311\\python.exe",
            },
        }

        dap.configurations.c = {
            {
                name = "(Default) Launch file (CodeLLDB)",
                -- type = "cppdbg",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }

        dap.configurations.cpp = dap.configurations.c
    end,
}
