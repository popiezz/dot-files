return {
	"f-person/auto-dark-mode.nvim",
	opts = {
		update_interval = 1000,
		set_dark_mode = function()
			vim.api.nvim_set_option_value("background", "dark", {})
			require("spaceduck").load() -- ✅ use the plugin's own API
		end,
		set_light_mode = function()
			vim.api.nvim_set_option_value("background", "dark", {})
			require("spaceduck").load()
		end,
	},
}
