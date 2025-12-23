return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"gopls",
				"pyright",
				"ts_ls",
				"html",
				"cssls",
				"graphql",
				"lua_ls",
				"marksman",
				"sqlls",
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Formatters
				"gofumpt",
				"goimports",
				"isort",
				"black",
				"prettier",
				"stylua",
				"sql-formatter",

				-- Linters
				"golangci-lint",
				"pylint",
				"eslint_d",
				"htmlhint",
				"stylelint",
				"markdownlint",
				"sqlfluff",
			},
			auto_update = true,
			run_on_start = true,
		})
	end,
}
