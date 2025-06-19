return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", tag = "legacy", event = "LspAttach", opts = {} },
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "luvit-meta/library", words = { "vim%.uv" } },
					},
				},
			},
			{ "Bilal2453/luvit-meta", lazy = true },
		},
		config = function()
			-- LSP on_attach function
			local on_attach = function(_, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
				nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP" })
			end

			-- Server configurations
			local servers = {
				gopls = {},
				rust_analyzer = {},
				ts_ls = {},
				volar = {},
				terraformls = {},
				tflint = {},
				lua_ls = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim", "require" } },
						workspace = {
							Library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			}

			-- Setup mason-lspconfig
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			local lspconfig = require("lspconfig")
			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						on_attach = on_attach,
						settings = servers[server_name],
					})
				end,
			})

			-- TypeScript/Vue specific setup
			lspconfig.ts_ls.setup({
				on_attach = on_attach,
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = require("mason-registry").get_package("vue-language-server"):get_install_path()
								.. "/node_modules/@vue/language-server",
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"vue",
				},
			})

			-- Volar setup
			lspconfig.volar.setup({
				on_attach = on_attach,
			})
		end,
	},
}
