local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

-- if you just want default config for the servers then put them in a table
-- local servers = { "html", "cssls", "tsserver", "clangd", "tailwindcss" }
local servers = {
	"html",
	"cssls",
	"tsserver",
	"clangd",
	"graphql",
	"eslint",
	"tailwindcss",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

if not configs.nginx_lsp then
	configs.nginx_lsp = {
		default_config = {
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "nginx-language-server" },
			filetypes = { "nginx" },
			root_dir = function(fname)
				return lspconfig.util.find_git_ancestor(fname)
			end,
			settings = {},
		},
	}
end

-- check https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local custom_servers = {
	"nginx_lsp",
	"dockerls",
	"prismals",
	"yamlls",
}
for _, lsp in ipairs(custom_servers) do
	lspconfig[lsp].setup({})
end

-- lspconfig.pyright.setup { blabla}
vim.diagnostic.config({
	virtual_text = false,
})
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd([[
  autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
  ]])
