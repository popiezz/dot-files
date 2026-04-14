return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- Install parsers (no-op if already installed)
    require("nvim-treesitter").install({
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "prisma",
      "markdown",
      "markdown_inline",
      "svelte",
      "graphql",
      "go",
      "python",
      "bash",
      "dockerfile",
      "gitignore",
      "query",
    })

    -- Autotag setup
    require("nvim-ts-autotag").setup()
  end,
}
