return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
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
