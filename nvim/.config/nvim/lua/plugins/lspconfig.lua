return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      vtsls = {},
      pyright = {},
      eslint = {},
      bashls = {},
      sqlls = {},
      cssls = {},
      css_variables = {},
      cssmodules_ls = {},
      tailwindcss = {},
      volar = {},
    },

    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      vtsls = function(_, opts)
        require("lspconfig").vtsls.setup({
          server = opts,
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          settings = {
            vtsls = {
              tsserver = {
                globalPlugins = {
                  {
                    name = "@vue/typescript-plugin",
                    location = require("mason-registry").get_package("vue-language-server"):get_install_path()
                      .. "/node_modules/@vue/language-server",
                    languages = { "vue" },
                    configNamespace = "typescript",
                    enableForWorkspaceTypeScriptVersions = true,
                  },
                },
              },
            },
          },
        })
        return true
      end,
    },
  },
}
