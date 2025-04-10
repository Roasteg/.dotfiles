return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      trigger = {
        show_on_blocked_trigger_characters = { " ", "\n", "\t", "{", "}", "{}" },
      },
    },
    sources = {
      per_filetype = { tsx = { "lsp", "snippets" } },
    },
    keymap = {
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-x>"] = { "show" },
    },
  },
}
