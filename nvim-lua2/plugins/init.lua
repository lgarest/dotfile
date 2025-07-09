---@type NvPluginSpec[]
--- @TODO: load only strictly necessary
--- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
--- https://lazy.folke.io/spec/lazy_loading

local VIEW_WIDTH_FIXED = 30
local VIEW_WIDTH_MAX = -1 -- fixed to start

function toggle_width_adaptive()
	if VIEW_WIDTH_MAX == -1 then
		VIEW_WIDTH_MAX = VIEW_WIDTH_FIXED
	else
		VIEW_WIDTH_MAX = -1
	end

	require("nvim-tree.api").tree.reload()
end
function get_view_width_max()
	return VIEW_WIDTH_MAX
end
local plugins = {
	-- Example on how to override telescope defaults
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		opts = function()
			local conf = require("nvchad.configs.telescope")
			conf.defaults.vimgrep_arguments = {
				"rg",
				"-L",
				"--vimgrep",
				"--hidden",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			}
			-- local inspect = require("lib.inspect")
			-- print(inspect(conf.defaults))
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		version = "*",
		config = function()
			require("telescope").load_extension("frecency")
		end,
	},

	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

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
			require("nvim-tree").setup({
				filters = {
					dotfiles = false,
					git_ignored = false,
				},
				view = {
					width = {
						min = 30,
						max = get_view_width_max,
					},
				},
        on_attach = function (bufnr)
        local opts = { buffer = bufnr }
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)
        -- function for left to assign to keybindings
        local lefty = function ()
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
        local righty = function ()
            local node_at_cursor = api.tree.get_node_under_cursor()
            -- if it's a closed node, open it
            if node_at_cursor.nodes and not node_at_cursor.open then
                api.node.open.edit()
            end
        end
        vim.keymap.set("n", "h", lefty , opts )
        vim.keymap.set("n", "<Left>", lefty , opts )
        vim.keymap.set("n", "<Right>", righty , opts )
        vim.keymap.set("n", "l", righty , opts )
    end,
			})
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
		cmd = { "G", "Git", "Ggrep", "Gdiffsplit", "Gvdiffsplit" },
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
		event = "BufWritePre",
		keys = {
			{ "fm" },
		},
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
			require("leap").opts.preview_filter = function()
				return false
			end
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
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
      max_join_length = 200,
		},
		keys = {
			{ "<leader>fj", mode = "n", desc="[j]oin lines" },
		},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function(_, opts)
			require("treesj").setup(opts)
			vim.keymap.set("n", "<leader>fj", "<cmd>TSJToggle<cr>", { desc="[j]oin lines"})
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
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		config = function()
			require("CopilotChat").setup({
				model = "claude-3.7-sonnet",
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
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
		cmd = {
			"CopilotChat",
			"CopilotChatOpen",
			"CopilotChatToggle",
			"CopilotChatLoad",
			"CopilotChatPrompts",
			"CopilotChatModels",
			"CopilotChatAgents",
			-- Opening chat with context
			"CopilotChatReview",
			"CopilotChatFix",
			"CopilotChatOptimize",
			"CopilotChatDocs",
			"CopilotChatTests",
			"CopilotChatCommit",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		config = function()
			require("treesitter-context").setup({
				-- enable = true,
				max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
				-- min_window_height = 0, -- Minimum editor window height for context to be shown.
				line_numbers = true, -- Use floating line numbers.
				-- separator = nil, -- Separator between current context and content below it.
			})
		end,
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
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
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
		"MeanderingProgrammer/render-markdown.nvim",
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		ft = {
			"markdown",
			"markdown.mdx",
			"mdx",
			"copilot-chat",
		},
	},
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			-- optional setup call to override plugin options
			-- alternatively you can set options with vim.g.grug_far = { ... }
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

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	--   enabled = false
	-- }
}

return plugins
