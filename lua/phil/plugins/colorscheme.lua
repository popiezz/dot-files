return {
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{ "shaunsingh/nord.nvim", priority = 1000 },
	{ "xero/miasma.nvim", priority = 1000 },
	{ "vague-theme/vague.nvim", priority = 1000 },
	{ "scottmckendry/cyberdream.nvim", priority = 1000 },
	{ "blazkowolf/gruber-darker.nvim", priority = 1000 },
	{ "f4z3r/gruvbox-material.nvim", priority = 1000 },
	{ "rebelot/kanagawa.nvim", priority = 1000 },
	{ "folke/tokyonight.nvim", priority = 1000 },
	{
		"whatyouhide/vim-gotham",
		priority = 1000,
		lazy = false,
		config = function()
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}
