return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- Go
			go = { "golangcilint" },

			-- Python
			python = { "pylint" }, -- or "ruff" if you prefer faster checks

			-- JavaScript / TypeScript
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },

			-- Web / Frontend
			html = { "htmlhint" },
			css = { "stylelint" },

			-- GraphQL
			graphql = { "graphql-schema-linter" },

			-- Markdown
			markdown = { "markdownlint" },

			-- SQL
			sql = { "sqlfluff" },
		}

		-- Autocommand group for linting events
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- Manual linting trigger
		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
