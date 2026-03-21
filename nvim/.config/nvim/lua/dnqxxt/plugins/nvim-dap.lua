return {
  -- nvim-dap: Debugger Protocol
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- UI visual del debugger
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup()

          -- Abrir/cerrar UI automáticamente al arrancar/parar el debug
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
      },
      -- Adaptador para Python
      {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        config = function()
          -- Usa el python del entorno virtual activo si existe, o el del sistema
          local python = vim.fn.exepath("python3") or "python"
          require("dap-python").setup(python)
        end,
      },
    },
    keys = {
      { "<leader>dc",  function() require("dap").continue() end,          desc = "Debug: Continuar / Iniciar" },
      { "<leader>db",  function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
      { "<leader>dB",  function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Debug: Breakpoint Condicional" },
      { "<leader>do",  function() require("dap").step_over() end,         desc = "Debug: Step Over" },
      { "<leader>di",  function() require("dap").step_into() end,         desc = "Debug: Step Into" },
      { "<leader>dO",  function() require("dap").step_out() end,          desc = "Debug: Step Out" },
      { "<leader>dr",  function() require("dap").repl.open() end,         desc = "Debug: Abrir REPL" },
      { "<leader>dt",  function() require("dap").terminate() end,         desc = "Debug: Terminar sesión" },
      { "<leader>du",  function() require("dapui").toggle() end,          desc = "Debug: Toggle UI" },
    },
  },
}
