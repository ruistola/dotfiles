-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Suppress lsp warnings
local vim = vim 

-- Disable netrw (using oil.nvim instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Options

-- vim.opt.autoread = true
-- vim.opt.backspace = "indent,eol,start"
-- vim.opt.list = true
-- vim.opt.pumheight = 15
-- vim.opt.undofile = true
-- vim.opt.wildmode = { "lastused", "full" }
-- vim.opt.wrap = false
vim.opt.autocomplete = true
vim.opt.background = "dark"
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect", "popup" }
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.expandtab = true
vim.opt.fixeol = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.laststatus = 0
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 0
vim.opt.shell = "/bin/zsh"
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes:1"
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250
vim.opt.winborder = "rounded"
