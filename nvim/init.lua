-- require("vim._core.ui2").enable()
require("options")
require("keymaps")
require("autocmds")

-- Plugins (dependents listed in comments)

vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-tree/nvim-web-devicons", -- Oil
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/nvim-lua/plenary.nvim", -- Telescope, LazyGit
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/AckslD/nvim-neoclip.lua",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/kdheepak/lazygit.nvim",
  "https://github.com/tpope/vim-fugitive", -- Gitsigns (optional)
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/OXY2DEV/markview.nvim",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/ribru17/bamboo.nvim",
  "https://github.com/AlexvZyl/nordic.nvim",
  "https://github.com/sainnhe/everforest",
  -- "https://github.com/tpope/vim-rhubarb"
  -- "https://github.com/RRethy/nvim-align",
  -- "https://github.com/machakann/vim-swap",
  -- "https://github.com/",
})

-- Colorscheme (after plugins to include custom colorschemes)

vim.cmd("colorscheme nordic")

-- LSP (after plugins so nvim-lspconfig's shipped lsp/*.lua base configs are on
-- the runtimepath before we enable/override servers like vtsls and eslint).
require("lsp")
