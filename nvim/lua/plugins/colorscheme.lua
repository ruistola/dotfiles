return {
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		opts = {
			compile = false,
			undercurl = false,
			commentStyle = { italic = false },
			functionStyle = {},
			keywordStyle = { italic = false },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = true,
			dimInactive = false,
			terminalColors = true,
			colors = {
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			theme = "dragon",
			background = {
				dark = "dragon",
				light = "lotus",
			},
		},
	},
	{
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			undercurl = false,
			transparent = true,
			gutter = false,
			dimInactive = false,
			terminalColors = true,
			commentStyle = { italic = false },
			functionStyle = { italic = false },
			keywordStyle = { italic = false, bold = false },
			statementStyle = { italic = false, bold = true },
			typeStyle = { italic = false },
		},
		config = function(_, opts)
			require("kanagawa-paper").setup(opts)
			-- Apply colorscheme and custom highlights
			vim.cmd.colorscheme("kanagawa-paper")

			-- Reapply custom highlights after colorscheme loads
			vim.api.nvim_set_hl(0, "MatchParen", { bold = true, bg = "none", fg = "#ffaf5f" })
			vim.api.nvim_set_hl(0, "Visual", { bold = false, bg = "#ffaf5f", fg = "#1c1c1c" })
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#fab387", bg = "None" })

			local bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")
			vim.api.nvim_set_hl(0, "Error", { fg = "red", bg = bg })
			vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "red", bg = bg })
			vim.api.nvim_set_hl(0, "ErrorMsg", { fg = "red", bg = "NONE" })
		end,
	},
}
