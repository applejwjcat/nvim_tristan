return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mfussenegger/nvim-dap-python",
			{
				"rcarriga/nvim-dap-ui",
				dependencies = {
					"nvim-neotest/nvim-nio",
				},
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
			local python_path = vim.g.python3_host_prog
			require("dap-python").setup(python_path)

			vim.api.nvim_set_keymap(
				"n",
				"<leader>db",
				"<cmd> DapToggleBreakpoint<CR>",
				{ noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<leader>dpr",
				"<cmd>lua require('dap-python').test_method()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>dc",
				"<cmd>lua require('dap').continue()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ds",
				"<cmd>lua require('dap').step_over()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>di",
				"<cmd>lua require('dap').step_into()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>do",
				"<cmd>lua require('dap').step_out()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>dt",
				"<cmd>lua require('dap').toggle_breakpoint()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>dl",
				"<cmd>lua require('dap').run_last()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>dr",
				"<cmd>lua require('dap').repl.toggle()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>dn",
				"<cmd>lua require('dap').run()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>dp",
				"<cmd>lua require('dap').pause.toggle()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>de",
				"<cmd>lua require('dap').disconnect()<CR>",
				{ noremap = true, silent = true }
			)

			vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
			vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
			vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#ffffff", bg = "#FE3C25" })

			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define("DapLogPoint", {
				text = "",
				texthl = "DapLogPoint",
				linehl = "DapLogPoint",
				numhl = "DapLogPoint",
			})
			vim.fn.sign_define(
				"DapStopped",
				{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
			)
		end,
	},
}
