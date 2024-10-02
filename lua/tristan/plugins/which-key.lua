return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local wk = require("which-key")
		wk.setup({})
		wk.add({
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
		})
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
