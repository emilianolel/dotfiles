return {
  "iurimateus/luasnip-latex-snippets.nvim",
  dependencies = { "L3MON4D3/LuaSnip" },
  ft = "tex", -- Solo cargar al abrir un archivo de LaTeX
  config = function()
    require("luasnip-latex-snippets").setup({
      use_treesitter = false,
      -- Opciones como permitir snippets matematicos fuera de entornos matematicos
      allow_on_markdown = true,
    })
    
    -- Cargar los snippets para que estén disponibles en LuaSnip 
    require("luasnip").config.setup({ enable_autosnippets = true })
  end,
}
