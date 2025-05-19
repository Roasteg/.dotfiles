return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {},
        eslint = {},
        bashls = {},
        sqlls = {},
        cssls = {},
        css_variables = {},
        cssmodules_ls = {},
        tailwindcss = {
          filetypes = { "css", "scss", "vue", "html", "javascriptreact", "typescriptreact", "typescript", "javascript" },
          settings = {
            tailwindCSS = {
              classAttributes = { "class", "ui" },
              experimental = {
                classRegex = { { "ui:\\s*{([^)]*)\\s*}", "(?:'|\"|`)([^']*)(?:'|\"|`)" } },
              },
            },
          },
        },
        intelephense = {
          settings = {
            intelephense = {
              format = {
                enable = false,
              },
            },
          },
        },
        phpactor = {
          filetypes = { "php" },
          setup = {
            init_options = {
              ["language_server_phpstan.enabled"] = false,
              ["language_server_psalm.enabled"] = false,
              ["indexer.exclude_patterns"] = {
                "/vendor/**/Tests",
                "/vendor/**/tests/**/*",
                "/vendor/composer/**/*",
                "/generated/**/*",
                "/upload/**",
                "/assets/**",
              },
            },
          },
        },
      },
    },
  },
}
