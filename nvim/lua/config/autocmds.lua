-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- List help files in telescope buffer list
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

-- Browse command
vim.api.nvim_create_user_command("Browse", "silent !firefox %:p &", {})

-- LSP semantic tokens fix for omnisharp
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local function toSnakeCase(str)
			return string.gsub(str, "%s*[- ]%s*", "_")
		end

		if client.name == "omnisharp_mono" then
			local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
			for i, v in ipairs(tokenModifiers) do
				tokenModifiers[i] = toSnakeCase(v)
			end
			local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
			for i, v in ipairs(tokenTypes) do
				tokenTypes[i] = toSnakeCase(v)
			end
		end
	end,
})

-- Diagnostic handler fix
for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
	local default_diagnostic_handler = vim.lsp.handlers[method]
	vim.lsp.handlers[method] = function(err, result, context, config)
		if err ~= nil and err.code == -32802 then
			return
		end
		return default_diagnostic_handler(err, result, context, config)
	end
end
