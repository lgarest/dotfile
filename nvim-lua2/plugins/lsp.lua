return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
    ft = {
      "lua",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "yaml",
      "json",
      "python",
      "go",
      "rust",
      "c",
      "cpp",
    },
  },

  -- Mason for LSP management
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      return require("configs.mason")
    end,
  },

  -- None-ls for additional tooling
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      return require("configs.none-ls")
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile", "BufWritePre" },
    keys = {
      { 
        "<leader>fm",
        function()
          require("conform").format()
        end,
        desc = "Format buffer"
      },
    },
    config = function()
      require("configs.conform")
    end,
  },
}
