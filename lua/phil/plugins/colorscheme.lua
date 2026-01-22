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
	{ "AlexvZyl/nordic.nvim", priority = 1000 },
	{ "neanias/everforest-nvim", priority = 1000 },
	{ "jpwol/thorn.nvim", priority = 1000 },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		lazy = false,
		config = function()
			require("rose-pine").setup({
				variant = "main", -- or "moon", "dawn"
				dark_variant = "main",
				styles = {
					transparency = false,
				},
				highlight_groups = {
					Normal = { bg = "#000000" }, -- main editor background
					NormalNC = { bg = "#000000" }, -- non-current windows
					NormalFloat = { bg = "#000000" }, -- floating windows
					SignColumn = { bg = "#000000" },
					MsgArea = { bg = "#000000" },
				},
			})

			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
