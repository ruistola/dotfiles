return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					go = { "gofmt" },
					lua = { "stylua" },
					python = { "isort", "black" },
					rust = { "rustfmt", lsp_format = "fallback" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
				},
				format_on_save = {
					timeout_ms = 1500,
					lsp_format = "fallback",
				},
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
	{
		"RRethy/nvim-align",
		cmd = "Align",
	},
	{
		"machakann/vim-swap",
		keys = {
			{ "g<", "<Plug>(swap-prev)" },
			{ "g>", "<Plug>(swap-next)" },
		},
	},
}
