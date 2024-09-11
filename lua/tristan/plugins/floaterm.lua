return {
	"numToStr/FTerm.nvim",
	config = function()
		local floaterm = require("FTerm")
		floaterm.setup({
			dimensions = {
				height = 0.75,
				width = 0.75,
			},
		})
		local runners = { lua = "lua", javascript = "node", python = "python3" }

		vim.keymap.set("n", "<leader><Enter>", function()
			local buf = vim.api.nvim_buf_get_name(0)
			local ftype = vim.filetype.match({ filename = buf })
			local exec = runners[ftype]
			if exec ~= nil then
				require("FTerm").scratch({ cmd = { exec, buf } })
			end
		end)
	end,
}
