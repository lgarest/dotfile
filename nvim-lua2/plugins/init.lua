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

	{ "dstein64/vim-startuptime", cmd = "StartupTime" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
		-- ft = {
		-- 	"lua",
		-- 	"javascript",
		-- 	"javascriptreact",
		-- 	"typescript",
		-- 	"typescriptreact",
		-- 	"yaml",
		-- 	"json",
		-- },
	},
	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require("configs.none-ls")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = function()
			return require("configs.mason")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		cmd = { "NvimTreeFindFileToggle", "NvimTreeFindFile", "NvimTreeFindFile", "NvimTreeToggle", "NvimTreeFocus" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
		opts = function()
			return require("nvchad.configs.nvimtree")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
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
		-- filetype?
	},
	{
		"lukas-reineke/cmp-rg",
		ft = { "markdown", "text" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		-- filetype?
	},

	-- Commenting code
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		-- key comment
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
		-- event = "VeryLazy",
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
		cmd = { "G", "Git", "Ggrep" },
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
		keys = {
			{
				"<leader>gp",
				"<cmd> Gitsigns preview_hunk<CR>",
				mode = { "n", "v" },
			},
		},
	},
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

	-- IDE
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		config = function()
			require("configs.conform")
		end,
	},
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
	{ "echasnovski/mini.ai", version = false },
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
			{ "<leader>fj", mode = "n" },
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
		-- event = "VeryLazy",
		config = function(_, _)
			-- require("core.utils").load_mappings "undotree"
		end,
		keys = {
			{ "<leader>gu", ":UndotreeToggle<CR>", mode = "n", desc = "Toggle undotree" },
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
	},
	-- {
	-- 	"github/copilot.vim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- require("core.utils").load_mappings "copilot"
	-- 	end,
	-- },
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
          }
        }
      })
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
	-- Same as below
	-- {
	-- 	"MunifTanjim/nui.nvim",
	-- 	lazy = false,
	-- },
	-- Disabling it because I'm getting following error
	--   E5108: Error executing lua ...e/.local/share/nvim/lazy/nui.nvim/lua/nui/popup/init.lua:168: Invalid window id: 1002
	-- stack traceback:
	--    [C]: in function 'nvim_open_win'
	--    ...e/.local/share/nvim/lazy/nui.nvim/lua/nui/popup/init.lua:168: in function '_open_window'
	--    ...e/.local/share/nvim/lazy/nui.nvim/lua/nui/popup/init.lua:251: in function 'mount'
	--    ...azy/better-ts-errors.nvim/lua/better-ts-errors/popup.lua:24: in function 'show'
	--    ...tter-ts-errors.nvim/lua/better-ts-errors/diagnostics.lua:138: in function 'show'
	--    ...lazy/better-ts-errors.nvim/lua/better-ts-errors/main.lua:31: in function 'toggle'
	--    ...lazy/better-ts-errors.nvim/lua/better-ts-errors/init.lua:11: in function 'toggle'
	--    [string ":lua"]:1: in main chunk
	-- {
	-- 	"OlegGulevskyy/better-ts-errors.nvim",
	-- 	dependencies = { "MunifTanjim/nui.nvim" },
	-- 	ft = {
	-- 		"typescript",
	-- 		"typescriptreact",
	-- 	},
	-- 	config = {
	-- 		keymap = "<leader>dd",
	-- 	},
	-- },

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
