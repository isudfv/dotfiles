return {
	{
		"rcarriga/nvim-dap-ui", 
		dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
		event = "VeryLazy",
		config = function ()
			local dap = require('dap')
			local dapui = require('dapui')

			dapui.setup()

			dap.adapters.lldb = {
				type = 'executable',
				command = 'codelldb', -- adjust as needed, must be absolute path
				name = 'lldb'
			}
			dap.configurations.cpp = {
				{
					name = 'Launch',
					type = 'lldb',
					request = 'launch',
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					args = {},

					-- 💀
					-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
					--
					--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
					--
					-- Otherwise you might get the following error:
					--
					--    Error on launch: Failed to attach to the target process
					--
					-- But you should be aware of the implications:
					-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
					-- runInTerminal = false,
				},
				{
					name = 'Attach',
					type = 'lldb',
					request = 'attach',
					pid = require('dap.utils').pick_process,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					args = {},
				}
			}
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

			-- keymaps
			vim.keymap.set('n', '<F8>', function() dap.step_over() end, { desc = "DAP Step Over" })
			vim.keymap.set('n', '<F7>', function() dap.step_into() end, { desc = "DAP Step Into" })
			vim.keymap.set('n', '<S-F7>', function() dap.step_out() end, { desc = "DAP Step Out" })
			vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
			vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = "DAP Continue" })
			vim.keymap.set({'n', 'v'}, '<leader>qe', function() dapui.eval() end, { desc = "DAP Quick Evaluate" })
		end
	}
}
