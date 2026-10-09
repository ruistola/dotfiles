local prettier = { "prettier" }

local conform = require("conform")

-- True if the buffer can actually be formatted right now: either a configured
-- conform formatter is installed/available, or an LSP client attached to the
-- buffer supports formatting (used by the lsp_format = "fallback" path, e.g.
-- gopls for Go). Prevents "Formatters unavailable for <ft>" noise on save for
-- the countless filetypes we have no formatter for.
local function can_format(bufnr)
  for _, f in ipairs(conform.list_formatters(bufnr)) do
    if f.available then
      return true
    end
  end
  local clients = vim.lsp.get_clients({
    bufnr = bufnr,
    method = vim.lsp.protocol.Methods.textDocument_formatting,
  })
  return #clients > 0
end

conform.setup({
  -- conform resolves `prettier` from the project's node_modules/.bin first,
  -- falling back to a global install, so it uses the repo's exact version and
  -- respects the project's .prettierrc automatically.
  formatters_by_ft = {
    javascript = prettier,
    javascriptreact = prettier,
    typescript = prettier,
    typescriptreact = prettier,
    json = prettier,
    jsonc = prettier,
    css = prettier,
    scss = prettier,
    less = prettier,
    html = prettier,
    yaml = prettier,
    markdown = prettier,
    graphql = prettier,
    vue = prettier,
  },
  -- Format on save; fall back to LSP formatting for filetypes without a
  -- configured formatter (e.g. Go via gopls).
  format_on_save = function(bufnr)
    -- Allow disabling per-buffer/globally via `vim.b/g.disable_autoformat`.
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    -- Skip (silently) when nothing can format this filetype.
    if not can_format(bufnr) then
      return
    end
    return { timeout_ms = 2000, lsp_format = "fallback" }
  end,
})

-- Manual format keymap + commands to toggle format-on-save.
vim.keymap.set({ "n", "v" }, "<leader>f", function()
  conform.format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer/selection" })

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    vim.b.disable_autoformat = true -- current buffer only
  else
    vim.g.disable_autoformat = true
  end
end, { desc = "Disable format-on-save", bang = true })

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, { desc = "Re-enable format-on-save" })
