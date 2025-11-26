return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		cmd = "Telescope",
		keys = {
			{ "<leader>?", "<cmd>Telescope oldfiles<cr>", desc = "[?] Find recently opened files" },
			{ "<leader>k", "<cmd>Telescope keymaps<cr>", desc = "[k] Search [K]eymaps" },
			{ "<leader><space>", "<cmd>Telescope buffers<cr>", desc = "[ ] Find existing buffers" },
			{ "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Search [G]it [F]iles" },
			{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "[S]earch [H]elp" },
			{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "[S]earch current [W]ord" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch by [G]rep" },
			{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[S]earch [D]iagnostics" },
			{
				"<leader>/",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					}))
				end,
				desc = "[/] Fuzzily search in current buffer",
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob",
						"!**/.git/*",
					},
					sorting_strategy = "ascending",
					layout_strategy = "vertical",
					layout_config = {
						vertical = {
							width = { padding = 0 },
							height = { padding = 0 },
							prompt_position = "top",
							preview_cutoff = 0,
							preview_height = 0.5,
							preview_width = 1.0,
							mirror = true,
						},
					},
					initial_mode = "normal",
					path_display = {
						"truncate",
					},
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
						n = {
							["K"] = require("telescope.actions.layout").toggle_preview,
							["dd"] = require("telescope.actions").delete_buffer,
						},
					},
					preview = {
						timeout_ms = 3000,
					},
				},
				pickers = {
					buffers = {
						sort_mru = true,
					},
					find_files = {
						hidden = true,
					},
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		lazy = false,
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{ "<leader>o", "<cmd>Telescope neoclip<CR>", desc = "Telescope Neoclip" },
		},
		config = function()
			require("neoclip").setup({
				history = 1000,
				enable_persistent_history = false,
				length_limit = 1048576,
				continuous_sync = false,
				db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
				filter = nil,
				preview = true,
				prompt = nil,
				default_register = '"',
				default_register_macros = "q",
				enable_macro_history = true,
				content_spec_column = false,
				disable_keycodes_parsing = false,
				on_select = {
					move_to_front = false,
					close_telescope = true,
				},
				on_paste = {
					set_reg = false,
					move_to_front = false,
					close_telescope = true,
				},
				on_replay = {
					set_reg = false,
					move_to_front = false,
					close_telescope = true,
				},
				on_custom_action = {
					close_telescope = true,
				},
				keys = {
					telescope = {
						i = {
							select = "<cr>",
							paste = "<c-j>",
							paste_behind = "<c-k>",
							replay = "<c-q>",
							delete = "<c-d>",
							edit = "<c-e>",
							custom = {},
						},
						n = {
							select = "<cr>",
							paste = "p",
							paste_behind = "P",
							replay = "q",
							delete = "d",
							edit = "e",
							custom = {},
						},
					},
				},
			})
		end,
	},
}
