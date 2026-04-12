local map = vim.keymap.set

-- LSP and code actions
map({ "n", "v" }, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code [a]ction - (default gra)" })

-- Treesitter context
map("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true, desc = "Go to [c]ontext" })

-- Telsecope LSP
map(
	"n",
	"<leader>of",
	"<cmd> Telescope lsp_document_symbols symbols={'function'} symbol_width=70<CR>",
	{ desc = "Outline [f]unctions" }
)
map(
	"n",
	"<leader>oF",
	"<cmd> Telescope lsp_dynamic_workspace_symbols symbols={'function','constant'} fname_width=54<CR>",
	{ desc = "Outline workspace [f]unctions" }
)

map("n", "<leader>gr", "<cmd> Telescope lsp_references <CR>", { desc = "goto [r]eferences - (default grr)" })

-- Finding with Grug far
map("n", "<leader>fg", "<cmd> GrugFar <CR>", { desc = "find with [g]rug" })
