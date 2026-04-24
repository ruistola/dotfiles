vim.lsp.enable({
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = function(ev)
    local bufopts = { noremap = true, silent = true, buffer = ev.buf }
    vim.keymap.set("n", "grd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("i", "<C-k>", vim.lsp.completion.get, bufopts) -- open completion menu manually
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    local methods = vim.lsp.protocol.Methods
    if client:supports_method(methods.textDocument_completion) then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
