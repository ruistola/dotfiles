return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			icons = {
				mappings = false,
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				icons_enabled = true,
				theme = "dracula",
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
					},
				},
				lualine_c = {
					{
						"filename",
						color = { fg = "#999999" },
						file_status = true,
						newfile_status = false,
						path = 3,
						shorting_target = 45,
						symbols = {
							modified = "[+]",
							readonly = "[R]",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
					},
				},
				lualine_x = { "filetype" },
				lualine_y = {},
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = { char = "╎" },
			whitespace = { remove_blankline_trail = false },
			scope = { enabled = false },
		},
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"code-biscuits/nvim-biscuits",
		lazy = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{
				"<leader>bb",
				function()
					local nvim_biscuits = require("nvim-biscuits")
					nvim_biscuits.BufferAttach()
					nvim_biscuits.toggle_biscuits()
				end,
				mode = "n",
				desc = "Enable Biscuits",
			},
		},
	},
}
