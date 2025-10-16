-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local nvlsp = require("nvchad.configs.lspconfig")

local constants = require("core.constants")
local lspconfig = vim.lsp.config
local servers = { "html", "cssls", "ts_ls", "biome", "tailwindcss" }

-- Force all clients to use UTF-8 encoding
capabilities.offsetEncoding = {'utf-8'}
capabilities.positionEncodings = {'utf-8'}

-- lsps with default config
vim.lsp.enable(servers)
-- for _, lsp in ipairs(servers) do
--    vim.lsp.enable(lsp)
--    lspconfig[lsp].setup({
--      on_attach = nvlsp.on_attach,
--      on_init = nvlsp.on_init,
--      capabilities = capabilities
--    })
-- end



vim.diagnostic.config({
	virtual_text = false,
})
vim.o.updatetime = 250
vim.cmd([[
  autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float( nil, {focus=false, scope="cursor"})
  ]])
