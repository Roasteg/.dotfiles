return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      vtsls = {
        tsserver = {
          globalPlugins = {
            {
              name = "@vue/typescript-plugin",
              location = LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
              languages = { "vue" },
              configNamespace = "typescript",
              enableForWorkspaceTypeScriptVersions = true,
            },
          },
        },
      },
      pyright = {},
      eslint = {},
      bashls = {},
      sqlls = {},
      cssls = {},
      css_variables = {},
      cssmodules_ls = {},
      tailwindcss = {},
      volar = {
        init_options = {
          vue = {
            hybridMode = true,
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
}
