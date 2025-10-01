return {
	"olimorris/codecompanion.nvim",
	opts = {
		memory = {
			opts = {
				chat = {
					enabled = true,
					default_params = "watch",
				},
			},
			claude = {
				description = "Memory files for Claude Code users",
				parser = "claude",
				files = {
					"CLAUDE.md",
					"CLAUDE.local.md",
					"~/.claude/CLAUDE.md",
				},
			},
		},
		strategies = {
			chat = {
				fold_context = true,
				fold_reasoning = true,
				adapter = "anthropic",
				model = "claude-opus-4-1-20250805",
				variables = {
					["buffer"] = {
						opts = {
							default_params = "watch",
						},
					},
				},
				tools = {
					opts = {
						default_tools = {
							"full_stack_dev",
						},
					},
				},
			},
			inline = {
				adapter = "anthropic",
				model = "claude-opus-4-1-20250805",
			},
			cmd = {
				adapter = "anthropic",
				model = "claude-opus-4-1-20250805",
			},
		},
		opts = {
			log_level = "DEBUG",
		},
		adapters = {
			http = {
				opts = {
					show_defaults = false,
				},
				anthropic = "anthropic",
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
