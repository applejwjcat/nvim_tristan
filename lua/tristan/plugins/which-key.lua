return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>c", "Copilot config" },
			{ "<leader>D", "Show Diagnostic" },
			{ "<leader>e", "File explore" },
			{ "<leader>f", "Fuzzy find" },
			{ "<leader>r", "rename" },
			{ "<leader>s", "window split" },
			{ "<leader>t", "tab config" },
			{ "<leader>x", "trouble workspace" },
		})
	end,
	keys = {
		{
			"<leader>/",
			mode = "n",
			"<Plug>(comment_toggle_linewise_current)",
			desc = "Toggle comment line",
		},
		{
			"<leader>/",
			mode = "v",
			"<Plug>(comment_toggle_linewise_visual)",
			desc = "Toggle visual block",
		},
	},
}
