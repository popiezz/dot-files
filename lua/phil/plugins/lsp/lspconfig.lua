return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		---------------------------------------------------------------------------
		-- Mason + LSP setup
		---------------------------------------------------------------------------
		local capabilities = cmp_nvim_lsp.default_capabilities()

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

			handlers = {
				-- Default handler
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-------------------------------------------------------------------------
				-- Golang
				-------------------------------------------------------------------------
				["gopls"] = function()
					lspconfig.gopls.setup({
						capabilities = capabilities,
						settings = {
							gopls = {
								gofumpt = true,
								staticcheck = true,
								completeUnimported = true,
								usePlaceholders = true,
								analyses = {
									unusedparams = true,
									unreachable = true,
								},
							},
						},
					})

					vim.api.nvim_create_autocmd("BufWritePre", {
						pattern = "*.go",
						callback = function()
							vim.lsp.buf.code_action({
								context = { only = { "source.organizeImports" } },
								apply = true,
							})
							vim.lsp.buf.format({ async = false })
						end,
					})
				end,

				-------------------------------------------------------------------------
				-- Python
				-------------------------------------------------------------------------
				["pyright"] = function()
					lspconfig.pyright.setup({
						capabilities = capabilities,
					})
				end,

				-------------------------------------------------------------------------
				-- JS / TS
				-------------------------------------------------------------------------
				["ts_ls"] = function()
					lspconfig.ts_ls.setup({
						capabilities = capabilities,
					})
				end,

				-------------------------------------------------------------------------
				-- HTML
				-------------------------------------------------------------------------
				["html"] = function()
					lspconfig.html.setup({
						capabilities = capabilities,
					})
				end,

				-------------------------------------------------------------------------
				-- CSS
				-------------------------------------------------------------------------
				["cssls"] = function()
					lspconfig.cssls.setup({
						capabilities = capabilities,
					})
				end,

				-------------------------------------------------------------------------
				-- GraphQL
				-------------------------------------------------------------------------
				["graphql"] = function()
					lspconfig.graphql.setup({
						capabilities = capabilities,
						filetypes = {
							"graphql",
							"gql",
							"javascriptreact",
							"typescriptreact",
							"svelte",
						},
					})
				end,

				-------------------------------------------------------------------------
				-- Lua
				-------------------------------------------------------------------------
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
								completion = { callSnippet = "Replace" },
							},
						},
					})
				end,

				-------------------------------------------------------------------------
				-- Markdown
				-------------------------------------------------------------------------
				["marksman"] = function()
					lspconfig.marksman.setup({
						capabilities = capabilities,
					})
				end,

				-------------------------------------------------------------------------
				-- SQL
				-------------------------------------------------------------------------
				["sqlls"] = function()
					lspconfig.sqlls.setup({
						capabilities = capabilities,
						cmd = { "sql-language-server", "up", "--method", "stdio" },
						filetypes = { "sql", "mysql", "plsql" },
						root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
					})
				end,
			},
		})

		---------------------------------------------------------------------------
		-- Diagnostic symbols
		---------------------------------------------------------------------------
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			--      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		---------------------------------------------------------------------------
		-- LSP Keymaps
		---------------------------------------------------------------------------
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				keymap.set("n", "K", vim.lsp.buf.hover, opts)
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})
	end,
}
