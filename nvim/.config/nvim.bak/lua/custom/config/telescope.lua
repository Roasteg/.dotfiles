local action_state = require 'telescope.actions.state'
local actions = require 'telescope.actions'

local m = {}
m.my_buffer = function()
  require('telescope.builtin').buffers {
    attach_mappings = function(prompt_bufnr, map)
      local delete_buf = function()
        local selection = action_state.get_current_selection()

        -- depending if you want to close or not, include this or not

        actions.close(prompt_bufnr)
        -- print(vim.inspect(selection))

        -- better print selection before first running this. I am not sure if it have a bufnr or if this field is named differently
        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
      end

      -- mode, key, func
      -- this is just an example
      map('n', 'd', delete_buf)
    end,
  }
end

return m
