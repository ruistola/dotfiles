return {
	"olimorris/codecompanion.nvim",
	init = function()
		vim.g.codecompanion_yolo_mode = true
	end,
	opts = {
		memory = {
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
				show_settings = true,
				show_token_count = true,
				show_tools_processing = true,
			},
		},
		strategies = {
			chat = {
				adapter = "anthropic",
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
			},
			cmd = {
				adapter = "anthropic",
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
				anthropic = function()
					return require("codecompanion.adapters").extend("anthropic", {
						schema = {
							model = {
								choices = {
									["claude-sonnet-4-5-20250929"] = {
										nice_name = "Claude Sonnet 4.5",
										opts = { can_reason = true, has_vision = true },
									},
								},
								default = "claude-sonnet-4-5-20250929",
							},
							temperature = { default = 0 },
							extended_thinking = { default = true },
							thinking_budget = { default = 32000 },
							max_tokens = { default = 64000 },
						},
					})
				end,
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
