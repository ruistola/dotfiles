-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw (using oil.nvim instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Options
vim.o.scrolloff = 0
vim.o.cursorlineopt = "number"
vim.o.cursorline = true
vim.o.background = "dark"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.fixeol = true
vim.o.relativenumber = true
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true
vim.o.swapfile = false

-- Split chars
vim.opt.fillchars = {
	vert = "│",
	horiz = "─",
}

-- Colorscheme (temporary, will be set by colorscheme plugin)
vim.cmd.colorscheme("habamax")

-- Highlight overrides (will be reapplied after colorscheme loads)
vim.api.nvim_set_hl(0, "MatchParen", { bold = true, bg = "none", fg = "#ffaf5f" })
vim.api.nvim_set_hl(0, "Visual", { bold = false, bg = "#ffaf5f", fg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#fab387", bg = "None" })

-- Error highlighting
local bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")
vim.api.nvim_set_hl(0, "Error", { fg = "red", bg = bg })
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "red", bg = bg })
vim.api.nvim_set_hl(0, "ErrorMsg", { fg = "red", bg = "NONE" })

-- Custom border style (global)
_G.custom_border = {
	"╭",
	"─",
	"╮",
	"│",
	"╯",
	"─",
	"╰",
	"│",
}

-- Example float function
function _G.OpenCustomFloatExample()
	local buf = vim.api.nvim_create_buf(false, true)
	local float_opts = {
		relative = "editor",
		row = 5,
		col = 10,
		width = 60,
		height = 10,
		style = "minimal",
		border = custom_border,
	}
	vim.api.nvim_open_win(buf, true, float_opts)
end
