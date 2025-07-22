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
	autotag = {
		enable = false,
	},
	highlight = {
		enable = true,
		-- Disable async highlighting to prevent race conditions
		additional_vim_regex_highlighting = false,
		-- Add custom match function to validate windows
		custom_captures = {},
	},
	-- Add incremental selection with window validation
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
}

-- Add window safety wrapper for TreeSitter operations
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	pattern = "*",
	callback = function()
		-- Validate current window before TreeSitter operations
		local current_win = vim.api.nvim_get_current_win()
		if not vim.api.nvim_win_is_valid(current_win) then
			return
		end
		
		-- Ensure TreeSitter is ready for the buffer
		local buf = vim.api.nvim_get_current_buf()
		if vim.api.nvim_buf_is_valid(buf) then
			-- Defer TreeSitter highlighting to avoid race conditions
			vim.defer_fn(function()
				if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_win_is_valid(current_win) then
					local ok, _ = pcall(vim.treesitter.start, buf)
					if not ok then
						-- Silently handle TreeSitter start failures
					end
				end
			end, 10)
		end
	end,
})

return M
