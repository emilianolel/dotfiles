return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "rust",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
      "toml",
      "latex",
    },
    auto_install = true,
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
  end,
}

