return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {
			impersonate_nvim_cmp = true,
		},
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
	},
	{
		"hrsh7th/cmp-cmdline",
		dependencies = "hrsh7th/nvim-cmp",
		lazy = true,
	},
	{
		"hrsh7th/cmp-path",
		dependencies = "hrsh7th/nvim-cmp",
		lazy = true,
	},
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
		},
		version = "*",
		opts = {
			sources = {
				default = { "lsp", "path", "buffer", "codecompanion" },
				per_filetype = {
					codecompanion = { "codecompanion" },
				},
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			completion = {
				accept = {
					auto_brackets = {
						enabled = false,
						-- kind_resolution = {
						-- 	enabled = true,
						-- 	blocked_filetypes = { "go" },
						-- },
						-- semantic_token_resolution = {
						-- 	enabled = true,
						-- 	blocked_filetypes = { "go" },
						-- },
					},
				},
				list = {
					selection = { preselect = false, auto_insert = false },
				},
				documentation = {
					auto_show = false,
					auto_show_delay_ms = 500,
				},
			},
			signature = { enabled = false },
			keymap = {
				preset = "default",
				["<tab>"] = { "hide_documentation", "select_next", "fallback" },
				["<S-tab>"] = { "hide_documentation", "select_prev", "fallback" },
				["<C-tab>"] = { "hide_documentation", "fallback" },
				["<CR>"] = { "hide_documentation", "accept", "fallback" },
				["<C-space>"] = { "show_documentation", "fallback" },
			},
		},
		config = function(_, opts)
			local blink_cmp = require("blink.cmp")
			blink_cmp.setup(opts)

			local cmp = require("cmp")

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "path" },
					{ name = "cmdline", keyword_length = 2 },
				},
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
		end,
	},
}
