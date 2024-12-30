-- You can add your own plugins here or in other files in this directory!
--
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
return {
  {
    'willothy/nvim-cokeline',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required for v0.4.0+
      'nvim-tree/nvim-web-devicons', -- If you want devicons
      'stevearc/resession.nvim', -- Optional, for persistent history
    },
    config = function()
      require('cokeline').setup {
        show_if_buffers_are_at_least = 1,
        buffers = {},
        default_hl = {
          fg = function(buf)
            return buf.diagnostics.errors > 0 and '#ce1126' or buf.is_modified and '#a3ffb4' or buf.is_focused and '#26bfbf' or '#606364'
          end,
          bold = function(buf)
            return buf.is_focused
          end,
          underline = function(buf)
            return buf.is_focused
          end,
        },
        fill_hl = 'TabLineFill',
        sidebar = {
          filetype = { 'neo-tree' },
          components = {
            {
              text = function(buf)
                return 'tree'
              end,
              bold = true,
            },
          },
        },
        components = {
          {
            text = function(buf)
              return ' ' .. buf.index
            end,
          },
          {
            text = function(buf)
              return ' ' .. buf.filename
            end,
          },
          {
            text = function(buf)
              return buf.diagnostics.errors > 0 and ' ' .. buf.diagnostics.errors or buf.is_modified and ' M ' or ''
            end,
            bold = true,
          },
          {
            text = function(buf)
              return ' ' .. buf.devicon.icon
            end,
            fg = function(buf)
              return buf.is_focused and buf.devicon.color or '#606364'
            end,
          },
        },
      }
      vim.keymap.set('n', '<S-Tab>', '<Plug>(cokeline-focus-prev)', { silent = true })
      vim.keymap.set('n', '<Tab>', '<Plug>(cokeline-focus-next)', { silent = true })
      vim.keymap.set('n', '<Leader>bd', ':bdelete<CR>', { silent = true })
      for i = 1, 9 do
        vim.api.nvim_set_keymap('n', ('<F%s>'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { silent = true })
        vim.api.nvim_set_keymap('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i), { silent = true })
      end
    end,
  },
  { 'habamax/vim-godot', event = 'VimEnter' },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',

      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require('neo-tree').setup {
        filesystem = {
          filtered_items = {
            hide_by_name = {
              'node_modules',
              'Vendors',
              'vendors',
              'vendor',
              'Vendor',
            },
          },
          buffers = {
            follow_current_file = {
              enabled = true, -- This will find and focus the file in the active buffer every time
              --              -- the current file is changed while the tree is open.

              leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
          },
        },
      }
      vim.cmd [[nnoremap \ :Neotree toggle<cr>]]
    end,
  },
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      local nvim_tmux_nav = require 'nvim-tmux-navigation'

      nvim_tmux_nav.setup {
        disable_when_zoomed = true, -- defaults to false
      }

      vim.keymap.set('n', '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', '<C-j>', nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', '<C-k>', nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', '<C-l>', nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', '<C-\\>', nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set('n', '<C-Space>', nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
  },
}
