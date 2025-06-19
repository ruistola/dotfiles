return {
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "<leader>gn", function()
					if vim.wo.diff then
						vim.cmd.normal({ "<leader>gn", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Next hunk" })

				map("n", "<leader>gp", function()
					if vim.wo.diff then
						vim.cmd.normal({ "<leader>gp", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Prev hunk" })

				vim.keymap.set(
					"n",
					"<leader>gP",
					require("gitsigns").preview_hunk,
					{ buffer = bufnr, desc = "Preview hunk" }
				)
			end,
		},
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
