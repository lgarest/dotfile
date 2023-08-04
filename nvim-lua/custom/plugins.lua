local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
		cmd = { "NvimTreeFindFile", "NvimTreeToggle", "NvimTreeFocus" },
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

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
	-- Tpope
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},
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
		"preservim/vim-markdown",
		ft = "markdown",
		config = function()
			require("custom.configs.vim-markdown")
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
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		event = "VeryLazy",
		config = function()
			require("custom.configs.vim-tmux-navigator")
		end,
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
			require("core.utils").load_mappings("treesj")
		end,
	},
	{
		"mbbill/undotree",
		event = "VeryLazy",
		config = function(_, _)
			require("core.utils").load_mappings("undotree")
		end,
	},

	-- DAP
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_initialized["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {}, -- pilla los defaults
			-- handlers = nil, -- machaca todos los handlers
			-- ensure_installed = { "node2" }, -- in Mason overrides
			automatic_installation = true,
		},
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		event = "VeryLazy",
	},
  {
    "nvim-treesitter/nvim-treesitter-context",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
    lazy = false,
  },
  -- couldn't get it to work
  {
    "barrett-ruth/import-cost",
    build = "sh install.sh yarn",
		config = function()
			require("import-cost").setup()
		end,
    enabled = false
  },
	{
	  "NvChad/nvim-colorizer.lua",
    enabled = false
	},

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	--   enabled = false
	-- }
}

return plugins
