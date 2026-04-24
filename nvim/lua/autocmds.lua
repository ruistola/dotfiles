local augroup = vim.api.nvim_create_augroup("_user", { clear = true })

-- Treesitter
vim.api.nvim_create_autocmd("FileType", {
  callback = function() pcall(vim.treesitter.start) end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
  pattern = "*",
})

-- List help files in buffer list
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == "help" then
      vim.bo.buflisted = true
    end
  end,
})

-- Disable auto-comment on new lines
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})
