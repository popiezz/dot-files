return {
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{ "shaunsingh/nord.nvim", priority = 1000 },
	{ "xero/miasma.nvim", priority = 1000 },
	{ "scottmckendry/cyberdream.nvim", priority = 1000 },
	{ "blazkowolf/gruber-darker.nvim", priority = 1000 },
	{ "rebelot/kanagawa.nvim", priority = 1000 },
	{ "AlexvZyl/nordic.nvim", priority = 1000 },
	{ "neanias/everforest-nvim", priority = 1000 },
	{ "jpwol/thorn.nvim", priority = 1000 },
	{ "rose-pine/neovim", priority = 1000 },
	{

		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			transparent = true, -- This enables transparency for the theme
			styles = {
				sidebars = "transparent", -- Ensures sidebars like nvim-tree are also transparent
				floats = "transparent", -- Ensures floating windows are transparent
			},
		},
	},
	{
		"metalelf0/black-metal-theme-neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("black-metal").setup({
				theme = "bathory",
				variant = "dark",
				alt_bg = false,
			})
			require("black-metal").load()
		end,
	},
}
