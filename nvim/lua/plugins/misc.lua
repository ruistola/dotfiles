return {
	-- Web development syntax
	{
		"digitaltoad/vim-pug",
		ft = "pug",
	},
	{
		"wavded/vim-stylus",
		ft = "stylus",
	},
	-- Aider integration
	{
		"joshuavial/aider.nvim",
		cmd = { "AiderOpen", "AiderBackground" },
		keys = {
			{ "<leader>ao", "<cmd>AiderOpen<cr>", desc = "Open Aider" },
			{ "<leader>ab", "<cmd>AiderBackground<cr>", desc = "Aider Background" },
		},
		opts = {
			auto_manage_context = true,
			default_bindings = false,
			debug = false,
			border = {
				style = "rounded",
				color = "#fab387",
			},
		},
	},
}
