local map = vim.keymap.set

-- LSP and code actions
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code [a]ction" })
map("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", { desc = "Code [a]ction" })

-- Treesitter context
map("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true, desc = "Go to [c]ontext" })
