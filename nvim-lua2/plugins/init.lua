---@type NvPluginSpec[]
--- @TODO: load only strictly necessary
--- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
--- https://lazy.folke.io/spec/lazy_loading
local plugins = {
  -- Example on how to override telescope defaults
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	tag = "0.1.8",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	-- opts = function()
	-- 		-- local conf = require("nvchad.configs.telescope")
	-- 		-- conf.defaults.vimgrep_arguments = {
	-- 		-- 	"rg",
	-- 		-- 	"-L",
	-- 		-- 	"--vimgrep",
	-- 		-- 	"--hidden",
	-- 		-- 	"--color=never",
	-- 		-- 	"--no-heading",
	-- 		-- 	"--with-filename",
	-- 		-- 	"--line-number",
	-- 		-- 	"--column",
	-- 		-- 	"--smart-case",
	-- 		-- }
	-- 		-- local inspect = require("lib.inspect")
	-- 		-- print(inspect(conf.defaults))
	-- 	-- end,
	-- },

  {"dstein64/vim-startuptime", cmd = "StartupTime" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",

		opts = function()
			return require("configs.mason")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "NvimTreeFindFile", "NvimTreeToggle", "NvimTreeFocus" },
		opts = function()
			return require("configs.treesitter")
		end,
	},

  -- Autocompletion
	{
		"hrsh7th/cmp-calc",
		event = "VeryLazy",
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

	-- {
	-- 	"max397574/better-escape.nvim",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("better_escape").setup()
	-- 	end,
	-- },

  -- GIT integration
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"junegunn/gv.vim",
		event = "VeryLazy",
		dependencies = {
			"tpope/vim-fugitive",
		},
	},

  -- IDE
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		config = function()
			require("configs.conform")
		end,
	},
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},
	{ "echasnovski/mini.ai", version = false },
	{
		"tpope/vim-speeddating",
		event = "VeryLazy",
	},
	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},
	{
		"tpope/vim-abolish",
		event = "VeryLazy",
	},
	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
    -- lazy=false,
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
	{
		"Wansmer/treesj",
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
		opts = {
			use_default_keymaps = false,
		},
		keys = {
			{ "<leader>fj", mode = { "n" } },
		},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function(_, opts)
			require("treesj").setup(opts)
			vim.keymap.set("n", "<leader>fj", "<cmd>TSJToggle<cr>")
			-- require("core.utils").load_mappings "treesj"
		end,
	},
	{
		"mbbill/undotree",
		event = "VeryLazy",
		config = function(_, _)
			-- require("core.utils").load_mappings "undotree"
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
	},
	{
		"github/copilot.vim",
		lazy = false,
		priority = 1000,
		config = function()
			-- require("core.utils").load_mappings "copilot"
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
	},

  -- Languages support
	{
		"preservim/vim-markdown",
		ft = "markdown",
		config = function()
			require("configs.markdown")
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		config = function()
			vim.cmd(":call mkdp#util#install()")
		end,
	},
	{
		"jparise/vim-graphql",
		ft = { "graphql" },
	},
	{
		"prisma/vim-prisma",
		ft = { "prisma" },
	},
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
	{
		"OlegGulevskyy/better-ts-errors.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		ft = {
			"typescript",
			"typescriptreact",
		},
		config = function()
			-- require("core.utils").load_mappings "bettertserrors"
		end,
		-- config = {
		--   keymaps = {
		--     toggle = '<leader>dd', -- default '<leader>dd'
		--     go_to_definition = '<leader>dx' -- default '<leader>dx'
		--   }
		-- }
	},


	-- DAP
	-- {
	--   "mfussenegger/nvim-dap",
	--   dependencies = {
	--     "nvim-neotest/nvim-nio",
	--   },
	--   config = function()
	--     require("core.utils").load_mappings "dap"
	--   end,
	-- },
	-- {
	--   "rcarriga/nvim-dap-ui",
	--   event = "VeryLazy",
	--   dependencies = {
	--     "mfussenegger/nvim-dap",
	--   },
	--   config = function()
	--     local dap = require "dap"
	--     local dapui = require "dapui"
	--     dapui.setup()
	--     dap.listeners.after.event_initialized["dapui_config"] = function()
	--       dapui.open()
	--     end
	--     dap.listeners.before.event_initialized["dapui_config"] = function()
	--       dapui.close()
	--     end
	--     dap.listeners.before.event_exited["dapui_config"] = function()
	--       dapui.close()
	--     end
	--   end,
	-- },
	-- {
	--   "jay-babu/mason-nvim-dap.nvim",
	--   event = "VeryLazy",
	--   dependencies = {
	--     "williamboman/mason.nvim",
	--     "mfussenegger/nvim-dap",
	--   },
	--   opts = {
	--     handlers = {}, -- pilla los defaults
	--     -- handlers = nil, -- machaca todos los handlers
	--     -- ensure_installed = { "node2" }, -- in Mason overrides
	--     automatic_installation = true,
	--   },
	-- },
	-- couldn't get it to work
	-- {
	-- 	"barrett-ruth/import-cost",
	-- 	build = "sh install.sh npm",
	-- 	config = function()
	-- 		require("import-cost").setup()
	-- 	end,
	-- 	enabled = false,
	-- },

	-- {
	-- 	"craftzdog/solarized-osaka.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	--   enabled = false
	-- }
}

return plugins
