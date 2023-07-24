local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
  autotag = {
    enable = true,
  },
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"eslint_d",
		"typescript-language-server",
		"deno",
		"prettier",
		"tailwindcss-language-server",
		"nginx-language-server",

		-- dap
		-- "js-debug-adapter",
		"node-debug2-adapter",
		-- "chrome-debug-adapter",

		-- c/cpp stuff
		"clangd",
		"clang-format",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.telescope = {
	mappings = {
		n = {
			["q"] = require("telescope.actions").close,
			["<c-d>"] = require("telescope.actions").delete_buffer,
		},
	},
}

return M
