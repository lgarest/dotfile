-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local nvlsp = require("nvchad.configs.lspconfig")

local lspconfig = require("lspconfig")
-- local servers = { "html", "cssls", "ts_ls", "eslint" }
local servers = { "html", "cssls", "ts_ls", "biome", "tailwindcss" }

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
  -- Force all clients to use UTF-8 encoding
  capabilities.offsetEncoding = {'utf-8'}
  -- For newer Neovim versions, you might need:
  capabilities.positionEncodings = {'utf-8'}
end



vim.diagnostic.config({
	virtual_text = false,
})
vim.o.updatetime = 250
vim.cmd([[
  autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float( nil, {focus=false, scope="cursor"})
  ]])
