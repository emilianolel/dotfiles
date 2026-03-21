return {
  -- vim-dadbod: core database client
  {
    "tpope/vim-dadbod",
    cmd = { "DB", "DBUI" },
    dependencies = {
      -- UI explorer de bases de datos
      {
        "kristijanhusak/vim-dadbod-ui",
        cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
        init = function()
          vim.g.db_ui_use_nerd_fonts = 1
        end,
        keys = {
          { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle DBUI" },
        },
      },
      -- Autocompletado de tablas y columnas de SQL
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        init = function()
          -- Auto-trigger completion inside sql files
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "sql", "mysql", "plsql" },
            callback = function()
              require("cmp").setup.buffer({
                sources = {
                  { name = "vim-dadbod-completion" },
                  { name = "buffer" },
                },
              })
            end,
          })
        end,
      },
    },
  },
}
