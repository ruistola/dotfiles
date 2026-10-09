-- gopls language server configuration
-- Discovered automatically by vim.lsp.enable("gopls") via the runtimepath `lsp/` dir.
-- See `:h lsp-config`.
return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      gofumpt = true,
      analyses = {
        unusedparams = true,
        unusedwrite = true,
        nilness = true,
      },
      staticcheck = true,
      hints = {
        parameterNames = true,
        assignVariableTypes = true,
      },
    },
  },
}
