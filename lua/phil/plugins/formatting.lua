return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- Go
        go = { "gofumpt", "goimports" },

        -- Python
        python = { "isort", "black" },

        -- JavaScript / TypeScript
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },

        -- Frontend
        svelte = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },

        -- Lua
        lua = { "stylua" },

        -- Markdown
        markdown = { "prettier" },

        -- SQL
        sql = { "sql_formatter" },
      },

      -- Automatically format on save
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1500,
      },
    })

    -- Manual format keymap
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
