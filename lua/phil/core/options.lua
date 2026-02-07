vim.cmd("let g:netrw_liststyle = 3")
vim.cmd("let g:netrw_banner = 0")
vim.cmd("let g:netrw_keepdir = 0")

local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indents
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrap
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- colors
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- turn off swapfile
opt.swapfile = false

-- hide bottom insert
vim.o.showmode = false

-- Custom Netrw Mappings
vim.api.nvim_create_autocmd("filetype", {
	pattern = "netrw",
	desc = "Better mappings for Netrw",
	callback = function()
		local bind = function(lhs, rhs)
			vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
		end

		-- 1. How to delete: Already 'D' by default, but we can ensure it's mapped
		-- 2. How to rename: Already 'R' by default, mapping 'r' for ease of use
		bind("r", "R")

		-- 3. Set 'a' to add a file instead of '%'
		bind("a", "%")
	end,
})
