return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "eslint",
        "texlab",
        "bashls",
        "clangd",
        "jsonls",
        "hls",
        "rust_analyzer",
        "sqlls",
        "terraformls",
        "marksman",
        "yamlls",
        "taplo",
        "ltex",
        "jinja_lsp",
        "dockerls",
        "protols",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
        "shfmt", -- bash formatter
        "shellcheck", -- bash linter
        "clang-format", -- c/c++ formatter
        "fourmolu", -- haskell formatter
        "sqlfluff", -- sql linter and formatter
        "tflint", -- terraform linter
        "hadolint", -- docker linter
        "sqlfmt",   -- dbt-compatible SQL formatter
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
