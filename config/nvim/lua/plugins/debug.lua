return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapUtils = require("dap.utils")
    local dapui = require("dapui")

    local function pick_process()
      dapUtils.pick_process({
        filter = function(process)
          return process.name:find("inspect") and process.name:find("node")
        end,
      })
    end

    -- Set keymaps to control the debugger
    vim.keymap.set("n", "<leader>dh", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<leader>dj", dap.step_into, { desc = "Step Into" })
    vim.keymap.set("n", "<leader>dk", dap.step_out, { desc = "Step Out" })
    vim.keymap.set("n", "<leader>dl", dap.step_over, { desc = "Step Over" })
    vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Dap UI" })
    vim.keymap.set("v", "<leader>de", dapui.eval, { desc = "Evaluate" })

    vim.keymap.set("n", "<leader>dd", "<CMD>DapNew Attach<CR>", { desc = "Debug" })
    vim.keymap.set("n", "<leader>db", "<CMD>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Set Conditional Breakpoint" })

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = {
          vim.fn.resolve(vim.fn.stdpath("data") .. "/vscode-js-debug/dist/src/dapDebugServer.js"),
          "${port}",
        },
      },
    }
    local attachAdapter = {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = pick_process,
      cwd = "${workspaceFolder}",
    }

    local lauchAdapter = {
      type = "pwa-node",
      request = "launch",
      name = "Launch",
      program = "${file}",
      cwd = "${workspaceFolder}",
    }

    for _, language in ipairs({ "typescript", "javascript" }) do
      dap.configurations[language] = { attachAdapter, lauchAdapter }
    end

    dap.configurations["oil"] = { attachAdapter }

    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close({})
    end
  end,
}
