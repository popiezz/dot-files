return {
	"f-person/auto-dark-mode.nvim",
	opts = {
		update_interval = 1000,
		set_dark_mode = function()
			vim.api.nvim_set_option_value("background", "dark", {})
			vim.cmd("colorscheme black-metal")
		end,
		set_light_mode = function()
			vim.api.nvim_set_option_value("background", "dark", {})
			-- Choose a light-compatible theme from your installed list
			vim.cmd("colorscheme black-metal")
		end,
	},
}
