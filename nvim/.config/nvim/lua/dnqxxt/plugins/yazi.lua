return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- 👇 en este bloque definimos los atajos de teclado principales
    {
      "<leader>ee",
      "<cmd>Yazi<cr>",
      desc = "Abrir Yazi en el directorio actual (CWD)",
    },
    {
      -- abrir yazi en el directorio del archivo actual
      "<leader>ef",
      "<cmd>Yazi cwd<cr>",
      desc = "Abrir Yazi en el directorio del archivo actual",
    },
    {
      -- abrir yazi en una nueva pestaña
      "<leader>et",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd(), { open_in_tab = true })
      end,
      desc = "Abrir Yazi en una nueva pestaña",
    },
  },
  ---@type YaziConfig
  opts = {
    -- si quieres configurar algo más, puedes hacerlo aquí
    open_for_directories = true,
    keymaps = {
      show_help = "<f1>",
    },
  },
}
