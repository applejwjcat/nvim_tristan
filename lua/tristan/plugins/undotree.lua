return {
	{
		"mbbill/undotree",
		keys = { "<leader>u" },
		config = function()
			vim.keymap.set(
				"n",
				"<leader>u",
				":UndotreeToggle<CR>",
				{ noremap = true, silent = true, desc = "Open the undotree" }
			)
			vim.cmd([[

      let g:undotree_DiffAutoOpen = 1
      let g:undotree_SetFocusWhenToggle = 1
      let g:undotree_ShortIndicators = 1
      let g:undotree_WindowLayout = 2
      let g:undotree_DiffpanelHeight = 8
      let g:undotree_SplitWidth = 24
      function g:Undotree_CustomMap()
        nmap <buffer> u <plug>UndotreeNextState
        nmap <buffer> e <plug>UndotreePreviousState
        nmap <buffer> U 5<plug>UndotreeNextState
        nmap <buffer> E 5<plug>UndotreePreviousState
      endfunc]])
		end,
	},
}
