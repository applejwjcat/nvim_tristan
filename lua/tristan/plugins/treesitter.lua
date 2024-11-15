return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		-- "windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-refactor",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true, disable = { "python" } },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			-- autotag = {
			-- enable = true,
			-- },
			-- ensure these language parsers are installed
			refactor = {
				highlight_definitions = {
					enable = true,
				},
				highlight_current_scope = {
					enable = false,
				},
			},
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
				"cpp",
				"python",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
		vim.cmd("highlight TSDefinition guibg=#ff875f guifg=#ffffff")
		vim.cmd("highlight TSDefinitionUsage guibg=#ff875f guifg=#ffffff")
		-- vim.cmd("highlight TSDefinition guibg=#880000 guifg=#ffffff")
		-- vim.cmd("highlight TSDefinitionUsage guibg=#880000 guifg=#ffffff")
	end,
}
