return {
  "lervag/vimtex",
  lazy = false, -- se recomienda cargar vimtex en el inicio en lugar de perezosamente
  init = function()
    -- usar Skim como visor de PDF en macOS
    vim.g.vimtex_view_method = "skim"
    
    -- no ocultar citas o entorno matemático por defecto (opcional)
    vim.g.vimtex_syntax_conceal = {
      accents = 1,
      cites = 1,
      fancy = 1,
      greek = 1,
      math_bounds = 1,
      math_delimiters = 1,
      math_fracs = 1,
      math_super_sub = 1,
      symbols = 1,
      env_itemize = 1,
      math_symbols = 1,
      sections = 0,
      styles = 1,
    }

    -- Compiler settings
    vim.g.vimtex_compiler_method = "latexmk"
  end,
}
