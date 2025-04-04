return {
	pyright = {
		settings = {},
	},
	-- clangd = {},
	gopls = {
		settings = {
			gopls = {
				analyses = {
					unusedparams = false,
				},
				hints = {
					constantValues = true,
					assignVariableTypes = true,
					parameterNames = true,
					functionTypeParameters = true,
				},
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
	cssls = {},
	css_variables = {},
	cssmodules_ls = {},
	eslint = {},
	prettier = {},
	volar = {},
	ts_ls = {
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = vim.fn.stdpath("data")
						.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
					languages = { "vue" },
				},
			},
		},
	},
	html = {
		filetypes = { "html", "templ" },
	},
	htmx = {
		filetypes = { "html", "templ" },
	},
	tailwindcss = {
		filetypes = { "templ", "astro", "javascript", "typescript", "react" },
		settings = {
			tailwindCSS = {
				includeLanguages = {
					templ = "html",
				},
			},
		},
	},
	-- intelephense = {},
	lua_ls = {
		-- cmd = {...},
		-- filetypes = { 'script' },
		-- capabilities = {},
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
				-- diagnostics = { disable = { 'missing-fields' } },
			},
		},
	},
}
