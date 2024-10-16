function ClickGit()
	local status_ok, _ = pcall(require, "toggleterm")
	if not status_ok then
		return vim.notify("toggleterm.nvim isn't installed!!!")
	end

	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
	lazygit:toggle()
end

return {
	"akinsho/toggleterm.nvim",
	commit = "48be57",
	init = function()
		vim.keymap.set(
			"n",
			"<leader>tf",
			"<cmd>ToggleTerm direction=float<cr>",
			{ desc = "ToggleTerm | Float Terminal", silent = true }
		)

		vim.keymap.set(
			"n",
			"<leader>th",
			"<cmd>ToggleTerm direction=horizontal<cr>",
			{ desc = "ToggleTerm | Horizontal Terminal", silent = true }
		)

		vim.keymap.set("n", "<leader>tv", function()
			local term = require("toggleterm.terminal").Terminal:new({
				direction = "vertical",
				size = math.floor(vim.o.columns * 0.5),
				close_on_exit = true,
			})
			term:toggle()
		end, { desc = "Toggle vertical terminal" })

		vim.keymap.set("n", "<leader>gg", function()
			ClickGit()
		end, { desc = "ToggleTerm | Lazygit", silent = true })
	end,

	config = function()
		require("toggleterm").setup({
			-- size = 20,
			size = function(term)
				if term.direction == "horizontal" then
					return 20
				elseif term.direction == "vertical" then
					return math.floor(vim.o.columns * 0.5)
				end
			end,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				width = function()
					return math.floor(vim.o.columns * 0.75)
				end,
				height = function()
					return math.floor(vim.o.lines * 0.75)
				end,
				winblend = 3,
			},
		})

		local runners = { lua = "lua", javascript = "node", python = "python3", cpp = "clang++", c = "clang" }

		vim.keymap.set("n", "<leader><Enter>", function()
			vim.api.nvim_command("w")
			local buf = vim.api.nvim_buf_get_name(0)
			local ftype = vim.filetype.match({ filename = buf })
			local exec = runners[ftype]

			if ftype == "cpp" or ftype == "c" then
				local dir = vim.fn.fnamemodify(buf, ":p:h")
				local build_dir = dir .. "/build"

				if vim.fn.isdirectory(build_dir) == 0 then
					vim.fn.mkdir(build_dir, "p")
				end

				local output = build_dir .. "/" .. vim.fn.fnamemodify(buf, ":t:r")

				if ftype == "cpp" then
					local cmd = string.format("clang++ -std=c++11 %s -o %s && %s", buf, output, output)

					local term = require("toggleterm.terminal").Terminal:new({
						cmd = cmd,
						close_on_exit = false,
						direction = "float",
					})
					term:toggle()
				elseif ftype == "c" then
					local cmd = string.format("clang %s -o %s && %s", buf, output, output)

					local term = require("toggleterm.terminal").Terminal:new({
						cmd = cmd,
						close_on_exit = false,
						direction = "float",
					})
					term:toggle()
				end
			else
				if exec ~= nil then
					local term = require("toggleterm.terminal").Terminal:new({
						cmd = exec .. " " .. buf,
						close_on_exit = false,
						direction = "float",
					})
					term:toggle()
				end
			end
		end, { desc = "Run current buffer" })
	end,
}
