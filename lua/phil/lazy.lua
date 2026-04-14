local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({ { import = "phil.plugins" }, { import = "phil.plugins.lsp" } }, {
	checker = {
		enable = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
-- vim.cmd.colorscheme("tokyonight")
vim.opt.scrolloff = 999
vim.opt.virtualedit = ""
-- Breaks lines at 80 characters (creates actual new lines)
vim.opt.textwidth = 80
-- Optional: Shows a vertical line at the wrap point so you see it coming
vim.opt.colorcolumn = "80"

vim.cmd([[
  augroup TransparentBackground
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
    autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
  augroup END
]])
