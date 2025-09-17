-- Suppress deprecation warnings
vim.deprecate = function() end

-- Bootstrap lazy.nvim and load configurations
require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
