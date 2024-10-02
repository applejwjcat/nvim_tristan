return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
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
