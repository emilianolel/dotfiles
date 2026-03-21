return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    -- Enable wait time for mapped sequences to trigger which-key
    vim.o.timeout = true
    vim.o.timeoutlen = 500 -- Waits 500ms before showing the popup
  end,
  opts = {
    -- Default options are usually great.
    -- Here you could customize appearance and grouping later.
  },
}
