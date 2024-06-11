-- custom/configs/null-ls.lua
local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins
local formatting = b.formatting
local lint = b.diagnostics

-- for autoformat on save
local format_on_save = function(client, bufnr)
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({
			group = augroup,
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

local opts = {
	sources = {
		formatting.prettierd,
		-- formatting.biome,
		formatting.stylua,
		formatting.markdownlint,
		lint.markdownlint,
		-- lint.shellcheck,
		lint.hadolint,
	},
	-- on_attach = format_on_save, -- for autoformat on save
}
return opts
