return {
  -- Autocompletion plugins
  {
    "hrsh7th/cmp-calc",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
  },
  {
    "lukas-reineke/cmp-rg",
    ft = { "markdown", "text" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
  },

  -- Commenting code
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })
      vim.g.skip_ts_context_commentstring_module = true
    end,
    keys = {
      { "gc", mode = "n" },
    },
  },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
    keys = {
      { "gc", mode = "n" },
    },
  },
}
