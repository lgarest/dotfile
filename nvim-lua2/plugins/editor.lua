return {
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    cmd = { "NvimTreeFindFileToggle", "NvimTreeFindFile", "NvimTreeFindFile", "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = false,
          git_ignored = false,
        },
        git = {
          enable = true,
          timeout = 10000, -- 10 seconds instead of default 400ms
          cwd = nil, -- use git root as cwd
        },
        view = {
          width = {
            min = 30,
            max = get_view_width_max,
          },
        },
        on_attach = function(bufnr)
          local opts = { buffer = bufnr }
          local api = require("nvim-tree.api")
          api.config.mappings.default_on_attach(bufnr)
          -- function for left to assign to keybindings
          local lefty = function()
            local node_at_cursor = api.tree.get_node_under_cursor()
            -- if it's a node and it's open, close
            if node_at_cursor.nodes and node_at_cursor.open then
              api.node.open.edit()
            -- else left jumps up to parent
            else
              api.node.navigate.parent()
            end
          end
          -- function for right to assign to keybindings
          local righty = function()
            local node_at_cursor = api.tree.get_node_under_cursor()
            -- if it's a closed node, open it
            if node_at_cursor.nodes and not node_at_cursor.open then
              api.node.open.edit()
            end
          end
          vim.keymap.set("n", "h", lefty, opts)
          vim.keymap.set("n", "<Left>", lefty, opts)
          vim.keymap.set("n", "<Right>", righty, opts)
          vim.keymap.set("n", "l", righty, opts)
        end,
      })
    end,
    opts = function()
      return require("nvchad.configs.nvimtree")
    end,
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
    build = ":TSUpdate",
    opts = function()
      return require("configs.treesitter")
    end,
  },

  -- Treesitter context
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("treesitter-context").setup({
        max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 5, -- Minimum editor window height for context to be shown.
        line_numbers = true, -- Use floating line numbers.
        -- Add window validation to prevent invalid window errors
        on_attach = function(bufnr)
          local winid = vim.fn.bufwinid(bufnr)
          return winid ~= -1 and vim.api.nvim_win_is_valid(winid)
        end,
      })
    end,
  },

  -- Motion plugins
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings()
      require("leap").opts.preview_filter = function()
        return false
      end
      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
    end,
  },

  -- Text manipulation
  {
    "tpope/vim-surround",
    dependencies = { "tpope/vim-repeat" },
    keys = {
      { "cs" },
      { "ys" },
      { "ds" },
      { "S", mode = "v" },
    },
  },
  {
    "tpope/vim-speeddating",
    keys = {
      { "<C-a>" },
      { "<C-x>" },
    },
  },
  {
    "tpope/vim-repeat",
    keys = { { "." } },
  },
  {
    "tpope/vim-abolish",
    event = "VeryLazy",
  },

  -- Join/split lines
  {
    "Wansmer/treesj",
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = {
      use_default_keymaps = false,
      max_join_length = 200,
    },
    keys = {
      { "<leader>fj", mode = "n", desc = "[j]oin lines" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function(_, opts)
      require("treesj").setup(opts)
      vim.keymap.set("n", "<leader>fj", "<cmd>TSJToggle<cr>", { desc = "[j]oin lines" })
    end,
  },

  -- Undo tree
  {
    "mbbill/undotree",
    config = function(_, _)
    end,
    keys = {
      { "<leader>gu", ":UndotreeToggle<CR>", mode = "n", desc = "Toggle undotree" },
    },
  },

  -- Mini.ai for better text objects
  { 
    "echasnovski/mini.ai",
    version = false,
    event = { "BufReadPost", "BufNewFile" },
    config = function(_, _)
      require('mini.ai').setup()
    end
  },

  -- Color highlighting
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer" },
  },

  -- Find and replace
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' or 'astgrep-rules' can
        -- be specified
      })
    end,
    cmd = {
      "GrugFar",
      "GrugFarWithin",
    },
  },
}
