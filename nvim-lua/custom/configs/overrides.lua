local M = {}

M.treesitter = {
	ensure_installed = {
		"lua",
		"vim",

		"c",

		"html",
		"css",

		"javascript",
		"typescript",
		"tsx",

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
		"eslint-lsp",
		"typescript-language-server",
		"prettier",
		"tailwindcss-language-server",

		"hadolint",
		"nginx-language-server",
		"dockerfile-language-server",
		"graphql-language-service-cli",
		"prisma-language-server",
		"yaml-language-server",

		-- dap
		"node-debug2-adapter",

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
