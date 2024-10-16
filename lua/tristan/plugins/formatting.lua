return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	branch = "nvim-0.9",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, lsp_format = "fallback", range = range })
		end, { range = true })
		_G.last_format_time = 0

		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = { "c", "cpp" },
			callback = function()
				vim.api.nvim_buf_set_keymap(
					0,
					"i",
					";",
					";<Esc>:lua require('conform').conditional_format()<CR>a",
					{ noremap = true, silent = true }
				)
			end,
		})

		function conform.conditional_format()
			local current_time = vim.loop.now()
			if current_time - _G.last_format_time > 30000 then -- 检查是否已经过去60秒
				_G.last_format_time = current_time
				vim.cmd("Format")
				-- else
				-- vim.notify("Format command is on cooldown. Please wait.", vim.log.levels.INFO, { timeout = 3000 })
			end
		end
	end,
}
