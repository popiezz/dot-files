return {
	"f-person/auto-dark-mode.nvim",
	dependencies = {
		"metalelf0/black-metal-theme-neovim",
	},
	opts = {
		update_interval = 1000,
		set_dark_mode = function()
			vim.api.nvim_set_option_value("background", "dark", {})
			require("black-metal").load() -- ✅ use the plugin's own API
		end,
		set_light_mode = function()
			vim.api.nvim_set_option_value("background", "dark", {})
			require("black-metal").load()
		end,
	},
}
