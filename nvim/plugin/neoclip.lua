require("neoclip").setup({
  initial_mode = "normal",
})

vim.keymap.set("n", "<leader>o", "<cmd>Telescope neoclip<cr>", { desc = "Telescope Neoclip" })
