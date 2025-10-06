return {
	"olimorris/codecompanion.nvim",
	init = function()
		vim.g.codecompanion_yolo_mode = true
	end,
	opts = {
		memory = {
			default = {
				description = "Collection of common files for all projects",
				files = {
					".clinerules",
					".cursorrules",
					".goosehints",
					".rules",
					".windsurfrules",
					".github/copilot-instructions.md",
					"AGENT.md",
					"AGENTS.md",
					{ path = "CLAUDE.md", parser = "claude" },
					{ path = "CLAUDE.local.md", parser = "claude" },
					{ path = "~/.claude/CLAUDE.md", parser = "claude" },
				},
			},
			opts = {
				chat = {
					enabled = true,
					default_memory = { "default", "claude" },
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
		display = {
			chat = {
				intro_message = "Press ? for options",
				auto_scroll = true,
				fold_context = true,
				fold_reasoning = true,
				show_token_count = false,
				show_tools_processing = true,
			},
		},
		strategies = {
			chat = {
				adapter = "anthropic",
				model = "claude-sonnet-4-5",
				variables = {
					["buffer"] = {
						opts = {
							default_params = "watch",
						},
					},
				},
				tools = {
					opts = {
						auto_submit_errors = true,
						auto_submit_success = true,
						default_tools = {
							"full_stack_dev",
						},
					},
				},
			},
			inline = {
				adapter = "anthropic",
				model = "claude-sonnet-4-5",
			},
			cmd = {
				adapter = "anthropic",
				model = "claude-sonnet-4-5",
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
