return {
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{ "shaunsingh/nord.nvim", priority = 1000 },
	{ "xero/miasma.nvim", priority = 1000 },
	{ "vague-theme/vague.nvim", priority = 1000 },
	{
		"whatyouhide/vim-gotham",
		priority = 1000,
		lazy = false,
		config = function()
			vim.cmd.colorscheme("gotham")
		end,
	},
}
