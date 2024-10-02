local opt = vim.opt

-- Set options
opt.iskeyword:append("-")
opt.formatoptions:remove("cro")
opt.compatible = false
opt.eb = false
opt.showcmd = true
opt.hidden = true
opt.wrap = false
opt.encoding = "utf-8"
opt.pumheight = 10
opt.fileencoding = "utf-8"
opt.ruler = false
opt.cmdheight = 1
opt.mouse = "a"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.laststatus = 2
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.background = "dark"
opt.showtabline = 4
opt.showmode = false
opt.swapfile = false
opt.shortmess:append("c")
opt.signcolumn = "yes"
opt.updatetime = 100
opt.virtualedit = "block,onemore"
opt.clipboard = "unnamedplus"
opt.scrolloff = 4
opt.lazyredraw = true
opt.visualbell = true
opt.ignorecase = true
opt.smartcase = true
opt.list = true
opt.listchars = { tab = "| ", trail = "▫" }
-- search settings
opt.hlsearch = true
opt.incsearch = true

vim.api.nvim_create_autocmd("VimLeave", {
	pattern = "*",
	callback = function()
		vim.opt.guicursor = "a:ver25-blinkon0"
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local last_pos = vim.fn.line("'\"")
		if last_pos > 1 and last_pos <= vim.fn.line("$") then
			vim.cmd("normal! g'\"")
		end
	end,
})

-- set the undo tree directory
local paths = {
	vim.fn.expand("~/.local/share/nvim/generate/undotreetmp/backup"),
	vim.fn.expand("~/.local/share/nvim/generate/undotreetmp/undo"),
}
for _, path in ipairs(paths) do
	if vim.fn.isdirectory(path) == 0 then
		vim.fn.mkdir(path, "p")
	end
end

opt.backupdir = { vim.fn.expand("$HOME/.local/share/nvim/generate/undotreetmp/backup"), "." }

opt.directory = { vim.fn.expand("$HOME/.local/share/nvim/generate/undotreetmp/backup"), "." }

if vim.fn.has("persistent_undo") == 1 then
	opt.undofile = true -- 启用撤销文件
	opt.undodir = { vim.fn.expand("$HOME/.local/share/nvim/generate/undotreetmp/undo"), "." }
end

-- vim.g.python3_host_prog = "/Users/tristan/.local/software/anaconda3/bin/python3"
-- 使用 Lua 检查 CONDA_PREFIX 环境变量并设置 python3_host_prog
local conda_prefix = os.getenv("CONDA_PREFIX")

if conda_prefix and vim.fn.isdirectory(conda_prefix) == 1 then
	-- 如果 CONDA_PREFIX 存在并且目录有效，使用 CONDA_PREFIX 下的 Python 解释器
	vim.g.python3_host_prog = conda_prefix .. "/bin/python3"
else
	-- 如果 CONDA_PREFIX 不存在或目录无效，使用系统默认的 Python 解释器
	vim.g.python3_host_prog = "/usr/bin/python3"
end
