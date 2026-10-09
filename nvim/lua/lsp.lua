-- Server-specific overrides layered on top of nvim-lspconfig's shipped
-- lsp/<name>.lua base configs. `vim.lsp.config()` calls take precedence over
-- runtimepath lsp/ files (see `:h vim.lsp.config`), so we only specify the
-- extras we care about and inherit the robust monorepo/root-detection defaults.

-- vtsls: TypeScript/JavaScript. Enable inlay hints for nicer editing.
vim.lsp.config("vtsls", {
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = false },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
    javascript = {
      inlayHints = {
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = false },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
  },
})

-- eslint's fix-on-save is wired in the LspAttach handler below (overriding
-- on_attach here would recurse, since vim.lsp.config.eslint resolves to the
-- merged config). lspconfig's base config still provides :LspEslintFixAll.

vim.lsp.enable({
  "gopls",
  "vtsls",
  "eslint",
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
    -- Turn on inlay hints for servers that provide them (gopls, vtsls).
    if client:supports_method(methods.textDocument_inlayHint) then
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
    end
    -- ESLint: auto-apply fixes on save (command defined by lspconfig's base config).
    if client.name == "eslint" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = ev.buf,
        command = "LspEslintFixAll",
      })
    end
    -- Go: organize imports on save (goimports behaviour). gopls's plain
    -- formatting (run by conform's LSP fallback) is gofmt only and won't
    -- add/remove imports, so we trigger the code action explicitly.
    if client.name == "gopls" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = ev.buf,
        callback = function()
          local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
          params.context = { only = { "source.organizeImports" }, diagnostics = {} }
          local result = client:request_sync("textDocument/codeAction", params, 2000, ev.buf)
          for _, res in pairs((result or {}).result or {}) do
            if res.edit then
              vim.lsp.util.apply_workspace_edit(res.edit, client.offset_encoding)
            end
          end
        end,
      })
    end
  end,
})
