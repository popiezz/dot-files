return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local comment = require("Comment")
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    comment.setup({
      -- Enables correct comment syntax depending on filetype
      pre_hook = function(ctx)
        local filetype = vim.bo.filetype

        -- Only apply context_commentstring logic for these languages
        local supported = { javascript = true, html = true, css = true, python = true, go = true }

        if supported[filetype] then
          return ts_context_commentstring.create_pre_hook()(ctx)
        end
      end,
    })
  end,
}
