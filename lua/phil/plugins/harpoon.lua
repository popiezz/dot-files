return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>aa", function()
			harpoon:list():add()
		end, { desc = "Add file to list" })
		vim.keymap.set("n", "<leader>ll", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Show the harpoon list" })
		vim.keymap.set("n", "<leader>hh", function()
			harpoon:list():select(1)
		end, { desc = "First list item" })
		vim.keymap.set("n", "<leader>hj", function()
			harpoon:list():select(2)
		end, { desc = "Second list item" })
		vim.keymap.set("n", "<leader>hk", function()
			harpoon:list():select(3)
		end, { desc = "Third list item" })
		vim.keymap.set("n", "<leader>hl", function()
			harpoon:list():select(4)
		end, { desc = "Fourth list item" })
	end,
}
