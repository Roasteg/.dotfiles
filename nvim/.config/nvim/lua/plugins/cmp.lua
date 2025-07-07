return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    -- vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require('cmp')
    opts.experimental = {}
    opts.mapping = cmp.mapping({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<S-tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-x>"] = cmp.mapping.complete(),
      ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),

      ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
      ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<C-CR>"] = function(fallback)
        cmp.abort()
        fallback()
      end,
    })
  end,
}
-- return {
--   "hrsh7th/nvim-cmp",
--   -- Not all LSP servers add brackets when completing a function.
--   -- To better deal with this, LazyVim adds a custom option to cmp,
--   -- that you can configure. For example:
--   --
--   -- ```lua
--   -- opts = {
--   --   auto_brackets = { "python" }
--   -- }
--   -- ```
--   dependencies = {
--     { "roobert/tailwindcss-colorizer-cmp.nvim", opts = {} },
--   },
--   opts = function(_, opts)
--     local cmp = require("cmp")
--     local defaults = require("cmp.config.default")()
--     local auto_select = true
--     if LazyVim.has("nvim-snippets") then
--       table.insert(opts.sources, { name = "snippets" })
--     end
--     return {
--       auto_brackets = {}, -- configure any filetype to auto add brackets
--       completion = {
--         completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
--       },
--       snippet = {
--         expand = function(item)
--           return LazyVim.cmp.expand(item.body)
--         end,
--       },
--       preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
--       mapping = cmp.mapping.preset.insert({
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--         ["<S-tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--         ["<C-x>"] = cmp.mapping.complete(),
--         ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
--
--         ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
--         ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--         ["<C-CR>"] = function(fallback)
--           cmp.abort()
--           fallback()
--         end,
--         -- ["<tab>"] = function(fallback)
--         --   return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
--         -- end,
--       }),
--       sources = cmp.config.sources({
--         { name = "lazydev" },
--
--         { name = "nvim_lsp" },
--         { name = "path" },
--       }, {
--
--         { name = "buffer" },
--       }),
--       formatting = {
--         format = function(entry, item)
--           -- local icons = LazyVim.config.icons.kinds
--           -- if icons[item.kind] then
--           --   item.kind = icons[item.kind] .. item.kind
--           -- end
--           local format_kinds = opts.formatting.format
--           format_kinds(entry, item) -- add icons
--           require("tailwindcss-colorizer-cmp").formatter(entry, item)
--
--           local widths = {
--             abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
--             menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
--           }
--
--           for key, width in pairs(widths) do
--             if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
--               item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
--             end
--           end
--
--           return item
--         end,
--       },
--       sorting = defaults.sorting,
--     }
--   end,
-- }
