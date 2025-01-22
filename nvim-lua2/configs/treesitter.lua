local M = {
	ensure_installed = {
		"vim",
		"lua",
		"vimdoc",
		"html",
		"css",
		"javascript",
		"typescript",
		-- "typescriptreact",
		"tsx",
		"markdown",
		"markdown_inline",
	},
	indent = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	autotag = {
		enable = false,
	},
}
return M
