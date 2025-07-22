return {
  -- Telescope and fuzzy finding
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    cmd = { "Telescope" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find current word" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Find diagnostics" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find keymaps" },
      { "<leader>fo", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "Find old files" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope_config = require("configs.telescope")
      require("telescope").setup(telescope_config)
      pcall(require("telescope").load_extension, "fzf")
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    version = "*",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },

  -- Theme and UI
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Startup time analysis
  { "dstein64/vim-startuptime", cmd = "StartupTime" },

  -- Tmux integration
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    priority = 1000,
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<C-y>",
          },
        },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    config = function()
      require("CopilotChat").setup({
        model = "claude-sonnet-4",
        highlight_headers = false,
        prompts = {
          GoodPractices = {
            prompt = "Apply good practices",
            system_prompt = "Refactor the following code to improve its clarity and readability, while maintaining its functionality. Remove any switch case in favor of object literal access, use nested ternaries, use implicit arrow return if needed. Be sure to include comments explaining the changes you made.",
            description = "Refactor the code to apply good practices",
          },
        },
      })
    end,
    opts = {},
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatToggle",
      "CopilotChatLoad",
      "CopilotChatPrompts",
      "CopilotChatModels",
      "CopilotChatAgents",
      "CopilotChatReview",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatTests",
      "CopilotChatCommit",
    },
  },
}
