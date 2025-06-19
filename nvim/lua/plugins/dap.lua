return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			"leoluz/nvim-dap-go",
			{
				"rcarriga/nvim-dap-ui",
				dependencies = { "nvim-neotest/nvim-nio" },
			},
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			-- DAP UI setup
			dapui.setup()

			-- Auto open/close DAP UI
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- Go debugging
			require("dap-go").setup({
				dap_configurations = {
					{
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
					},
				},
				delve = {
					path = "dlv",
					initialize_timeout_sec = 20,
					port = "${port}",
					args = {},
					build_flags = {},
					detached = vim.fn.has("win32") == 0,
					cwd = nil,
				},
				tests = {
					verbose = false,
				},
			})

			-- Unity/C# debugging
			dap.adapters.vstuc = {
				type = "executable",
				command = "/opt/homebrew/bin/mono",
				args = {
					"/Users/ruistola/.vscode/extensions/visualstudiotoolsforunity.vstuc-1.0.2/bin/UnityDebugAdapter.dll",
				},
			}

			dap.adapters.coreclr = {
				type = "executable",
				command = "/usr/local/bin/netcoredbg/netcoredbg",
				args = { "--interpreter=vscode" },
			}

			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "launch - netcoredbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
					end,
				},
				{
					type = "vstuc",
					request = "attach",
					name = "Unity Editor",
				},
			}
		end,
	},
}
