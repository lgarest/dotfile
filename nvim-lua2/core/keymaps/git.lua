local map = vim.keymap.set

-- Git / fugitive
map("n", "<leader>gb", "<cmd> G blame<CR>", { desc = "git [b]lame" })
map("n", "<leader>gd", "<cmd> Gvdiffsplit<CR>", { desc = "git [d]iff" })
map("n", "<leader>gp", "<cmd> Gitsigns preview_hunk<CR>", { desc = "git [p]review hunk" })

-- Conflict resolution
map("v", "gh", "<cmd> diffget //2 <CR>", { desc = "Pick left in conflicts solver" })
map("v", "gl", "<cmd> diffget //3 <CR>", { desc = "Pick right in conflicts solver" })
