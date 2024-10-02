return {
	{
		"github/copilot.vim",
		enabled = true,
		config = function()
			vim.g.copilot_enabled = true
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_proxy = "http://172.16.210.20:7890"
			vim.api.nvim_set_keymap("n", "<leader>cp", ":Copilot<CR>", { silent = true })
			vim.api.nvim_set_keymap("n", "<leader>ce", ":Copilot enable<CR>", { silent = true })
			vim.api.nvim_set_keymap("n", "<leader>cd", ":Copilot disable<CR>", { silent = true })
			vim.api.nvim_set_keymap("i", "<c-d>", "<Plug>(copilot-next)", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("i", "<c-f>", "<Plug>(copilot-previous)", { noremap = true, silent = true })
			vim.cmd([[
        function! CheckSpace()
          return col('.') == col('$')
        endfunction
        imap <silent><expr> <Right> CheckSpace() ? copilot#Accept("") : "\<Right>"
        ]])
		end,
	},
}
