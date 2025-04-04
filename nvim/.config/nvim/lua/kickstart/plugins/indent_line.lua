return {
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},

			scope = { show_start = true, show_end = true },
			exclude = {
				filetypes = {
					"Trouble",
					"alpha",
					"dashboard",
					"help",
					"lazy",
					"mason",
					"neo-tree",
					"notify",
					"snacks_dashboard",

					"snacks_notif",
					"snacks_terminal",
					"snacks_win",
					"toggleterm",
					"trouble",
				},
			},
		},
	},
}
