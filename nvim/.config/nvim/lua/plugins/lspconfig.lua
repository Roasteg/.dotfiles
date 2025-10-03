return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {},
        bashls = {},
        sqlls = {},
        cssls = {},
        css_variables = {},
        cssmodules_ls = {},
        tailwindcss = {
          filetypes_include = {
            "css",
            "scss",
            "vue",
            "html",
            "javascriptreact",
            "typescriptreact",
            "typescript",
            "javascript",
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
        -- phpactor = { filetypes = { "php" }, setup = {
        --     init_options = {
        --       ["language_server_phpstan.enabled"] = false,
        --       ["language_server_psalm.enabled"] = false,
        --       ["indexer.exclude_patterns"] = {
        --         "/vendor/**/Tests",
        --         "/vendor/**/tests/**/*",
        --         "/vendor/composer/**/*",
        --         "/generated/**/*",
        --         "/upload/**",
        --         "/assets/**",
        --       },
        --     },
        --   },
        -- },
      },
    },
    setup = {
      tailwindcss = function(_, opts)
        opts.settings = {
          tailwindCSS = {
            classAttributes = { "class", "ui", "className" },
            classFunctions = { "cva", "cx" },
            experimental = {
              classRegex = { { "ui:\\s*{([^)]*)\\s*}", "(?:'|\"|`)([^']*)(?:'|\"|`)" } },
            },
          },
        }
      end,
    },
  },
}
