local luasnip = require("lazyvim.plugins.extras.coding.luasnip")
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- New Tab
keymap("n", "te", ":tabedit<CR>", opts)

keymap("n", "sp", ":split<CR><C-w>l", opts)
keymap("n", "sv", ":vsplit<CR><C-w>l", opts)

-- Better line start/end
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)

-- Better escape
keymap("i", "jk", "<ESC>", opts)
keymap("n", "<ESC>", "<ESC>:noh<CR>", opts)

-- Tab switch buffer
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Resize window using <ctrl> arrow keys
keymap("n", "<leader>wk", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap("n", "<leader>wj", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap("n", "<leader>wh", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap("n", "<leader>wl", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

local nvim_tmux_nav = require("nvim-tmux-navigation")
keymap("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
keymap("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
keymap("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
keymap("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
keymap("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
keymap("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
