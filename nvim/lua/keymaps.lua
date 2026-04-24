-- Keymaps

-- Basic keymaps
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- ???
vim.keymap.set("n", "<leader>r", function() -- toggle lsp loclist
  local loclist_win = vim.fn.getloclist(0, { winid = 0 }).winid
  if loclist_win > 0 then
    vim.cmd("lclose")
  else
    vim.diagnostic.setloclist({ open = true })
  end
end, { silent = true })

-- Better navigation with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>gD", function()
	vim.diagnostic.goto_prev({ float = { border = "rounded" } })
end, { desc = "Go to previous diagnostic message" })

vim.keymap.set("n", "<leader>gd", function()
	vim.diagnostic.goto_next({ float = { border = "rounded" } })
end, { desc = "Go to next diagnostic message" })

vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Open floating diagnostic message" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
