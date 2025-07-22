return {
  -- Git integration
  {
    "tpope/vim-fugitive",
    keys = {
      {
        "<leader>gg",
        function()
          vim.cmd("tab G")
          vim.cmd("h fugitive-staging-maps")
          vim.cmd("wincmd L")
          vim.cmd("wincmd h")
        end,
        mode = "n",
        desc = "Open fugitive status / goto [g]it",
      },
    },
    cmd = { "G", "Git", "Ggrep", "Gdiffsplit", "Gvdiffsplit" },
  },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
    keys = {
      {
        "<leader>gp",
        "<cmd> Gitsigns preview_hunk<CR>",
        mode = { "n", "v" },
        desc = "Preview git hunk",
      },
      {
        "<leader>ghr",
        "<cmd> Gitsigns reset_hunk<CR>",
        mode = { "n", "v" },
        desc = "Reset git hunk",
      },
      {
        "<leader>ghs",
        "<cmd> Gitsigns stage_hunk<CR>",
        mode = { "n", "v" },
        desc = "Stage git hunk",
      },
    },
  },

  -- Git log viewer
  {
    "junegunn/gv.vim",
    dependencies = {
      "tpope/vim-fugitive",
    },
    keys = {
      { "<leader>gl", "<cmd> GV<CR>", mode = "n", desc = "git [l]og" },
      { "<leader>gL", "<cmd> GV!<CR>", mode = "n", desc = "git [L]og current file" },
    },
  },
}
