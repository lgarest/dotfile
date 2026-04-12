return {
  -- Markdown support
  {
    "preservim/vim-markdown",
    ft = "markdown",
    config = function()
      require("configs.markdown")
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {},
    ft = {
      "markdown",
      "markdown.mdx",
      "mdx",
      "copilot-chat",
    },
  },

  -- GraphQL support
  {
    "jparise/vim-graphql",
    ft = { "graphql" },
  },

  -- Prisma support
  {
    "prisma/vim-prisma",
    ft = { "prisma" },
  },

  -- Auto-tag for HTML/JSX
  {
    "windwp/nvim-ts-autotag",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
